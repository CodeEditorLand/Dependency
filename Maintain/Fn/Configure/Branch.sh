#!/bin/bash

\pwd

\git switch -c Previous
\git switch Previous
\git branch --set-upstream-to=Source/Previous Previous

\git switch -c Current
\git switch Current
\git branch --set-upstream-to=Source/Current Current
