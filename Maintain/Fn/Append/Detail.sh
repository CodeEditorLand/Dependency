#!/bin/bash

# TODO: Add dynamic { "repository": { "directory": Foundation/$Foundation/Service/$Service } }

# The path is always CodeEditorLand/Foundation/$Foundation/Service/$SUBMODULE.name or fetch the correct submodule URL

# Version=$(\npm show @playform/build version)

\jq -S --tab ". * {
	\"homepage\": \"https://github.com/CodeEditorLand/Foundation#ReadMe\",
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
		\"email\": \"Hello@playform.cloud\",
		\"url\": \"https://playform.cloud\"
	},
	\"scripts\": {
		\"prepublishOnly\": \"Build 'Source/**/*.ts'\"
	},
	\"devDependencies\": {
		\"@playform/build\": \"0.0.2\"
	},
	\"optionalDependencies\": {
		\"@playform/document\": \"0.0.2\"
	}
}" package.json >|package.json.tmp

\mv package.json.tmp package.json
