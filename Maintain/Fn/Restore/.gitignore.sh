#!/bin/bash

\pwd

Current=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && \pwd)

# shellcheck disable=SC1091
\source "$Current"/../Cache.sh

Fn

# shellcheck disable=SC2154
\git restore --source Parent/"$BranchParent" .gitignore
