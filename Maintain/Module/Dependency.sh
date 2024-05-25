#!/bin/bash

Current=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && \pwd)

# shellcheck disable=SC1091
\source "$Current"/../Fn/Argument.sh

Fn "$@"

for Organization in "${Organization[@]}"; do
	for SubDependency in "${SubDependency[@]}"; do
		Origin="ssh://git@github.com/${SubDependency}.git"

		# shellcheck disable=SC2154
		\cd "$Folder" || \exit

		\git submodule add --depth=1 "$Origin" "${SubDependency/"${Organization}/"/}"

		\cd - || \exit
	done
done
