#!/bin/bash

Current=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && \pwd)

# shellcheck disable=SC1091
\source "$Current"/../Fn/Argument.sh

Fn "$@"

for Organization in "${Organization[@]}"; do
	(
		for SubDependency in "${SubDependency[@]}"; do
			( # shellcheck disable=SC2154
				\cd "$Folder"/"${SubDependency/"${Organization}/"/}" || \exit

				"$Current"/../Fn/Configure/Remote.sh
				"$Current"/../Fn/Configure/Fetch.sh
				"$Current"/../Fn/Configure/Branch.sh

				\cd - || \exit
			) &
		done

		wait
	) &
done

wait
