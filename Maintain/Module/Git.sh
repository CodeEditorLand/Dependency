#!/bin/bash

\echo "Process: Module/Git.sh"

# Contextless

Current=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && \pwd)

if [ $# -gt 0 ]; then
	if [ -f "$1" ]; then
		\mapfile -t Service < <(jq -r '.[]' "$1" | \tr -d '\r')
	else
		\echo "Cannot Service."
		\exit 1
	fi

	if [ -n "$2" ]; then
		Foundation=$2
	else
		\echo "Cannot Foundation."
		\exit 2
	fi
fi

Git="$Current"/../../"$Foundation"/Service

for Service in "${Service[@]}"; do
	Service="${Service/'CodeEditorLand/'/}"

	Origin="ssh://git@github.com/${Service}.git"

	\echo "Service: "
	\echo "$Service"

	\echo "Origin: "
	\echo "$Origin"

	\cd "$Git" || \exit

	git submodule add --depth=1 "$Origin" "$Service"

	\cd - || \exit
done
