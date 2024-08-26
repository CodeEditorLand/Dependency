#!/bin/bash

cd "Application/CodeEditorLand/Dependency/Land/Dependency/Editor/extensions/css-language-features" || exit

\git restore --source Parent/"$(\gh repo view "$(\gh repo view --json parent | \jq -c -r '.parent.owner.login, .parent.name' | \tr -s '\r\n' '/' | \sed 's/\/$//')" --json defaultBranchRef | \jq -r -c '.defaultBranchRef.name')" package.json

cd - || exit

cd "Application/CodeEditorLand/Dependency/Land/Dependency/Editor/extensions/debug-auto-launch" || exit

\git restore --source Parent/"$(\gh repo view "$(\gh repo view --json parent | \jq -c -r '.parent.owner.login, .parent.name' | \tr -s '\r\n' '/' | \sed 's/\/$//')" --json defaultBranchRef | \jq -r -c '.defaultBranchRef.name')" package.json

cd - || exit

cd "Application/CodeEditorLand/Dependency/Land/Dependency/Editor/extensions/debug-server-ready" || exit

\git restore --source Parent/"$(\gh repo view "$(\gh repo view --json parent | \jq -c -r '.parent.owner.login, .parent.name' | \tr -s '\r\n' '/' | \sed 's/\/$//')" --json defaultBranchRef | \jq -r -c '.defaultBranchRef.name')" package.json

cd - || exit

cd "Application/CodeEditorLand/Dependency/Land/Dependency/Editor/extensions/emmet" || exit

\git restore --source Parent/"$(\gh repo view "$(\gh repo view --json parent | \jq -c -r '.parent.owner.login, .parent.name' | \tr -s '\r\n' '/' | \sed 's/\/$//')" --json defaultBranchRef | \jq -r -c '.defaultBranchRef.name')" package.json

cd - || exit

cd "Application/CodeEditorLand/Dependency/Land/Dependency/Editor/extensions/extension-editing" || exit

\git restore --source Parent/"$(\gh repo view "$(\gh repo view --json parent | \jq -c -r '.parent.owner.login, .parent.name' | \tr -s '\r\n' '/' | \sed 's/\/$//')" --json defaultBranchRef | \jq -r -c '.defaultBranchRef.name')" package.json

cd - || exit

cd "Application/CodeEditorLand/Dependency/Land/Dependency/Editor/extensions/git-base" || exit

\git restore --source Parent/"$(\gh repo view "$(\gh repo view --json parent | \jq -c -r '.parent.owner.login, .parent.name' | \tr -s '\r\n' '/' | \sed 's/\/$//')" --json defaultBranchRef | \jq -r -c '.defaultBranchRef.name')" package.json

cd - || exit

cd "Application/CodeEditorLand/Dependency/Land/Dependency/Editor/extensions/github" || exit

\git restore --source Parent/"$(\gh repo view "$(\gh repo view --json parent | \jq -c -r '.parent.owner.login, .parent.name' | \tr -s '\r\n' '/' | \sed 's/\/$//')" --json defaultBranchRef | \jq -r -c '.defaultBranchRef.name')" package.json

cd - || exit

cd "Application/CodeEditorLand/Dependency/Land/Dependency/Editor/extensions/grunt" || exit

\git restore --source Parent/"$(\gh repo view "$(\gh repo view --json parent | \jq -c -r '.parent.owner.login, .parent.name' | \tr -s '\r\n' '/' | \sed 's/\/$//')" --json defaultBranchRef | \jq -r -c '.defaultBranchRef.name')" package.json

cd - || exit

cd "Application/CodeEditorLand/Dependency/Land/Dependency/Editor/extensions/gulp" || exit

\git restore --source Parent/"$(\gh repo view "$(\gh repo view --json parent | \jq -c -r '.parent.owner.login, .parent.name' | \tr -s '\r\n' '/' | \sed 's/\/$//')" --json defaultBranchRef | \jq -r -c '.defaultBranchRef.name')" package.json

cd - || exit

cd "Application/CodeEditorLand/Dependency/Land/Dependency/Editor/extensions/html-language-features" || exit

\git restore --source Parent/"$(\gh repo view "$(\gh repo view --json parent | \jq -c -r '.parent.owner.login, .parent.name' | \tr -s '\r\n' '/' | \sed 's/\/$//')" --json defaultBranchRef | \jq -r -c '.defaultBranchRef.name')" package.json

cd - || exit

cd "Application/CodeEditorLand/Dependency/Land/Dependency/Editor/extensions/html-language-features/server" || exit

\git restore --source Parent/"$(\gh repo view "$(\gh repo view --json parent | \jq -c -r '.parent.owner.login, .parent.name' | \tr -s '\r\n' '/' | \sed 's/\/$//')" --json defaultBranchRef | \jq -r -c '.defaultBranchRef.name')" package.json

cd - || exit

cd "Application/CodeEditorLand/Dependency/Land/Dependency/Editor/extensions/jake" || exit

