#!/bin/bash

Current=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && \pwd)

# shellcheck disable=SC1091
\source "$Current"/../Fn/Argument.sh

Fn "$@"

for Organization in "${Organization[@]}"; do
	for Service in "${Service[@]}"; do
		Origin="ssh://git@github.com/${Service}.git"

		Folder="${Service/"${Organization}/"/}"

		\echo "Folder: "
		\echo "$Folder"

		\echo "Origin: "
		\echo "$Origin"

		\cd "$Current"/../../"$Foundation"/Service || \exit

		git submodule add --depth=1 "$Origin" "$Folder"

		\cd - || \exit
	done
done
