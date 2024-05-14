#!/bin/bash

Current=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && \pwd)

# shellcheck disable=SC1091
\source "$Current"/../Fn/Argument.sh

Fn "$@"

for Organization in "${Organization[@]}"; do
	for Dependency in "${Dependency[@]}"; do
		"$Current"/../Fn/Setting/Dependency.sh "$Dependency"
	done
done
