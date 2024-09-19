#!/bin/bash

\pwd

Current=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && \pwd)

# shellcheck disable=SC1091
\source "$Current"/../Cache.sh

Fn

Remote() {
	git remote get-url "$1" 2> /dev/null || git remote get-url origin
}

Source=$(Remote Source | \sed 's/git@github.com:/ssh:\/\/git@github.com\//')

\echo "Source: "
\echo "$Source"

\git remote remove origin

\git remote add Source "$Source"
\git remote set-url Source "$Source"

\gh repo set-default "$(\git remote get-url Source)"

# shellcheck disable=SC2154
Parent="$OwnerParent/$NameParent"

\git remote remove Parent

if [[ "$Parent" != "null/null" ]]; then
	Parent="ssh://git@github.com/${Parent}"
	Parent=$(\echo "$Parent" | \sed 's/\/$/\.git/')

	\echo "Parent: "
	\echo "$Parent"

	\git remote add Parent "$Parent"
	\git remote set-url Parent "$Parent"
fi
