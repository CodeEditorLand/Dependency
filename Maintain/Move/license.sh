#!/usr/bin/env sh

Current=$(cd -- "$(dirname -- "$0")" > /dev/null 2>&1 && pwd)

_FN_DIR_="$Current/../Fn"
export _FN_DIR_

# shellcheck disable=SC1091
. "$Current/../Fn/Argument.sh"

Fn "$@"

while IFS= read -r Organization; do
	(
		while IFS= read -r SubDependency; do
			(
				# shellcheck disable=SC2154
				SubName=$(echo "$SubDependency" | sed "s|${Organization}/||")
				cd "$Folder/$SubName" || exit

				find . -type d \( -iname node_modules -o -iname .git \) -prune -false -o -iname license.txt -type f -execdir mv {} LICENSE \;
				find . -type d \( -iname node_modules -o -iname .git \) -prune -false -o -iname license.md -type f -execdir mv {} LICENSE \;

				cd - || exit
			) &
		done <<- EOF
			$SubDependency
		EOF

		wait
	) &
done <<- EOF
	$Organization
EOF

wait
