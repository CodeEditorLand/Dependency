#!/bin/bash

SOURCE=Parent/"$(\gh repo view "$(\gh repo view --json parent | \jq -c -r '.parent.owner.login, .parent.name' | \tr -s '\r\n' '/' | \sed 's/\/$//')" --json defaultBranchRef | \jq -r -c '.defaultBranchRef.name')"

cd Source/vs/workbench/api/browser/ || exit

\git restore --source "$SOURCE" mainThreadComments.ts

cd - || exit

cd Source/vs/workbench/api/common/ || exit

\git restore --source "$SOURCE" extHostComments.ts

cd - || exit

cd Source/vs/workbench/api/common/ || exit

\git restore --source "$SOURCE" extHostStatusBar.ts

cd - || exit

cd Source/vs/workbench/api/common/ || exit

\git restore --source "$SOURCE" extHostTesting.ts

cd - || exit

cd Source/vs/workbench/api/common/ || exit

\git restore --source "$SOURCE" extHostTypes.ts

cd - || exit

cd Source/vs/workbench/browser/parts/ || exit

\git restore --source "$SOURCE" paneCompositeBar.ts

cd - || exit

cd Source/vs/workbench/contrib/extensions/browser/ || exit

\git restore --source "$SOURCE" extensionsWorkbenchService.ts

cd - || exit

cd Source/vs/workbench/services/extensionRecommendations/common/ || exit

\git restore --source "$SOURCE" extensionIgnoredRecommendationsService.ts

cd - || exit

cd Source/vs/workbench/services/userDataSync/browser/ || exit

\git restore --source "$SOURCE" userDataSyncWorkbenchService.ts

cd - || exit

cd Source/vs/workbench/api/common/ || exit

git restore --source "$SOURCE" extHostComments.ts

cd - || exit

cd Source/vs/workbench/api/common/ || exit

git restore --source "$SOURCE" extHostQuickOpen.ts

cd - || exit
