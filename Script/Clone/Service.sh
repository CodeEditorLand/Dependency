#!/bin/bash

\echo "Process: Clone/Service.sh"

# Context: CodeEditorLand/Foundation/$Foundation/Service

if [ $# -gt 0 ]; then
	if [ -f "$1" ]; then
		\mapfile -t Service < <(jq -r '.[]' "$1" | \tr -d '\r')
	else
		\echo "Cannot Service."
		\exit 1
	fi
fi

for Service in "${Service[@]}"; do
	\git clone --filter=tree:0 --depth=1 --recurse-submodules --shallow-submodules "ssh://git@github.com/${Service}.git"
done
