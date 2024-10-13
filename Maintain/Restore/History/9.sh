#!/bin/bash

\pwd

Current=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && \pwd)

cd "$Current"/../../../Biome/Dependency/BiomeLand || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

git fetch --all

# shellcheck disable=SC2154
\git restore --source Parent/"$BranchParent" LICENSE-APACHE
\git restore --source Parent/"$BranchParent" LICENSE-MIT

cd "$Current"/../../../Biome/Dependency/BiomeIntelliJ || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

git fetch --all

\git restore --source Parent/"$BranchParent" LICENSE-APACHE
\git restore --source Parent/"$BranchParent" LICENSE-MIT

cd "$Current"/../../../Biome/Dependency/SetupBiome || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

git fetch --all

\git restore --source Parent/"$BranchParent" LICENSE.md
\git restore --source Parent/"$BranchParent" bun.lockb

cd "$Current"/../../../Biome/Dependency/Biome || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

git fetch --all

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

git fetch --all

\git restore --source Parent/"$BranchParent" THIRD_PARTY_LICENSES

cd "$Current"/../../../Land/Dependency/AzureStreamAnalyticsInLand || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

git fetch --all

\git restore --source Parent/"$BranchParent" LICENSE-CODE

cd "$Current"/../../../Land/Dependency/DevSkim || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

git fetch --all

\git restore --source Parent/"$BranchParent" DevSkim-DotNet/Content/LICENSE.txt
\git restore --source Parent/"$BranchParent" DevSkim-DotNet/Microsoft.DevSkim.VisualStudio/Content/License.txt
\git restore --source Parent/"$BranchParent" DevSkim-VSCode-Plugin/License.txt
\git restore --source Parent/"$BranchParent" LICENSE.txt

cd "$Current"/../../../Land/Dependency/LandAsa || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

git fetch --all

\git restore --source Parent/"$BranchParent" LICENSE-CODE

cd "$Current"/../../../Land/Dependency/LandAzureAppService || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

git fetch --all

\git restore --source Parent/"$BranchParent" LICENSE.md

cd "$Current"/../../../Land/Dependency/Editor || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

git fetch --all

\git restore --source Parent/"$BranchParent" LICENSE.txt
\git restore --source Parent/"$BranchParent" src/vs/base/browser/dompurify/dompurify.license.txt
\git restore --source Parent/"$BranchParent" src/vs/base/common/marked/marked.license.txt
\git restore --source Parent/"$BranchParent" extensions/latex/cpp-bailout-license.txt
\git restore --source Parent/"$BranchParent" extensions/latex/markdown-latex-combined-license.txt
\git restore --source Parent/"$BranchParent" extensions/vscode-colorize-tests/producticons/mit_license.txt

cd "$Current"/../../../Land/Dependency/LandAzureContainerapps || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

git fetch --all

\git restore --source Parent/"$BranchParent" LICENSE.md

cd "$Current"/../../../Land/Dependency/LandAzureStorage || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

git fetch --all

\git restore --source Parent/"$BranchParent" LICENSE.md

cd "$Current"/../../../Land/Dependency/LandAzureStaticwebapps || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

git fetch --all

\git restore --source Parent/"$BranchParent" LICENSE.md

cd "$Current"/../../../Land/Dependency/LandAzureVirtualMachines || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

git fetch --all

\git restore --source Parent/"$BranchParent" LICENSE.md

cd "$Current"/../../../Land/Dependency/LandCopilotRelease || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

git fetch --all

\git restore --source Parent/"$BranchParent" LICENSE-CODE

cd "$Current"/../../../Land/Dependency/LandCSSLanguageService || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

git fetch --all

\git restore --source Parent/"$BranchParent" src/beautify/beautify-license

cd "$Current"/../../../Land/Dependency/LandCPPTools || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

git fetch --all

\git restore --source Parent/"$BranchParent" ExtensionPack/LICENSE.txt
\git restore --source Parent/"$BranchParent" LICENSE.md
\git restore --source Parent/"$BranchParent" RuntimeLicenses/cpptools-LICENSE.txt
\git restore --source Parent/"$BranchParent" RuntimeLicenses/cpptools-srv-LICENSE.txt
\git restore --source Parent/"$BranchParent" RuntimeLicenses/vsdbg-LICENSE.txt
\git restore --source Parent/"$BranchParent" Themes/LICENSE.txt

cd "$Current"/../../../Land/Dependency/LandCustomData || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

git fetch --all

\git restore --source Parent/"$BranchParent" web-data/LICENSE.md

cd "$Current"/../../../Land/Dependency/LandDocker || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

git fetch --all

\git restore --source Parent/"$BranchParent" LICENSE.md

cd "$Current"/../../../Land/Dependency/LandDocs || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

git fetch --all

\git restore --source Parent/"$BranchParent" LICENSE.md

cd "$Current"/../../../Land/Dependency/LandHTMLLanguageService || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

git fetch --all

\git restore --source Parent/"$BranchParent" src/beautify/beautify-license

cd "$Current"/../../../Land/Dependency/LandIcons || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

git fetch --all

\git restore --source Parent/"$BranchParent" LICENSE-CODE

cd "$Current"/../../../Land/Dependency/LandJSDebug || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

