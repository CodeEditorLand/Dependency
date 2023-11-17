#!/bin/bash

echo "Process: Clean/Repository.sh"

# Context: CodeEditorLand/Application

Directory=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

readarray -t Repository < "$Directory"/../Cache/Repository/CodeEditorLand.md

for Repository in "${Repository[@]}"; do
	Folder="${Repository/'CodeEditorLand/'/}"

	cd "$Folder" || exit

	pwd

	git fetch origin
	git fetch upstream --depth 1 --no-tags

	git tag | xargs -L 1 | xargs git push origin --delete
	git tag | xargs -L 1 | xargs git tag --delete

	\find . \( \
		-iname .prettierrc \
		-o -iname .clang-format \
		-o -iname .csharpierrc \
		-o -iname .editorconfig \
		-o -iname .github \
		-o -iname .pnpm-store \
		-o -iname .prettierignore \
		-o -iname .prettierrc.js \
		-o -iname .prettierrc.json \
		-o -iname .prettierrc.yaml \
		-o -iname .stylua.toml \
		-o -iname biome.json \
		-o -iname rome.json \
		-o -iname Cargo.lock \
		-o -iname jsconfig.json \
		-o -iname package-lock.json \
		-o -iname pnpm-lock.yaml \
		-o -iname prettier.config.js \
		-o -iname rustfmt.toml \
		-o -iname yarn.lock \
		\) -exec rm -rf {} \;

	cd - || exit
done
