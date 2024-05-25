#!/bin/bash

Current=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && \pwd)

# shellcheck disable=SC1091
\source "$Current"/../Fn/Argument.sh

Fn "$@"

for Organization in "${Organization[@]}"; do
	for SubDependency in "${SubDependency[@]}"; do
		# shellcheck disable=SC2154
		\cd "$Folder"/"${SubDependency/"${Organization}/"/}" || \exit

		\find . -type d \( -iname node_modules -o -iname \.git \) -prune -false -o -iname license.txt -type f -execdir mv {} LICENSE \;
		\find . -type d \( -iname node_modules -o -iname \.git \) -prune -false -o -iname license.md -type f -execdir mv {} LICENSE \;

		\cd - || \exit
	done
done
