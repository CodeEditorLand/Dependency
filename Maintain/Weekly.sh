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

		"$Current"/Save/Dependency.sh \
			"$Organization" \
			"$Dependency" \
			"$Filter"

		"$Current"/Switch/Branch.sh \
			"$Organization" \
			"$Dependency" \
			"$Filter" \
			"Current"

		# # # # "$Current"/Reset/Dependency.sh \
		# # # # 	"$Organization" \
		# # # # 	"$Dependency" \
		# # # # 	"$Filter" \
		# # # # 	"Current"

		# "$Current"/Save/Dependency.sh \
		# 	"$Organization" \
		# 	"$Dependency" \
		# 	"$Filter"

		# "$Current"/Default/Branch.sh \
		# 	"$Organization" \
		# 	"$Dependency" \
		# 	"$Filter" \
		# 	"Current"

		# # "$Current"/Move/license.sh \
		# # 	"$Organization" \
		# # 	"$Dependency" \
		# # 	"$Filter"

		# "$Current"/Move/package.json.sh \
		# 	"$Organization" \
		# 	"$Dependency" \
		# 	"$Filter"

		# "$Current"/Move/src.sh \
		# 	"$Organization" \
		# 	"$Dependency" \
		# 	"$Filter"

		"$Current"/Clean/Dependency.sh \
			"$Organization" \
			"$Dependency" \
			"$Filter"

		# "$Current"/Clean/Detail.sh \
		# 	"$Organization" \
		# 	"$Dependency" \
		# 	"$Filter"

		# "$Current"/Append/Detail.sh \
		# 	"$Organization" \
		# 	"$Dependency" \
		# 	"$Filter"

		# "$Current"/Save/Dependency.sh \
		# 	"$Organization" \
		# 	"$Dependency" \
		# 	"$Filter"

		# "$Current"/Sync/Dependency.sh \
		# 	"$Organization" \
		# 	"$Dependency" \
		# 	"$Filter"
	) &
done

\wait

echo "Weekly completed."

# TODO: Implement
# Maintain Workflow
# Document 'Source/**/*.ts' 'Source/**/*.tsx' 'Source/**/*.js' 'Source/**/*.jsx' \
# 	'src/**/*.ts' 'src/**/*.tsx' 'src/**/*.js' 'src/**/*.jsx'
# sort-package-json
# bump_dependencies
