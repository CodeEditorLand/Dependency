#!/bin/bash

\echo "Process: Module/Git.sh"

# Contextless

Current=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && \pwd)

if [ $# -gt 0 ]; then
	if [ -f "$1" ]; then
		\mapfile -t Organization < <(jq -r '.[]' "$1" | \tr -d '\r')
	else
		\echo "Cannot Organization."
		\exit 1
	fi

	if [ -f "$2" ]; then
		\mapfile -t Service < <(jq -r '.[]' "$2" | \tr -d '\r')
	else
		\echo "Cannot Service."
		\exit 1
	fi

	if [ -n "$3" ]; then
		Foundation=$3
	else
		\echo "Cannot Foundation."
		\exit 1
	fi
fi

Git="$Current"/../../"$Foundation"/Service

for Organization in "${Organization[@]}"; do
	for Service in "${Service[@]}"; do
		Origin="ssh://git@github.com/${Service}.git"

		Folder="${Service/"${Organization}/"/}"

		\echo "Folder: "
		\echo "$Folder"

		\echo "Origin: "
		\echo "$Origin"

		\cd "$Git" || \exit

		git submodule add --depth=1 "$Origin" "$Folder"

		\cd - || \exit
	done
done
