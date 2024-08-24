#!/bin/bash

Current=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && \pwd)

# shellcheck disable=SC1091
\source "$Current"/../Fn/Argument.sh

Fn "$@"

for Organization in "${Organization[@]}"; do
	(
		for SubDependency in "${SubDependency[@]}"; do
			(
				Name="${SubDependency/"${Organization}/"/}"

				# shellcheck disable=SC2154
				\cd "$Folder"/"${SubDependency/"${Organization}/"/}" || \exit

				if [[ $Name == "LandGeneratorCode" ]]; then
					mv generators/app/templates/ext-colortheme/package.json generators/app/templates/ext-colortheme/template.package.json
					mv generators/app/templates/ext-command-js/package.json generators/app/templates/ext-command-js/template.package.json
					mv generators/app/templates/ext-command-ts/package.json generators/app/templates/ext-command-ts/template.package.json
					mv generators/app/templates/ext-command-ts/vscode-esbuild/package.json generators/app/templates/ext-command-ts/vscode-esbuild/template.package.json
					mv generators/app/templates/ext-command-ts/vscode-webpack/package.json generators/app/templates/ext-command-ts/vscode-webpack/template.package.json
					mv generators/app/templates/ext-command-web/package.json generators/app/templates/ext-command-web/template.package.json
					mv generators/app/templates/ext-extensionpack/package.json generators/app/templates/ext-extensionpack/template.package.json
					mv generators/app/templates/ext-keymap/package.json generators/app/templates/ext-keymap/template.package.json
					mv generators/app/templates/ext-language/package.json generators/app/templates/ext-language/template.package.json
					mv generators/app/templates/ext-localization/package.json generators/app/templates/ext-localization/template.package.json
					mv generators/app/templates/ext-notebook-renderer/package.json generators/app/templates/ext-notebook-renderer/template.package.json
					mv generators/app/templates/ext-snippets/package.json generators/app/templates/ext-snippets/template.package.json
				fi

				if [[ $Name == "Oxc" ]]; then
					mv crates/oxc_linter/fixtures/import/with-syntax-error/package.json crates/oxc_linter/fixtures/import/with-syntax-error/fixture.package.json
				fi

				if [[ $Name == "OxcResolver" ]]; then
					mv fixtures/enhanced_resolve/test/fixtures/incorrect-package/pack1/package.json fixtures/enhanced_resolve/test/fixtures/incorrect-package/pack1/fixture.package.json
					mv fixtures/enhanced_resolve/test/fixtures/incorrect-package/pack2/package.json fixtures/enhanced_resolve/test/fixtures/incorrect-package/pack2/fixture.package.json
				fi

				# ignore ./Application/CodeEditorLand/Dependency/Land/Dependency/Codetour/package.json
				# ignore ./Application/CodeEditorLand/Dependency/Land/Dependency/LandJsAtomGrammar/package.json
				# ignore ./Application/CodeEditorLand/Dependency/Land/Dependency/LandJsDebugBrowsers/package.json
				# ignore ./Application/CodeEditorLand/Dependency/Land/Dependency/LandJsonLanguageservice/package.json
				# ignore ./Application/CodeEditorLand/Dependency/Land/Dependency/LandLanguageserverNode/tools/package.json
				# ignore ./Application/CodeEditorLand/Dependency/Tauri/Dependency/Tauri/tooling/cli/node/npm/linux-arm-gnueabihf/package.json

				\cd - || \exit
			) &
		done

		wait
	) &
done

wait
