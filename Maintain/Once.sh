#!/bin/bash

Current=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && \pwd)

Filter=(
	"None"
)

for Filter in "${Filter[@]}"; do
	Cache="$Current"/Cache

	Organization="$Cache"/Organization/"$Filter".json
	Exclude="$Cache"/Exclude/"$Filter".json
	Dependency="$Cache"/Dependency/"$Filter".json

	"$Current"/Cache/Dependency.sh \
		"$Organization" \
		"$Exclude" \
		"$Dependency"

	# "$Current"/Setting/Dependency.sh \
	# 	"$Organization" \
	# 	"$Dependency" \
	# 	"$Filter"
done
