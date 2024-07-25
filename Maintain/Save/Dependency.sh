#!/bin/bash

Current=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && \pwd)

# shellcheck disable=SC1091
\source "$Current"/../Fn/Argument.sh

Fn "$@"

for Organization in "${Organization[@]}"; do
	for SubDependency in "${SubDependency[@]}"; do
		# shellcheck disable=SC2154
		\cd "$Folder"/"${SubDependency/"${Organization}/"/}" || \exit

		# "$Current"/../Fn/Save/Dependency.sh

		Run -P .git git add . --no-verbose
		Run -P .git git ecommit --quiet --no-status --short --no-edit

		\cd - || \exit
	done
done
