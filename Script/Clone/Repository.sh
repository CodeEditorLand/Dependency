#!/bin/bash

\echo "Process: Clone/Repository.sh"

# Context: CodeEditorLand/Environment/Stream

Directory=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && \pwd)

\readarray -t Repository <"$Directory"/../Cache/Repository/CodeEditorLand.md

for Repository in "${Repository[@]}"; do
	\git clone --filter=tree:0 --depth=1 --recurse-submodules --shallow-submodules "ssh://git@github.com/${Repository}.git"
done
