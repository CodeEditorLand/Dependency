#!/usr/bin/env sh

\pwd

Fn() {
	if [ $# -gt 0 ]; then
		if [ -f "$1" ]; then
			Organization=""
			while IFS= \read -r _line; do
				Organization="${Organization}${_line}
"
			done <<- EOF
				$(jq -r '.[]' "$1" | \tr -d '\r')
			EOF
			Organization=$(\printf '%s' "$Organization" | \sed '/^[[:space:]]*$/d')
		else
			\echo "Cannot Organization."
			\exit 1
		fi

		if [ -f "$2" ]; then
			SubDependency=""
			while IFS= \read -r _line; do
				SubDependency="${SubDependency}${_line}
"
			done <<- EOF
				$(jq -r '.[]' "$2" | \tr -d '\r')
			EOF
			SubDependency=$(\printf '%s' "$SubDependency" | \sed '/^[[:space:]]*$/d')
		else
			\echo "Cannot SubDependency."
			\exit 1
		fi

		if [ -n "$3" ]; then
			Dependency=$3
		else
			\echo "Cannot Dependency."
			\exit 1
		fi
	fi

	# _FN_DIR_ must be set by the caller before sourcing this file.
	# It should point to the Fn/ directory (i.e. the directory containing this file).
	# shellcheck disable=SC2154
	Folder=$(\cd -- "$_FN_DIR_" > /dev/null 2>&1 && \pwd)/../../"$Dependency"/Dependency
}

\export Fn

\export Folder
\export Organization
\export SubDependency
\export Dependency
