#!/bin/bash

\echo "Process: Sort/Detail.sh"

# Context: CodeEditorLand/Application

Directory=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && \pwd)

\readarray -t Repository < "$Directory"/../Cache/Repository/Build.md

Script() {
	\cd "${1/'CodeEditorLand/'/}" || \exit

	\pwd

	\find . -type d \( -iname node_modules -o -iname vendor -o -iname dist -o -iname target -o -iname \.git -o -iname \.next \) -prune -false -o -iname package.json -type f -execdir sort-package-json \;

	\cd - || \exit
}

export -f Script

parallel --jobs 6 Script ::: "${Repository[@]}"
