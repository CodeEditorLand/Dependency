#!/bin/sh

\pwd

if [ $# -gt 0 ]; then
	if [ -n "$1" ]; then
		Dependency=$1
	else
		\echo "Cannot Dependency."
		\exit 1
	fi
fi

\gh api \
	--method DELETE \
	-H "Accept: application/vnd.github+json" \
	-H "X-GitHub-Api-Version: 2022-11-28" \
	repos/"${Dependency}"/branches/Current/protection \
	--silent

\gh api \
	--method DELETE \
	-H "Accept: application/vnd.github+json" \
	-H "X-GitHub-Api-Version: 2022-11-28" \
	repos/"${Dependency}"/branches/Previous/protection \
	--silent

\gh api \
	--method PUT \
	-H "Accept: application/vnd.github+json" \
	-H "X-GitHub-Api-Version: 2022-11-28" \
	repos/"${Dependency}"/actions/permissions/access \
	-f access_level='organization' \
	--silent

\gh api \
	--method PUT \
	-H "Accept: application/vnd.github+json" \
	-H "X-GitHub-Api-Version: 2022-11-28" \
	user/starred/"${Dependency}" \
	--silent

\gh api \
	--method PUT \
	-H "Accept: application/vnd.github+json" \
	-H "X-GitHub-Api-Version: 2022-11-28" \
	repos/"${Dependency}"/actions/permissions/workflow \
	-f default_workflow_permissions='write' \
	-F can_approve_pull_request_reviews=true \
	--silent

\gh api \
	--method PUT \
	-H "Accept: application/vnd.github+json" \
	-H "X-GitHub-Api-Version: 2022-11-28" \
	repos/"${Dependency}"/actions/permissions \
	-F enabled=true \
	-f allowed_actions='all' \
	--silent

\gh api \
	--method PUT \
	-H "Accept: application/vnd.github+json" \
	-H "X-GitHub-Api-Version: 2022-11-28" \
	repos/"${Dependency}"/vulnerability-alerts \
	--silent

\gh api \
	--method PUT \
	-H "Accept: application/vnd.github+json" \
	-H "X-GitHub-Api-Version: 2022-11-28" \
	repos/"${Dependency}"/automated-security-fixes \
	--silent

\gh api \
	--method PATCH \
	-H "Accept: application/vnd.github+json" \
	-H "X-GitHub-Api-Version: 2022-11-28" \
	repos/"${Dependency}" \
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

\gh repo edit "$Dependency" \
	--allow-update-branch \
	--delete-branch-on-merge \
	--enable-auto-merge \
	--enable-issues \
	--enable-merge-commit \
	--enable-squash-merge
