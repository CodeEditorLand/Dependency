#!/bin/bash

\pwd

\git fetch Parent --all --no-tags --unshallow

\git merge Parent/"$(\gh repo view "$(\gh repo view --json parent | \jq -c -r '.parent.owner.login, .parent.name' | \tr -s '\r\n' '/' | \sed 's/\/$//')" --json defaultBranchRef | \jq -r -c '.defaultBranchRef.name')" --no-edit --allow-unrelated-histories -X theirs
