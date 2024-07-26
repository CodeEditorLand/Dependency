#!/bin/bash

Current=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && \pwd)

Dependency=(
	"Biome"
	"Land"
	"OXC"
	"Tauri"
)

for Dependency in "${Dependency[@]}"; do
	Cache="$Current"/Cache

	# Exclude="$Cache"/Exclude/"$Dependency".json
	# Include="$Cache"/Include/"$Dependency".json
	Organization="$Cache"/Organization/"$Dependency".json
	SubDependency="$Cache"/Dependency/"$Dependency".json

	# ! NOT CURRENTLY WORKING
	# "$Current"/Cache/Dependency.sh \
	# 	"$Organization" \
	#	"$Exclude" \
	# 	"$Dependency"

	# "$Current"/Module/Dependency.sh \
	# 	"$Organization" \
	# 	"$SubDependency" \
	# 	"$Dependency"

	# "$Current"/Configure/Dependency.sh \
	# 	"$Organization" \
	# 	"$SubDependency" \
	# 	"$Dependency"

	# "$Current"/Setting/Dependency.sh \
	# 	"$Organization" \
	# 	"$SubDependency" \
	# 	"$Dependency"

	# # "$Current"/Rename/Dependency.sh \
	# # 	"$Organization" \
	# # 	"$SubDependency" \
	# # 	"$Dependency"

	"$Current"/Save/Dependency.sh \
		"$Organization" \
		"$SubDependency" \
		"$Dependency"

	"$Current"/Sync/Dependency.sh \
		"$Organization" \
		"$SubDependency" \
		"$Dependency"

	"$Current"/Save/Dependency.sh \
		"$Organization" \
		"$SubDependency" \
		"$Dependency"

	# # "$Current"/Save/Dependency.sh \
	# # 	"$Organization" \
	# # 	"$SubDependency" \
	# # 	"$Dependency"

	"$Current"/Switch/Branch.sh \
		"$Organization" \
		"$SubDependency" \
		"$Dependency" \
		"Previous"

	"$Current"/Reset/Dependency.sh \
		"$Organization" \
		"$SubDependency" \
		"$Dependency" \
		"Previous"

	"$Current"/Switch/Branch.sh \
		"$Organization" \
		"$SubDependency" \
		"$Dependency" \
		"Current"

	"$Current"/Merge/Dependency.sh \
		"$Organization" \
		"$SubDependency" \
		"$Dependency"

	# # "$Current"/Reset/Dependency.sh \
	# # 	"$Organization" \
	# # 	"$SubDependency" \
	# # 	"$Dependency" \
	# # 	"Current"

	"$Current"/Save/Dependency.sh \
		"$Organization" \
		"$SubDependency" \
		"$Dependency"

	# "$Current"/Default/Branch.sh \
	# 	"$Organization" \
	# 	"$SubDependency" \
	# 	"$Dependency" \
	# 	"Current"

	"$Current"/Move/license.sh \
		"$Organization" \
		"$SubDependency" \
		"$Dependency"

	"$Current"/Move/package.json.sh \
		"$Organization" \
		"$SubDependency" \
		"$Dependency"

	"$Current"/Move/src.sh \
		"$Organization" \
		"$SubDependency" \
		"$Dependency"

	"$Current"/Clean/Dependency.sh \
		"$Organization" \
		"$SubDependency" \
		"$Dependency"

	"$Current"/Clean/Detail.sh \
		"$Organization" \
		"$SubDependency" \
		"$Dependency"

	"$Current"/Append/Detail.sh \
		"$Organization" \
		"$SubDependency" \
		"$Dependency"

	# "$Current"/Sort/Detail.sh \
	# 	"$Organization" \
	# 	"$SubDependency" \
	# 	"$Dependency"

	"$Current"/Save/Dependency.sh \
		"$Organization" \
		"$SubDependency" \
		"$Dependency"

	"$Current"/Sync/Dependency.sh \
		"$Organization" \
		"$SubDependency" \
		"$Dependency"

	# # "$Current"/Restore/Detail.sh \
	# # 	"$Organization" \
	# # 	"$SubDependency" \
	# # 	"$Dependency"
done
