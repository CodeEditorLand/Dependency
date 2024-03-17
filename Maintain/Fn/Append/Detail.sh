#!/bin/bash

# TODO: Add dynamic { "repository": { "directory": Foundation/$Foundation/Service/$Service } }
# The path is always CodeEditorLand/Foundation/$Foundation/Service/$SUBMODULE.name
# or fetch the correct submodule URL

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
	\"publisher\": \"playform\",
	\"private\": false,
	\"publishConfig\": {
		\"access\": \"public\"
	},
	\"author\": {
		\"name\": \"Nikola R. Hristov\",
		\"email\": \"Nikola@Playform.Cloud\",
		\"url\": \"https://nikolahristov.tech\"
	},
	\"scripts\": {
		\"prepublishOnly\": \"TypeScriptESBuild 'Source/**/*.ts'\"
	},
	\"devDependencies\": {
		\"typescript-esbuild\": \"0.3.12\"
	}
}" package.json >|package.json.tmp

\mv package.json.tmp package.json
