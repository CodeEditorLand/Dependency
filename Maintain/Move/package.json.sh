#!/usr/bin/env sh

Current=$(cd -- "$(dirname -- "$0")" > /dev/null 2>&1 && pwd)

_FN_DIR_="$Current/../Fn"
export _FN_DIR_

# shellcheck disable=SC1091
. "$Current/../Fn/Argument.sh"

Fn "$@"

while IFS= read -r Organization; do
	(
		while IFS= read -r SubDependency; do
			(
				# shellcheck disable=SC2154
				Name=$(echo "$SubDependency" | sed "s|${Organization}/||")
				SubName="$Name"
				cd "$Folder/$SubName" || exit

				case "$Name" in
					LandGeneratorCode)
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
						;;
					Oxc)
						mv crates/oxc_linter/fixtures/import/with-syntax-error/package.json crates/oxc_linter/fixtures/import/with-syntax-error/fixture.package.json
						;;
					OXCResolver)
						mv fixtures/enhanced_resolve/test/fixtures/incorrect-package/pack1/package.json fixtures/enhanced_resolve/test/fixtures/incorrect-package/pack1/fixture.package.json
						mv fixtures/enhanced_resolve/test/fixtures/incorrect-package/pack2/package.json fixtures/enhanced_resolve/test/fixtures/incorrect-package/pack2/fixture.package.json
						;;
				esac

				cd - || exit
			) &
		done <<- EOF
			$SubDependency
		EOF

		wait
	) &
done <<- EOF
	$Organization
EOF

wait
