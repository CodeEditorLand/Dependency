#!/bin/bash

Current=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && \pwd)

Foundation=(
	"None"
)

for Foundation in "${Foundation[@]}"; do
	Organization="$Current"/Cache/Organization/"$Foundation".json
	Omit="$Current"/Cache/Omit/"$Foundation".json
	Service="$Current"/Cache/Service/"$Foundation".json

	"$Current"/Cache/Service.sh \
		"$Organization" \
		"$Omit" \
		"$Foundation"

	"$Current"/Setting/Service.sh \
		"$Organization" \
		"$Service" \
		"$Foundation"
done
