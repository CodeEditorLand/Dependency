#!/bin/bash

\pwd

Current=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && \pwd)

cd "$Current"/../../../Biome/Dependency/BiomeIntelliJ || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

# shellcheck disable=SC2154
\git restore --source Parent/"$BranchParent" LICENSE-APACHE
\git restore --source Parent/"$BranchParent" LICENSE-MIT

cd "$Current"/../../../Biome/Dependency/BiomeLand || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

# shellcheck disable=SC2154
\git restore --source Parent/"$BranchParent" LICENSE-APACHE
\git restore --source Parent/"$BranchParent" LICENSE-MIT

cd "$Current"/../../../Biome/Dependency/SetupBiome || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

# shellcheck disable=SC2154
\git restore --source Parent/"$BranchParent" LICENSE.md

cd "$Current"/../../../Biome/Dependency/Biome || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

# shellcheck disable=SC2154
\git restore --source Parent/"$BranchParent" LICENSE-APACHE
\git restore --source Parent/"$BranchParent" LICENSE-MIT
\git restore --source Parent/"$BranchParent" crates/biome_console/CODESPAN_LICENSE
\git restore --source Parent/"$BranchParent" crates/biome_js_formatter/PRETTIER_LICENSE
\git restore --source Parent/"$BranchParent" crates/biome_js_syntax/RSLINT_LICENSE
\git restore --source Parent/"$BranchParent" crates/biome_rowan/LICENSE-APACHE
\git restore --source Parent/"$BranchParent" crates/biome_rowan/LICENSE-MIT
\git restore --source Parent/"$BranchParent" crates/biome_service/src/matcher/LICENSE-APACHE
\git restore --source Parent/"$BranchParent" crates/biome_service/src/matcher/LICENSE-MIT
\git restore --source Parent/"$BranchParent" crates/biome_text_size/LICENSE-APACHE
\git restore --source Parent/"$BranchParent" crates/biome_text_size/LICENSE-MIT
\git restore --source Parent/"$BranchParent" crates/biome_ungrammar/LICENSE-APACHE
\git restore --source Parent/"$BranchParent" packages/@biomejs/backend-jsonrpc/LICENSE-APACHE
\git restore --source Parent/"$BranchParent" packages/@biomejs/backend-jsonrpc/LICENSE-MIT
\git restore --source Parent/"$BranchParent" packages/@biomejs/backend-jsonrpc/ROME-LICENSE-MIT
\git restore --source Parent/"$BranchParent" packages/@biomejs/biome/LICENSE-APACHE
\git restore --source Parent/"$BranchParent" packages/@biomejs/biome/LICENSE-MIT
\git restore --source Parent/"$BranchParent" packages/@biomejs/biome/ROME-LICENSE-MIT
\git restore --source Parent/"$BranchParent" packages/@biomejs/js-api/LICENSE-APACHE
\git restore --source Parent/"$BranchParent" packages/@biomejs/js-api/LICENSE-MIT
\git restore --source Parent/"$BranchParent" packages/@biomejs/js-api/ROME-LICENSE-MIT

cd "$Current"/../../../Land/Cargo/Runtime || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

# shellcheck disable=SC2154
\git restore --source Parent/"$BranchParent" THIRD_PARTY_LICENSES

cd "$Current"/../../../Land/Dependency/AzureStreamAnalyticsInLand || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

# shellcheck disable=SC2154
\git restore --source Parent/"$BranchParent" LICENSE-CODE

cd "$Current"/../../../Land/Dependency/DevSkim || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

# shellcheck disable=SC2154
\git restore --source Parent/"$BranchParent" LICENSE.txt

cd "$Current"/../../../Land/Dependency/LandAsa || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

# shellcheck disable=SC2154
\git restore --source Parent/"$BranchParent" LICENSE-CODE

cd "$Current"/../../../Land/Dependency/LandAzureAppService || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

# shellcheck disable=SC2154
\git restore --source Parent/"$BranchParent" LICENSE.md

cd "$Current"/../../../Land/Dependency/Editor || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

# shellcheck disable=SC2154
\git restore --source Parent/"$BranchParent" LICENSE.txt
\git restore --source Parent/"$BranchParent" extensions/latex/cpp-bailout-license.txt

cd "$Current"/../../../Land/Dependency/LandAzureContainerapps || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

