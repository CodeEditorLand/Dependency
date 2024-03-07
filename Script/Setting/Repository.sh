#!/bin/bash

\echo "Process: Setting/Repository.sh"

# Context: CodeEditorLand/Environment/Stream

Directory=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && \pwd)

\readarray -t Repository <"$Directory"/../Cache/Repository/CodeEditorLand

for Repository in "${Repository[@]}"; do
	\cd "${Repository/'CodeEditorLand/'/}" || \exit

	\pwd

	\gh repo set-default "$(\git remote get-url origin)"

	\gh api \
		--method PUT \
		-H "Accept: application/vnd.github+json" \
		-H "X-GitHub-Api-Version: 2022-11-28" \
		repos/"${Repository}"/actions/permissions/access \
		-f access_level='organization' \
		--silent

	\gh api \
		--method PUT \
		-H "Accept: application/vnd.github+json" \
		-H "X-GitHub-Api-Version: 2022-11-28" \
		user/starred/"${Repository}" \
		--silent

	\gh api \
		--method PUT \
		-H "Accept: application/vnd.github+json" \
		-H "X-GitHub-Api-Version: 2022-11-28" \
		repos/"${Repository}"/actions/permissions/workflow \
		-f default_workflow_permissions='write' \
		-F can_approve_pull_request_reviews=true \
		--silent

	\gh api \
		--method PUT \
		-H "Accept: application/vnd.github+json" \
		-H "X-GitHub-Api-Version: 2022-11-28" \
		repos/"${Repository}"/actions/permissions \
		-F enabled=true \
		-f allowed_actions='all' \
		--silent

	\gh api \
		--method PUT \
		-H "Accept: application/vnd.github+json" \
		-H "X-GitHub-Api-Version: 2022-11-28" \
		repos/"${Repository}"/vulnerability-alerts \
		--silent

	\gh api \
		--method PUT \
		-H "Accept: application/vnd.github+json" \
		-H "X-GitHub-Api-Version: 2022-11-28" \
		repos/"${Repository}"/automated-security-fixes \
		--silent

	\gh api \
		--method PATCH \
		-H "Accept: application/vnd.github+json" \
		-H "X-GitHub-Api-Version: 2022-11-28" \
		repos/"${Repository}" \
		-F has_issues=true \
		-F has_projects=false \
		-F has_wiki=false \
		-F allow_squash_merge=true \
		-F allow_merge_commit=true \
		-F allow_rebase_merge=false \
		-F allow_auto_merge=true \
		-F delete_branch_on_merge=true \
		-F allow_update_branch=true \
		-F use_squash_pr_title_as_default=true \
		-F web_commit_signoff_required=true \
		--silent

	\gh repo edit \
		--allow-update-branch \
		--delete-branch-on-merge \
		--enable-auto-merge \
		--enable-issues \
		--enable-merge-commit \
		--enable-squash-merge

	\cd - || \exit
done
