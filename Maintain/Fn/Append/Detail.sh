#!/bin/bash

Current=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && \pwd)

# TODO: Add dynamic { "repository": { "directory": Foundation/$Foundation/Service/$Service } }

# # The path is always CodeEditorLand/Foundation/$Foundation/Service/$SUBMODULE.name or fetch the correct submodule URL

Package="$Current"/../../../package.json

\jq -S --tab ". * {
	\"homepage\": \"https://github.com/CodeEditorLand/Foundation#readme\",
	\"bugs\": {
		\"url\": \"https://github.com/CodeEditorLand/Foundation/issues\"
	},
	\"repository\": {
		\"type\": \"git\",
		\"url\": \"git+https://github.com/CodeEditorLand/Foundation.git\"
	},
	\"version\": \"0.0.1\",
	\"license\": \"SEE LICENSE IN LICENSE\",
	\"type\": \"module\",
	\"private\": false,
	\"publishConfig\": {
		\"access\": \"public\"
	},
	\"author\": {
		\"name\": \"Playform\",
		\"email\": \"hello@playform.cloud\",
		\"url\": \"https://playform.cloud\"
	},
	\"scripts\": {
		\"Document\": \"Document 'Source/**/*.ts'\",
		\"prepublishOnly\": \"Build 'Source/**/*.ts'\"
	},
	\"devDependencies\": {
		\"@playform/document\": \"$(\jq -r '.devDependencies["@playform/document"]' "$Package")\",
		\"@playform/build\": \"$(\jq -r '.devDependencies["@playform/build"]' "$Package")\"
	}
}" package.json >| package.json.tmp

\mv package.json.tmp package.json
