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
