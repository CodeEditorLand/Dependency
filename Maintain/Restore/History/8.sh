#!/bin/bash

\pwd

Current=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && \pwd)

File=(
	"$Current/../../../SWC/Dependency/SWC/bindings/binding_core_wasm/package.json"
	"$Current/../../../SWC/Dependency/SWC/bindings/binding_minifier_wasm/package.json"
	"$Current/../../../SWC/Dependency/SWC/bindings/binding_typescript_wasm/package.json"
	"$Current/../../../SWC/Dependency/SWC/crates/swc_ecma_minifier/package.json"
	"$Current/../../../SWC/Dependency/SWC/package.json"
	"$Current/../../../SWC/Dependency/SWC/packages/core/scripts/npm/darwin-x64/package.json"
	"$Current/../../../SWC/Dependency/SWC/packages/core/scripts/npm/linux-x64-gnu/package.json"
	"$Current/../../../SWC/Dependency/SWC/packages/core/scripts/npm/win32-x64-msvc/package.json"
	"$Current/../../../SWC/Dependency/SWC/packages/helpers/package.json"
	"$Current/../../../SWC/Dependency/SWC/packages/types/package.json"
	"$Current/../../../Tauri/Dependency/AwesomeTauri/package.json"
	"$Current/../../../Tauri/Dependency/PluginsWorkspace/plugins/authenticator/package.json"
	"$Current/../../../Tauri/Dependency/Realworld/package.json"
	"$Current/../../../Tauri/Dependency/Tauri/examples/web/package.json"
	"$Current/../../../Tauri/Dependency/TauriInvokeHTTP/examples/vanilla/package.json"
	"$Current/../../../Tauri/Dependency/TauriPluginAuthenticator/package.json"
	"$Current/../../../Tauri/Dependency/TauriPluginAutostart/package.json"
	"$Current/../../../Tauri/Dependency/TauriPluginPositioner/package.json"
	"$Current/../../../Tauri/Dependency/TauriPluginStore/examples/AppSettingsManager/package.json"
	"$Current/../../../Tauri/Dependency/TauriPluginStore/package.json"
	"$Current/../../../Tauri/Dependency/TauriPluginStrongHold/package.json"
	"$Current/../../../Tauri/Dependency/TauriPluginUpload/package.json"
	"$Current/../../../Tauri/Dependency/TauriPluginWebSocket/examples/tauri-app/package.json"
	"$Current/../../../Tauri/Dependency/TauriPluginWebSocket/package.json"
	"$Current/../../../Tauri/Dependency/TauriPluginWindow/package.json"
	"$Current/../../../Tauri/Dependency/TauriSearch/package.json"
	"$Current/../../../Tauri/Dependency/TauriSearch/packages/tauri-search/package.json"
	"$Current/../../../Tauri/Dependency/TauriStudio/docs-generator/package.json"
	"$Current/../../../Tauri/Dependency/VueCLIPluginTauri/package.json"
	"$Current/../../../Tauri/Dependency/WindowShadows/examples/tauri/package.json"
	"$Current/../../../Tauri/Dependency/WindowVibrancy/examples/tauri/package.json"
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
