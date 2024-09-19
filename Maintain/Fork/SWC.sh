#!/bin/bash

Dependency=(
	"swc-project/oxc"
)

for Dependency in "${Dependency[@]}"; do
	\gh repo fork "$Dependency" --org CodeEditorLand
done
