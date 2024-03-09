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

		Upstream=$(\gh repo view --json parent | \jq -c -r '.parent.owner.login, .parent.name' | \tr -s '\r\n' '/')

		if [[ "$Upstream" != "null/null" ]]; then
			Upstream=$(\echo "$Upstream" | \sed 's/\/$//')

			\echo "Upstream: "
			\echo "$Upstream"

			\git fetch upstream --depth 1 --no-tags

			Main=$(\gh repo view --json parent | \jq -c -r '.parent.owner.login, .parent.name' | \tr -s '\r\n' '/')
			Main=$(\echo "$Main" | \sed 's/\/$//')
			Main=$(\gh repo view "$Main" --json defaultBranchRef | \jq -r -c '.defaultBranchRef.name')

			\echo "Main: "
			\echo "$Main"

			\git reset --hard upstream/"$Main"
			\git clean -dfx
			\git add .
			\git commit -m "squash!"
			\git push --force
		fi

		\cd - || \exit
	done
done
