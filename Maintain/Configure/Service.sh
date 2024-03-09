#!/bin/bash

Current=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && \pwd)

# shellcheck disable=SC1091
\source "$Current"/../Fn/Argument.sh

Fn "$@"

# shellcheck disable=SC2154
Git="$Current"/../../"$Foundation"/Service

for Organization in "${Organization[@]}"; do
	for Service in "${Service[@]}"; do
		Folder="${Service/"${Organization}/"/}"

		\cd "$Git"/"$Folder" || \exit

		\pwd

		Origin=$(\git remote get-url origin)
		Origin=$(\echo "$Origin" | \sed 's/git@github.com:/ssh:\/\/git@github.com\//')

		\git remote set-url origin "$Origin"

		\echo "Origin: "
		\echo "$Origin"

		\gh repo set-default "$(\git remote get-url origin)"

		Upstream=$(\gh repo view --json parent | \jq -c -r '.parent.owner.login, .parent.name' | \tr -s '\r\n' '/')

		echo "$Upstream"

		if [[ "$Upstream" != "null/null" ]]; then
			Upstream="ssh://git@github.com/${Upstream}"
			Upstream=$(\echo "$Upstream" | \sed 's/\/$/\.git/')

			\echo "Upstream: "
			\echo "$Upstream"

			\git remote remove upstream
			\git remote add upstream "$Upstream"
			\git remote set-url upstream "$Upstream"
		fi

		\cd - || \exit
	done
done
