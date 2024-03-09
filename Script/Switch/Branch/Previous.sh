#!/bin/bash

\echo "Process: Switch/Branch/Previous.sh"

# Context: CodeEditorLand/Foundation/$Foundation/Service

Directory=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && \pwd)

\readarray -t Repository <"$Directory"/../../Cache/Repository/CodeEditorLand

for Repository in "${Repository[@]}"; do
	\cd "${Repository/'CodeEditorLand/'/}" || \exit

	\pwd

	# Upstream=$(\gh repo view --json parent | \jq -c -r '.parent.owner.login, .parent.name' | \tr -s '\r\n' '/')

	# if [[ "$Upstream" != "null/null" ]]; then
	\git switch -c previous
	\git switch previous
	\git push --set-upstream origin previous --force
	# fi

	\cd - || \exit
done
