#!/bin/bash

\pwd

\git pull --no-edit --allow-unrelated-histories --no-progress -q -X theirs
\git push --no-progress -q
