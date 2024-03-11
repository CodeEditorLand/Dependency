#!/bin/bash

Service=(
	"oxc-project/oxc"
	"oxc-project/unicode-id-start"
	"oxc-project/oxc-resolver"
	"oxc-project/bench-javascript-parser-written-in-rust"
	"oxc-project/eslint-plugin-oxlint"
	"oxc-project/oxc-intellij-plugin"
	"oxc-project/mirrors-oxlint"
	"oxc-project/benchmark-files"
	"oxc-project/json-strip-comments"
	"oxc-project/aria-query"
	"oxc-project/oxc-assets"
	"oxc-project/javascript-parser-in-rust"
	"oxc-project/bench-javascript-linter"
	"oxc-project/bench-nodejs-resolver"
	"oxc-project/unicode-id"
	"oxc-project/oxc-fuzz-parser"
)

for Service in "${Service[@]}"; do
	\gh repo fork "$Service" --org CodeEditorLand
done
