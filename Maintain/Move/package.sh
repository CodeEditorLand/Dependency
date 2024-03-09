#!/bin/bash

Current=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && \pwd)

if [ $# -gt 0 ]; then
	if [ -f "$1" ]; then
		\mapfile -t Organization < <(jq -r '.[]' "$1" | \tr -d '\r')
	else
		\echo "Cannot Organization."
		\exit 1
	fi

	if [ -f "$2" ]; then
		\mapfile -t Service < <(jq -r '.[]' "$2" | \tr -d '\r')
	else
		\echo "Cannot Service."
		\exit 1
	fi

	if [ -n "$3" ]; then
		Foundation=$3
	else
		\echo "Cannot Foundation."
		\exit 1
	fi
fi

Git="$Current"/../../"$Foundation"/Service

for Organization in "${Organization[@]}"; do
	for Service in "${Service[@]}"; do
		Folder="${Service/"${Organization}/"/}"

		\cd "$Git"/"$Folder" || \exit

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
done
