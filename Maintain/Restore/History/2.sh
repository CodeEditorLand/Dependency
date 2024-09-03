#!/bin/bash

File=$(find . -name "package.json" -exec grep -l '"tauri"' {} +)

for File in $File; do
	echo "Running ncu on $File"

	(
		cd "$(dirname "$File")" || exit

		ncu -u --deep --dep "dev,optional,peer,prod,bundle" --color --concurrency 12 -f /.*tauri.*/ --target greatest
	)
done