\git restore --source Parent/"$(\gh repo view "$(\gh repo view --json parent | \jq -c -r '.parent.owner.login, .parent.name' | \tr -s '\r\n' '/' | \sed 's/\/$//')" --json defaultBranchRef | \jq -r -c '.defaultBranchRef.name')" package.json

cd - || exit

cd "Application/CodeEditorLand/Dependency/Land/Dependency/Editor/extensions/json-language-features" || exit

\git restore --source Parent/"$(\gh repo view "$(\gh repo view --json parent | \jq -c -r '.parent.owner.login, .parent.name' | \tr -s '\r\n' '/' | \sed 's/\/$//')" --json defaultBranchRef | \jq -r -c '.defaultBranchRef.name')" package.json

cd - || exit

cd "Application/CodeEditorLand/Dependency/Land/Dependency/Editor/extensions/json-language-features/server" || exit

\git restore --source Parent/"$(\gh repo view "$(\gh repo view --json parent | \jq -c -r '.parent.owner.login, .parent.name' | \tr -s '\r\n' '/' | \sed 's/\/$//')" --json defaultBranchRef | \jq -r -c '.defaultBranchRef.name')" package.json

cd - || exit

cd "Application/CodeEditorLand/Dependency/Land/Dependency/Editor/extensions/markdown-language-features/server" || exit

\git restore --source Parent/"$(\gh repo view "$(\gh repo view --json parent | \jq -c -r '.parent.owner.login, .parent.name' | \tr -s '\r\n' '/' | \sed 's/\/$//')" --json defaultBranchRef | \jq -r -c '.defaultBranchRef.name')" package.json

cd - || exit

cd "Application/CodeEditorLand/Dependency/Land/Dependency/Editor/extensions/merge-conflict" || exit

\git restore --source Parent/"$(\gh repo view "$(\gh repo view --json parent | \jq -c -r '.parent.owner.login, .parent.name' | \tr -s '\r\n' '/' | \sed 's/\/$//')" --json defaultBranchRef | \jq -r -c '.defaultBranchRef.name')" package.json

cd - || exit

cd "Application/CodeEditorLand/Dependency/Land/Dependency/Editor/extensions/npm" || exit

\git restore --source Parent/"$(\gh repo view "$(\gh repo view --json parent | \jq -c -r '.parent.owner.login, .parent.name' | \tr -s '\r\n' '/' | \sed 's/\/$//')" --json defaultBranchRef | \jq -r -c '.defaultBranchRef.name')" package.json

cd - || exit

cd "Application/CodeEditorLand/Dependency/Land/Dependency/Editor/extensions/php-language-features" || exit

\git restore --source Parent/"$(\gh repo view "$(\gh repo view --json parent | \jq -c -r '.parent.owner.login, .parent.name' | \tr -s '\r\n' '/' | \sed 's/\/$//')" --json defaultBranchRef | \jq -r -c '.defaultBranchRef.name')" package.json

cd - || exit

cd "Application/CodeEditorLand/Dependency/Land/Dependency/Editor/extensions/references-view" || exit

\git restore --source Parent/"$(\gh repo view "$(\gh repo view --json parent | \jq -c -r '.parent.owner.login, .parent.name' | \tr -s '\r\n' '/' | \sed 's/\/$//')" --json defaultBranchRef | \jq -r -c '.defaultBranchRef.name')" package.json

cd - || exit

cd "Application/CodeEditorLand/Dependency/Land/Dependency/Editor/extensions/tunnel-forwarding" || exit

\git restore --source Parent/"$(\gh repo view "$(\gh repo view --json parent | \jq -c -r '.parent.owner.login, .parent.name' | \tr -s '\r\n' '/' | \sed 's/\/$//')" --json defaultBranchRef | \jq -r -c '.defaultBranchRef.name')" package.json

cd - || exit

cd "Application/CodeEditorLand/Dependency/Land/Dependency/Editor/extensions/vscode-colorize-tests" || exit

\git restore --source Parent/"$(\gh repo view "$(\gh repo view --json parent | \jq -c -r '.parent.owner.login, .parent.name' | \tr -s '\r\n' '/' | \sed 's/\/$//')" --json defaultBranchRef | \jq -r -c '.defaultBranchRef.name')" package.json

cd - || exit

cd "Application/CodeEditorLand/Dependency/Land/Dependency/Editor/extensions/vscode-test-resolver" || exit

\git restore --source Parent/"$(\gh repo view "$(\gh repo view --json parent | \jq -c -r '.parent.owner.login, .parent.name' | \tr -s '\r\n' '/' | \sed 's/\/$//')" --json defaultBranchRef | \jq -r -c '.defaultBranchRef.name')" package.json

cd - || exit

cd "Application/CodeEditorLand/Dependency/Land/Dependency/LandExtensionSamples/tree-view-sample" || exit

\git restore --source Parent/"$(\gh repo view "$(\gh repo view --json parent | \jq -c -r '.parent.owner.login, .parent.name' | \tr -s '\r\n' '/' | \sed 's/\/$//')" --json defaultBranchRef | \jq -r -c '.defaultBranchRef.name')" package.json

cd - || exit
