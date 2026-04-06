#!/usr/bin/env sh

Current=$(cd -- "$(dirname -- "$0")" >/dev/null 2>&1 && pwd)

_FN_DIR_="$Current/../Fn"
export _FN_DIR_

# shellcheck disable=SC1091
. "$Current/../Fn/Argument.sh"

Fn "$@"

while IFS= read -r Organization; do
	while IFS= read -r SubDependency; do
		# shellcheck disable=SC2154
		SubName=$(echo "$SubDependency" | sed "s|${Organization}/||")
		cd "$Folder/$SubName" || exit

		"$Current/../Fn/Save/Dependency.sh"

		git fetch Parent --no-tags

		find . -type d \( -iname node_modules -o -iname .git \) -prune -false -o -iname package.json -type f -execdir sh -c "git restore --source Parent/\"\$(gh repo view \"\$(gh repo view --json parent | jq -c -r '.parent.owner.login, .parent.name' | tr -s '\r\n' '/' | sed 's/\/\$//')\" --json defaultBranchRef | jq -r -c '.defaultBranchRef.name')\" package.json" \;

		cd - || exit
	done <<-EOF
		$SubDependency
	EOF
done <<-EOF
	$Organization
EOF
