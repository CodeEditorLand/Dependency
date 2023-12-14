#!/bin/bash

echo "Process: Clean/Detail.sh"

# Context: CodeEditorLand/Application

pwd

jq "del(.eslintConfig,.prettier,.peerDependencies,.engines,.tags,.categories,.keywords)" package.json >|package.json.tmp
\mv package.json.tmp package.json

Omit=(
	"eslint-config-prettier"
	"eslint-config-standard"
	"eslint-plugin-import"
	"eslint-plugin-node"
	"eslint-plugin-promise"
	"eslint-plugin-react"
	"eslint-plugin-require-path-exists"
	"eslint-plugin-standard"
	"eslint"
	"prettier"
	"tslint"
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
