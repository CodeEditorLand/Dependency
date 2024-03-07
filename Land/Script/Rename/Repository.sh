#!/bin/bash

\echo "Process: Rename/Repository.sh"

# Context: CodeEditorLand/Environment/Stream

Directory=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && \pwd)

\readarray -t Repository <"$Directory"/../Cache/Repository/CodeEditorLand

for Repository in "${Repository[@]}"; do
	Folder="${Repository/'CodeEditorLand/'/}"

	\cd "$Folder" || \exit

	\pwd

	\gh repo set-default "$(\git remote get-url origin)"

	Rename=""

	Rename=$(\tr '[:lower:]' '[:upper:]' <<<"${Folder:0:1}")

	for ((i = 1; i < ${#Folder}; i++)); do
		if [ "${Folder:i:1}" = "-" ]; then
			Next="${Folder:i+1:1}"
			if [[ "$Next" =~ [a-z] ]]; then
				Upper=$(\tr '[:lower:]' '[:upper:]' <<<"$Next")
				Rename="${Rename}${Upper}"
				((i++))
			else
				Rename="${Rename}-"
			fi
		else
			Rename="${Rename}${Folder:i:1}"
		fi
	done

	Rename=$(\echo "$Rename" | \sed -E "s/vscode/Land/gI")

	\echo "Rename: "
	\echo "$Rename"

	\gh repo rename "$Rename" --yes

	\cd - || \exit
done
