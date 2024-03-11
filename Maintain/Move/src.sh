#!/bin/bash

Current=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && \pwd)

# shellcheck disable=SC1091
\source "$Current"/../Fn/Argument.sh

Fn "$@"

for Organization in "${Organization[@]}"; do
	for Service in "${Service[@]}"; do
		# shellcheck disable=SC2154
		\cd "$Folder"/"${Service/"${Organization}/"/}" || \exit

		\pwd

		if [[ -d "src" ]]; then
			\mkdir -p Source
			\cp -rf src/* Source/
			\rm -rf src/
		fi

		\find . -type d \( -iname node_modules -o -iname vendor -o -iname dist -o -iname target -o -iname \.git -o -iname \.next \) -prune -false -o -name src -type d -execdir bash -c '\mkdir -p Source ; \cp -rf src/* Source/ ; \rm -rf src/' \;

		\cd - || \exit
	done
done
