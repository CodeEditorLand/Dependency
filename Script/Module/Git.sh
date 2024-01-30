#!/bin/bash

\echo "Process: Module/Git.sh"

# Context: CodeEditorLand/Environment/Land

Directory=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && \pwd)

\readarray -t Repository < "$Directory"/../Cache/Repository/Environment.md

\rm -rf "$Directory"/../../.gitmodules

Script() {
	Folder="${1/'CodeEditorLand/'/}"

	\cd "$Folder" || \exit

	\pwd

	\gh repo set-default "$(\git remote get-url origin)"

	Origin="ssh://git@github.com/${1}.git"

	\echo "Folder: "
	\echo "$Folder"

	\echo "Origin: "
	\echo "$Origin"

	\read -r -d '' Submodule <<- EOM
		[submodule "Application/${Folder}"]
		path = Application/${Folder}
		url = ${Origin}

	EOM

	\echo "$Submodule" >> "$Directory"/../../.gitmodules

	\cd - || \exit
}

export -f Script

parallel --jobs 6 Script ::: "${Repository[@]}"
