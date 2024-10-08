#!/bin/bash

\pwd

Current=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && \pwd)

File=(
	"/d/Developer/Application/CodeEditorLand/Land/Dependency/SWC/Dependency/SWC/bindings/binding_core_wasm/package.json"
	"/d/Developer/Application/CodeEditorLand/Land/Dependency/SWC/Dependency/SWC/bindings/binding_minifier_wasm/package.json"
	"/d/Developer/Application/CodeEditorLand/Land/Dependency/SWC/Dependency/SWC/bindings/binding_typescript_wasm/package.json"
	"/d/Developer/Application/CodeEditorLand/Land/Dependency/SWC/Dependency/SWC/crates/swc_ecma_minifier/package.json"
	"/d/Developer/Application/CodeEditorLand/Land/Dependency/SWC/Dependency/SWC/package.json"
	"/d/Developer/Application/CodeEditorLand/Land/Dependency/SWC/Dependency/SWC/packages/core/scripts/npm/darwin-x64/package.json"
	"/d/Developer/Application/CodeEditorLand/Land/Dependency/SWC/Dependency/SWC/packages/core/scripts/npm/linux-x64-gnu/package.json"
	"/d/Developer/Application/CodeEditorLand/Land/Dependency/SWC/Dependency/SWC/packages/core/scripts/npm/win32-x64-msvc/package.json"
	"/d/Developer/Application/CodeEditorLand/Land/Dependency/SWC/Dependency/SWC/packages/helpers/package.json"
	"/d/Developer/Application/CodeEditorLand/Land/Dependency/SWC/Dependency/SWC/packages/types/package.json"
	"/d/Developer/Application/CodeEditorLand/Land/Dependency/Tauri/Dependency/AwesomeTauri/package.json"
	"/d/Developer/Application/CodeEditorLand/Land/Dependency/Tauri/Dependency/PluginsWorkspace/plugins/authenticator/package.json"
	"/d/Developer/Application/CodeEditorLand/Land/Dependency/Tauri/Dependency/Realworld/package.json"
	"/d/Developer/Application/CodeEditorLand/Land/Dependency/Tauri/Dependency/Tauri/examples/web/package.json"
	"/d/Developer/Application/CodeEditorLand/Land/Dependency/Tauri/Dependency/TauriInvokeHTTP/examples/vanilla/package.json"
	"/d/Developer/Application/CodeEditorLand/Land/Dependency/Tauri/Dependency/TauriPluginAuthenticator/package.json"
	"/d/Developer/Application/CodeEditorLand/Land/Dependency/Tauri/Dependency/TauriPluginAutostart/package.json"
	"/d/Developer/Application/CodeEditorLand/Land/Dependency/Tauri/Dependency/TauriPluginPositioner/package.json"
	"/d/Developer/Application/CodeEditorLand/Land/Dependency/Tauri/Dependency/TauriPluginStore/examples/AppSettingsManager/package.json"
	"/d/Developer/Application/CodeEditorLand/Land/Dependency/Tauri/Dependency/TauriPluginStore/package.json"
	"/d/Developer/Application/CodeEditorLand/Land/Dependency/Tauri/Dependency/TauriPluginStrongHold/package.json"
	"/d/Developer/Application/CodeEditorLand/Land/Dependency/Tauri/Dependency/TauriPluginUpload/package.json"
	"/d/Developer/Application/CodeEditorLand/Land/Dependency/Tauri/Dependency/TauriPluginWebSocket/examples/tauri-app/package.json"
	"/d/Developer/Application/CodeEditorLand/Land/Dependency/Tauri/Dependency/TauriPluginWebSocket/package.json"
	"/d/Developer/Application/CodeEditorLand/Land/Dependency/Tauri/Dependency/TauriPluginWindow/package.json"
	"/d/Developer/Application/CodeEditorLand/Land/Dependency/Tauri/Dependency/TauriSearch/package.json"
	"/d/Developer/Application/CodeEditorLand/Land/Dependency/Tauri/Dependency/TauriSearch/packages/tauri-search/package.json"
	"/d/Developer/Application/CodeEditorLand/Land/Dependency/Tauri/Dependency/TauriStudio/docs-generator/package.json"
	"/d/Developer/Application/CodeEditorLand/Land/Dependency/Tauri/Dependency/VueCLIPluginTauri/package.json"
	"/d/Developer/Application/CodeEditorLand/Land/Dependency/Tauri/Dependency/WindowShadows/examples/tauri/package.json"
	"/d/Developer/Application/CodeEditorLand/Land/Dependency/Tauri/Dependency/WindowVibrancy/examples/tauri/package.json"
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
