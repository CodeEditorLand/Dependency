#!/bin/bash

# Context: CodeEditorLand/Application

Directory=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

readarray -t Repository < "$Directory"/../Cache/Repository/CodeEditorLand.md

for Repository in "${Repository[@]}"; do
	echo "$Repository"
	
	# gh repo rename 
done


# USAGE
#   gh repo rename [<new-name>] [flags]

# FLAGS
#   -R, --repo [HOST/]OWNER/REPO   Select another repository using the [HOST/]OWNER/REPO format
#   -y, --yes                      Skip the confirmation prompt

# INHERITED FLAGS
#   --help   Show help for command

# LEARN MORE
#   Use 'gh <command> <subcommand> --help' for more information about a command.
#   Read the manual at https://cli.github.com/manual
