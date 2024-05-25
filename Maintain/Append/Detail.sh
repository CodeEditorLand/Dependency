#!/bin/bash

Current=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && \pwd)

# shellcheck disable=SC1091
\source "$Current"/../Fn/Argument.sh

Fn "$@"

for Organization in "${Organization[@]}"; do
	for Dependency in "${Dependency[@]}"; do
		# shellcheck disable=SC2154
		\cd "$Folder"/"${Dependency/"${Organization}/"/}" || \exit

		\find . -type d \( -iname node_modules -o -iname \.git \) -prune -false -o -iname package.json -type f -execdir bash -c "$Current"/../Fn/Append/package.json.sh \;

		# \find . -type d \( -iname node_modules -o -iname \.git \) -prune -false -o -iname tsconfig.json -type f -execdir bash -c "$Current"/../Fn/Append/tsconfig.json.sh \;

		\cd - || \exit
	done
done