# shellcheck disable=SC2154
\git restore --source Parent/"$BranchParent" LICENSE.md

cd "$Current"/../../../Land/Dependency/LandAzureStorage || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

# shellcheck disable=SC2154
\git restore --source Parent/"$BranchParent" LICENSE.md

cd "$Current"/../../../Land/Dependency/LandAzureStaticwebapps || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

# shellcheck disable=SC2154
\git restore --source Parent/"$BranchParent" LICENSE.md

cd "$Current"/../../../Land/Dependency/LandAzureVirtualMachines || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

# shellcheck disable=SC2154
\git restore --source Parent/"$BranchParent" LICENSE.md

cd "$Current"/../../../Land/Dependency/LandCopilotRelease || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

# shellcheck disable=SC2154
\git restore --source Parent/"$BranchParent" LICENSE-CODE

cd "$Current"/../../../Land/Dependency/LandCPPTools || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

# shellcheck disable=SC2154
\git restore --source Parent/"$BranchParent" ExtensionPack/LICENSE.txt
\git restore --source Parent/"$BranchParent" LICENSE.md
\git restore --source Parent/"$BranchParent" RuntimeLicenses/cpptools-LICENSE.txt
\git restore --source Parent/"$BranchParent" RuntimeLicenses/cpptools-srv-LICENSE.txt
\git restore --source Parent/"$BranchParent" RuntimeLicenses/vsdbg-LICENSE.txt
\git restore --source Parent/"$BranchParent" Themes/LICENSE.txt

cd "$Current"/../../../Land/Dependency/LandDocker || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

# shellcheck disable=SC2154
\git restore --source Parent/"$BranchParent" LICENSE.md

cd "$Current"/../../../Land/Dependency/LandDocs || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

# shellcheck disable=SC2154
\git restore --source Parent/"$BranchParent" LICENSE.md

cd "$Current"/../../../Land/Dependency/LandIcons || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

# shellcheck disable=SC2154
\git restore --source Parent/"$BranchParent" LICENSE-CODE

cd "$Current"/../../../Land/Dependency/LandJupyter || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

# shellcheck disable=SC2154
\git restore --source Parent/"$BranchParent" api/LICENSE.md

cd "$Current"/../../../Land/Dependency/LandLanguageServerNode || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

# shellcheck disable=SC2154
\git restore --source Parent/"$BranchParent" License.txt
\git restore --source Parent/"$BranchParent" client/License.txt
\git restore --source Parent/"$BranchParent" jsonrpc/License.txt
\git restore --source Parent/"$BranchParent" protocol/License.txt
\git restore --source Parent/"$BranchParent" server/License.txt
\git restore --source Parent/"$BranchParent" textDocument/License.txt
\git restore --source Parent/"$BranchParent" tsconfig-gen/LICENSE.md
\git restore --source Parent/"$BranchParent" types/License.txt

cd "$Current"/../../../Land/Dependency/LandMssql || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

# shellcheck disable=SC2154
\git restore --source Parent/"$BranchParent" LICENSE.txt

cd "$Current"/../../../Land/Dependency/LandPython || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

# shellcheck disable=SC2154
\git restore --source Parent/"$BranchParent" pythonExtensionApi/LICENSE.md

cd "$Current"/../../../Land/Dependency/LandRemoteRepositoriesGitHub || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

# shellcheck disable=SC2154
\git restore --source Parent/"$BranchParent" LICENSE-CODE

cd "$Current"/../../../Land/Dependency/LandRemoteRelease || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

# shellcheck disable=SC2154
\git restore --source Parent/"$BranchParent" LICENSE-extensions
\git restore --source Parent/"$BranchParent" LICENSE-repository

cd "$Current"/../../../Land/Dependency/LandRussh || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

# shellcheck disable=SC2154
\git restore --source Parent/"$BranchParent" LICENSE-2.0.txt

cd "$Current"/../../../Land/Dependency/LandToolsForAI || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

# shellcheck disable=SC2154
\git restore --source Parent/"$BranchParent" LICENSE-CODE
\git restore --source Parent/"$BranchParent" archive/LICENSE-CODE

cd "$Current"/../../../Land/Dependency/LandWiki || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

# shellcheck disable=SC2154
\git restore --source Parent/"$BranchParent" Contributor-License-Agreement.md

cd "$Current"/../../../OXC/Dependency/OXC || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

