#!/bin/bash

\pwd

Current=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && \pwd)

File=(
	"$Current/../../../Land/Dependency/LandPullRequestGitHub/Source/github/conflictResolutionCoordinator.ts"
	"$Current/../../../SWC/Dependency/SWC/crates/swc_ecma_parser/Source/lexer/tests.rs"
	"$Current/../../../Tauri/Dependency/PluginsWorkspace/examples/api/package.json"
	"$Current/../../../Tauri/Dependency/PluginsWorkspace/plugins/barcode-scanner/package.json"
	"$Current/../../../Tauri/Dependency/PluginsWorkspace/plugins/biometric/package.json"
	"$Current/../../../Tauri/Dependency/PluginsWorkspace/plugins/cli/package.json"
	"$Current/../../../Tauri/Dependency/PluginsWorkspace/plugins/clipboard-manager/package.json"
	"$Current/../../../Tauri/Dependency/PluginsWorkspace/plugins/deep-link/package.json"
	"$Current/../../../Tauri/Dependency/PluginsWorkspace/plugins/dialog/package.json"
	"$Current/../../../Tauri/Dependency/PluginsWorkspace/plugins/fs/package.json"
	"$Current/../../../Tauri/Dependency/PluginsWorkspace/plugins/geolocation/package.json"
	"$Current/../../../Tauri/Dependency/PluginsWorkspace/plugins/global-shortcut/package.json"
	"$Current/../../../Tauri/Dependency/PluginsWorkspace/plugins/haptics/package.json"
	"$Current/../../../Tauri/Dependency/PluginsWorkspace/plugins/http/package.json"
	"$Current/../../../Tauri/Dependency/PluginsWorkspace/plugins/log/package.json"
	"$Current/../../../Tauri/Dependency/PluginsWorkspace/plugins/nfc/package.json"
	"$Current/../../../Tauri/Dependency/PluginsWorkspace/plugins/notification/package.json"
	"$Current/../../../Tauri/Dependency/PluginsWorkspace/plugins/os/package.json"
	"$Current/../../../Tauri/Dependency/PluginsWorkspace/plugins/positioner/package.json"
	"$Current/../../../Tauri/Dependency/PluginsWorkspace/plugins/process/package.json"
	"$Current/../../../Tauri/Dependency/PluginsWorkspace/plugins/shell/package.json"
	"$Current/../../../Tauri/Dependency/PluginsWorkspace/plugins/sql/package.json"
	"$Current/../../../Tauri/Dependency/PluginsWorkspace/plugins/store/package.json"
	"$Current/../../../Tauri/Dependency/PluginsWorkspace/plugins/stronghold/package.json"
	"$Current/../../../Tauri/Dependency/PluginsWorkspace/plugins/updater/package.json"
	"$Current/../../../Tauri/Dependency/PluginsWorkspace/plugins/upload/package.json"
	"$Current/../../../Tauri/Dependency/PluginsWorkspace/plugins/websocket/package.json"
	"$Current/../../../Tauri/Dependency/PluginsWorkspace/plugins/window-state/package.json"
	"$Current/../../../Tauri/Dependency/TauriDocs/packages/plugins-workspace/examples/api/package.json"
	"$Current/../../../Tauri/Dependency/TauriDocs/packages/plugins-workspace/plugins/barcode-scanner/package.json"
	"$Current/../../../Tauri/Dependency/TauriDocs/packages/plugins-workspace/plugins/biometric/package.json"
	"$Current/../../../Tauri/Dependency/TauriDocs/packages/plugins-workspace/plugins/cli/package.json"
	"$Current/../../../Tauri/Dependency/TauriDocs/packages/plugins-workspace/plugins/clipboard-manager/package.json"
	"$Current/../../../Tauri/Dependency/TauriDocs/packages/plugins-workspace/plugins/deep-link/package.json"
	"$Current/../../../Tauri/Dependency/TauriDocs/packages/plugins-workspace/plugins/dialog/package.json"
	"$Current/../../../Tauri/Dependency/TauriDocs/packages/plugins-workspace/plugins/fs/package.json"
	"$Current/../../../Tauri/Dependency/TauriDocs/packages/plugins-workspace/plugins/geolocation/package.json"
	"$Current/../../../Tauri/Dependency/TauriDocs/packages/plugins-workspace/plugins/global-shortcut/package.json"
	"$Current/../../../Tauri/Dependency/TauriDocs/packages/plugins-workspace/plugins/haptics/package.json"
	"$Current/../../../Tauri/Dependency/TauriDocs/packages/plugins-workspace/plugins/http/package.json"
	"$Current/../../../Tauri/Dependency/TauriDocs/packages/plugins-workspace/plugins/log/package.json"
	"$Current/../../../Tauri/Dependency/TauriDocs/packages/plugins-workspace/plugins/nfc/package.json"
	"$Current/../../../Tauri/Dependency/TauriDocs/packages/plugins-workspace/plugins/notification/package.json"
	"$Current/../../../Tauri/Dependency/TauriDocs/packages/plugins-workspace/plugins/os/package.json"
	"$Current/../../../Tauri/Dependency/TauriDocs/packages/plugins-workspace/plugins/positioner/package.json"
	"$Current/../../../Tauri/Dependency/TauriDocs/packages/plugins-workspace/plugins/process/package.json"
	"$Current/../../../Tauri/Dependency/TauriDocs/packages/plugins-workspace/plugins/shell/package.json"
	"$Current/../../../Tauri/Dependency/TauriDocs/packages/plugins-workspace/plugins/sql/package.json"
	"$Current/../../../Tauri/Dependency/TauriDocs/packages/plugins-workspace/plugins/store/package.json"
	"$Current/../../../Tauri/Dependency/TauriDocs/packages/plugins-workspace/plugins/stronghold/package.json"
	"$Current/../../../Tauri/Dependency/TauriDocs/packages/plugins-workspace/plugins/updater/package.json"
	"$Current/../../../Tauri/Dependency/TauriDocs/packages/plugins-workspace/plugins/upload/package.json"
	"$Current/../../../Tauri/Dependency/TauriDocs/packages/plugins-workspace/plugins/websocket/package.json"
	"$Current/../../../Tauri/Dependency/TauriDocs/packages/plugins-workspace/plugins/window-state/package.json"
)

for File in "${File[@]}"; do
	(
		\cd "$(\dirname "$File")" || \exit

		# shellcheck disable=SC1091
		\source "$Current"/../../Fn/Cache.sh

		Fn

		\pwd

		\git fetch Parent --no-tags

		# shellcheck disable=SC2046
		# shellcheck disable=SC2154
		\git restore --source Parent/"$BranchParent" $(\basename "$File")

		\cd - || \exit
	) &
done

\wait
