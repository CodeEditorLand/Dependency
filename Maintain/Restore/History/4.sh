#!/usr/bin/env bash

\pwd

Current=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && \pwd)

cd "$Current"/../../../Microsoft/Dependency/Editor/Source/vs/workbench/api/browser/ || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

# shellcheck disable=SC2154
\git restore --source Parent/"$BranchParent" mainThreadComments.ts

cd "$Current"/../../../Microsoft/Dependency/Editor/Source/vs/workbench/api/common/ || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

\git restore --source Parent/"$BranchParent" extHostComments.ts

cd "$Current"/../../../Microsoft/Dependency/Editor/Source/vs/workbench/api/common/ || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

\git restore --source Parent/"$BranchParent" extHostStatusBar.ts

cd "$Current"/../../../Microsoft/Dependency/Editor/Source/vs/workbench/api/common/ || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

\git restore --source Parent/"$BranchParent" extHostTesting.ts

cd "$Current"/../../../Microsoft/Dependency/Editor/Source/vs/workbench/api/common/ || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

\git restore --source Parent/"$BranchParent" extHostTypes.ts

cd "$Current"/../../../Microsoft/Dependency/Editor/Source/vs/workbench/browser/parts/ || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

\git restore --source Parent/"$BranchParent" paneCompositeBar.ts

cd "$Current"/../../../Microsoft/Dependency/Editor/Source/vs/workbench/contrib/extensions/browser/ || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

\git restore --source Parent/"$BranchParent" extensionsWorkbenchService.ts

cd "$Current"/../../../Microsoft/Dependency/Editor/Source/vs/workbench/services/extensionRecommendations/common/ || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

\git restore --source Parent/"$BranchParent" extensionIgnoredRecommendationsService.ts

cd "$Current"/../../../Microsoft/Dependency/Editor/Source/vs/workbench/services/userDataSync/browser/ || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

\git restore --source Parent/"$BranchParent" userDataSyncWorkbenchService.ts

cd "$Current"/../../../Microsoft/Dependency/Editor/Source/vs/workbench/api/common/ || exit

git restore --source "$SOURCE" extHostComments.ts

cd "$Current"/../../../Microsoft/Dependency/Editor/Source/vs/workbench/api/common/ || exit

git restore --source "$SOURCE" extHostQuickOpen.ts
