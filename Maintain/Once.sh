#!/bin/bash

# TODO: Run once after repository creation
# TODO: Event Log

Current=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && \pwd)

_Dependency=(
	"None"
)

for _Dependency in "${_Dependency[@]}"; do
	Cache="$Current"/Cache

	Organization="$Cache"/Organization/"$_Dependency".json
	# Exclude="$Cache"/Exclude/"$_Dependency".json
	Dependency="$Cache"/Dependency/"$_Dependency".json

	# "$Current"/Cache/Dependency.sh \
	# 	"$Organization" \
	# 	"$Exclude" \
	# 	"$_Dependency"

	"$Current"/Setting/Dependency.sh \
		"$Organization" \
		"$Dependency" \
		"$_Dependency"
done
