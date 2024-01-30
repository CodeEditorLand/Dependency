#!/bin/bash

\echo "Process: Clone/Repository.sh"

# Context: CodeEditorLand/Environment/Land

Directory=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && \pwd)

\readarray -t Repository < "$Directory"/../Cache/Repository/Environment.md

Script() {
	\git clone --depth=1 --recurse-submodules --shallow-submodules "ssh://git@github.com/${1}.git"
}

export -f Script

parallel --jobs 6 Script ::: "${Repository[@]}"
