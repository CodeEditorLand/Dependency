#!/bin/bash

Current=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && \pwd)

# shellcheck disable=SC1091
\source "$Current"/../Fn/Argument.sh

Fn "$@"

for Organization in "${Organization[@]}"; do
	(
		for SubDependency in "${SubDependency[@]}"; do
			( # shellcheck disable=SC2154
				\cd "$Folder"/"${SubDependency/"${Organization}/"/}" || \exit

				if [[ -d "src" ]]; then
					\mkdir -p Source
					\cp -rf src/* Source/
					\rm -rf src/
				fi

				\find . -type d \( -iname node_modules -o -iname \.git \) -prune -false -o -name src -type d -execdir bash -c '\mkdir -p Source ; \cp -rf src/* Source/ ; \rm -rf src/' \;

				\cd - || \exit
			) &
		done

		wait
	) &
done

wait
