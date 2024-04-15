#!/bin/bash

\pwd

\git fetch upstream --depth 1 --no-tags

Main=$(\gh repo view --json parent | \jq -c -r '.parent.owner.login, .parent.name' | \tr -s '\r\n' '/')
Main=$(\echo "$Main" | \sed 's/\/$//')
Main=$(\gh repo view "$Main" --json defaultBranchRef | \jq -r -c '.defaultBranchRef.name')

\git merge upstream/"$Main" --no-edit --allow-unrelated-histories -X ours
