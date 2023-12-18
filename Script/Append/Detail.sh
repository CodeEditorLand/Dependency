#!/bin/sh

\echo "Process: Append/Detail.sh"

# Context: CodeEditorLand/Application

\pwd

# TODO: Add dynamic { "repository": { "directory": CodeEditorLand/Application/$REPOSITORY } }
# The path is always CodeEditorLand/CodeEditorLand/Application/$SUBMODULE.name
# or fetch the correct submodule URL

\jq -S ". * {
	\"homepage\": \"https://github.com/CodeEditorLand/CodeEditorLand#readme\",
	\"bugs\": {
		\"url\": \"https://github.com/CodeEditorLand/CodeEditorLand/issues\"
	},
	\"repository\": {
		\"type\": \"git\",
		\"url\": \"git+https://github.com/CodeEditorLand/CodeEditorLand.git\"
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
		\"name\": \"Nikola Hristov\",
		\"email\": \"nikola@nikolahristov.tech\",
		\"url\": \"https://nikolahristov.tech\"
	},
	\"scripts\": {
		\"prepublishOnly\": \"TypeScriptESBuild 'Source/**/*.ts'\"
	},
	\"devDependencies\": {
		\"typescript-esbuild\": \"0.3.3\"
	}
}" package.json >| package.json.tmp

\mv package.json.tmp package.json
