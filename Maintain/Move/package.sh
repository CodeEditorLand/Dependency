#!/bin/bash

Current=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && \pwd)

# shellcheck disable=SC1091
\source "$Current"/../Fn/Argument.sh

Fn "$@"

for Organization in "${Organization[@]}"; do
	for Service in "${Service[@]}"; do
		Name="${Service/"${Organization}/"/}"

		# shellcheck disable=SC2154
		\cd "$Folder"/"${Service/"${Organization}/"/}" || \exit

		if [[ $Name == "LandGeneratorCode" ]]; then
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
done
