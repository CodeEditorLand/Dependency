#!/bin/bash

Current=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && \pwd)

# shellcheck disable=SC1091
\source "$Current"/../Fn/Argument.sh

Fn "$@"

for Organization in "${Organization[@]}"; do
	for Service in "${Service[@]}"; do
		Name="${Service/"${Organization}/"/}"

		Rename=""

		Rename=$(\tr '[:lower:]' '[:upper:]' <<<"${Name:0:1}")

		for ((i = 1; i < ${#Name}; i++)); do
			if [ "${Name:i:1}" = "-" ]; then
				Next="${Name:i+1:1}"
				if [[ "$Next" =~ [a-z] ]]; then
					Upper=$(\tr '[:lower:]' '[:upper:]' <<<"$Next")
					Rename="${Rename}${Upper}"
					((i++))
				else
					Rename="${Rename}-"
				fi
			else
				Rename="${Rename}${Name:i:1}"
			fi
		done

		Rename=$(\echo "$Rename" | \sed -E "s/vscode/Land/gI")

		\gh repo rename --repo "$Service" "$Rename" --yes
	done
done
