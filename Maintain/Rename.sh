#!/bin/bash

Current=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && \pwd)

Dependency=(
	"Rolldown"
)

for Dependency in "${Dependency[@]}"; do
	(
		Cache="$Current"/Cache

		# Exclude="$Cache"/Exclude/"$Dependency".json
		# Include="$Cache"/Include/"$Dependency".json
		Organization="$Cache"/Organization/"$Dependency".json
		SubDependency="$Cache"/Dependency/"$Dependency".json

		"$Current"/Rename/Dependency.sh \
			"$Organization" \
			"$SubDependency" \
			"$Dependency"
	) &
done

wait

echo "Rename completed."
