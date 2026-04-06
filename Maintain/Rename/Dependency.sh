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
				Name=$(echo "$SubDependency" | sed "s|${Organization}/||")

				# Convert kebab-case to PascalCase
				Rename=$(echo "$Name" | awk -F'-' '{
					result = ""
					for (i = 1; i <= NF; i++) {
						word = $i
						if (length(word) > 0) {
							result = result toupper(substr(word, 1, 1)) substr(word, 2)
						}
					}
					print result
				}')

				Rename=$(echo "$Rename" | sed -E "s/vscode/Land/gI")

				gh repo rename --repo "$SubDependency" "$Rename" --yes
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
