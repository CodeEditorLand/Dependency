#!/bin/sh

\pwd

Current=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && \pwd)

# TODO: Add dynamic { "repository": { "directory": Dependency/$Dependency/Dependency/$Dependency } }

# # The path is always CodeEditorLand/Dependency/$Dependency/Dependency/$Dependency or fetch the correct submodule URL

Package="$Current"/../../../package.json
Slug=$(\gh repo view --json nameWithOwner | \jq -r .nameWithOwner)

\jq -S --tab ".keywords += [ \"codeeditorland\", \"land\", \"playform\"] | . * {
	\"homepage\": \"HTTPS://GitHub.Com/$Slug#readme\",
	\"bugs\": {
		\"url\": \"HTTPS://GitHub.Com/$Slug/issues\"
	},
	\"repository\": {
		\"type\": \"git\",
		\"url\": \"git+HTTPS://github.com/$Slug.git\"
	},
	\"version\": \"0.0.1\",
	\"license\": \"SEE LICENSE IN LICENSE\",
	\"type\": \"module\",
	\"private\": false,
	\"publishConfig\": {
		\"access\": \"public\"
	},
	\"author\": {
		\"name\": \"🖋️ Source — 👐🏻 Open —\",
		\"email\": \"Source/Open@Editor.Land\",
		\"url\": \"HTTPS://Editor.Land\"
	},
	\"scripts\": {
		\"prepublishOnly\": \"Build 'Source/**/*.ts'\"
	},
	\"devDependencies\": {
		\"@playform/build\": \"$(\jq -r '.devDependencies["@playform/build"]' "$Package")\"
	}
}" package.json >| package.json.tmp

\mv package.json.tmp package.json
