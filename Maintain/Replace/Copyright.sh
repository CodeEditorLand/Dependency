#!/bin/bash

Current=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && \pwd)

# shellcheck disable=SC1091
\source "$Current"/../Fn/Argument.sh

Fn "$@"

for Organization in "${Organization[@]}"; do
	for Service in "${Service[@]}"; do
		Folder="${Service/"${Organization}/"/}"

		# shellcheck disable=SC2154
		\cd "$Current"/../../"$Foundation"/Service/"$Folder" || \exit

		\pwd

		\cd - || \exit
	done
done
