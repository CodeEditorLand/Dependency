#!/bin/bash

\echo "Process: Restore/package.json.sh"

# Context: CodeEditorLand/Property/Land/Foundation

Directory=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && \pwd)

\readarray -t Repository <"$Directory"/../Cache/Repository/CodeEditorLand

for Repository in "${Repository[@]}"; do
	Folder="${Repository/'CodeEditorLand/'/}"

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

	\find . -type d \( -iname node_modules -o -iname vendor -o -iname dist -o -iname target -o -iname \.git -o -iname \.next \) -prune -false -o -iname package.json -type f -execdir bash -c "\git restore --source upstream/\"$Main\" package.json" \;

	\cd - || \exit
done
