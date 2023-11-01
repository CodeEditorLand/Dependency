#!/bin/bash

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

for Repository in "${Repository[@]}"; do
	Current="$(git config --get remote.origin.url)"
	URL="ssh://git@github.com/${Repository}.git"

	if [[ $Current != "$URL" ]]; then
		git clone --depth=1 --recurse-submodules --shallow-submodules "ssh://git@github.com/${Repository}.git"
	fi
done
