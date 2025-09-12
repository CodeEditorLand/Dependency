#!/usr/bin/env bash

Current=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && \pwd)

# shellcheck disable=SC1091
\source "$Current"/../Fn/Argument.sh

Fn "$@"

for Organization in "${Organization[@]}"; do
	(
		for SubDependency in "${SubDependency[@]}"; do
			(
				# shellcheck disable=SC2154
				\cd "$Folder" || \exit

				\git clone --recurse-submodules --shallow-submodules "ssh://git@github.com/${SubDependency}.git" "$SubDependency"

				\cd - || \exit
			) &
		done

		\wait
	) &
done

\wait
