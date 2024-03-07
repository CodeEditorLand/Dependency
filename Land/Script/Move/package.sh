#!/bin/bash

\echo "Process: Move/package.sh"

# Context: CodeEditorLand/Property/Stream

Directory=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && \pwd)

\readarray -t Repository <"$Directory"/../Cache/Repository/CodeEditorLand

for Repository in "${Repository[@]}"; do
	Folder="${Repository/'CodeEditorLand/'/}"

	\cd "$Folder" || \exit

	\pwd

	if [[ $Folder == "LandGeneratorCode" ]]; then
		mv generators/app/templates/ext-colortheme/package.json generators/app/templates/ext-colortheme/template.package.json
		mv generators/app/templates/ext-command-js/package.json generators/app/templates/ext-command-js/template.package.json
		mv generators/app/templates/ext-command-ts/package.json generators/app/templates/ext-command-ts/template.package.json
		mv generators/app/templates/ext-command-ts/vscode-webpack/package.json generators/app/templates/ext-command-ts/vscode-webpack/template.package.json
		mv generators/app/templates/ext-command-web/package.json generators/app/templates/ext-command-web/template.package.json
		mv generators/app/templates/ext-extensionpack/package.json generators/app/templates/ext-extensionpack/template.package.json
		mv generators/app/templates/ext-keymap/package.json generators/app/templates/ext-keymap/template.package.json
		mv generators/app/templates/ext-language/package.json generators/app/templates/ext-language/template.package.json
		mv generators/app/templates/ext-localization/package.json generators/app/templates/ext-localization/template.package.json
		mv generators/app/templates/ext-notebook-renderer/package.json generators/app/templates/ext-notebook-renderer/template.package.json
		mv generators/app/templates/ext-snippets/package.json generators/app/templates/ext-snippets/template.package.json
	fi

	\cd - || \exit
done
