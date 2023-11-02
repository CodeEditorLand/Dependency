#!/bin/bash

Directory=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

readarray -t Repository < "$Directory"/../Cache/Repository/CodeEditorLand.md

for Repository in "${Repository[@]}"; do
	Current="$(git config --get remote.origin.url)"
	URL="ssh://git@github.com/${Repository}.git"

	if [[ $Current != "$URL" ]]; then
		git clone --depth=1 --recurse-submodules --shallow-submodules "ssh://git@github.com/${Repository}.git"
	fi
done
