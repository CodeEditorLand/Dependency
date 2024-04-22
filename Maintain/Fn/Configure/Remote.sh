#!/bin/bash

\pwd

URL() {
	git remote get-url "$1" 2>/dev/null || git remote get-url origin
}

Source=$(URL Source | \sed 's/git@github.com:/ssh:\/\/git@github.com\//')

\git remote set-url Source "$Source"

\gh repo set-default "$(\git remote get-url Source)"

Parent=$(\gh repo view --json parent | \jq -c -r '.parent.owner.login, .parent.name' | \tr -s '\r\n' '/')

\git remote remove Parent

if [[ "$Parent" != "null/null" && "$Parent" != "null/null/" ]]; then
	Parent=$("ssh://git@github.com/${Parent}" | \sed 's/\/$/\.git/')

	\git remote add Parent "$Parent"
	\git remote set-url Parent "$Parent"
fi
