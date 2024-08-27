#!/bin/bash

\pwd

\jq -S --tab ".include += [\"src\"] | . * {
	\"compilerOptions\": {
		\"baseUrl\": \"./\",
		\"outDir\": \"Target\",
		\"rootDir\": \"src\"
	},
	\"extends\": \"@playform/build/tsconfig\"
}
" tsconfig.json >| tsconfig.json.tmp

\mv tsconfig.json.tmp tsconfig.json
