#!/bin/bash

# Current directory
Directory=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

Organization="CodeEditorLand"

Repository=()

for ((Page = 1; Page <= 10; Page++)); do
	mapfile -t TemporaryRepository < <(printf "%s" "$(
		gh api \
			-H "Accept: application/vnd.github+json" \
			-H "X-GitHub-Api-Version: 2022-11-28" \
			orgs/"${Organization}"/repos?per_page=100\&page=${Page} | jq -r '.[].full_name'
	)" | tr -d '\r')

	Repository+=("${TemporaryRepository[@]}")
done

printf "%s\n" "${Repository[@]}" > "$Directory"/Repository/CodeEditorLand.md
