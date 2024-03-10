#!/bin/bash

Current=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

if [ $# -gt 0 ]; then
	if [ -f "$1" ]; then
		\mapfile -t Organization < <(jq -r '.[]' "$1" | \tr -d '\r')
	else
		\echo "Cannot Organization."
		\exit 1
	fi

	if [ -f "$2" ]; then
		\mapfile -t Omit < <(jq -r '.[]' "$2" | \tr -d '\r')
	else
		\echo "Cannot Omit."
		\exit 1
	fi

	if [ -n "$3" ]; then
		Foundation=$3
	else
		\echo "Cannot Foundation."
		\exit 1
	fi
fi

Service=()

for Organization in "${Organization[@]}"; do
	for ((Page = 1; Page <= 50; Page++)); do
		\mapfile -t Temporary < <(\printf "%s" "$(
			\gh api \
				-H "Accept: application/vnd.github+json" \
				-H "X-GitHub-Api-Version: 2022-11-28" \
				orgs/"${Organization}"/repos?per_page=100\&page=${Page} | \jq -r '.[].full_name'
		)" | \tr -d '\r')

		for Temporary in "${Temporary[@]}"; do
			Flag=false

			for ServiceOmit in "${Omit[@]}"; do
				if [ "$Temporary" = "$ServiceOmit" ]; then
					Flag=true

					break
				fi
			done

			if [ "$Flag" = false ]; then
				Service+=("$Temporary")
			fi

			# TODO: Add these to the cache
			# Sync/Service

			# ```sh
			# Main=$(\gh repo view --json parent | \jq -c -r '.parent.owner.login, .parent.name' | \tr -s '\r\n' '/')
			# Main=$(\echo "$Main" | \sed 's/\/$//')
			# Main=$(\gh repo view "$Main" --json defaultBranchRef | \jq -r -c '.defaultBranchRef.name')
			# ```

			# # Configure/Service

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

	\mapfile -t Service < <(\printf "%s\n" "${Service[@]}" | \sort)

	\printf '%s\n' "${Service[@]}" | \jq -R . | \jq -s --tab . >"$Current"/Service/"$Foundation".json
done
