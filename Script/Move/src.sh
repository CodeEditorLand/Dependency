#!/bin/bash

\echo "Process: Move/src.sh"

# Context: CodeEditorLand/Application

Directory=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && \pwd)

\readarray -t Repository < "$Directory"/../Cache/Repository/Build.md

for Repository in "${Repository[@]}"; do
	Folder="${Repository/'CodeEditorLand/'/}"

	\cd "$Folder" || \exit

	\pwd

	if [[ -d "src" ]]; then
		\cp -rf src/* Source/
		\rm -rf src/
	fi

	\find . -type d \( -iname node_modules -o -iname vendor -o -iname dist -o -iname target -o -iname \.git -o -iname \.next \) -prune -false -o -name src -type d -execdir bash -c '\cp -rf src/* Source/ ; \rm -rf src/' \;

	\cd - || \exit
done
