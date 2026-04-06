#!/usr/bin/env sh

Current=$(cd -- "$(dirname -- "$0")" >/dev/null 2>&1 && pwd)

_FN_DIR_="$Current/../Fn"
export _FN_DIR_

# shellcheck disable=SC1091
. "$Current/../Fn/Argument.sh"

Fn "$@"

if [ $# -gt 0 ]; then
	if [ -n "$4" ]; then
		Branch=$4
	else
		echo "Cannot Branch."
		exit 1
	fi
fi

while IFS= read -r Organization; do
	(
		while IFS= read -r SubDependency; do
			(
				# shellcheck disable=SC2154
				SubName=$(echo "$SubDependency" | sed "s|${Organization}/||")
				cd "$Folder/$SubName" || exit

				git switch -c "$Branch"

				git switch "$Branch"

				cd - || exit
			) &
		done <<-EOF
			$SubDependency
		EOF

		wait
	) &
done <<-EOF
	$Organization
EOF

wait
