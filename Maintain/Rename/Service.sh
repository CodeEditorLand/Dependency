#!/bin/bash

Current=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && \pwd)

if [ $# -gt 0 ]; then
	if [ -f "$1" ]; then
		\mapfile -t Organization < <(jq -r '.[]' "$1" | \tr -d '\r')
	else
		\echo "Cannot Organization."
		\exit 1
	fi

	if [ -f "$2" ]; then
		\mapfile -t Service < <(jq -r '.[]' "$2" | \tr -d '\r')
	else
		\echo "Cannot Service."
		\exit 1
	fi

	if [ -n "$3" ]; then
		Foundation=$3
	else
		\echo "Cannot Foundation."
		\exit 1
	fi
fi

Git="$Current"/../../"$Foundation"/Service

for Organization in "${Organization[@]}"; do
	for Service in "${Service[@]}"; do
		Folder="${Service/"${Organization}/"/}"

		\cd "$Git"/"$Folder" || \exit

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
