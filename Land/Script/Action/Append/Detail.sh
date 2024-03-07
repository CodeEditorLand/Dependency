#!/bin/bash

\echo "Process: Action/Append/Detail.sh"

# Context: CodeEditorLand/Property/Land/Foundation

\pwd

# TODO: Add dynamic { "repository": { "directory": Property/$PROPERTY/Foundation/$REPOSITORY } }
# The path is always CodeEditorLand/Property/Land/Foundation/$SUBMODULE.name
# or fetch the correct submodule URL

\jq -S ". * {
	\"homepage\": \"https://github.com/CodeEditorLand/Property#readme\",
	\"bugs\": {
		\"url\": \"https://github.com/CodeEditorLand/Property/issues\"
	},
	\"repository\": {
		\"type\": \"git\",
		\"url\": \"git+https://github.com/CodeEditorLand/Property.git\"
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
		\"email\": \"nikola@nikolahristov.tech\",
		\"url\": \"https://nikolahristov.tech\"
	},
	\"scripts\": {
		\"prepublishOnly\": \"TypeScriptESBuild 'Source/**/*.ts'\"
	},
	\"devDependencies\": {
		\"typescript-esbuild\": \"0.3.6\"
	}
}" package.json >|package.json.tmp

\mv package.json.tmp package.json
