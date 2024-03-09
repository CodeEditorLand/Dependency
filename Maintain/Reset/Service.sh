#!/bin/bash

Current=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && \pwd)

# shellcheck disable=SC1091
source "$Current"/../Fn/Argument.sh

Fn "$@"

# shellcheck disable=SC2154
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