git fetch --all

\git restore --source Parent/"$BranchParent" testWorkspace/nodeModuleBreakpoint/node_modules/.DS_Store
\git restore --source Parent/"$BranchParent" testWorkspace/nodeModuleBreakpoint/node_modules/@c4312/absolute-sourceroot/out/index.js
\git restore --source Parent/"$BranchParent" testWorkspace/nodeModuleBreakpoint/node_modules/@c4312/absolute-sourceroot/out/index.js.map
\git restore --source Parent/"$BranchParent" testWorkspace/nodeModuleBreakpoint/node_modules/@c4312/absolute-sourceroot/package.json
\git restore --source Parent/"$BranchParent" testWorkspace/nodeModuleBreakpoint/node_modules/@c4312/absolute-sourceroot/src/index.ts
\git restore --source Parent/"$BranchParent" testWorkspace/nodeModuleBreakpoint/node_modules/@c4312/foo/out/index.js
\git restore --source Parent/"$BranchParent" testWorkspace/nodeModuleBreakpoint/node_modules/@c4312/foo/out/index.js.map
\git restore --source Parent/"$BranchParent" testWorkspace/nodeModuleBreakpoint/node_modules/@c4312/foo/package.json
\git restore --source Parent/"$BranchParent" testWorkspace/nodeModuleBreakpoint/node_modules/@c4312/foo/src/index.ts
\git restore --source Parent/"$BranchParent" testWorkspace/nodePathProvider/node-module/node_modules/.bin/node
\git restore --source Parent/"$BranchParent" testWorkspace/nodePathProvider/node-module/node_modules/.bin/node.exe
\git restore --source Parent/"$BranchParent" testWorkspace/node_modules/browser-pack/_prelude.js

cd "$Current"/../../../Land/Dependency/LandJupyter || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

git fetch --all

\git restore --source Parent/"$BranchParent" api/LICENSE.md

cd "$Current"/../../../Land/Dependency/LandLanguageServerNode || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

git fetch --all

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

git fetch --all

\git restore --source Parent/"$BranchParent" LICENSE.txt

cd "$Current"/../../../Land/Dependency/LandPowerquerySdk || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

git fetch --all

\git restore --source Parent/"$BranchParent" resources/license-header.js

cd "$Current"/../../../Land/Dependency/LandPython || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

git fetch --all

\git restore --source Parent/"$BranchParent" build/license-header.txt
\git restore --source Parent/"$BranchParent" pythonExtensionApi/LICENSE.md

cd "$Current"/../../../Land/Dependency/LandRemoteRelease || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

git fetch --all

\git restore --source Parent/"$BranchParent" LICENSE-extensions
\git restore --source Parent/"$BranchParent" LICENSE-repository

cd "$Current"/../../../Land/Dependency/LandRemoteRepositoriesGitHub || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

git fetch --all

\git restore --source Parent/"$BranchParent" LICENSE-CODE

cd "$Current"/../../../Land/Dependency/LandRussh || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

git fetch --all

\git restore --source Parent/"$BranchParent" LICENSE-2.0.txt

cd "$Current"/../../../Land/Dependency/LandToolsForAI || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

git fetch --all

\git restore --source Parent/"$BranchParent" LICENSE-CODE
\git restore --source Parent/"$BranchParent" archive/LICENSE-CODE

cd "$Current"/../../../Land/Dependency/LandWiki || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

git fetch --all

\git restore --source Parent/"$BranchParent" Contributor-License-Agreement.md

cd "$Current"/../../../OXC/Dependency/UniCodeIDStart || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

git fetch --all

\git restore --source Parent/"$BranchParent" LICENSE-UNICODE

cd "$Current"/../../../OXC/Dependency/OXC || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

git fetch --all

\git restore --source Parent/"$BranchParent" THIRD-PARTY-LICENSE

cd "$Current"/../../../Rolldown/Dependency/Rolldown || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

git fetch --all

\git restore --source Parent/"$BranchParent" THIRD-PARTY-LICENSE

cd "$Current"/../../../Rolldown/Dependency/RolldownPluginNodePolyfills || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

git fetch --all

\git restore --source Parent/"$BranchParent" polyfills/LICENSE-browserify-fs.txt
\git restore --source Parent/"$BranchParent" polyfills/LICENSE-buffer-es6.txt
\git restore --source Parent/"$BranchParent" polyfills/LICENSE-crypto-browserify.txt
\git restore --source Parent/"$BranchParent" polyfills/LICENSE-process-es6.txt

cd "$Current"/../../../SWC/Dependency/SWCProject.github.io || exit

# shellcheck disable=SC1091
\source "$Current"/../../Fn/Cache.sh

Fn

git fetch --all

\git restore --source Parent/"$BranchParent" assets/js/1df93b7f.2cdd3048.js.LICENSE.txt
\git restore --source Parent/"$BranchParent" assets/js/538.f3e45ed7.js.LICENSE.txt
\git restore --source Parent/"$BranchParent" assets/js/5486.22089da0.js.LICENSE.txt
\git restore --source Parent/"$BranchParent" assets/js/be0067a2.2e0f395f.js.LICENSE.txt
\git restore --source Parent/"$BranchParent" assets/js/main.d97baaa2.js.LICENSE.txt
