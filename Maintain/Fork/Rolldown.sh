#!/bin/bash

Dependency=(
	"rolldown/benchcases"
	"rolldown/benchmark-results-storage"
	"rolldown/metric"
	"rolldown/repros"
	"rolldown/rolldown"
	"rolldown/rolldown-on-deno"
	"rolldown/rolldown-plugin-node-polyfills"
	"rolldown/rolldown-starter-stackblitz"
	"rolldown/rolldown-vite-eco-ci"
	"rolldown/string_wizard"
	"rolldown/testcase"
	"rolldown/vite"
	"rolldown/vite-plugin-vue"
)

for Dependency in "${Dependency[@]}"; do
	\gh repo fork "$Dependency" --org CodeEditorLand
done
