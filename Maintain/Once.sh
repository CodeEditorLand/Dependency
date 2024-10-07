#!/bin/bash

Current=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && \pwd)

Filter=(
	"None"
)

for Filter in "${Filter[@]}"; do
	Cache="$Current"/Cache

	Organization="$Cache"/Organization/"$Filter".json
	Dependency="$Cache"/Dependency/"$Filter".json

	"$Current"/Setting/Dependency.sh \
		"$Organization" \
		"$Dependency" \
		"$Filter"
done