# shellcheck disable=SC2154
\git restore --source Parent/"$BranchParent" THIRD-PARTY-LICENSE

cd "$Current"/../../../OXC/Dependency/UniCodeIDStart || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

# shellcheck disable=SC2154
\git restore --source Parent/"$BranchParent" LICENSE-UNICODE

cd "$Current"/../../../Rolldown/Dependency/Rolldown || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

# shellcheck disable=SC2154
\git restore --source Parent/"$BranchParent" THIRD-PARTY-LICENSE

cd "$Current"/../../../Rolldown/Dependency/RolldownPluginNodePolyfills || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

# shellcheck disable=SC2154
\git restore --source Parent/"$BranchParent" polyfills/LICENSE-browserify-fs.txt
\git restore --source Parent/"$BranchParent" polyfills/LICENSE-buffer-es6.txt
\git restore --source Parent/"$BranchParent" polyfills/LICENSE-crypto-browserify.txt
\git restore --source Parent/"$BranchParent" polyfills/LICENSE-process-es6.txt

cd "$Current"/../../../SWC/Dependency/SWCProject.github.io || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

# shellcheck disable=SC2154
\git restore --source Parent/"$BranchParent" assets/js/1df93b7f.2cdd3048.js.LICENSE.txt
\git restore --source Parent/"$BranchParent" assets/js/538.f3e45ed7.js.LICENSE.txt
\git restore --source Parent/"$BranchParent" assets/js/5486.22089da0.js.LICENSE.txt
\git restore --source Parent/"$BranchParent" assets/js/be0067a2.2e0f395f.js.LICENSE.txt

cd "$Current"/../../../Tauri/Dependency/CreateTauriApp || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

# shellcheck disable=SC2154
\git restore --source Parent/"$BranchParent" LICENSE_APACHE-2.0
\git restore --source Parent/"$BranchParent" node/LICENSE_APACHE-2.0
\git restore --source Parent/"$BranchParent" node/LICENSE_MIT

cd "$Current"/../../../Tauri/Dependency/DNSAutomation || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

# shellcheck disable=SC2154
\git restore --source Parent/"$BranchParent" LICENSE_APACHE-2.0
\git restore --source Parent/"$BranchParent" LICENSE_MIT

cd "$Current"/../../../Tauri/Dependency/FixPathENVRS || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

# shellcheck disable=SC2154
\git restore --source Parent/"$BranchParent" LICENSE_APACHE-2.0
\git restore --source Parent/"$BranchParent" LICENSE_MIT

cd "$Current"/../../../Tauri/Dependency/MeiliSearchDocsearch || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

# shellcheck disable=SC2154
\git restore --source Parent/"$BranchParent" LICENSE_APACHE-2.0
\git restore --source Parent/"$BranchParent" LICENSE_MIT

cd "$Current"/../../../Tauri/Dependency/MSEdgeDriverManifestCache || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

# shellcheck disable=SC2154
\git restore --source Parent/"$BranchParent" LICENSE_APACHE-2.0
\git restore --source Parent/"$BranchParent" LICENSE_MIT

cd "$Current"/../../../Tauri/Dependency/NSISTauriUtils || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

# shellcheck disable=SC2154
\git restore --source Parent/"$BranchParent" LICENSE_APACHE-2.0
\git restore --source Parent/"$BranchParent" LICENSE_MIT

cd "$Current"/../../../Tauri/Dependency/PluginsWorkspace || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

