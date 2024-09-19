#!/bin/bash

\pwd

Current=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && \pwd)

# shellcheck disable=SC1091
\source "$Current"/../Cache.sh

Fn

\git fetch Parent --no-tags

# shellcheck disable=SC2154
\git merge Parent/"$BranchParent" --no-edit --allow-unrelated-histories -X theirs
