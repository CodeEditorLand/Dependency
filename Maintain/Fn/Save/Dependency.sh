#!/bin/sh

# git ecommit is an alias for:
# commit -a --allow-empty-message -m \"\"

\pwd

\git add . --no-verbose
\git ecommit -q --no-status --short --no-edit
