#!/bin/bash

# Context: CodeEditorLand/Application

Directory=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

readarray -t Repository <"$Directory"/../Cache/Repository/CodeEditorLand.md

for Repository in "${Repository[@]}"; do
	Folder="${Repository/'CodeEditorLand/'/}"

	cd "$Folder" || exit

	pwd

	if [[ -d "src" ]]; then
		cp -rf src/* Source/
		rm -rf src/
	fi

	find . -name src -type d -execdir bash -c 'cp -rf src/* Source/ ; rm -rf src/' \;

	cd - || exit
done
