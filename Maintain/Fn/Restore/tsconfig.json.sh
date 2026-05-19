#!/usr/bin/env sh

\pwd

Current=$(\cd -- "$(\dirname -- "$0")" > /dev/null 2>&1 && \pwd)

# shellcheck disable=SC1091
. "$Current/../Cache.sh"

Fn

# shellcheck disable=SC2154
git restore --source Parent/"$BranchParent" tsconfig.json
