#!/bin/bash

Current=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && \pwd)

Filter=(
	"Biome"
	"Land"
	"OXC"
	"Rolldown"
	"SWC"
	"Tauri"
)

for Filter in "${Filter[@]}"; do
	(
		Cache="$Current"/Cache

		Organization="$Cache"/Organization/"$Filter".json
		Dependency="$Cache"/Dependency/"$Filter".json

		"$Current"/Module/Dependency.sh \
			"$Organization" \
			"$Dependency" \
			"$Filter"

		"$Current"/Configure/Dependency.sh \
			"$Organization" \
			"$Dependency" \
			"$Filter"

		"$Current"/Setting/Dependency.sh \
			"$Organization" \
			"$Dependency" \
			"$Filter"

		"$Current"/Default/Branch.sh \
			"$Organization" \
			"$Dependency" \
			"$Filter" \
			"Current"

		"$Current"/Merge/Dependency.sh \
			"$Organization" \
			"$Filter" \
			"$Filter"

		"$Current"/Save/Dependency.sh \
			"$Organization" \
			"$Dependency" \
			"$Filter"
	) &
done

\wait
