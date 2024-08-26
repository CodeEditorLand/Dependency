#!/bin/bash

# Find package.json File with tauri as a dependency
File=$(find . -name "package.json" -exec grep -l '"tauri"' {} +)

# Loop through each file and run ncu
for File in $File; do
	echo "Running ncu on $File"

	# Change to the directory containing the package.json File
	(
		cd "$(dirname "$File")" || exit

		# Run ncu with the specified options
		ncu -u --deep --dep "dev,optional,peer,prod,bundle" --color --concurrency 12 -f /.*tauri.*/ --target greatest
	)
done
