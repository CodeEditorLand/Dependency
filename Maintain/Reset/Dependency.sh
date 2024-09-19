#!/bin/bash

Current=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && \pwd)

# shellcheck disable=SC1091
\source "$Current"/../Fn/Argument.sh

Fn "$@"

if [ $# -gt 0 ]; then
	if [ -n "$4" ]; then
		Branch=$4
	else
		\echo "Cannot Branch."
		\exit 1
	fi
fi

for Organization in "${Organization[@]}"; do
	(
		for SubDependency in "${SubDependency[@]}"; do
			( # shellcheck disable=SC2154
				\cd "$Folder"/"${SubDependency/"${Organization}/"/}" || \exit

				# shellcheck disable=SC1091
				\source "$Current"/../Cache.sh

				Fn

				# shellcheck disable=SC2154
				Parent="$OwnerParent/$NameParent"

				if [[ "$Parent" != "null/null" ]]; then
					Parent=$(\echo "$Parent" | \sed 's/\/$//')

					\git fetch Parent --depth 1 --no-tags

					# shellcheck disable=SC2154
					\git reset --hard Parent/"$BranchParent"

					\git clean -dfx

					\git push --set-upstream Source "$Branch" --force
				fi

				\cd - || \exit
			) &
		done

		wait
	) &
done

wait
