#!/bin/bash

Current=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && \pwd)

Foundation=(
	"Biome"
	"Land"
	"OXC"
	"Tauri"
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

	"$Current"/Save/Service.sh \
		"$Organization" \
		"$Service" \
		"$Foundation"

	"$Current"/Sync/Service.sh \
		"$Organization" \
		"$Service" \
		"$Foundation"

	"$Current"/Merge/Service.sh \
		"$Organization" \
		"$Service" \
		"$Foundation"

	"$Current"/Save/Service.sh \
		"$Organization" \
		"$Service" \
		"$Foundation"

	"$Current"/Switch/Branch.sh \
		"$Organization" \
		"$Service" \
		"$Foundation" \
		"Previous"

	"$Current"/Reset/Service.sh \
		"$Organization" \
		"$Service" \
		"$Foundation"

	"$Current"/Switch/Branch.sh \
		"$Organization" \
		"$Service" \
		"$Foundation" \
		"Current"

	# "$Current"/Save/Service.sh \
	# 	"$Organization" \
	# 	"$Service" \
	# 	"$Foundation"

	# "$Current"/Reset/Service.sh \
	# 	"$Organization" \
	# 	"$Service" \
	# 	"$Foundation"

	# "$Current"/Default/Branch.sh \
	# 	"$Organization" \
	# 	"$Service" \
	# 	"$Foundation" \
	# 	"Current"

	"$Current"/Move/license.sh \
		"$Organization" \
		"$Service" \
		"$Foundation"

	"$Current"/Move/package.sh \
		"$Organization" \
		"$Service" \
		"$Foundation"

	"$Current"/Move/src.sh \
		"$Organization" \
		"$Service" \
		"$Foundation"

	"$Current"/Clean/Service.sh \
		"$Organization" \
		"$Service" \
		"$Foundation"

	"$Current"/Clean/Detail.sh \
		"$Organization" \
		"$Service" \
		"$Foundation"

	"$Current"/Append/Detail.sh \
		"$Organization" \
		"$Service" \
		"$Foundation"

	"$Current"/Sort/Detail.sh \
		"$Organization" \
		"$Service" \
		"$Foundation"

	"$Current"/Save/Service.sh \
		"$Organization" \
		"$Service" \
		"$Foundation"

	"$Current"/Sync/Service.sh \
		"$Organization" \
		"$Service" \
		"$Foundation"

	# "$Current"/Restore/.gitignore.sh \
	# 	"$Organization" \
	# 	"$Service" \
	# 	"$Foundation"

	# "$Current"/Restore/package.json.sh \
	# 	"$Organization" \
	# 	"$Service" \
	# 	"$Foundation"

	# "$Current"/Restore/src.sh \
	# 	"$Organization" \
	# 	"$Service" \
	# 	"$Foundation"
done
