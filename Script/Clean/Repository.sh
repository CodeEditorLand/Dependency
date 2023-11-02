#!/bin/bash

# Context: CodeEditorLand/Application

Directory=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

readarray -t Repository < "$Directory"/../Cache/Repository/CodeEditorLand.md

for Repository in "${Repository[@]}"; do
	Current="$(git config --get remote.origin.url)"
	Folder="${Repository/'CodeEditorLand/'/}"

	if [[ $Current != "$URL" ]]; then
		cd "${Folder}" || exit

		git fetch
		git tag | xargs -L 1 | xargs git push origin --delete
		git tag | xargs -L 1 | xargs git tag --delete

		cd - || exit
	fi
done
