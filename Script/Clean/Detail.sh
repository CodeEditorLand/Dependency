#!/bin/bash

echo "Process: Clean/Detail.sh"

# Context: CodeEditorLand/Application

pwd

jq "del(.eslintConfig,.prettier,.peerDependencies,.engines,.tags,.categories,.keywords,.scripts.lint,.scripts.[\"lint-fix\"])" package.json >|package.json.tmp
\mv package.json.tmp package.json

Omit=(
	"@typescript-eslint/eslint-plugin"
	"@typescript-eslint/parser"
	"eslint-config-prettier"
	"eslint-config-standard"
	"eslint-import-resolver-node"
	"eslint-import-resolver-typescript"
	"eslint-plugin-header"
	"eslint-plugin-import"
	"eslint-plugin-jsdoc"
	"eslint-plugin-local"
	"eslint-plugin-node"
	"eslint-plugin-prettier"
	"eslint-plugin-promise"
	"eslint-plugin-react"
	"eslint-plugin-require-path-exists"
	"eslint-plugin-standard"
	"eslint-plugin-unicorn"
	"eslint"
	"gulp-eslint"
	"prettier"
	"tslint"
)

Key() {
	local Type="$1"

	for Dependency in "${Omit[@]}"; do
		jq "del(.[\"${Type}\"].[\"${Dependency}\"])" package.json >|package.json.tmp
		\mv package.json.tmp package.json
	done
}

Key "dependencies"
Key "devDependencies"
