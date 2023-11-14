#!/bin/bash

# Context: CodeEditorLand/Application

Directory=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

readarray -t Repository <"$Directory"/../Cache/Repository/CodeEditorLand.md

for Repository in "${Repository[@]}"; do
	Folder="${Repository/'CodeEditorLand/'/}"

	cd "$Folder" || exit

	pwd

	git fetch
	git tag | xargs -L 1 | xargs git push origin --delete
	git tag | xargs -L 1 | xargs git tag --delete

	\find . \( \
		-iname .prettierrc \
		-o -iname .prettierrc.js \
		-o -iname .prettierrc.json \
		-o -iname .prettierrc.yaml \
		-o -iname .github \
		\) -exec rm -rf {} \;

	cd - || exit
done
