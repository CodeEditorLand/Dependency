#!/bin/bash

Dependency=(
	"biomejs/biome"
	"biomejs/setup-biome"
	"biomejs/biome-vscode"
	"biomejs/discord-utils-bot"
	"biomejs/biome-intellij"
	"biomejs/resources"
	"biomejs/pre-commit"
)

for Dependency in "${Dependency[@]}"; do
	\gh repo fork "$Dependency" --org CodeEditorLand
done
