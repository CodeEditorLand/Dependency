#!/bin/bash

\pwd

\git pull --allow-unrelated-histories --no-progress -q -X theirs
\git push --no-progress -q
