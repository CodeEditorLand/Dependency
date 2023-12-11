#!/bin/bash

echo "Process: Clean/Detail.sh"

# Context: CodeEditorLand/Application

pwd

jq del\(\.eslintConfig\) <package.json >|package.json.tmp
\mv package.json.tmp package.json

jq del\(\.prettier\) <package.json >|package.json.tmp
\mv package.json.tmp package.json

jq del\(\.engines\) <package.json >|package.json.tmp
\mv package.json.tmp package.json

jq del\(\.tags\) <package.json >|package.json.tmp
\mv package.json.tmp package.json

jq del\(\.categories\) <package.json >|package.json.tmp
\mv package.json.tmp package.json

jq del\(\.keywords\) <package.json >|package.json.tmp
\mv package.json.tmp package.json
