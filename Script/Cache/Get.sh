#!/bin/bash

echo "Process: Cache/Get.sh"

# Contextless

Directory=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

Organization="CodeEditorLand"

Repository=()

Omit=(
	"CodeEditorLand/CodeEditorLand"
	"CodeEditorLand/.github"
)

for ((Page = 1; Page <= 10; Page++)); do
	mapfile -t TemporaryRepository < <(printf "%s" "$(
		gh api \
			-H "Accept: application/vnd.github+json" \
			-H "X-GitHub-Api-Version: 2022-11-28" \
			orgs/"${Organization}"/repos?per_page=100\&page=${Page} | jq -r '.[].full_name'
	)" | tr -d '\r')

	for Temporary in "${TemporaryRepository[@]}"; do
		Flag=false

		for RepositoryOmit in "${Omit[@]}"; do
			if [ "$Temporary" = "$RepositoryOmit" ]; then
				Flag=true

				break
			fi
		done

		if [ "$Flag" = false ]; then
			Repository+=("$Temporary")
		fi
	done
done

printf "%s\n" "${Repository[@]}" > "$Directory"/Repository/CodeEditorLand.md
