#!/bin/bash

\pwd

Origin=$(\git remote get-url origin)
Origin=$(\echo "$Origin" | \sed 's/git@github.com:/ssh:\/\/git@github.com\//')

\git remote set-url origin "$Origin"

\echo "Origin: "
\echo "$Origin"

\gh repo set-default "$(\git remote get-url origin)"

Upstream=$(\gh repo view --json parent | \jq -c -r '.parent.owner.login, .parent.name' | \tr -s '\r\n' '/')

\git remote remove upstream

if [[ "$Upstream" != "null/null" && "$Upstream" != "null/null/" ]]; then
	Upstream="ssh://git@github.com/${Upstream}"
	Upstream=$(\echo "$Upstream" | \sed 's/\/$/\.git/')

	\echo "Upstream: "
	\echo "$Upstream"

	\git remote add upstream "$Upstream"
	\git remote set-url upstream "$Upstream"
fi
