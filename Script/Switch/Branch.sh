#!/bin/bash

\echo "Process: Rename/Branch.sh"

# Context: CodeEditorLand/Environment/Land

Directory=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && \pwd)

\readarray -t Repository < "$Directory"/../Cache/Repository/Environment.md

for Repository in "${Repository[@]}"; do
	\cd "${Repository/'CodeEditorLand/'/}" || \exit

	\pwd

	Upstream=$(\gh repo view --json parent | \jq -c -r '.parent.owner.login, .parent.name' | \tr -s '\r\n' '/')

	if [[ "$Upstream" != "null/null" ]]; then
		\git switch -c instream
		\git push -f --set-upstream origin instream
	fi

	\cd - || \exit
done
