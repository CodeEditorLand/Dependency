#!/bin/bash

\echo "Process: Cache/Get.sh"

# Contextless

Directory=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

Organization="CodeEditorLand"

Repository=()

Omit=(
	"CodeEditorLand/.github"
	"CodeEditorLand/Babel"
	"CodeEditorLand/Biome"
	"CodeEditorLand/Cargo"
	"CodeEditorLand/CargoMaintain"
	"CodeEditorLand/Commonality"
	"CodeEditorLand/debugger-libs"
	"CodeEditorLand/Environment"
	"CodeEditorLand/EnvironmentLand"
	"CodeEditorLand/node-gyp"
	"CodeEditorLand/NPM"
	"CodeEditorLand/NPMCommon"
	"CodeEditorLand/NPMIngress"
	"CodeEditorLand/NRefactory"
	"CodeEditorLand/Oniguruma"
	"CodeEditorLand/TypeScript"
	"CodeEditorLand/Website"
	"CodeEditorLand/Wil"
)

for ((Page = 1; Page <= 10; Page++)); do
	\mapfile -t TemporaryRepository < <(\printf "%s" "$(
		\gh api \
			-H "Accept: application/vnd.github+json" \
			-H "X-GitHub-Api-Version: 2022-11-28" \
			orgs/"${Organization}"/repos?per_page=100\&page=${Page} | \jq -r '.[].full_name'
	)" | \tr -d '\r')

	for Temporary in "${TemporaryRepository[@]}"; do
		Flag=false

		for RepositoryOmit in "${Omit[@]}"; do
			if [ "$Temporary" = "$RepositoryOmit" ]; then
				Flag=true

				break
			fi
		done

		if [ "$Flag" = false ]; then
			Repository+=("$Temporary")
		fi

		# TODO: Add these to the cache
		# Sync/Repository

		# ```sh
		# Main=$(\gh repo view --json parent | \jq -c -r '.parent.owner.login, .parent.name' | \tr -s '\r\n' '/')
		# Main=$(\echo "$Main" | \sed 's/\/$//')
		# Main=$(\gh repo view "$Main" --json defaultBranchRef | \jq -r -c '.defaultBranchRef.name')
		# ```

		# # Configure/Repository

		# ```sh
		# Upstream=$(\gh repo view --json parent | \jq -c -r '.parent.owner.login, .parent.name' | \tr -s '\r\n' '/')

		# if [[ "$Upstream" != "null/null" ]]; then
		# 	Upstream="ssh://git@github.com/${Upstream}"
		# 	Upstream=$(\echo "$Upstream" | \sed 's/\/$/\.git/')

		# 	\echo "Upstream: "
		# 	\echo "$Upstream"

		# 	\git remote remove upstream
		# 	\git remote add upstream "$Upstream"
		# 	\git remote set-url upstream "$Upstream"
		# fi
		# ```
	done
done

\mapfile -t Repository < <(\printf "%s\n" "${Repository[@]}" | \sort)

\printf "%s\n" "${Repository[@]}" > "$Directory"/Repository/Environment.md
