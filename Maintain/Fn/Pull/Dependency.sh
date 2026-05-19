#!/usr/bin/env sh

\pwd

Current=$(\cd -- "$(\dirname -- "$0")" > /dev/null 2>&1 && \pwd)

# shellcheck disable=SC1091
. "$Current/../Cache.sh"

Fn

git fetch Parent --no-tags

# shellcheck disable=SC2154
if git merge --ff-only "Parent/$BranchParent" 2> /dev/null; then
	\echo "[ff] fast-forwarded to Parent/$BranchParent"
else
	# Fast-forward not possible (local patches exist). Merge without committing
	# so the result can be reviewed and committed with a descriptive message.
	# -X theirs resolves content conflicts automatically (prefer upstream).
	git merge "Parent/$BranchParent" \
		--no-commit \
		--no-ff \
		--allow-unrelated-histories \
		-X theirs 2>&1

	# Resolve modify/delete conflicts for generated/committed files we
	# intentionally removed from our fork (lock files, committed node_modules).
	# "deleted in HEAD" = keep our deletion: stage the removal.
	git diff --name-only --diff-filter=U | while IFS= \read -r _conflict; do
		_base=$(\basename "$_conflict")
		case "$_base" in
		Cargo.lock | pnpm-lock.yaml | yarn.lock | package-lock.json | bun.lockb)
			git rm -f "$_conflict" 2> /dev/null
			\echo "[auto-resolve] removed $_conflict (keep our deletion)"
			;;
		*)
			case "$_conflict" in
			node_modules/*)
				git rm -rf "$_conflict" 2> /dev/null
				\echo "[auto-resolve] removed $_conflict (keep our deletion)"
				;;
			*)
				\echo "[warn] unresolved conflict in $_conflict - manual fix required"
				;;
			esac
			;;
		esac
	done

	Remaining=$(git diff --name-only --diff-filter=U 2> /dev/null)
	if [ -z "$Remaining" ]; then
		Staged=$(git diff --cached --name-only 2> /dev/null | \wc -l | \tr -d ' ')
		\echo "[merged] $Staged files staged (not committed)"
	else
		\echo "[warn] merge has unresolved conflicts - check: git diff --name-only --diff-filter=U"
	fi
fi
