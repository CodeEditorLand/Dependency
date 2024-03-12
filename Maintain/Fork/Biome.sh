#!/bin/bash

Service=(
	"biomejs/biome"
	"biomejs/setup-biome"
	"biomejs/biome-vscode"
	"biomejs/discord-utils-bot"
	"biomejs/biome-intellij"
	"biomejs/resources"
	"biomejs/pre-commit"
)

for Service in "${Service[@]}"; do
	\gh repo fork "$Service" --org CodeEditorLand
done
