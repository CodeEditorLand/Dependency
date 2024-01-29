#!/bin/bash

\echo "Process: Sync/Repository.sh"

# Context: CodeEditorLand/Application

Directory=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && \pwd)

\readarray -t Repository < "$Directory"/../Cache/Repository/Build.md

Script() {
	Folder="${1/'CodeEditorLand/'/}"

	\cd "$Folder" || \exit

	\pwd

	\git add .
	\git commit -m "squash!"
	\git pull
	\git push

	\git fetch upstream --depth 1 --no-tags

	Main=$(\gh repo view --json parent | \jq -c -r '.parent.owner.login, .parent.name' | \tr -s '\r\n' '/')
	Main=$(\echo "$Main" | \sed 's/\/$//')
	Main=$(\gh repo view "$Main" --json defaultBranchRef | \jq -r -c '.defaultBranchRef.name')

	\git merge upstream/"$Main" --allow-unrelated-histories -X theirs

	\cd - || \exit
}

export -f Script

parallel --jobs 6 Script ::: "${Repository[@]}"
