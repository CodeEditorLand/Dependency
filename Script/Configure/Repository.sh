#!/bin/bash

# Context: CodeEditorLand/Application

Directory=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

readarray -t Repository < "$Directory"/../Cache/Repository/CodeEditorLand.md

for Repository in "${Repository[@]}"; do
	Current="$(git config --get remote.origin.url)"
	Upstream="ssh://git@github.com/$(echo "$Repository" | sed 's/CodeEditorLand\//Microsoft\//g').git"
	Folder="${Repository/'CodeEditorLand/'/}"

	if [[ $Current != "$URL" ]]; then
		cd "${Folder}" || exit

		git remote add upstream "$Upstream"
		git remote set-url upstream "$Upstream"

		cd - || exit
	fi
done
