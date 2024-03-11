#!/bin/bash

Current=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && \pwd)

\cd "$Current"/../ || \exit

Inn -P -F .git git add .
Inn -P -F .git git commit -m "squash!"
Inn -P -F .git git sync

Inn -P .git git add .
Inn -P .git git commit -m "squash!"
Inn -P .git git sync

Inn -P -F .git git add .
Inn -P -F .git git commit -m "squash!"
Inn -P -F .git git sync

Inn -P .git git add .
Inn -P .git git commit -m "squash!"
Inn -P .git git sync

\cd - || \exit
