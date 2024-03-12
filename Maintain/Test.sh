#!/bin/bash

Current=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && \pwd)

Foundation=(
	"Biome"
)

for Foundation in "${Foundation[@]}"; do
	Cache="$Current"/Cache

	Organization="$Cache"/Organization/"$Foundation".json
	Omit="$Cache"/Omit/"$Foundation".json
	Service="$Cache"/Service/"$Foundation".json

	"$Current"/Cache/Service.sh \
		"$Organization" \
		"$Omit" \
		"$Foundation"

	"$Current"/Rename/Service.sh \
		"$Organization" \
		"$Service" \
		"$Foundation"
done