# shellcheck disable=SC2154
\git restore --source Parent/"$BranchParent" LICENSE_APACHE-2.0
\git restore --source Parent/"$BranchParent" LICENSE_MIT
\git restore --source Parent/"$BranchParent" plugins/autostart/LICENSE_APACHE-2.0
\git restore --source Parent/"$BranchParent" plugins/autostart/LICENSE_MIT
\git restore --source Parent/"$BranchParent" plugins/barcode-scanner/LICENSE_APACHE-2.0
\git restore --source Parent/"$BranchParent" plugins/barcode-scanner/LICENSE_MIT
\git restore --source Parent/"$BranchParent" plugins/biometric/LICENSE_APACHE-2.0
\git restore --source Parent/"$BranchParent" plugins/biometric/LICENSE_MIT
\git restore --source Parent/"$BranchParent" plugins/cli/LICENSE_APACHE-2.0
\git restore --source Parent/"$BranchParent" plugins/cli/LICENSE_MIT
\git restore --source Parent/"$BranchParent" plugins/clipboard-manager/LICENSE_APACHE-2.0
\git restore --source Parent/"$BranchParent" plugins/clipboard-manager/LICENSE_MIT
\git restore --source Parent/"$BranchParent" plugins/deep-link/LICENSE_APACHE-2.0
\git restore --source Parent/"$BranchParent" plugins/deep-link/LICENSE_MIT
\git restore --source Parent/"$BranchParent" plugins/dialog/LICENSE_APACHE-2.0
\git restore --source Parent/"$BranchParent" plugins/dialog/LICENSE_MIT
\git restore --source Parent/"$BranchParent" plugins/fs/LICENSE_APACHE-2.0
\git restore --source Parent/"$BranchParent" plugins/fs/LICENSE_MIT
\git restore --source Parent/"$BranchParent" plugins/geolocation/LICENSE_APACHE-2.0
\git restore --source Parent/"$BranchParent" plugins/geolocation/LICENSE_MIT
\git restore --source Parent/"$BranchParent" plugins/global-shortcut/LICENSE_APACHE-2.0
\git restore --source Parent/"$BranchParent" plugins/global-shortcut/LICENSE_MIT
\git restore --source Parent/"$BranchParent" plugins/haptics/LICENSE_APACHE-2.0
\git restore --source Parent/"$BranchParent" plugins/haptics/LICENSE_MIT
\git restore --source Parent/"$BranchParent" plugins/http/LICENSE_APACHE-2.0
\git restore --source Parent/"$BranchParent" plugins/http/LICENSE_MIT
\git restore --source Parent/"$BranchParent" plugins/localhost/LICENSE_APACHE-2.0
\git restore --source Parent/"$BranchParent" plugins/localhost/LICENSE_MIT
\git restore --source Parent/"$BranchParent" plugins/log/LICENSE_APACHE-2.0
\git restore --source Parent/"$BranchParent" plugins/log/LICENSE_MIT
\git restore --source Parent/"$BranchParent" plugins/nfc/LICENSE_APACHE-2.0
\git restore --source Parent/"$BranchParent" plugins/nfc/LICENSE_MIT
\git restore --source Parent/"$BranchParent" plugins/notification/LICENSE_APACHE-2.0
\git restore --source Parent/"$BranchParent" plugins/notification/LICENSE_MIT
\git restore --source Parent/"$BranchParent" plugins/os/LICENSE_APACHE-2.0
\git restore --source Parent/"$BranchParent" plugins/os/LICENSE_MIT
\git restore --source Parent/"$BranchParent" plugins/persisted-scope/LICENSE_APACHE-2.0
\git restore --source Parent/"$BranchParent" plugins/persisted-scope/LICENSE_MIT
\git restore --source Parent/"$BranchParent" plugins/positioner/LICENSE_APACHE-2.0
\git restore --source Parent/"$BranchParent" plugins/positioner/LICENSE_MIT
\git restore --source Parent/"$BranchParent" plugins/process/LICENSE_APACHE-2.0
\git restore --source Parent/"$BranchParent" plugins/process/LICENSE_MIT
\git restore --source Parent/"$BranchParent" plugins/shell/LICENSE_APACHE-2.0
\git restore --source Parent/"$BranchParent" plugins/shell/LICENSE_MIT
\git restore --source Parent/"$BranchParent" plugins/single-instance/LICENSE_APACHE-2.0
\git restore --source Parent/"$BranchParent" plugins/single-instance/LICENSE_MIT
\git restore --source Parent/"$BranchParent" plugins/sql/LICENSE_APACHE-2.0
\git restore --source Parent/"$BranchParent" plugins/sql/LICENSE_MIT
\git restore --source Parent/"$BranchParent" plugins/store/LICENSE_APACHE-2.0
\git restore --source Parent/"$BranchParent" plugins/store/LICENSE_MIT
\git restore --source Parent/"$BranchParent" plugins/stronghold/LICENSE_APACHE-2.0
\git restore --source Parent/"$BranchParent" plugins/stronghold/LICENSE_MIT
\git restore --source Parent/"$BranchParent" plugins/updater/LICENSE_APACHE-2.0
\git restore --source Parent/"$BranchParent" plugins/updater/LICENSE_MIT
\git restore --source Parent/"$BranchParent" plugins/upload/LICENSE_APACHE-2.0
\git restore --source Parent/"$BranchParent" plugins/upload/LICENSE_MIT
\git restore --source Parent/"$BranchParent" plugins/websocket/LICENSE_APACHE-2.0
\git restore --source Parent/"$BranchParent" plugins/websocket/LICENSE_MIT
\git restore --source Parent/"$BranchParent" plugins/window-state/LICENSE_APACHE-2.0
\git restore --source Parent/"$BranchParent" plugins/window-state/LICENSE_MIT
\git restore --source Parent/"$BranchParent" shared/template/LICENSE_APACHE-2.0
\git restore --source Parent/"$BranchParent" shared/template/LICENSE_MIT

