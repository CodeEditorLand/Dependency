#!/bin/bash

\echo "Process: Rename/Branch.sh"

# Context: CodeEditorLand/CodeEditorLand/Stream

Directory=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && \pwd)

\readarray -t Repository < "$Directory"/../Cache/Repository/CodeEditorLand.md

for Repository in "${Repository[@]}"; do
	\cd "${Repository/'CodeEditorLand/'/}" || \exit

	\pwd

	\gh repo set-default "$(\git remote get-url origin)"

	\git switch -c main

	\git push --set-upstream origin main

	\gh repo edit --default-branch main

	\cd - || \exit
done
