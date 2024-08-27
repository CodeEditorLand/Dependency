#!/bin/bash

SOURCE=Parent/"$(\gh repo view "$(\gh repo view --json parent | \jq -c -r '.parent.owner.login, .parent.name' | \tr -s '\r\n' '/' | \sed 's/\/$//')" --json defaultBranchRef | \jq -r -c '.defaultBranchRef.name')"

cd src/vs/ || exit

\git restore --source "$SOURCE" amdX.ts

cd - || exit

cd src/vs/base/browser/ui/list/ || exit

\git restore --source "$SOURCE" listView.ts

cd - || exit

cd src/vs/base/common/worker/ || exit

\git restore --source "$SOURCE" simpleWorker.ts

cd - || exit

cd src/vs/base/worker/ || exit

\git restore --source "$SOURCE" workerMain.ts

cd - || exit

cd src/vs/editor/common/services/ || exit

\git restore --source "$SOURCE" editorSimpleWorker.ts

cd - || exit

cd src/vs/editor/contrib/rename/browser/ || exit

\git restore --source "$SOURCE" renameInputField.ts

cd - || exit

cd src/vs/workbench/browser/parts/views/ || exit

\git restore --source "$SOURCE" viewPane.ts

cd - || exit

cd src/vs/workbench/contrib/bulkEdit/browser/preview/ || exit

\git restore --source "$SOURCE" bulkEditPane.ts

cd - || exit

cd src/vs/workbench/contrib/chat/browser/contrib/ || exit

\git restore --source "$SOURCE" chatContextAttachments.ts

cd - || exit

cd src/vs/workbench/contrib/chat/common/ || exit

\git restore --source "$SOURCE" chatWordCounter.ts

cd - || exit

cd src/vs/workbench/contrib/comments/browser/ || exit

\git restore --source "$SOURCE" commentReply.ts

cd - || exit

cd src/vs/workbench/contrib/debug/browser/ || exit

\git restore --source "$SOURCE" exceptionWidget.ts

cd - || exit

cd src/vs/workbench/contrib/extensions/browser/ || exit

\git restore --source "$SOURCE" extensionsWorkbenchService.ts

cd - || exit

cd src/vs/workbench/contrib/inlineChat/browser/ || exit

\git restore --source "$SOURCE" inlineChatController.ts

cd - || exit

cd src/vs/workbench/contrib/inlineChat/browser/ || exit

\git restore --source "$SOURCE" inlineChatSession.ts

cd - || exit

cd src/vs/workbench/contrib/notebook/browser/diff/ || exit

\git restore --source "$SOURCE" diffElementViewModel.ts

cd - || exit

cd src/vs/workbench/contrib/notebook/browser/diff/ || exit

\git restore --source "$SOURCE" notebookDiffEditor.ts

cd - || exit

cd src/vs/workbench/contrib/preferences/browser/ || exit

\git restore --source "$SOURCE" keybindingsEditor.ts

cd - || exit

cd src/vs/workbench/contrib/scm/browser/ || exit

\git restore --source "$SOURCE" dirtydiffDecorator.ts

cd - || exit

cd src/vs/workbench/contrib/search/browser/ || exit

\git restore --source "$SOURCE" anythingQuickAccess.ts

cd - || exit

cd src/vs/workbench/contrib/search/browser/ || exit

\git restore --source "$SOURCE" searchModel.ts

cd - || exit

cd src/vs/workbench/contrib/tasks/common/ || exit

\git restore --source "$SOURCE" jsonSchema_v1.ts

cd - || exit

cd src/vs/workbench/contrib/tasks/common/ || exit

\git restore --source "$SOURCE" jsonSchema_v2.ts

cd - || exit

cd src/vs/workbench/contrib/terminal/browser/ || exit

\git restore --source "$SOURCE" terminalInstance.ts

cd - || exit

cd src/vs/workbench/contrib/terminal/browser/ || exit

\git restore --source "$SOURCE" terminalVoice.ts

cd - || exit

cd src/vs/workbench/contrib/terminalContrib/chat/browser/ || exit

\git restore --source "$SOURCE" terminal.initialHint.contribution.ts

cd - || exit

cd src/vs/workbench/contrib/testing/common/ || exit

\git restore --source "$SOURCE" testItemCollection.ts

cd - || exit

cd src/vs/workbench/contrib/welcomeGettingStarted/browser/ || exit

\git restore --source "$SOURCE" gettingStarted.ts

cd - || exit

cd src/vs/workbench/contrib/welcomeGettingStarted/browser/ || exit

\git restore --source "$SOURCE" gettingStartedDetailsRenderer.ts

cd - || exit

cd src/vs/workbench/contrib/welcomeWalkthrough/common/ || exit

\git restore --source "$SOURCE" walkThroughContentProvider.ts

cd - || exit

cd src/vs/workbench/contrib/workspace/browser/ || exit

\git restore --source "$SOURCE" workspaceTrustEditor.ts

cd - || exit

cd src/vs/workbench/contrib/workspaces/browser/ || exit

\git restore --source "$SOURCE" workspaces.contribution.ts

cd - || exit

cd src/vs/workbench/services/extensionRecommendations/browser/ || exit

\git restore --source "$SOURCE" extensionIgnoredRecommendationsService.ts

cd - || exit

cd src/vs/workbench/services/extensionRecommendations/common/ || exit

\git restore --source "$SOURCE" extensionIgnoredRecommendationsService.ts

cd - || exit

cd src/vs/workbench/services/extensions/common/ || exit

\git restore --source "$SOURCE" extensionsRegistry.ts

cd - || exit

cd src/vs/workbench/services/keybinding/browser/ || exit

\git restore --source "$SOURCE" keyboardLayoutService.ts

cd - || exit

cd src/vs/workbench/services/search/common/ || exit

\git restore --source "$SOURCE" fileSearchManager.ts

cd - || exit

cd src/vs/workbench/services/search/common/ || exit

\git restore --source "$SOURCE" searchExtConversionTypes.ts

cd - || exit
