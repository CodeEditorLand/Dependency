#!/bin/bash

echo "Process: Configure/Repository.sh"

# Context: CodeEditorLand/Application

Directory=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

readarray -t Repository < "$Directory"/../Cache/Repository/CodeEditorLand.md

rm -rf "$Directory"/../../.gitmodules

for Repository in "${Repository[@]}"; do
	Folder="${Repository/'CodeEditorLand/'/}"

	cd "$Folder" || exit

	pwd

	gh repo set-default "$(git remote get-url origin)"

	Origin="ssh://git@github.com/${Repository}.git"

	echo "Folder: "
	echo "$Folder"

	echo "Origin: "
	echo "$Origin"

	read -r -d '' Submodule <<- EOM
		[submodule "Application/${Folder}"]
		path = Application/${Folder}
		url = ${Origin}
	EOM

	echo "$Submodule" >> "$Directory"/../../.gitmodules

	cd - || exit
done
