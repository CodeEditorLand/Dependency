#!/bin/bash

Current=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && \pwd)

# shellcheck disable=SC1091
\source "$Current"/../Fn/Argument.sh

Fn "$@"

for Organization in "${Organization[@]}"; do
	for Service in "${Service[@]}"; do
		Folder="${Service/"${Organization}/"/}"

		# shellcheck disable=SC2154
		\cd "$Current"/../../"$Foundation"/Service/"$Folder" || \exit

		\pwd

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
done
