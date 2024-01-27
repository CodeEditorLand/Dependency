#!/bin/bash

\echo "Process: Clone/Repository.sh"

# Context: CodeEditorLand/Application

Directory=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && \pwd)

\readarray -t Repository < "$Directory"/../Cache/Repository/Build.md

for Repository in "${Repository[@]}"; do
	\git clone --depth=1 --recurse-submodules --shallow-submodules "ssh://git@github.com/${Repository}.git"
done
