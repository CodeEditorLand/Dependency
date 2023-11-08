#!/bin/bash

# Context: CodeEditorLand/Application

Directory=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

readarray -t Repository < "$Directory"/../Cache/Repository/CodeEditorLand.md

for Repository in "${Repository[@]}"; do
	Folder="${Repository/'CodeEditorLand/'/}"

	cd "${Folder}" || exit

	gh repo set-default "$(git remote get-url origin)"

	Upstream=$(gh repo view --json parent | jq --compact-output -r '.parent.owner.login, .parent.name' | tr -s '\r\n' '/')
	Upstream="ssh://git@github.com/${Upstream}"
	Upstream=$(echo "$Upstream" | sed 's/\/$/\.git/')

	git remote add upstream "$Upstream"
	git remote set-url upstream "$Upstream"

	cd - || exit
done
