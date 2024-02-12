#!/bin/bash

\echo "Process: Replace/Copyright.sh"

# Context: CodeEditorLand/Land/Stream

Directory=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && \pwd)

\readarray -t Repository < "$Directory"/../Cache/Repository/CodeEditorLand.md

Script() {
	\cd "${1/'CodeEditorLand/'/}" || \exit

	\pwd

	\cd - || \exit
}

export -f Script

parallel --jobs 6 Script ::: "${Repository[@]}"