cd "$Current"/../../../Tauri/Dependency/TauriBindgen || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

# shellcheck disable=SC2154
\git restore --source Parent/"$BranchParent" LICENSE_APACHE-2.0
\git restore --source Parent/"$BranchParent" LICENSE_MIT

cd "$Current"/../../../Tauri/Dependency/TauriCon || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

# shellcheck disable=SC2154
\git restore --source Parent/"$BranchParent" LICENSE_APACHE-2.0
\git restore --source Parent/"$BranchParent" LICENSE_MIT

cd "$Current"/../../../Tauri/Dependency/Tauri || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

# shellcheck disable=SC2154
\git restore --source Parent/"$BranchParent" crates/tauri-build/LICENSE_APACHE-2.0
\git restore --source Parent/"$BranchParent" crates/tauri-build/LICENSE_MIT
\git restore --source Parent/"$BranchParent" crates/tauri-bundler/License_MIT.md
\git restore --source Parent/"$BranchParent" crates/tauri-cli/LICENSE_APACHE-2.0
\git restore --source Parent/"$BranchParent" crates/tauri-cli/LICENSE_MIT
\git restore --source Parent/"$BranchParent" crates/tauri-codegen/LICENSE_APACHE-2.0
\git restore --source Parent/"$BranchParent" crates/tauri-codegen/LICENSE_MIT
\git restore --source Parent/"$BranchParent" crates/tauri-driver/LICENSE_APACHE-2.0
\git restore --source Parent/"$BranchParent" crates/tauri-driver/LICENSE_MIT
\git restore --source Parent/"$BranchParent" crates/tauri-macros/LICENSE_APACHE-2.0
\git restore --source Parent/"$BranchParent" crates/tauri-macros/LICENSE_MIT
\git restore --source Parent/"$BranchParent" crates/tauri-runtime-wry/LICENSE_APACHE-2.0
\git restore --source Parent/"$BranchParent" crates/tauri-runtime-wry/LICENSE_MIT
\git restore --source Parent/"$BranchParent" crates/tauri-runtime/LICENSE_APACHE-2.0
\git restore --source Parent/"$BranchParent" crates/tauri-runtime/LICENSE_MIT
\git restore --source Parent/"$BranchParent" crates/tauri-utils/LICENSE_APACHE-2.0
\git restore --source Parent/"$BranchParent" crates/tauri-utils/LICENSE_MIT
\git restore --source Parent/"$BranchParent" crates/tauri/LICENSE_APACHE-2.0
\git restore --source Parent/"$BranchParent" crates/tauri/LICENSE_MIT
\git restore --source Parent/"$BranchParent" packages/api/LICENSE_APACHE-2.0
\git restore --source Parent/"$BranchParent" packages/api/LICENSE_MIT
\git restore --source Parent/"$BranchParent" packages/cli/LICENSE_APACHE-2.0
\git restore --source Parent/"$BranchParent" packages/cli/LICENSE_MIT

cd "$Current"/../../../Tauri/Dependency/TauriDiscordBot || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

# shellcheck disable=SC2154
\git restore --source Parent/"$BranchParent" LICENSE_MIT

cd "$Current"/../../../Tauri/Dependency/TauriEGUI || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

# shellcheck disable=SC2154
\git restore --source Parent/"$BranchParent" LICENSE_APACHE-2.0
\git restore --source Parent/"$BranchParent" LICENSE_MIT

cd "$Current"/../../../Tauri/Dependency/TauriGitHubBot || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

# shellcheck disable=SC2154
\git restore --source Parent/"$BranchParent" LICENSE_APACHE-2.0
\git restore --source Parent/"$BranchParent" LICENSE_MIT

