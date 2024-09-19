/d/Developer/Application/CodeEditorLand/CloneDependency

diff --git a/.gitignore b/.gitignore
index 1141fb9..213002f 100644
--- a/.gitignore
+++ b/.gitignore
@@ -1,20 +1,54 @@
 .pnp
 .pnp.js
-
 coverage
-
 .next/
 out/
-
-
 npm-debug.log*
 yarn-debug.log*
 yarn-error.log*
 .pnpm-debug.log*
-
 .dev.vars
+.pnpm-store
 
+/Target/*
 
-.pnpm-store
+!/Target/debug
+!/Target/release
+!/Target/x86_64-pc-windows-msvc
+
+/Target/debug/*
+/Target/release/*
+/Target/x86_64-pc-windows-msvc/*
+
+!/Target/debug/bundle
+!/Target/debug/bundle/nsis
+!/Target/debug/bundle/msi
+!/Target/debug/bundle/appimage
+
+!/Target/debug/bundle/nsis/*.exe
+!/Target/debug/bundle/msi/*.msi
+!/Target/debug/bundle/appimage/*.AppImage
+
+!/Target/debug/*.exe
+
+!/Target/release/bundle
+!/Target/release/bundle/nsis
+!/Target/release/bundle/msi
+!/Target/release/bundle/appimage
+
+!/Target/release/bundle/nsis/*.exe
+!/Target/release/bundle/msi/*.msi
+!/Target/release/bundle/appimage/*.AppImage
+
+!/Target/release/*.exe
+
+!/Target/x86_64-pc-windows-msvc/bundle
+!/Target/x86_64-pc-windows-msvc/bundle/nsis
+!/Target/x86_64-pc-windows-msvc/bundle/msi
+!/Target/x86_64-pc-windows-msvc/bundle/appimage
+
+!/Target/x86_64-pc-windows-msvc/bundle/nsis/*.exe
+!/Target/x86_64-pc-windows-msvc/bundle/msi/*.msi
+!/Target/x86_64-pc-windows-msvc/bundle/appimage/*.AppImage
 
-/target
+!/Target/x86_64-pc-windows-msvc/*.exe
diff --git a/Maintain/Init/Dependency.sh b/Maintain/Init/Dependency.sh
new file mode 100644
index 0000000..dbb7640
--- /dev/null
+++ b/Maintain/Init/Dependency.sh
@@ -0,0 +1,29 @@
+#!/bin/bash
+
+Current=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && \pwd)
+
+# shellcheck disable=SC1091
+\source "$Current"/../Fn/Argument.sh
+
+Fn "$@"
+
+for Organization in "${Organization[@]}"; do
+	(
+		for SubDependency in "${SubDependency[@]}"; do
+			( # shellcheck disable=SC2154
+				\cd "$Folder"/"${SubDependency/"${Organization}/"/}" || \exit
+
+				git init
+				git reset --hard
+				git clean -dfx
+				git submodule deinit --all -f
+
+				\cd - || \exit
+			) &
+		done
+
+		wait
+	) &
+done
+
+wait
diff --git a/Maintain/Weekly.sh b/Maintain/Weekly.sh
index 847dbb7..7f72c3d 100644
--- a/Maintain/Weekly.sh
+++ b/Maintain/Weekly.sh
@@ -25,120 +25,125 @@ for Dependency in "${Dependency[@]}"; do
 		# 	"$Exclude" \
 		# 	"$Dependency"
 
-		"$Current"/Module/Dependency.sh \
+		"$Current"/Init/Dependency.sh \
 			"$Organization" \
 			"$SubDependency" \
 			"$Dependency"
 
-		"$Current"/Configure/Dependency.sh \
-			"$Organization" \
-			"$SubDependency" \
-			"$Dependency"
+		# "$Current"/Module/Dependency.sh \
+		# 	"$Organization" \
+		# 	"$SubDependency" \
+		# 	"$Dependency"
 
-		# "$Current"/Setting/Dependency.sh \
+		# "$Current"/Configure/Dependency.sh \
 		# 	"$Organization" \
 		# 	"$SubDependency" \
 		# 	"$Dependency"
 
-		# "$Current"/Rename/Dependency.sh \
+		# "$Current"/Setting/Dependency.sh \
 		# 	"$Organization" \
 		# 	"$SubDependency" \
 		# 	"$Dependency"
 
-		"$Current"/Save/Dependency.sh \
-			"$Organization" \
-			"$SubDependency" \
-			"$Dependency"
+		# # "$Current"/Rename/Dependency.sh \
+		# # 	"$Organization" \
+		# # 	"$SubDependency" \
+		# # 	"$Dependency"
 
-		"$Current"/Sync/Dependency.sh \
-			"$Organization" \
-			"$SubDependency" \
-			"$Dependency"
+		# "$Current"/Save/Dependency.sh \
+		# 	"$Organization" \
+		# 	"$SubDependency" \
+		# 	"$Dependency"
 
-		"$Current"/Save/Dependency.sh \
-			"$Organization" \
-			"$SubDependency" \
-			"$Dependency"
+		# "$Current"/Sync/Dependency.sh \
+		# 	"$Organization" \
+		# 	"$SubDependency" \
+		# 	"$Dependency"
 
-		"$Current"/Switch/Branch.sh \
-			"$Organization" \
-			"$SubDependency" \
-			"$Dependency" \
-			"Previous"
+		# "$Current"/Save/Dependency.sh \
+		# 	"$Organization" \
+		# 	"$SubDependency" \
+		# 	"$Dependency"
 
-		"$Current"/Reset/Dependency.sh \
-			"$Organization" \
-			"$SubDependency" \
-			"$Dependency" \
-			"Previous"
+		# "$Current"/Switch/Branch.sh \
+		# 	"$Organization" \
+		# 	"$SubDependency" \
+		# 	"$Dependency" \
+		# 	"Previous"
 
-		"$Current"/Switch/Branch.sh \
-			"$Organization" \
-			"$SubDependency" \
-			"$Dependency" \
-			"Current"
+		# "$Current"/Reset/Dependency.sh \
+		# 	"$Organization" \
+		# 	"$SubDependency" \
+		# 	"$Dependency" \
+		# 	"Previous"
 
-		"$Current"/Merge/Dependency.sh \
-			"$Organization" \
-			"$SubDependency" \
-			"$Dependency"
+		# "$Current"/Switch/Branch.sh \
+		# 	"$Organization" \
+		# 	"$SubDependency" \
+		# 	"$Dependency" \
+		# 	"Current"
 
-		# # # "$Current"/Reset/Dependency.sh \
-		# # # 	"$Organization" \
-		# # # 	"$SubDependency" \
-		# # # 	"$Dependency" \
-		# # # 	"Current"
+		# "$Current"/Merge/Dependency.sh \
+		# 	"$Organization" \
+		# 	"$SubDependency" \
+		# 	"$Dependency"
 
-		"$Current"/Save/Dependency.sh \
-			"$Organization" \
-			"$SubDependency" \
-			"$Dependency"
+		# # # # "$Current"/Reset/Dependency.sh \
+		# # # # 	"$Organization" \
+		# # # # 	"$SubDependency" \
+		# # # # 	"$Dependency" \
+		# # # # 	"Current"
 
-		"$Current"/Default/Branch.sh \
-			"$Organization" \
-			"$SubDependency" \
-			"$Dependency" \
-			"Current"
+		# "$Current"/Save/Dependency.sh \
+		# 	"$Organization" \
+		# 	"$SubDependency" \
+		# 	"$Dependency"
 
-		"$Current"/Move/license.sh \
-			"$Organization" \
-			"$SubDependency" \
-			"$Dependency"
+		# "$Current"/Default/Branch.sh \
+		# 	"$Organization" \
+		# 	"$SubDependency" \
+		# 	"$Dependency" \
+		# 	"Current"
 
-		"$Current"/Move/package.json.sh \
-			"$Organization" \
-			"$SubDependency" \
-			"$Dependency"
+		# "$Current"/Move/license.sh \
+		# 	"$Organization" \
+		# 	"$SubDependency" \
+		# 	"$Dependency"
 
-		"$Current"/Move/src.sh \
-			"$Organization" \
-			"$SubDependency" \
-			"$Dependency"
+		# "$Current"/Move/package.json.sh \
+		# 	"$Organization" \
+		# 	"$SubDependency" \
+		# 	"$Dependency"
 
-		"$Current"/Clean/Dependency.sh \
-			"$Organization" \
-			"$SubDependency" \
-			"$Dependency"
+		# "$Current"/Move/src.sh \
+		# 	"$Organization" \
+		# 	"$SubDependency" \
+		# 	"$Dependency"
 
-		"$Current"/Clean/Detail.sh \
-			"$Organization" \
-			"$SubDependency" \
-			"$Dependency"
+		# "$Current"/Clean/Dependency.sh \
+		# 	"$Organization" \
+		# 	"$SubDependency" \
+		# 	"$Dependency"
 
-		"$Current"/Append/Detail.sh \
-			"$Organization" \
-			"$SubDependency" \
-			"$Dependency"
+		# "$Current"/Clean/Detail.sh \
+		# 	"$Organization" \
+		# 	"$SubDependency" \
+		# 	"$Dependency"
 
-		"$Current"/Save/Dependency.sh \
-			"$Organization" \
-			"$SubDependency" \
-			"$Dependency"
+		# "$Current"/Append/Detail.sh \
+		# 	"$Organization" \
+		# 	"$SubDependency" \
+		# 	"$Dependency"
 
-		"$Current"/Sync/Dependency.sh \
-			"$Organization" \
-			"$SubDependency" \
-			"$Dependency"
+		# "$Current"/Save/Dependency.sh \
+		# 	"$Organization" \
+		# 	"$SubDependency" \
+		# 	"$Dependency"
+
+		# "$Current"/Sync/Dependency.sh \
+		# 	"$Organization" \
+		# 	"$SubDependency" \
+		# 	"$Dependency"
 	) &
 done
 

/d/Developer/Application/CodeEditorLand/CloneDependency/Biome


/d/Developer/Application/CodeEditorLand/CloneDependency/Biome/Cargo


/d/Developer/Application/CodeEditorLand/CloneDependency/Biome/Dependency/Biome


/d/Developer/Application/CodeEditorLand/CloneDependency/Biome/Dependency


/d/Developer/Application/CodeEditorLand/CloneDependency/Biome/Dependency/BiomeLand


/d/Developer/Application/CodeEditorLand/CloneDependency/Biome/Dependency/BiomeIntelliJ


/d/Developer/Application/CodeEditorLand/CloneDependency/Biome/Dependency/PreCommit


/d/Developer/Application/CodeEditorLand/CloneDependency/Biome/Dependency/DiscordUtilsBot


/d/Developer/Application/CodeEditorLand/CloneDependency/Biome/Dependency/Resources


/d/Developer/Application/CodeEditorLand/CloneDependency/Biome/NPM


/d/Developer/Application/CodeEditorLand/CloneDependency/Biome/Dependency/SetupBiome


/d/Developer/Application/CodeEditorLand/CloneDependency/Land


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Cargo/Document


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Cargo


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Cargo/Maintain


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Cargo/Runtime


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Cargo/Runtime/zstd


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/ApplicationInsightsLand


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/AzureDatalakeToolsForLand


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/AzureBoardsLand


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/AzureIOTDeveloperKit


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/AzureStreamAnalyticsInLand


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/AzureReposLand


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/Codetour


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/AzurePipelinesLand


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/ComposeLanguageService


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/DevSkim


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/DevSkimLandPlugin


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/DeoptexplorerLand


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/DSToolkitDevContainers


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/Gnls


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandAnacondaExtensionPack


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/Editor


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandAnycode


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandAppcenter


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandAsa


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandAtomKeybindings


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandArduino


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandApimanagement


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandAutopep8


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandAzureAppService


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandAzureAccount


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandAzureArmTools


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandAzureAutomation


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandAzureBlockchainEthereum


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandAzureCli


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandAzureCache


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandAzureFunctions


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandAzureEventGrid


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandAzureCognitiveSearch


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandAzureContainerapps


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandAzureFunctionsRemoteWebExtension


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandAzureHealthcareAPIsTools


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandAzureIOTEdge


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandAzureIOTToolkit


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandAzureIOTTools


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandAzureResourceGroups


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandAzureLogicapps


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandAzurePack


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandAzureServerlessPack


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandAzureSpringCloud


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandAzureStaticwebapps


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandAzureStorage


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandAzureVirtualMachines


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandAzureTools


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandBackSpace


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandBisect


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandBlackFormatter


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandBracketsKeybindings


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandBracketsPack


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandCdpProxy


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandChromeDebug


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandCdp


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandChromeDebugCore


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandCmakeTools


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandCmakeToolsApi


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandCosmosDBGraph


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandCodicons


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandCopilotRelease


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandComment


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandCordova


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandCosmosDB


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandCourseSample


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandCPPToolsApi


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandCPPTools


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandCSS


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandCustomData


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandCSSLanguageService


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandDAPR


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandDataWrangler


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandDevChromeLauncher


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandDebugAdapterNode


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandDeployAzure


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandDevContainers


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandDiagnosticTools


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandDocker


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandDocs


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandDiscussions


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandDockerExtensibility


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandDocsArchive


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandDocsAuthoring


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandDtdl


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandDotNETTools


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandDts


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandDwarfDebugging


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandEdgeDebug2


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandDwarfDebuggingExt


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandEdgeDebug


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandEdgeDevTools


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandEdgeDevToolsNetwork


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandEditorConfig


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandEmbeddedTools


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandEmmetHelper


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandEmmetLegacy


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandExplorerCommand


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandExtensionLand


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandESLint


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandExtensionRecommender


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandExtensionSamples


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandExtensionTelemetry


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandExtensionTestRunner


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandFigmaIcons


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandFigmaToolkit


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandFileDownloaderApi


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandFileDownloader


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandFlake8


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandFilewatcherWindows


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandGather


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandGeneratorCode


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandGeneratorCodeJavascript


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandGitHubIssueNotebooks


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandGitHubTriageActions


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandGitHubIssuesPrs


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandGitHubTriageExtension


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandGo


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandGradle


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandGrammarUpdater


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandGulpElectron


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandHTMLHint


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandHTMLLanguageService


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandHTMLTagWrap


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandHexEditor


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandHydrate


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandIconvLiteUMD


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandIcons


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandIosWebDebug


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandIOTWorkbench


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandIsort


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandJavaDebug


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandJavaDependency


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandJavaInstaller


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandJavaTest


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandJavaPack


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandJSAtomGrammar


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandJSCS


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandJSDebug


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandJSDebugBrowsers


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandJSDebugCompanion


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandJSHint


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandJSProfileVisualizer


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandJSON.tmLanguage


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandJSonLanguageService


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandJupyter


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandJupyterCellTags


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandJupyterHub


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandJupyterIpywidgets


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandJupyterKeymap


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandJupyterPowertoys


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandJupyterSlideshow


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandJupyterLSPMiddleware


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandJvmTools


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandL10n


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandLanguageDetection


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandLinuxBuildAgent


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandLanguageServerNode


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandLivePreview


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandLanguageServerProtocolFoldingprovider


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandLaTeX


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandLoader


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandLocDeprecated


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandLoc


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandLsifExtension


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandLombok


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandMakecode


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandMakefileTools


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandMarkdownItKatex


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandMarkdownNotebook


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandMarkdownLanguageService


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandMarkdownTmGrammar


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandMaven


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandMDTools


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandMezzurite


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandMockDebug


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandMinimist


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandMongoDB


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandMypy


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandMonoDebug


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandNls


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandMssql


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandNlsDev


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandNodeAzurePack


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandNodeDebug


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandNodebook


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandNodeDebug2


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandNodeSQLite3


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandNotebookRenderers


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandNotebookErrorOverlay


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandNotebookRendererStarter


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandNotebookTestData


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandNPMScripts


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandNotepadPlusPlusKeybindings


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandOcticonsFont


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandOnedriveBrowser


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandOniguruma


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandPerf


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandOpenSSLPrebuilt


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandPerfBot


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandPlatformSpecificSample


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandPostgresql


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandPolicyWatcher


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandPowerquery


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandPowerquerySdk


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandProxyAgent


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandPwaAnalyzer


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandPylint


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandPython


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandPullRequestGitHub


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandPythonDebugger


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandPythonDeviceSimulator


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandPythonDsExtensionPack


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandPythonInstaller


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandPythonToolsExtensionTemplate


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandReactNative


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandPythonWebWASM


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandReactSample


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandReferencesView


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandRecipes


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandRemoteTryCPP


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandRemoteRepositoriesGitHub


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandRemoteRelease


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandRemoteTryGo


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandRemoteTryDotNET


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandRemoteTryJava


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandRemoteTryNode


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandRemoteTryPython


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandRemoteTryRust


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandRemoteTryPhp


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandRemoteTrySQLserver


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandRemoteWSLRecommender


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandResharperKeybindings


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandRipGREP


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandRussh


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandSCMBuilders


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandSecretServiceRs


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandSamples


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandSelfhostTestProvider


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandServiceStatus


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandServiceFabricReliableServices


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandSerialMonitor


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandSmokeTestCheck


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandSimpleJupyterNotebook


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandSpellCheck


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandSmokeTestExpress


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandSpringBootDashboard


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandspacesQuickstart


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandSpringInitializr


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandStac


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandSublimeKeybindings


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandTasAngular


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandTasVue


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandTasExpress


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandTeam


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandTelemetryExtractor


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandTensorboard


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandTest


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandTestAdapterConverter


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandTestCli


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandTestCover


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandTestWeb


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandTextBuffer


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandTextMate


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandThemeTester


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandThemeColorConsumer


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandThemes


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandTipsAndTricks


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandTMDL


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandToolsForAI


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandTSLint


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandTSTSLint


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandTSPackageManager


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandTye


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandTypeScriptNext


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandTypeScriptTSLintPlugin


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandURI


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandV8HeapTools


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandVSCE


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandWASM


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandWebPlayground


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandVSKeybindings


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandWebViewUIToolkit


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandWebViewUIToolkitSamples


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandWiki


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandWin32AppContainerTokens


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandWindowsProcessTree


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandWindowsCaCerts


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandWinsta11er


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandWordCount


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandWindowsRegistry


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/MonacoEditor


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LinkCheckerMD


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/LandZeroMQ


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/NodeRequestLight


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/PlaywrightLand


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/PowerPlatformLand


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/PowerPlatformLandLab


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/PSDocsLand


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/PSRuleLand


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/PVSCBot


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/PythonSampleLandDjangoTutorial


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/PythonSampleLandFlaskTutorial


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/PythonSampleLandFastapiTutorial


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/Quantum


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/ScopeStudioLand


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/SarifLandExtension


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/SynapseLand


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/ThemeConverterForVS


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/Dependency/TypeScriptLandExtensions


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/NPM


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/NPM/Ingress


/d/Developer/Application/CodeEditorLand/CloneDependency/Land/NPM/Common


/d/Developer/Application/CodeEditorLand/CloneDependency/OXC


/d/Developer/Application/CodeEditorLand/CloneDependency/OXC/Cargo


/d/Developer/Application/CodeEditorLand/CloneDependency/OXC/Dependency

diff --git a/.gitmodules b/.gitmodules
index 99bd897..ab05569 100644
--- a/.gitmodules
+++ b/.gitmodules
@@ -43,6 +43,3 @@
 [submodule "UniCodeIDStart"]
 	path = UniCodeIDStart
 	url = ssh://git@github.com/CodeEditorLand/UniCodeIDStart.git
-[submodule "OXCResolver"]
-	path = OXCResolver
-	url = ssh://git@github.com/CodeEditorLand/OXCResolver.git

/d/Developer/Application/CodeEditorLand/CloneDependency/OXC/Dependency/AriaQuery


/d/Developer/Application/CodeEditorLand/CloneDependency/OXC/Dependency/BenchJavascriptLinter


/d/Developer/Application/CodeEditorLand/CloneDependency/OXC/Dependency/BenchJavascriptParserWrittenInRust


/d/Developer/Application/CodeEditorLand/CloneDependency/OXC/Dependency/EslintPluginOxlint


/d/Developer/Application/CodeEditorLand/CloneDependency/OXC/Dependency/BenchNodeJSResolver


/d/Developer/Application/CodeEditorLand/CloneDependency/OXC/Dependency/JavascriptParserInRust


/d/Developer/Application/CodeEditorLand/CloneDependency/OXC/Dependency/JsonStripComments


/d/Developer/Application/CodeEditorLand/CloneDependency/OXC/Dependency/BenchMarkFiles


/d/Developer/Application/CodeEditorLand/CloneDependency/OXC/Dependency/MirrorsOxlint


/d/Developer/Application/CodeEditorLand/CloneDependency/OXC/Dependency/OxcAssets


/d/Developer/Application/CodeEditorLand/CloneDependency/OXC/Dependency/OxcIntellijPlugin


/d/Developer/Application/CodeEditorLand/CloneDependency/OXC/Dependency/OXCResolver


/d/Developer/Application/CodeEditorLand/CloneDependency/OXC/Dependency/Oxc


/d/Developer/Application/CodeEditorLand/CloneDependency/OXC/Dependency/OxcFuzzParser


/d/Developer/Application/CodeEditorLand/CloneDependency/OXC/Dependency/UniCodeIdStart


/d/Developer/Application/CodeEditorLand/CloneDependency/OXC/Dependency/UniCodeId


/d/Developer/Application/CodeEditorLand/CloneDependency/OXC/NPM


/d/Developer/Application/CodeEditorLand/CloneDependency/Rolldown


/d/Developer/Application/CodeEditorLand/CloneDependency/Rolldown/Cargo


/d/Developer/Application/CodeEditorLand/CloneDependency/Rolldown/Dependency


/d/Developer/Application/CodeEditorLand/CloneDependency/Rolldown/Dependency/BenchmarkResultsStorage


/d/Developer/Application/CodeEditorLand/CloneDependency/Rolldown/Dependency/Metric


/d/Developer/Application/CodeEditorLand/CloneDependency/Rolldown/Dependency/Benchcases


/d/Developer/Application/CodeEditorLand/CloneDependency/Rolldown/Dependency/Repros


/d/Developer/Application/CodeEditorLand/CloneDependency/Rolldown/Dependency/Rolldown


/d/Developer/Application/CodeEditorLand/CloneDependency/Rolldown/Dependency/RolldownOnDeno


/d/Developer/Application/CodeEditorLand/CloneDependency/Rolldown/Dependency/RolldownStarterStackblitz


/d/Developer/Application/CodeEditorLand/CloneDependency/Rolldown/Dependency/RolldownPluginNodePolyfills


/d/Developer/Application/CodeEditorLand/CloneDependency/Rolldown/Dependency/RolldownViteEcoCi


/d/Developer/Application/CodeEditorLand/CloneDependency/Rolldown/Dependency/StringWizard


/d/Developer/Application/CodeEditorLand/CloneDependency/Rolldown/Dependency/Testcase


/d/Developer/Application/CodeEditorLand/CloneDependency/Rolldown/Dependency/Vite


/d/Developer/Application/CodeEditorLand/CloneDependency/Rolldown/Dependency/VitePluginVue


/d/Developer/Application/CodeEditorLand/CloneDependency/Rolldown/NPM


/d/Developer/Application/CodeEditorLand/CloneDependency/SWC


/d/Developer/Application/CodeEditorLand/CloneDependency/SWC/Dependency


/d/Developer/Application/CodeEditorLand/CloneDependency/SWC/Cargo


/d/Developer/Application/CodeEditorLand/CloneDependency/SWC/Dependency/Bins


/d/Developer/Application/CodeEditorLand/CloneDependency/SWC/Dependency/Book


/d/Developer/Application/CodeEditorLand/CloneDependency/SWC/Dependency/Bot


/d/Developer/Application/CodeEditorLand/CloneDependency/SWC/Dependency/Cli


/d/Developer/Application/CodeEditorLand/CloneDependency/SWC/Dependency/CrawlCoreVersion


/d/Developer/Application/CodeEditorLand/CloneDependency/SWC/Dependency/Ddt


/d/Developer/Application/CodeEditorLand/CloneDependency/SWC/Dependency/DbgSWC


/d/Developer/Application/CodeEditorLand/CloneDependency/SWC/Dependency/Helpers


/d/Developer/Application/CodeEditorLand/CloneDependency/SWC/Dependency/ExtraBindings


/d/Developer/Application/CodeEditorLand/CloneDependency/SWC/Dependency/Jest


/d/Developer/Application/CodeEditorLand/CloneDependency/SWC/Dependency/LandSWCDevtools


/d/Developer/Application/CodeEditorLand/CloneDependency/SWC/Dependency/Logo


/d/Developer/Application/CodeEditorLand/CloneDependency/SWC/Dependency/PluginExamples


/d/Developer/Application/CodeEditorLand/CloneDependency/SWC/Dependency/Pkgs


/d/Developer/Application/CodeEditorLand/CloneDependency/SWC/Dependency/Plugins


/d/Developer/Application/CodeEditorLand/CloneDependency/SWC/Dependency/NodeSWC


/d/Developer/Application/CodeEditorLand/CloneDependency/SWC/Dependency/PluginUtils


/d/Developer/Application/CodeEditorLand/CloneDependency/SWC/Dependency/StringCache


/d/Developer/Application/CodeEditorLand/CloneDependency/SWC/Dependency/Register


/d/Developer/Application/CodeEditorLand/CloneDependency/SWC/Dependency/SWCEcosystemCi


/d/Developer/Application/CodeEditorLand/CloneDependency/SWC/Dependency/RawGreenData


/d/Developer/Application/CodeEditorLand/CloneDependency/SWC/Dependency/RawData


/d/Developer/Application/CodeEditorLand/CloneDependency/SWC/Dependency/SWCDev


/d/Developer/Application/CodeEditorLand/CloneDependency/SWC/Dependency/SWCify


/d/Developer/Application/CodeEditorLand/CloneDependency/SWC/Dependency/SWC


/d/Developer/Application/CodeEditorLand/CloneDependency/SWC/Dependency/Rustdoc


/d/Developer/Application/CodeEditorLand/CloneDependency/SWC/Dependency/SWCNode


/d/Developer/Application/CodeEditorLand/CloneDependency/SWC/Dependency/SWCLoader


/d/Developer/Application/CodeEditorLand/CloneDependency/SWC/Dependency/SWCPlayground


/d/Developer/Application/CodeEditorLand/CloneDependency/SWC/Dependency/SWCProject.github.io


/d/Developer/Application/CodeEditorLand/CloneDependency/SWC/Dependency/TsParserTestRef


/d/Developer/Application/CodeEditorLand/CloneDependency/SWC/Dependency/Vote


/d/Developer/Application/CodeEditorLand/CloneDependency/SWC/Dependency/SWCSponsorImages


/d/Developer/Application/CodeEditorLand/CloneDependency/SWC/Dependency/WebSiteSWC


/d/Developer/Application/CodeEditorLand/CloneDependency/SWC/NPM


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Cargo


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/ActionsNetlify


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/AppRun


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/BenchMarkResults


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/Automation


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/BenchMarkElectron


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/AwesomeTauri


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/BenchMark_electron


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/BinaryReleases


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/BenchMark_results


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/BoardVoter


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/CargoMobile2


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/CreateTauriApp


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/CreatePullRequest


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/Deno


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/DnsAutomation


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/DocusaurusMeilisearchIndexer


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/Egui


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/GhTangleRelease


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/FixPathEnvRs


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/Gipfs


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/GirFiles


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/GlobalHotkey


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/Glutin


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/JavascriptcoreRs


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/GovernanceAndGuidance


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/LinuxdeployPluginGstreamer


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/LibappindicatorRs


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/LinuxdeployPluginGtk


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/Meetings


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/MeilisearchDocsearch


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/MsedgedriverManifestCache


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/Muda


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/NsisTauriUtils


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/Realworld


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/PluginsWorkspace


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/Rfcs


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/Rustdocusaurus


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/RustXcodePlugin


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/RustIcns


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/SmokeTests


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/Soup2Rs


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/Tao


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/Tauri.studio


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/Tauri


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/TauriAction


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/Tauricon


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/TauriBindgen


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/TauriDialogRs


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/TauriDocs


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/TauriDiscordBot


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/TauriForage


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/TauriEgui


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/TauriGithubBot


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/TauriIncludedir


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/TauriHotkeyRs


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/TauriInliner


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/TauriInlinerRs


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/TauriLand


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/TauriInvokeHttp


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/TauriPluginApp


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/TauriPluginAutostart


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/TauriPluginAuthenticator


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/TauriPluginClipboardManager


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/TauriPluginCli


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/TauriPluginDialog


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/TauriPluginFs


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/TauriPluginFsWatch


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/TauriPluginFsExtra


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/TauriPluginGlobalShortcut


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/TauriPluginHttp


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/TauriPluginLocalhost


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/TauriPluginNotification


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/TauriPluginLog


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/TauriPluginOs


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/TauriPluginProcess


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/TauriPluginPositioner


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/TauriPluginPersistedScope


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/TauriPluginSingleInstance


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/TauriPluginShell


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/TauriPluginSql


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/TauriPluginStore


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/TauriPluginStronghold


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/TauriPluginWebsocket


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/TauriPluginUpdater


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/TauriPluginUpload


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/TauriPluginWindowState


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/TauriStudio


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/TauriPluginWindow


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/TauriSearch


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/TauriTheia


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/TauriToml


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/TauriWebpack


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/TypedocPluginMarkdown


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/Typedocusaurus


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/TrayIcon


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/VueCliPluginTauri


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/WebView


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/Webkit2gtkRs


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/WindowShadows


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/Win7Notifications


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/WindowVibrancy


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/Winit


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/Winres


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/WinrtNotification


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/ZsergeWebview


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/WorkflowTestbed


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/NPM


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/Wry


/d/Developer/Application/CodeEditorLand/CloneDependency/Tauri/Dependency/WryMobile


