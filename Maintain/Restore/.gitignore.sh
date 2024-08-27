#!/bin/bash

Current=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && \pwd)

# shellcheck disable=SC1091
\source "$Current"/../Fn/Argument.sh

Fn "$@"

for Organization in "${Organization[@]}"; do
	for SubDependency in "${SubDependency[@]}"; do
		# shellcheck disable=SC2154
		\cd "$Folder"/"${SubDependency/"${Organization}/"/}" || \exit

		"$Current"/../Fn/Save/Dependency.sh

		\git fetch Parent --depth 1 --no-tags

		\find . -type d \( -iname node_modules -o -iname \.git \) -prune -false -o -iname .gitignore -type f -execdir bash -c "\git restore --source Parent/\"$(\gh repo view "$(\gh repo view --json parent | \jq -c -r '.parent.owner.login, .parent.name' | \tr -s '\r\n' '/' | \sed 's/\/$//')" --json defaultBranchRef | \jq -r -c '.defaultBranchRef.name')\" .gitignore" \;

		\cd - || \exit
	done
done