cd "$Current"/../../../Tauri/Dependency/TauriInliner || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

# shellcheck disable=SC2154
\git restore --source Parent/"$BranchParent" MIT-LICENSE.TXT

cd "$Current"/../../../Tauri/Dependency/TauriInvokeHTTP || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

# shellcheck disable=SC2154
\git restore --source Parent/"$BranchParent" LICENSE_APACHE-2.0
\git restore --source Parent/"$BranchParent" LICENSE_MIT

cd "$Current"/../../../Tauri/Dependency/TauriLand || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

# shellcheck disable=SC2154
\git restore --source Parent/"$BranchParent" LICENSE_APACHE-2.0
\git restore --source Parent/"$BranchParent" LICENSE_MIT

cd "$Current"/../../../Tauri/Dependency/TauriPluginApp || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

# shellcheck disable=SC2154
\git restore --source Parent/"$BranchParent" LICENSE_APACHE-2.0
\git restore --source Parent/"$BranchParent" LICENSE_MIT

cd "$Current"/../../../Tauri/Dependency/TauriPluginAuthenticator || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

# shellcheck disable=SC2154
\git restore --source Parent/"$BranchParent" LICENSE_APACHE-2.0
\git restore --source Parent/"$BranchParent" LICENSE_MIT

cd "$Current"/../../../Tauri/Dependency/TauriPluginCLI || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

# shellcheck disable=SC2154
\git restore --source Parent/"$BranchParent" LICENSE_APACHE-2.0
\git restore --source Parent/"$BranchParent" LICENSE_MIT

cd "$Current"/../../../Tauri/Dependency/TauriPluginAutostart || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

# shellcheck disable=SC2154
\git restore --source Parent/"$BranchParent" LICENSE_APACHE-2.0
\git restore --source Parent/"$BranchParent" LICENSE_MIT

cd "$Current"/../../../Tauri/Dependency/TauriPluginClipboardManager || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

# shellcheck disable=SC2154
\git restore --source Parent/"$BranchParent" LICENSE_APACHE-2.0
\git restore --source Parent/"$BranchParent" LICENSE_MIT

cd "$Current"/../../../Tauri/Dependency/TauriPluginDialog || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

# shellcheck disable=SC2154
\git restore --source Parent/"$BranchParent" LICENSE_APACHE-2.0
\git restore --source Parent/"$BranchParent" LICENSE_MIT

cd "$Current"/../../../Tauri/Dependency/TauriPluginFS || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

# shellcheck disable=SC2154
\git restore --source Parent/"$BranchParent" LICENSE_APACHE-2.0
\git restore --source Parent/"$BranchParent" LICENSE_MIT

cd "$Current"/../../../Tauri/Dependency/TauriPluginFSWatch || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

# shellcheck disable=SC2154
\git restore --source Parent/"$BranchParent" LICENSE_APACHE-2.0
\git restore --source Parent/"$BranchParent" LICENSE_MIT

cd "$Current"/../../../Tauri/Dependency/TauriPluginFSExtra || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

# shellcheck disable=SC2154
\git restore --source Parent/"$BranchParent" LICENSE_APACHE-2.0
\git restore --source Parent/"$BranchParent" LICENSE_MIT

cd "$Current"/../../../Tauri/Dependency/TauriPluginGlobalShortCut || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

# shellcheck disable=SC2154
\git restore --source Parent/"$BranchParent" LICENSE_APACHE-2.0
\git restore --source Parent/"$BranchParent" LICENSE_MIT

cd "$Current"/../../../Tauri/Dependency/TauriPluginHTTP || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

# shellcheck disable=SC2154
\git restore --source Parent/"$BranchParent" LICENSE_APACHE-2.0
\git restore --source Parent/"$BranchParent" LICENSE_MIT

cd "$Current"/../../../Tauri/Dependency/TauriPluginLocalhost || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

# shellcheck disable=SC2154
\git restore --source Parent/"$BranchParent" LICENSE_APACHE-2.0
\git restore --source Parent/"$BranchParent" LICENSE_MIT

cd "$Current"/../../../Tauri/Dependency/TauriPluginNotification || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

# shellcheck disable=SC2154
\git restore --source Parent/"$BranchParent" LICENSE_APACHE-2.0
\git restore --source Parent/"$BranchParent" LICENSE_MIT

