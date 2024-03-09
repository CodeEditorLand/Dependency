#!/bin/bash

\echo "Process: Module/Git.sh"

# Context: CodeEditorLand/Foundation/$Foundation/Service

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

\rm -rf "$Current"/../../Foundation/"$Foundation"/Service/.gitmodules

for Service in "${Service[@]}"; do
	Folder="${Service/'CodeEditorLand/'/}"

	\cd "$Folder" || \exit

	\pwd

	\gh repo set-default "$(\git remote get-url origin)"

	Origin="ssh://git@github.com/${Service}.git"

	\echo "Folder: "
	\echo "$Folder"

	\echo "Origin: "
	\echo "$Origin"

	\read -r -d '' Submodule <<-EOM
		[submodule "${Folder}"]
		path = ${Folder}
		url = ${Origin}

	EOM

	\echo "$Submodule" >>"$Current"/../../Foundation/"$Foundation"/Service/.gitmodules

	\cd - || \exit
done
