#!/bin/bash

\echo "Process: Switch/Branch/Stream.sh"

# Context: CodeEditorLand/Property/Stream

Directory=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && \pwd)

\readarray -t Repository <"$Directory"/../../Cache/Repository/CodeEditorLand

for Repository in "${Repository[@]}"; do
	\cd "${Repository/'CodeEditorLand/'/}" || \exit

	\pwd

	# Upstream=$(\gh repo view --json parent | \jq -c -r '.parent.owner.login, .parent.name' | \tr -s '\r\n' '/')

	# if [[ "$Upstream" != "null/null" ]]; then
	\git switch -c stream
	\git switch stream
	\git push --set-upstream origin stream --force
	# fi

	\cd - || \exit
done
