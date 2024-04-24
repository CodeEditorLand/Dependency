#!/bin/bash

\pwd

\jq -S --tab ". * {
	\"compilerOptions\": {
		\"baseUrl\": \"./\",
		\"outDir\": \"Target\",
		\"rootDir\": \"Source\"
	},
	\"extends\": \"@playform/build/tsconfig\",
	\"include\": [\"Source\"]
}
" tsconfig.json >|tsconfig.json.tmp

\mv tsconfig.json.tmp tsconfig.json
