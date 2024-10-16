#!/bin/bash

\pwd

Current=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && \pwd)

File=(
	"$Current/../../../Tauri/Dependency/Tauri/crates/tauri-cli/templates/plugin/__example-basic/vanilla/package.json"
	"$Current/../../../Tauri/Dependency/Tauri/crates/tauri-cli/templates/plugin/package.json"
	"$Current/../../../Tauri/Dependency/Tauri/crates/tauri-schema-worker/package.json"
	"$Current/../../../Tauri/Dependency/Tauri/examples/api/package.json"
	"$Current/../../../Tauri/Dependency/Tauri/examples/file-associations/package.json"
	"$Current/../../../Tauri/Dependency/Tauri/examples/resources/package.json"
	"$Current/../../../Tauri/Dependency/Tauri/package.json"
	"$Current/../../../Tauri/Dependency/Tauri/packages/cli/npm/darwin-arm64/package.json"
	"$Current/../../../Tauri/Dependency/Tauri/packages/cli/npm/darwin-x64/package.json"
	"$Current/../../../Tauri/Dependency/Tauri/packages/cli/npm/linux-arm-gnueabihf/package.json"
	"$Current/../../../Tauri/Dependency/Tauri/packages/cli/npm/linux-arm64-gnu/package.json"
	"$Current/../../../Tauri/Dependency/Tauri/packages/cli/npm/linux-arm64-musl/package.json"
	"$Current/../../../Tauri/Dependency/Tauri/packages/cli/npm/linux-x64-gnu/package.json"
	"$Current/../../../Tauri/Dependency/Tauri/packages/cli/npm/linux-x64-musl/package.json"
	"$Current/../../../Tauri/Dependency/Tauri/packages/cli/npm/win32-arm64-msvc/package.json"
	"$Current/../../../Tauri/Dependency/Tauri/packages/cli/npm/win32-ia32-msvc/package.json"
	"$Current/../../../Tauri/Dependency/Tauri/packages/cli/npm/win32-x64-msvc/package.json"
	"$Current/../../../Tauri/Dependency/Tauri/packages/cli/package.json"
	"$Current/../../../Tauri/Dependency/TauriDocs/packages/tauri/crates/tauri-cli/templates/plugin/__example-basic/vanilla/package.json"
	"$Current/../../../Tauri/Dependency/TauriDocs/packages/tauri/crates/tauri-cli/templates/plugin/package.json"
	"$Current/../../../Tauri/Dependency/TauriDocs/packages/tauri/crates/tauri-schema-worker/package.json"
	"$Current/../../../Tauri/Dependency/TauriDocs/packages/tauri/examples/api/package.json"
	"$Current/../../../Tauri/Dependency/TauriDocs/packages/tauri/examples/file-associations/package.json"
	"$Current/../../../Tauri/Dependency/TauriDocs/packages/tauri/examples/resources/package.json"
	"$Current/../../../Tauri/Dependency/TauriDocs/packages/tauri/package.json"
	"$Current/../../../Tauri/Dependency/TauriDocs/packages/tauri/packages/cli/npm/darwin-arm64/package.json"
	"$Current/../../../Tauri/Dependency/TauriDocs/packages/tauri/packages/cli/npm/darwin-x64/package.json"
	"$Current/../../../Tauri/Dependency/TauriDocs/packages/tauri/packages/cli/npm/linux-arm-gnueabihf/package.json"
	"$Current/../../../Tauri/Dependency/TauriDocs/packages/tauri/packages/cli/npm/linux-arm64-gnu/package.json"
	"$Current/../../../Tauri/Dependency/TauriDocs/packages/tauri/packages/cli/npm/linux-arm64-musl/package.json"
	"$Current/../../../Tauri/Dependency/TauriDocs/packages/tauri/packages/cli/npm/linux-x64-gnu/package.json"
	"$Current/../../../Tauri/Dependency/TauriDocs/packages/tauri/packages/cli/npm/linux-x64-musl/package.json"
	"$Current/../../../Tauri/Dependency/TauriDocs/packages/tauri/packages/cli/npm/win32-arm64-msvc/package.json"
	"$Current/../../../Tauri/Dependency/TauriDocs/packages/tauri/packages/cli/npm/win32-ia32-msvc/package.json"
	"$Current/../../../Tauri/Dependency/TauriDocs/packages/tauri/packages/cli/npm/win32-x64-msvc/package.json"
	"$Current/../../../Tauri/Dependency/TauriDocs/packages/tauri/packages/cli/package.json"
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
