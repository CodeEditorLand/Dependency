#!/bin/bash

\pwd

\jq -S --tab ".include += [\"Source\"] | . * {
	\"compilerOptions\": {
		\"baseUrl\": \"./\",
		\"outDir\": \"Target\",
		\"rootDir\": \"Source\"
	},
	\"extends\": \"@playform/build/tsconfig\"
}
" tsconfig.json >|tsconfig.json.tmp

\mv tsconfig.json.tmp tsconfig.json
