#!/bin/bash

\echo "Action: Clean/Detail.sh"

# Context: CodeEditorLand/Application

\pwd

\jq -S "del(.eslintConfig,.prettier,.peerDependencies,.engines,.tags,.categories,.keywords,.scripts.lint,.scripts.[\"lint-fix\"],.scripts.[\"lint:fix\"],.scripts.[\"lint:eslint\"],.scripts.[\"lint:client\"],.scripts.[\"lint:scripts\"],.scripts.[\"lint:server\"],.scripts.pretest,.scripts.test,.scripts.[\"test:lint\"],.scripts.[\"test:eslint-rules\"],.scripts.posttest,.test,.tslint,.check,.fix)" package.json >| package.json.tmp
\mv package.json.tmp package.json

Omit=(
	"@babel/eslint-config-internal"
	"@babel/eslint-parser"
	"@babel/eslint-plugin-development-internal"
	"@babel/eslint-plugin-development"
	"@eslint/eslintrc"
	"@eslint/js"
	"@microsoft/eslint-config-azuretools"
	"@microsoft/eslint-config-fast-dna"
	"@nicolo-ribaudo/eslint-scope-5-internals"
	"@typescript-eslint/eslint-plugin-tslint"
	"@typescript-eslint/eslint-plugin"
	"@typescript-eslint/experimental-utils"
	"@typescript-eslint/parser"
	"@typescript-eslint/utils"
	"eslint-cli"
	"eslint-config-airbnb"
	"eslint-config-commonality"
	"eslint-config-next"
	"eslint-config-prettier"
	"eslint-config-standard"
	"eslint-formatter-autolinkable-stylish"
	"eslint-formatter-codeframe"
	"eslint-import-resolver-node"
	"eslint-import-resolver-typescript"
	"eslint-plugin-filenames"
	"eslint-plugin-header"
	"eslint-plugin-html"
	"eslint-plugin-import"
	"eslint-plugin-jest"
	"eslint-plugin-jsdoc"
	"eslint-plugin-jsx-a11y"
	"eslint-plugin-license-header"
	"eslint-plugin-local-rules"
	"eslint-plugin-local"
	"eslint-plugin-n"
	"eslint-plugin-no-null"
	"eslint-plugin-no-only-tests"
	"eslint-plugin-node"
	"eslint-plugin-notice"
	"eslint-plugin-prefer-arrow"
	"eslint-plugin-prettier"
	"eslint-plugin-promise"
	"eslint-plugin-react-hooks"
	"eslint-plugin-react"
	"eslint-plugin-require-path-exists"
	"eslint-plugin-security"
	"eslint-plugin-simple-import-sort"
	"eslint-plugin-standard"
	"eslint-plugin-tslint"
	"eslint-plugin-unicorn"
	"eslint-plugin-unused-imports"
	"eslint-plugin-vue"
	"eslint-rule-composer"
	"eslint-scope"
	"eslint-utils"
	"eslint-visitor-keys"
	"eslint"
	"gulp-eslint"
	"prettier-eslint-cli"
	"prettier-eslint"
	"prettier"
	"tslint-eslint-rules"
	"tslint"
	"vue-eslint-parser"
)

Key() {
	local Type="$1"

	for Dependency in "${Omit[@]}"; do
		\jq -S "del(.[\"${Type}\"].[\"${Dependency}\"])" package.json >| package.json.tmp
		\mv package.json.tmp package.json
	done
}

Key "dependencies"
Key "devDependencies"
