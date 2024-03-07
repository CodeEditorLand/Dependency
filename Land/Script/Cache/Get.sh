#!/bin/bash

\echo "Process: Cache/Get.sh"

# Contextless

Directory=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

Organization="CodeEditorLand"

Repository=()

Omit=(
	"CodeEditorLand/.github"
	"CodeEditorLand/Babel"
	"CodeEditorLand/Biome"
	"CodeEditorLand/Cargo"
	"CodeEditorLand/CargoDocument"
	"CodeEditorLand/CargoLand"
	"CodeEditorLand/CargoMaintain"
	"CodeEditorLand/CargoRuntime"
	"CodeEditorLand/CodeEditorLand"
	"CodeEditorLand/Commonality"
	"CodeEditorLand/debugger-libs"
	"CodeEditorLand/DemoRepository"
	"CodeEditorLand/Document"
	"CodeEditorLand/Foundation"
	"CodeEditorLand/JavaScript"
	"CodeEditorLand/Land"
	"CodeEditorLand/LLRT"
	"CodeEditorLand/Maintain"
	"CodeEditorLand/node-gyp"
	"CodeEditorLand/NPM"
	"CodeEditorLand/NPMCommon"
	"CodeEditorLand/NPMIngress"
	"CodeEditorLand/NPMLand"
	"CodeEditorLand/NRefactory"
	"CodeEditorLand/Oniguruma"
	"CodeEditorLand/Property"
	"CodeEditorLand/PropertyLand"
	"CodeEditorLand/Runtime"
	"CodeEditorLand/Skia"
	"CodeEditorLand/Stream"
	"CodeEditorLand/TypeScript"
	"CodeEditorLand/Website"
	"CodeEditorLand/Wil"

	"CodeEditorLand/plugins-workspace"
	"CodeEditorLand/tray-icon"
	"CodeEditorLand/tauri-bindgen"
	"CodeEditorLand/tauri-docs"
	"CodeEditorLand/tauri"
	"CodeEditorLand/smoke-tests"
	"CodeEditorLand/benchmark_results"
	"CodeEditorLand/tauri-action"
	"CodeEditorLand/tauri-discord-bot"
	"CodeEditorLand/muda"
	"CodeEditorLand/global-hotkey"
	"CodeEditorLand/meilisearch-docsearch"
	"CodeEditorLand/tauri-github-bot"
	"CodeEditorLand/tauri-vscode"
	"CodeEditorLand/tauri-plugin-dialog"
	"CodeEditorLand/tauri-plugin-fs"
	"CodeEditorLand/tauri-plugin-http"
	"CodeEditorLand/wry"
	"CodeEditorLand/tauri-plugin-store"
	"CodeEditorLand/tauri-plugin-stronghold"
	"CodeEditorLand/create-tauri-app"
	"CodeEditorLand/window-vibrancy"
	"CodeEditorLand/linuxdeploy-plugin-gstreamer"
	"CodeEditorLand/tauri-plugin-window-state"
	"CodeEditorLand/tauri-plugin-websocket"
	"CodeEditorLand/tauri-plugin-upload"
	"CodeEditorLand/tauri-plugin-updater"
	"CodeEditorLand/tauri-plugin-shell"
	"CodeEditorLand/tauri-plugin-sql"
	"CodeEditorLand/tauri-plugin-process"
	"CodeEditorLand/tauri-plugin-positioner"
	"CodeEditorLand/tauri-plugin-os"
	"CodeEditorLand/tauri-plugin-notification"
	"CodeEditorLand/tauri-plugin-log"
	"CodeEditorLand/tauri-plugin-global-shortcut"
	"CodeEditorLand/tauri-plugin-clipboard-manager"
	"CodeEditorLand/tauri-plugin-cli"
	"CodeEditorLand/tauri-plugin-autostart"
	"CodeEditorLand/tauri-plugin-authenticator"
	"CodeEditorLand/awesome-tauri"
	"CodeEditorLand/create-pull-request"
	"CodeEditorLand/cargo-mobile2"
	"CodeEditorLand/tao"
	"CodeEditorLand/win7-notifications"
	"CodeEditorLand/tauri-invoke-http"
	"CodeEditorLand/window-shadows"
	"CodeEditorLand/rfcs"
	"CodeEditorLand/dns-automation"
	"CodeEditorLand/linuxdeploy-plugin-gtk"
	"CodeEditorLand/libappindicator-rs"
	"CodeEditorLand/javascriptcore-rs"
	"CodeEditorLand/webkit2gtk-rs"
	"CodeEditorLand/tauri-plugin-fs-watch"
	"CodeEditorLand/tauri-plugin-fs-extra"
	"CodeEditorLand/fix-path-env-rs"
	"CodeEditorLand/binary-releases"
	"CodeEditorLand/msedgedriver-manifest-cache"
	"CodeEditorLand/gipfs"
	"CodeEditorLand/gir-files"
	"CodeEditorLand/board-voter"
	"CodeEditorLand/tauri-egui"
	"CodeEditorLand/meetings"
	"CodeEditorLand/soup2-rs"
	"CodeEditorLand/benchmark_electron"
	"CodeEditorLand/nsis-tauri-utils"
	"CodeEditorLand/winres"
	"CodeEditorLand/vue-cli-plugin-tauri"
	"CodeEditorLand/winrt-notification"
	"CodeEditorLand/rust-xcode-plugin"
	"CodeEditorLand/automation"
	"CodeEditorLand/tauri-plugin-window"
	"CodeEditorLand/tauri-plugin-app"
	"CodeEditorLand/egui"
	"CodeEditorLand/glutin"
	"CodeEditorLand/actions-netlify"
	"CodeEditorLand/rust-icns"
	"CodeEditorLand/typedoc-plugin-markdown"
	"CodeEditorLand/governance-and-guidance"
	"CodeEditorLand/tauri-plugin-persisted-scope"
	"CodeEditorLand/tauri-plugin-localhost"
	"CodeEditorLand/AppRun"
	"CodeEditorLand/tauri-search"
	"CodeEditorLand/tauri-plugin-single-instance"
	"CodeEditorLand/workflow-testbed"
	"CodeEditorLand/tauricon"
	"CodeEditorLand/rustdocusaurus"
	"CodeEditorLand/tauri-forage"
	"CodeEditorLand/tauri-theia"
	"CodeEditorLand/docusaurus-meilisearch-indexer"
	"CodeEditorLand/wry-mobile"
	"CodeEditorLand/realworld"
	"CodeEditorLand/typedocusaurus"
	"CodeEditorLand/tauri-hotkey-rs"
	"CodeEditorLand/tauri-dialog-rs"
	"CodeEditorLand/tauri-includedir"
	"CodeEditorLand/winit"
	"CodeEditorLand/tauri-inliner-rs"
	"CodeEditorLand/web-view"
	"CodeEditorLand/tauri-webpack"
	"CodeEditorLand/tauri.studio"
	"CodeEditorLand/zserge-webview"
	"CodeEditorLand/tauri-inliner"
	"CodeEditorLand/gh-tangle-release"
	"CodeEditorLand/deno"
	"CodeEditorLand/tauri-toml"
)

