#!/bin/bash

Current=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && \pwd)

# shellcheck disable=SC1091
\source "$Current"/../Fn/Argument.sh

Fn "$@"

if [ $# -gt 0 ]; then
	if [ -n "$4" ]; then
		Branch=$4
	else
		\echo "Cannot Branch."
		\exit 1
	fi
fi

for Organization in "${Organization[@]}"; do
	for Dependency in "${Dependency[@]}"; do
		# shellcheck disable=SC2154
		\cd "$Folder"/"${Dependency/"${Organization}/"/}" || \exit

		Upstream=$(\gh repo view --json parent | \jq -c -r '.parent.owner.login, .parent.name' | \tr -s '\r\n' '/')

		if [[ "$Upstream" != "null/null" && "$Upstream" != "null/null/" ]]; then
			Upstream=$(\echo "$Upstream" | \sed 's/\/$//')

			\git fetch Parent --depth 1 --no-tags

			\git reset --hard Parent/"$(\gh repo view "$(\gh repo view --json parent | \jq -c -r '.parent.owner.login, .parent.name' | \tr -s '\r\n' '/' | \sed 's/\/$//')" --json defaultBranchRef | \jq -r -c '.defaultBranchRef.name')"

			\git clean -dfx

			\git push --set-upstream Source "$Branch" --force
		fi

		\cd - || \exit
	done
done
