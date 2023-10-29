#!/bin/sh

pwd

jq del\(\.eslintConfig\) < package.json >| package.json.tmp
\mv package.json.tmp package.json

jq del\(\.prettier\) < package.json >| package.json.tmp
\mv package.json.tmp package.json

jq '. * {
	"homepage": "https://github.com/CodeEditorLand/CodeEditorLand#readme",
	"bugs": {
		"url": "https://github.com/CodeEditorLand/CodeEditorLand/issues"
	},
	"repository": {
		"type": "git",
		"url": "git+https://github.com/CodeEditorLand/CodeEditorLand.git"
	},
	"version": "0.0.1",
	"license": "MIT",
	"type": "module",
	"private": "false",
	"publishConfig": {
		"access": "public"
	},
	"author": {
		"name": "Nikola Hristov",
		"email": "nikola@nikolahristov.tech",
		"url": "https://nikolahristov.tech"
	},
	"scripts": {
		"prepublishOnly": "TypeScriptESBuild Source/**/*.ts"
	},
	"devDependencies": {
		"typescript-esbuild": "0.3.1"
	}
}' < package.json >| package.json.tmp

\mv package.json.tmp package.json
