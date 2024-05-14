#!/bin/bash

Current=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && \pwd)

# shellcheck disable=SC1091
\source "$Current"/../Fn/Argument.sh

Fn "$@"

for Organization in "${Organization[@]}"; do
	for Dependency in "${Dependency[@]}"; do
		# shellcheck disable=SC2154
		\cd "$Folder" || \exit

		\git clone --filter=tree:0 --depth=1 --recurse-submodules --shallow-submodules "ssh://git@github.com/${Dependency}.git" "$Dependency"

		\cd - || \exit
	done
done
