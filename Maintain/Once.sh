#!/bin/bash

# TODO: Run once after repository creation
# TODO: Event Log

Current=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && \pwd)

Foundation=(
	"None"
)

for Foundation in "${Foundation[@]}"; do
	Cache="$Current"/Cache

	Organization="$Cache"/Organization/"$Foundation".json
	Exclude="$Cache"/Exclude/"$Foundation".json
	Service="$Cache"/Service/"$Foundation".json

	"$Current"/Cache/Service.sh \
		"$Organization" \
		"$Exclude" \
		"$Foundation"

	"$Current"/Setting/Service.sh \
		"$Organization" \
		"$Service" \
		"$Foundation"
done
