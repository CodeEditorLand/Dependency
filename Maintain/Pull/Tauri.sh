#!/usr/bin/env bash
#===============================================================================
# Pull/Tauri.sh - merge latest upstream into Current for active Tauri deps
#===============================================================================
#
# Pulls the newest upstream commits from Parent into the Current branch for
# every active Tauri sub-dependency (the repos referenced in Land/Cargo.toml
# [patch.crates-io]).  Changes are staged but NOT committed so you can review
# them and write a meaningful commit message.
#
# Per repo the pipeline is:
#   1. git fetch Parent --no-tags
#   2a. git merge --ff-only Parent/<branch>   (fast-forward when possible)
#   2b. git merge Parent/<branch> --no-commit --no-ff -X theirs
#       (when local patches diverge from upstream)
#
# After a successful run:
#   • Each repo is either fast-forwarded OR in MERGING state with staged diffs
#   • Nothing has been pushed to Source - review first, then push
#
# To commit a merged repo:
#   git -C Land/Dependency/Tauri/Dependency/<Repo> \
#       commit -m "chore: merge upstream <new-version>"
#
# To abort a merge that needs manual attention:
#   git -C Land/Dependency/Tauri/Dependency/<Repo> merge --abort
#
# Usage:
#   bash Land/Dependency/Maintain/Pull/Tauri.sh            # run
#   bash Land/Dependency/Maintain/Pull/Tauri.sh --dry-run  # print only
#
#===============================================================================

Current=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" > /dev/null 2>&1 && \pwd)
Base=$(\cd -- "$Current/../.." > /dev/null 2>&1 && \pwd)

DRY_RUN=false
if [ "${1:-}" = "--dry-run" ]; then
	DRY_RUN=true
fi

# Active repos - those checked out and referenced in Land/Cargo.toml patches.
REPOS="Tauri PluginsWorkspace Wry Tao Muda TrayIcon WindowVibrancy WindowShadows GlobalHotKey"

\echo "================================================================"
\echo "Pull/Tauri - merge upstream into Current (no-commit)"
\echo "================================================================"
\echo "Base:  $Base/Dependency"
\echo "Repos: $REPOS"
\echo "Mode:  $([ "$DRY_RUN" = true ] && \echo dry-run || \echo execute)"
\echo "================================================================"

if [ "$DRY_RUN" = true ]; then
	\echo ""
	\echo "Would run per repo:"
	\echo "  1. git fetch Parent --no-tags"
	\echo "  2. git merge --ff-only Parent/<branch>  [or --no-commit --no-ff -X theirs]"
	\echo ""
	for Repo in $REPOS; do
		Branch=$(git -C "$Base/Dependency/$Repo" config --get Parent.Branch 2> /dev/null || \echo "?")
		\echo "  $Repo  →  Parent/$Branch"
	done
	\exit 0
fi

for Repo in $REPOS; do
	RepoPath="$Base/Dependency/$Repo"

	if [ ! -d "$RepoPath/.git" ] && [ ! -f "$RepoPath/.git" ]; then
		\echo "[skip] $Repo - not a git repo at $RepoPath"
		continue
	fi

	(
		\cd "$RepoPath" || \exit 1

		Branch=$(git config --get Parent.Branch 2> /dev/null)
		if [ -z "$Branch" ]; then
			\echo "[skip] $Repo - Parent.Branch not configured; run Configure/Dependency.sh first"
			\exit 0
		fi

		\echo "----"
		\echo "[$Repo] fetching Parent/$Branch …"
		git fetch Parent --no-tags --quiet

		if git merge --ff-only "Parent/$Branch" 2> /dev/null; then
			\echo "[$Repo] fast-forwarded to Parent/$Branch"
		else
			\echo "[$Repo] merging Parent/$Branch --no-commit -X theirs …"
			if git merge "Parent/$Branch" \
				--no-commit \
				--no-ff \
				--allow-unrelated-histories \
				-X theirs 2>&1; then
				Status=$(git status --short | \wc -l | \tr -d ' ')
				\echo "[$Repo] merge staged - $Status files changed (not committed)"
			else
				\echo "[$Repo] merge needs manual attention - run: git -C $RepoPath merge --abort"
			fi
		fi
	) &
done

\wait

\echo ""
\echo "================================================================"
\echo "Done.  Review staged changes in each repo, then:"
\echo "  git -C Land/Dependency/Tauri/Dependency/<Repo> \\"
\echo "      commit -m \"chore: merge upstream <version>\""
\echo "================================================================"
