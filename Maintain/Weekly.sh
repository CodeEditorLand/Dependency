#!/bin/bash

Current=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && \pwd)

_Dependency=(
	"Biome"
	"Land"
	"OXC"
	"Tauri"
)

for _Dependency in "${_Dependency[@]}"; do
	Cache="$Current"/Cache

	Organization="$Cache"/Organization/"$_Dependency".json
	# Exclude="$Cache"/Exclude/"$_Dependency".json
	Dependency="$Cache"/Dependency/"$_Dependency".json

	# ! NOT CURRENTLY WORKING
	# "$Current"/Cache/Dependency.sh \
	# 	"$Organization" \
	# 	"$Exclude" \
	# 	"$_Dependency"

	"$Current"/Module/Dependency.sh \
		"$Organization" \
		"$Dependency" \
		"$_Dependency"

	"$Current"/Configure/Dependency.sh \
		"$Organization" \
		"$Dependency" \
		"$_Dependency"

	"$Current"/Setting/Dependency.sh \
		"$Organization" \
		"$Dependency" \
		"$_Dependency"

	# # "$Current"/Rename/Dependency.sh \
	# # 	"$Organization" \
	# # 	"$Dependency" \
	# # 	"$_Dependency"

	"$Current"/Save/Dependency.sh \
		"$Organization" \
		"$Dependency" \
		"$_Dependency"

	"$Current"/Sync/Dependency.sh \
		"$Organization" \
		"$Dependency" \
		"$_Dependency"

	# "$Current"/Merge/Dependency.sh \
	# 	"$Organization" \
	# 	"$Dependency" \
	# 	"$_Dependency"

	# "$Current"/Save/Dependency.sh \
	# 	"$Organization" \
	# 	"$Dependency" \
	# 	"$_Dependency"

	"$Current"/Switch/Branch.sh \
		"$Organization" \
		"$Dependency" \
		"$_Dependency" \
		"Previous"

	"$Current"/Reset/Dependency.sh \
		"$Organization" \
		"$Dependency" \
		"$_Dependency" \
		"Previous"

	"$Current"/Switch/Branch.sh \
		"$Organization" \
		"$Dependency" \
		"$_Dependency" \
		"Current"

	# "$Current"/Reset/Dependency.sh \
	# 	"$Organization" \
	# 	"$Dependency" \
	# 	"$_Dependency" \
	# 	"Current"

	"$Current"/Save/Dependency.sh \
		"$Organization" \
		"$Dependency" \
		"$_Dependency"

	"$Current"/Default/Branch.sh \
		"$Organization" \
		"$Dependency" \
		"$_Dependency" \
		"Current"

	"$Current"/Move/license.sh \
		"$Organization" \
		"$Dependency" \
		"$_Dependency"

	"$Current"/Move/package.json.sh \
		"$Organization" \
		"$Dependency" \
		"$_Dependency"

	"$Current"/Move/src.sh \
		"$Organization" \
		"$Dependency" \
		"$_Dependency"

	"$Current"/Clean/Dependency.sh \
		"$Organization" \
		"$Dependency" \
		"$_Dependency"

	"$Current"/Clean/Detail.sh \
		"$Organization" \
		"$Dependency" \
		"$_Dependency"

	"$Current"/Append/Detail.sh \
		"$Organization" \
		"$Dependency" \
		"$_Dependency"

	"$Current"/Sort/Detail.sh \
		"$Organization" \
		"$Dependency" \
		"$_Dependency"

	"$Current"/Save/Dependency.sh \
		"$Organization" \
		"$Dependency" \
		"$_Dependency"

	"$Current"/Sync/Dependency.sh \
		"$Organization" \
		"$Dependency" \
		"$_Dependency"

	# "$Current"/Restore/Detail.sh \
	# 	"$Organization" \
	# 	"$Dependency" \
	# 	"$_Dependency"
done
