#!/bin/bash

# TODO: Run once after repository creation
# TODO: Event Log

Current=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && \pwd)

Dependency=(
	"None"
)

for Dependency in "${Dependency[@]}"; do
	Cache="$Current"/Cache

	Organization="$Cache"/Organization/"$Dependency".json
	# Exclude="$Cache"/Exclude/"$Dependency".json
	SubDependency="$Cache"/Dependency/"$Dependency".json

	# "$Current"/Cache/Dependency.sh \
	# 	"$Organization" \
	# 	"$Exclude" \
	# 	"$Dependency"

	"$Current"/Setting/Dependency.sh \
		"$Organization" \
		"$SubDependency" \
		"$Dependency"
done
