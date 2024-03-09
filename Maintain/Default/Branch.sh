#!/bin/bash

Current=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && \pwd)

# shellcheck disable=SC1091
source "$Current"/../Fn/Argument.sh

Fn "$@"

if [ $# -gt 0 ]; then
	if [ -n "$4" ]; then
		Branch=$4
	else
		\echo "Cannot Branch."
		\exit 1
	fi
fi

# shellcheck disable=SC2154
Git="$Current"/../../"$Foundation"/Service

for Organization in "${Organization[@]}"; do
	for Service in "${Service[@]}"; do
		Folder="${Service/"${Organization}/"/}"

		\cd "$Git"/"$Folder" || \exit

		\pwd

		\gh repo edit --default-branch "$Branch"

		\cd - || \exit
	done
done