cd "$Current"/../../../Tauri/Dependency/TauriPluginLog || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

# shellcheck disable=SC2154
\git restore --source Parent/"$BranchParent" LICENSE_APACHE-2.0
\git restore --source Parent/"$BranchParent" LICENSE_MIT

cd "$Current"/../../../Tauri/Dependency/TauriPluginPersistedScope || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

# shellcheck disable=SC2154
\git restore --source Parent/"$BranchParent" LICENSE_APACHE-2.0
\git restore --source Parent/"$BranchParent" LICENSE_MIT

cd "$Current"/../../../Tauri/Dependency/TauriPluginOS || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

# shellcheck disable=SC2154
\git restore --source Parent/"$BranchParent" LICENSE_APACHE-2.0
\git restore --source Parent/"$BranchParent" LICENSE_MIT

cd "$Current"/../../../Tauri/Dependency/TauriPluginPositioner || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

# shellcheck disable=SC2154
\git restore --source Parent/"$BranchParent" LICENSE_APACHE-2.0
\git restore --source Parent/"$BranchParent" LICENSE_MIT

cd "$Current"/../../../Tauri/Dependency/TauriPluginProcess || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

# shellcheck disable=SC2154
\git restore --source Parent/"$BranchParent" LICENSE_APACHE-2.0
\git restore --source Parent/"$BranchParent" LICENSE_MIT

cd "$Current"/../../../Tauri/Dependency/TauriPluginShell || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

# shellcheck disable=SC2154
\git restore --source Parent/"$BranchParent" LICENSE_APACHE-2.0
\git restore --source Parent/"$BranchParent" LICENSE_MIT

cd "$Current"/../../../Tauri/Dependency/TauriPluginSingleInstance || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

# shellcheck disable=SC2154
\git restore --source Parent/"$BranchParent" LICENSE_APACHE-2.0
\git restore --source Parent/"$BranchParent" LICENSE_MIT

cd "$Current"/../../../Tauri/Dependency/TauriPluginSQL || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

# shellcheck disable=SC2154
\git restore --source Parent/"$BranchParent" LICENSE_APACHE-2.0
\git restore --source Parent/"$BranchParent" LICENSE_MIT

cd "$Current"/../../../Tauri/Dependency/TauriPluginStrongHold || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

# shellcheck disable=SC2154
\git restore --source Parent/"$BranchParent" LICENSE_APACHE-2.0
\git restore --source Parent/"$BranchParent" LICENSE_MIT

cd "$Current"/../../../Tauri/Dependency/TauriPluginUpdater || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

# shellcheck disable=SC2154
\git restore --source Parent/"$BranchParent" LICENSE_APACHE-2.0
\git restore --source Parent/"$BranchParent" LICENSE_MIT

cd "$Current"/../../../Tauri/Dependency/TauriPluginStore || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

# shellcheck disable=SC2154
\git restore --source Parent/"$BranchParent" LICENSE_APACHE-2.0
\git restore --source Parent/"$BranchParent" LICENSE_MIT

cd "$Current"/../../../Tauri/Dependency/TauriPluginWebSocket || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

# shellcheck disable=SC2154
\git restore --source Parent/"$BranchParent" LICENSE_APACHE-2.0
\git restore --source Parent/"$BranchParent" LICENSE_MIT

cd "$Current"/../../../Tauri/Dependency/TauriPluginUpload || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

# shellcheck disable=SC2154
\git restore --source Parent/"$BranchParent" LICENSE_APACHE-2.0
\git restore --source Parent/"$BranchParent" LICENSE_MIT

cd "$Current"/../../../Tauri/Dependency/TauriPluginWindow || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

# shellcheck disable=SC2154
\git restore --source Parent/"$BranchParent" LICENSE_APACHE-2.0
\git restore --source Parent/"$BranchParent" LICENSE_MIT

cd "$Current"/../../../Tauri/Dependency/TauriPluginWindowState || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

# shellcheck disable=SC2154
\git restore --source Parent/"$BranchParent" LICENSE_APACHE-2.0
\git restore --source Parent/"$BranchParent" LICENSE_MIT

cd "$Current"/../../../Tauri/Dependency/WinRTNotification || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

# shellcheck disable=SC2154
\git restore --source Parent/"$BranchParent" LICENSE_APACHE-2.0
\git restore --source Parent/"$BranchParent" LICENSE_MIT
