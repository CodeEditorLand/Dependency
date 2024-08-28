#!/bin/bash

# Function to perform git operations
git_operations() {
	cd "$1" || return
	pwd
	git add .
	git ecommit
	git push
}

export -f git_operations

# Find all .git directories and start processes in background
find . -iname .git -execdir bash -c '
    repo_path="$(pwd)"

    (
        git_operations "$repo_path" &
    )
' \;

# Wait for all background processes to finish
wait

echo "All git operations completed."
