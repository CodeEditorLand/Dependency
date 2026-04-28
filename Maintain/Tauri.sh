#!/usr/bin/env bash
#===============================================================================
# Maintain/Tauri.sh - One-shot full reset for every Tauri sub-dependency
#===============================================================================
#
# Resets EVERY repo under `Land/Dependency/Tauri/Dependency/<sub>/` to its
# upstream (`Parent`) branch and force-pushes the result to BOTH our
# `Previous` and `Current` branches on the `Source` (CodeEditorLand) fork.
#
# After running:
#   • Source/Previous = upstream HEAD snapshot at the moment of reset
#   • Source/Current  = upstream HEAD (will diverge as we patch locally)
#   • Working tree    = on Current branch, ready for local changes
#
# Pipeline (per sub-dep, parallel across the 105 entries):
#   1. Configure  - register Source + Parent remotes (idempotent), create
#                   Previous + Current branches if missing
#   2. Fetch      - pull from both Source and Parent
#   3. Save       - commit any WIP (stash-equivalent via `git ecommit`)
#   4. Switch + Reset to Previous → force-push to Source/Previous
#   5. Switch + Reset to Current  → force-push to Source/Current
#   6. Switch back to Current
#
# DESTRUCTIVE - force-pushes 105 GitHub forks. Re-runs are idempotent
# (the fetch+reset pair restores upstream state regardless of previous
# state), but anything not committed beforehand is lost. Save step
# guards against forgotten WIP.
#
# Usage:
#   bash Land/Dependency/Maintain/Tauri.sh             # full run
#   bash Land/Dependency/Maintain/Tauri.sh --dry-run   # print actions only
#
#===============================================================================

# Intentionally NOT `set -euo pipefail`. The inner Reset/Switch/Save
# scripts run their per-repo work in parallel (`&`); one transient
# failure (gh rate-limit, network blip) returns non-zero from the
# trailing `wait`, which under `-e` would abort the whole orchestrator
# halfway through and leave Source/Current un-reset while Source/Previous
# is already at upstream. Better to soldier through and let the user
# re-run for the small set that actually failed.

Current=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && \pwd)

DRY_RUN=false
if [ "${1:-}" = "--dry-run" ]; then
	DRY_RUN=true
fi

Dependency="Tauri"
Cache="$Current/Cache"
Organization="$Cache/Organization/$Dependency.json"
SubDependency="$Cache/Dependency/$Dependency.json"

if [ ! -f "$SubDependency" ]; then
	echo "FATAL: $SubDependency not found. Activate it via:"
	echo "  cp $Cache/Dependency/Inactive/$Dependency.json $SubDependency"
	exit 1
fi

Count=$(\jq '. | length' "$SubDependency")

echo "================================================================"
echo "Tauri full reset"
echo "================================================================"
echo "Sub-dependencies: $Count"
echo "Mode:             $([ "$DRY_RUN" = true ] && echo dry-run || echo execute)"
echo "Organization:     $Organization"
echo "Sub-dep list:     $SubDependency"
echo "================================================================"

if [ "$DRY_RUN" = true ]; then
	echo ""
	echo "Pipeline that would run for each sub-dep:"
	echo "  1. Configure/Dependency.sh    -> Source + Parent remotes, Previous + Current branches"
	echo "  2. Save/Dependency.sh         -> commit any WIP"
	echo "  3. Switch/Branch.sh Previous  -> switch to Previous branch"
	echo "  4. Reset/Dependency.sh Previous -> reset hard to Parent/<upstream>, force-push Source/Previous"
	echo "  5. Switch/Branch.sh Current   -> switch to Current branch"
	echo "  6. Reset/Dependency.sh Current  -> reset hard to Parent/<upstream>, force-push Source/Current"
	echo "  7. Switch/Branch.sh Current   -> end on Current"
	echo ""
	echo "Sub-dependencies:"
	\jq -r '.[]' "$SubDependency" | \sed 's/^/  - /'
	exit 0
fi

read -r -p "Force-push will overwrite Source/Previous and Source/Current on $Count GitHub forks. Continue? [yes/NO] " Confirm
if [ "$Confirm" != "yes" ]; then
	echo "Aborted."
	exit 1
fi

# 1. Configure remotes + branches (idempotent).
"$Current/Configure/Dependency.sh" "$Organization" "$SubDependency" "$Dependency"

# 2. Save WIP on whatever branch is currently checked out.
"$Current/Save/Dependency.sh" "$Organization" "$SubDependency" "$Dependency"

# 3. Reset Previous branch to upstream + force-push.
"$Current/Switch/Branch.sh" "$Organization" "$SubDependency" "$Dependency" "Previous"
"$Current/Reset/Dependency.sh" "$Organization" "$SubDependency" "$Dependency" "Previous"

# 4. Reset Current branch to upstream + force-push.
"$Current/Switch/Branch.sh" "$Organization" "$SubDependency" "$Dependency" "Current"
"$Current/Reset/Dependency.sh" "$Organization" "$SubDependency" "$Dependency" "Current"

# 5. End on Current.
"$Current/Switch/Branch.sh" "$Organization" "$SubDependency" "$Dependency" "Current"

echo ""
echo "================================================================"
echo "Tauri full reset complete."
echo "  Source/Previous = upstream snapshot"
echo "  Source/Current  = upstream HEAD (working branch)"
echo "================================================================"
