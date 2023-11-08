#!/bin/bash

# Contextless

Directory=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

Organization="CodeEditorLand"

Repository=()

Omit="CodeEditorLand/CodeEditorLand"

for ((Page = 1; Page <= 10; Page++)); do
	mapfile -t TemporaryRepository < <(printf "%s" "$(
		gh api \
			-H "Accept: application/vnd.github+json" \
			-H "X-GitHub-Api-Version: 2022-11-28" \
			orgs/"${Organization}"/repos?per_page=100\&page=${Page} | jq -r '.[].full_name'
	)" | tr -d '\r')

	for Temporary in "${TemporaryRepository[@]}"; do
		if [[ "$Temporary" != "$Omit" ]]; then
			Repository+=("$Temporary")
		fi
	done
done

printf "%s\n" "${Repository[@]}" > "$Directory"/Repository/CodeEditorLand.md
