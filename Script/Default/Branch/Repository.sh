#!/bin/bash

\echo "Process: Default/Branch/Repository.sh"

# Context: CodeEditorLand/Environment/Stream

Directory=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && \pwd)

\readarray -t Repository <"$Directory"/../../Cache/Repository/CodeEditorLand.md

for Repository in "${Repository[@]}"; do
	\cd "${Repository/'CodeEditorLand/'/}" || \exit

	\pwd

	# Upstream=$(\gh repo view --json parent | \jq -c -r '.parent.owner.login, .parent.name' | \tr -s '\r\n' '/')

	# if [[ "$Upstream" != "null/null" ]]; then
	\gh repo edit --default-branch repository
	# fi

	\cd - || \exit
done
