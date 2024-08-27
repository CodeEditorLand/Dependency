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

				if [[ -d "Source" ]]; then
					\mkdir -p src
					\cp -rf Source/* src/
					\rm -rf Source/
				fi

				\find . -type d \( -iname node_modules -o -iname \.git \) -prune -false -o -name Source -type d -execdir bash -c '\mkdir -p src ; \cp -rf Source/* src/ ; \rm -rf Source/' \;

				\cd - || \exit
			) &
		done

		wait
	) &
done

wait
