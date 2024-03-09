#!/bin/bash

Current=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && \pwd)

# shellcheck disable=SC1091
source "$Current"/../Fn/Argument.sh

Fn "$@"

# shellcheck disable=SC2154
Git="$Current"/../../"$Foundation"/Service

for Organization in "${Organization[@]}"; do
	for Service in "${Service[@]}"; do
		Folder="${Service/"${Organization}/"/}"

		\cd "$Git"/"$Folder" || \exit

		\pwd

		\cd - || \exit
	done
done
