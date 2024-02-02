#!/bin/bash

\echo "Process: Packed/Repository.sh"

# Context: CodeEditorLand/Environment/Land

Directory=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && \pwd)

\readarray -t Repository < "$Directory"/../Cache/Repository/Environment.md

for Repository in "${Repository[@]}"; do
	\echo "Pack: Cache/Get.sh"
	##########################

	\git clone --depth=1 --recurse-submodules --shallow-submodules "ssh://git@github.com/${Repository}.git"

	\echo "Pack: Module/Git.sh"
	##########################

	Folder="${Repository/'CodeEditorLand/'/}"

	\cd "$Folder" || \exit

	\pwd

	\gh repo set-default "$(\git remote get-url origin)"

	Origin="ssh://git@github.com/${Repository}.git"

	\echo "Folder: "
	\echo "$Folder"

	\echo "Origin: "
	\echo "$Origin"

	\read -r -d '' Submodule <<- EOM
		[submodule "${Folder}"]
		path = ${Folder}
		url = ${Origin}

	EOM

	\echo "$Submodule" >> "$Directory"/../../Land/.gitmodules

	\echo "Pack: Configure/Repository.sh"
	#####################################

	Origin=$(\git remote get-url origin)
	Origin=$(\echo "$Origin" | \sed 's/git@github.com:/ssh:\/\/git@github.com\//')

	\git remote set-url origin "$Origin"

	\echo "Origin: "
	\echo "$Origin"

	\gh repo set-default "$(\git remote get-url origin)"

	Upstream=$(\gh repo view --json parent | \jq -c -r '.parent.owner.login, .parent.name' | \tr -s '\r\n' '/')

	if [[ "$Upstream" != "null/null" ]]; then
		Upstream="ssh://git@github.com/${Upstream}"
		Upstream=$(\echo "$Upstream" | \sed 's/\/$/\.git/')

		\echo "Upstream: "
		\echo "$Upstream"

		\git remote remove upstream
		\git remote add upstream "$Upstream"
		\git remote set-url upstream "$Upstream"
	fi

	\echo "Pack: Setting/Repository.sh"
	###################################

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
		--default-branch main \
		--delete-branch-on-merge \
		--enable-auto-merge \
		--enable-issues \
		--enable-merge-commit \
		--enable-squash-merge

	\echo "Pack: Rename/Repository.sh"
	##################################

	\gh repo set-default "$(\git remote get-url origin)"

	Rename=""

	Rename=$(\tr '[:lower:]' '[:upper:]' <<< "${Folder:0:1}")

	for ((i = 1; i < ${#Folder}; i++)); do
		if [ "${Folder:i:1}" = "-" ]; then
			Next="${Folder:i+1:1}"
			if [[ "$Next" =~ [a-z] ]]; then
				Upper=$(\tr '[:lower:]' '[:upper:]' <<< "$Next")
				Rename="${Rename}${Upper}"
				((i++))
			else
				Rename="${Rename}-"
			fi
		else
			Rename="${Rename}${Folder:i:1}"
		fi
	done

	Rename=$(\echo "$Rename" | \sed -E "s/vscode/Land/gI")

	\echo "Rename: "
	\echo "$Rename"

	\gh repo rename "$Rename" --yes

	\echo "Pack: Rename/Branch.sh"
	##############################

	\gh repo set-default "$(\git remote get-url origin)"

	\git switch -c main

	\git push -f --set-upstream origin main

	\gh repo edit --default-branch main

	\echo "Pack: Sync/Repository.sh"
	################################

	\git add .
	\git commit -m "squash!"
	\git pull
	\git push

	\git fetch upstream --depth 1 --no-tags

	Main=$(\gh repo view --json parent | \jq -c -r '.parent.owner.login, .parent.name' | \tr -s '\r\n' '/')
	Main=$(\echo "$Main" | \sed 's/\/$//')
	Main=$(\gh repo view "$Main" --json defaultBranchRef | \jq -r -c '.defaultBranchRef.name')

	\git merge upstream/"$Main" --allow-unrelated-histories -X theirs

	\cd - || \exit
done
