#!/bin/bash

# TODO: Add dynamic { "repository": { "directory": Foundation/$Foundation/Service/$Service } }

# The path is always CodeEditorLand/Foundation/$Foundation/Service/$SUBMODULE.name or fetch the correct submodule URL

# Version=$(\npm show typescript-esbuild version)

\jq -S --tab ". * {
	\"homepage\": \"https://GitHub.Com/CodeEditorLand/Foundation#readme\",
	\"bugs\": {
		\"url\": \"https://GitHub.Com/CodeEditorLand/Foundation/issues\"
	},
	\"repository\": {
		\"type\": \"git\",
		\"url\": \"git+https://GitHub.Com/CodeEditorLand/Foundation.git\"
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
		\"email\": \"Hello@Playform.Cloud\",
		\"url\": \"https://Playform.Cloud\"
	},
	\"scripts\": {
		\"prepublishOnly\": \"TypeScriptESBuild 'Source/**/*.ts'\"
	},
	\"devDependencies\": {
		\"typescript-esbuild\": \"0.4.5\"
	}
}" package.json >|package.json.tmp

\mv package.json.tmp package.json
