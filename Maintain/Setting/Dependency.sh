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
			("$Current/../Fn/Setting/Dependency.sh" "$SubDependency") &
		done <<- EOF
			$SubDependency
		EOF

		wait
	) &
done <<- EOF
	$Organization
EOF

wait
