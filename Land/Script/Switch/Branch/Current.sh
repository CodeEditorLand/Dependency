#!/bin/bash

\echo "Process: Switch/Branch/Current.sh"

# Context: CodeEditorLand/Property/Foundation

Directory=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && \pwd)

\readarray -t Repository <"$Directory"/../../Cache/Repository/CodeEditorLand

for Repository in "${Repository[@]}"; do
	\cd "${Repository/'CodeEditorLand/'/}" || \exit

	\pwd

	# Upstream=$(\gh repo view --json parent | \jq -c -r '.parent.owner.login, .parent.name' | \tr -s '\r\n' '/')

	# if [[ "$Upstream" != "null/null" ]]; then
	\git switch -c repository
	\git switch repository
	\git push --set-upstream origin repository --force
	# fi

	\cd - || \exit
done
