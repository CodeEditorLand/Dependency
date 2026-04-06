#!/usr/bin/env sh

pwd

Current=$(cd -- "$(dirname -- "$0")" >/dev/null 2>&1 && pwd)

# shellcheck disable=SC1091
. "$Current/../Cache.sh"

Fn

git fetch Parent --no-tags

# shellcheck disable=SC2154
git merge Parent/"$BranchParent" --no-edit --allow-unrelated-histories -X theirs
