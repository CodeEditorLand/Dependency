#!/bin/bash

\echo "Process: Clean/Detail.sh"

# Context: CodeEditorLand/Application

Directory=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && \pwd)

\readarray -t Repository < "$Directory"/../Cache/Repository/Build.md

for Repository in "${Repository[@]}"; do
	Folder="${Repository/'CodeEditorLand/'/}"

	\cd "$Folder" || \exit

	\pwd

	\find . -type d \( -iname node_modules -o -iname vendor -o -iname dist -o -iname target -o -iname \.git -o -iname \.next \) -prune -false -o -iname package.json -type f -execdir bash -c "$Directory"/../Action/Clean/Detail.sh \;

	\cd - || \exit
done
