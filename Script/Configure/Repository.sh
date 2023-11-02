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
	Upstream="ssh://git@github.com/$(echo "$Repository" | sed 's/CodeEditorLand\//Microsoft\//g').git"
	Folder="${Repository/'CodeEditorLand/'/}"

	if [[ $Current != "$URL" ]]; then
		cd "${Folder}" || exit

		git remote add upstream "$Upstream"
		git remote set-url upstream "$Upstream"

		cd - || exit
	fi
done
