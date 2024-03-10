#!/bin/bash

Current=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && \pwd)

Foundation=(
	"Land"
	"Tauri"
)

for Foundation in "${Foundation[@]}"; do
	Organization="$Current"/Cache/Organization/"$Foundation".json
	Omit="$Current"/Cache/Omit/"$Foundation".json
	# Service="$Current"/Cache/Service/"$Foundation".json

	"$Current"/Cache/Service.sh \
		"$Organization" \
		"$Omit" \
		"$Foundation"

	# "$Current"/Module/Foundation.sh \
	# 	"$Organization" \
	# 	"$Service" \
	# 	"$Foundation"

	# "$Current"/Configure/Service.sh \
	# 	"$Organization" \
	# 	"$Service" \
	# 	"$Foundation"

	# "$Current"/Setting/Service.sh \
	# 	"$Organization" \
	# 	"$Service" \
	# 	"$Foundation"

	# "$Current"/Rename/Service.sh \
	# 	"$Organization" \
	# 	"$Service" \
	# 	"$Foundation"

	# "$Current"/Sync/Service.sh \
	# 	"$Organization" \
	# 	"$Service" \
	# 	"$Foundation"

	# "$Current"/Switch/Branch.sh \
	# 	"$Organization" \
	# 	"$Service" \
	# 	"$Foundation" \
	# 	"Previous"

	# "$Current"/Reset/Service.sh \
	# 	"$Organization" \
	# 	"$Service" \
	# 	"$Foundation"

	# "$Current"/Switch/Branch.sh \
	# 	"$Organization" \
	# 	"$Service" \
	# 	"$Foundation" \
	# 	"Current"

	# "$Current"/Default/Branch.sh \
	# 	"$Organization" \
	# 	"$Service" \
	# 	"$Foundation" \
	# 	"Current"

	# "$Current"/Clean/Service.sh \
	# 	"$Organization" \
	# 	"$Service" \
	# 	"$Foundation"

	# "$Current"/Clean/Detail.sh \
	# 	"$Organization" \
	# 	"$Service" \
	# 	"$Foundation"

	# "$Current"/Move/license.sh \
	# 	"$Organization" \
	# 	"$Service" \
	# 	"$Foundation"

	# "$Current"/Move/package.sh \
	# 	"$Organization" \
	# 	"$Service" \
	# 	"$Foundation"

	# "$Current"/Move/src.sh \
	# 	"$Organization" \
	# 	"$Service" \
	# 	"$Foundation"

	# "$Current"/Append/Detail.sh \
	# 	"$Organization" \
	# 	"$Service" \
	# 	"$Foundation"

	# "$Current"/Sort/Detail.sh \
	# 	"$Organization" \
	# 	"$Service" \
	# 	"$Foundation"

	# biome check "$Current"/../"$Foundation" --apply-unsafe

	# "$Current"/Restore/.gitignore.sh \
	# 	"$Organization" \
	# 	"$Service" \
	# 	"$Foundation"

	# "$Current"/Restore/package.json.sh \
	# 	"$Organization" \
	# 	"$Service" \
	# 	"$Foundation"
done

# Maintain Workflow
