#!/bin/bash

echo "Process: Configure/Repository.sh"

# Context: CodeEditorLand/Application

Directory=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

readarray -t Repository < "$Directory"/../Cache/Repository/CodeEditorLand.md

for Repository in "${Repository[@]}"; do
	Folder="${Repository/'CodeEditorLand/'/}"

	cd "$Folder" || exit

	pwd

	gh repo set-default "$(git remote get-url origin)"

	Upstream=$(gh repo view --json parent | jq -c -r '.parent.owner.login, .parent.name' | tr -s '\r\n' '/')

	if [[ "$Upstream" != "null/null" ]]; then
		Upstream="ssh://git@github.com/${Upstream}"
		Upstream=$(echo "$Upstream" | sed 's/\/$/\.git/')

		echo "Upstream: "
		echo "$Upstream"

		git remote remove upstream
		git remote add upstream "$Upstream"
		git remote set-url upstream "$Upstream"
	fi

	cd - || exit
done
