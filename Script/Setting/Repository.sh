#!/bin/bash

Directory=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

readarray -t Repository < "$Directory"/../Cache/Repository/CodeEditorLand.md

for Repository in "${Repository[@]}"; do
	echo "Settings for $Repository"

	# gh api \
	# 	--method PUT \
	# 	-H "Accept: application/vnd.github+json" \
	# 	-H "X-GitHub-Api-Version: 2022-11-28" \
	# 	repos/"${Repository}"/vulnerability-alerts \
	# 	--silent

	# gh api \
	# 	--method PUT \
	# 	-H "Accept: application/vnd.github+json" \
	# 	-H "X-GitHub-Api-Version: 2022-11-28" \
	# 	repos/"${Repository}"/automated-security-fixes \
	# 	--silent

	# gh api \
	# 	--method PUT \
	# 	-H "Accept: application/vnd.github+json" \
	# 	-H "X-GitHub-Api-Version: 2022-11-28" \
	# 	orgs/"${ORG}" \
	# 	-f location='Bulgaria' \
	# 	-f company='Playform' \
	# 	-f billing_email=${EMAIL_BILLING} \
	# 	-f email=${EMAIL} \
	# 	-f twitter_username=${TWITTER} \
	# 	-F has_organization_projects=false \
	# 	-F has_repository_projects=false \
	# 	-f default_repository_permission='none' \
	# 	-F members_can_create_repositories=false \
	# 	-F members_can_create_private_repositories=false \
	# 	-F members_can_create_public_repositories=false \
	# 	-f members_allowed_repository_creation_type='none' \
	# 	-F members_can_create_pages=false \
	# 	-F members_can_create_public_pages=false \
	# 	-F members_can_create_private_pages=false \
	# 	-F members_can_fork_private_repositories=false \
	# 	-F advanced_security_enabled_for_new_repositories=true \
	# 	-F dependabot_alerts_enabled_for_new_repositories=true \
	# 	-F dependabot_security_updates_enabled_for_new_repositories=true \
	# 	-F dependency_graph_enabled_for_new_repositories=true \
	# 	-F secret_scanning_enabled_for_new_repositories=true \
	# 	-F secret_scanning_push_protection_enabled_for_new_repositories=true \
	# 	-F secret_scanning_push_protection_custom_link_enabled=true \
	# 	-F secret_scanning_push_protection_custom_link='https://link.nikolahristov.tech/protection-push' \
	# 	--silent
done

# Usage:  gh repo edit [<repository>] [flags]

# Flags:
#       --add-topic strings        Add repository topic
#       --allow-forking            Allow forking of an organization repository
#       --allow-update-branch      Allow a pull request head branch that is behind its base branch to be updated
#       --default-branch name      Set the default branch name for the repository
#       --delete-branch-on-merge   Delete head branch when pull requests are merged
#   -d, --description string       Description of the repository
#       --enable-auto-merge        Enable auto-merge functionality
#       --enable-discussions       Enable discussions in the repository
#       --enable-issues            Enable issues in the repository
#       --enable-merge-commit      Enable merging pull requests via merge commit
#       --enable-projects          Enable projects in the repository
#       --enable-rebase-merge      Enable merging pull requests via rebase
#       --enable-squash-merge      Enable merging pull requests via squashed commit
#       --enable-wiki              Enable wiki in the repository
#   -h, --homepage URL             Repository home page URL
#       --remove-topic strings     Remove repository topic
#       --template                 Make the repository available as a template repository
#       --visibility string        Change the visibility of the repository to {public,private,internal}