for ((Page = 1; Page <= 10; Page++)); do
	\mapfile -t TemporaryRepository < <(\printf "%s" "$(
		\gh api \
			-H "Accept: application/vnd.github+json" \
			-H "X-GitHub-Api-Version: 2022-11-28" \
			orgs/"${Organization}"/repos?per_page=100\&page=${Page} | \jq -r '.[].full_name'
	)" | \tr -d '\r')

	for Temporary in "${TemporaryRepository[@]}"; do
		Flag=false

		for RepositoryOmit in "${Omit[@]}"; do
			if [ "$Temporary" = "$RepositoryOmit" ]; then
				Flag=true

				break
			fi
		done

		if [ "$Flag" = false ]; then
			Repository+=("$Temporary")
		fi

		# TODO: Add these to the cache
		# Sync/Repository

		# ```sh
		# Main=$(\gh repo view --json parent | \jq -c -r '.parent.owner.login, .parent.name' | \tr -s '\r\n' '/')
		# Main=$(\echo "$Main" | \sed 's/\/$//')
		# Main=$(\gh repo view "$Main" --json defaultBranchRef | \jq -r -c '.defaultBranchRef.name')
		# ```

		# # Configure/Repository

		# ```sh
		# Upstream=$(\gh repo view --json parent | \jq -c -r '.parent.owner.login, .parent.name' | \tr -s '\r\n' '/')

		# if [[ "$Upstream" != "null/null" ]]; then
		# 	Upstream="ssh://git@github.com/${Upstream}"
		# 	Upstream=$(\echo "$Upstream" | \sed 's/\/$/\.git/')

		# 	\echo "Upstream: "
		# 	\echo "$Upstream"

		# 	\git remote remove upstream
		# 	\git remote add upstream "$Upstream"
		# 	\git remote set-url upstream "$Upstream"
		# fi
		# ```
	done
done

\mapfile -t Repository < <(\printf "%s\n" "${Repository[@]}" | \sort)

\printf "%s\n" "${Repository[@]}" >"$Directory"/Repository/CodeEditorLand
