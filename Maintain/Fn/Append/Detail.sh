#!/bin/bash

# TODO: Add dynamic { "repository": { "directory": Foundation/$Foundation/Service/$Service } }

# The path is always CodeEditorLand/Foundation/$Foundation/Service/$SUBMODULE.name or fetch the correct submodule URL

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
		\"email\": \"hello@playform.cloud\",
		\"url\": \"https://playform.cloud\"
	},
	\"scripts\": {
		\"Document\": \"Document 'Source/**/*.ts'\",
		\"Build\": \"Build 'Source/**/*.ts'\",
	},
	\"devDependencies\": {
		\"@playform/build\": \"$(\npm show @playform/build version)\"
	},
	\"optionalDependencies\": {
		\"@playform/document\": \"$(\npm show @playform/document version)\"
	}
}" package.json >|package.json.tmp

\mv package.json.tmp package.json
