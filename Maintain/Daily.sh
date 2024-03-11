#!/bin/bash

Current=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && \pwd)

Foundation=(
	# "Land"
	# "Tauri"
	"OXC"
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

	"$Current"/Module/Foundation.sh \
		"$Organization" \
		"$Service" \
		"$Foundation"

	"$Current"/Configure/Service.sh \
		"$Organization" \
		"$Service" \
		"$Foundation"

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

	"$Current"/Reset/Service.sh \
		"$Organization" \
		"$Service" \
		"$Foundation"

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

# \cd "$Current"/../ || \exit

# \biome check . --apply-unsafe

# \Maintain Workflow

# \cd - || \exit
