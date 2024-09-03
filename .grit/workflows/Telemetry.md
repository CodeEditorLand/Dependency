2470 results - 448 files

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\build\.webignore:

```sh
38
39 # This makes sure the model is included in the package
40 !@vscode/vscode-languagedetection/model/**
41 !@vscode/tree-sitter-wasm/wasm/**
42
43: # Ensure only the required telemetry pieces are loaded in web to reduce bundle size
44 @microsoft/1ds-core-js/**
45 @microsoft/1ds-post-js/**
46 @microsoft/applicationinsights-core-js/**
47 @microsoft/applicationinsights-shims/**
48 !@microsoft/1ds-core-js/dist/ms.core.min.js
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\build\buildfile.js:

```sh
  70  exports.workerOutputLinks = createEditorWorkerModuleDescription('vs/workbench/contrib/output/common/outputLinkComputer');
  71  exports.workerBackgroundTokenization = createEditorWorkerModuleDescription('vs/workbench/services/textMate/browser/backgroundTokenization/worker/textMateTokenizationWorker.worker');
  72
  73  exports.workbenchDesktop = function () {
  74  	return isESM() ? [
  75: 		createModuleDescription('vs/workbench/contrib/debug/node/telemetryApp'),
  76  		createModuleDescription('vs/platform/files/node/watcher/watcherMain'),
  77  		createModuleDescription('vs/platform/terminal/node/ptyHostMain'),
  78  		createModuleDescription('vs/workbench/api/node/extensionHostProcess'),
  79  		createModuleDescription('vs/workbench/contrib/issue/electron-sandbox/issueReporterMain'),
  80  		createModuleDescription('vs/workbench/workbench.desktop.main')
  81  	] : [
  82  		...createEditorWorkerModuleDescription('vs/workbench/contrib/output/common/outputLinkComputer'),
  83  		...createEditorWorkerModuleDescription('vs/workbench/services/textMate/browser/backgroundTokenization/worker/textMateTokenizationWorker.worker'),
  84: 		createModuleDescription('vs/workbench/contrib/debug/node/telemetryApp'),
  85  		createModuleDescription('vs/platform/files/node/watcher/watcherMain'),
  86  		createModuleDescription('vs/platform/terminal/node/ptyHostMain'),
  87  		createModuleDescription('vs/workbench/api/node/extensionHostProcess'),
  88  		createModuleDescription('vs/workbench/contrib/issue/electron-sandbox/issueReporterMain'),
  89  	];
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\build\gulpfile.vscode.js:

```sh
  357  		const license = gulp.src([product.licenseFileName, 'ThirdPartyNotices.txt', 'licenses/**'], { base: '.', allowEmpty: true });
  358
  359  		// TODO the API should be copied to `out` during compile, not here
  360  		const api = gulp.src('src/vscode-dts/vscode.d.ts').pipe(rename('out/vscode-dts/vscode.d.ts'));
  361
  362: 		const telemetry = gulp.src('.build/telemetry/**', { base: '.build/telemetry', dot: true });
  363
  364  		const jsFilter = util.filter(data => !data.isDirectory() && /\.js$/.test(data.path));
  365  		const root = path.resolve(path.join(__dirname, '..'));
  366  		const productionDependencies = getProductionDependencies(root);
  367  		const dependenciesSrc = productionDependencies.map(d => path.relative(root, d.path)).map(d => [`${d}/**`, `!${d}/**/{test,tests}/**`, `!**/*.mk`]).flat();

  392  		let all = es.merge(
  393  			packageJsonStream,
  394  			productJsonStream,
  395  			license,
  396  			api,
  397: 			telemetry,
  398  			sources,
  399  			deps
  400  		);
  401
  402  		if (platform === 'win32') {
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\build\azure-pipelines\product-compile.yml:

```sh
  225                  AZURE_CLIENT_ID="$(AZURE_CLIENT_ID)" \
  226                  AZURE_CLIENT_SECRET="$(AZURE_CLIENT_SECRET)" \
  227                    node build/azure-pipelines/upload-sourcemaps
  228              displayName: Upload sourcemaps to Azure (Deprecated)
  229
  230:           - script: ./build/azure-pipelines/common/extract-telemetry.sh
  231:             displayName: Generate lists of telemetry events
  232
  233            - script:
  234                  tar -cz --ignore-failed-read
  235                  --exclude='.build/node_modules_cache'
  236                  --exclude='.build/node_modules_list.txt'
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\build\azure-pipelines\common\extract-telemetry.sh:

```sh
2 set -e
3
4 cd $BUILD_STAGINGDIRECTORY
5 mkdir extraction
6 cd extraction
7: git clone --depth 1 https://github.com/microsoft/vscode-extension-telemetry.git
8 git clone --depth 1 https://github.com/microsoft/vscode-chrome-debug-core.git
9 git clone --depth 1 https://github.com/microsoft/vscode-node-debug2.git
10 git clone --depth 1 https://github.com/microsoft/vscode-node-debug.git
11 git clone --depth 1 https://github.com/microsoft/vscode-html-languageservice.git
12 git clone --depth 1 https://github.com/microsoft/vscode-json-languageservice.git
13: node $BUILD_SOURCESDIRECTORY/node_modules/.bin/vscode-telemetry-extractor --sourceDir $BUILD_SOURCESDIRECTORY --excludedDir $BUILD_SOURCESDIRECTORY/extensions --outputDir . --applyEndpoints
14: node $BUILD_SOURCESDIRECTORY/node_modules/.bin/vscode-telemetry-extractor --config $BUILD_SOURCESDIRECTORY/build/azure-pipelines/common/telemetry-config.json -o .
15: mkdir -p $BUILD_SOURCESDIRECTORY/.build/telemetry
16: mv declarations-resolved.json $BUILD_SOURCESDIRECTORY/.build/telemetry/telemetry-core.json
17: mv config-resolved.json $BUILD_SOURCESDIRECTORY/.build/telemetry/telemetry-extensions.json
18 cd ..
19 rm -rf extraction
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\build\azure-pipelines\common\telemetry-config.json:

```sh
10 "sourceDirs": ["../../s/extensions/git"],
11 "excludedDirs": [],
12 "applyEndpoints": true
13 },
14 {
15: "eventPrefix": "extension-telemetry/",
16: "sourceDirs": ["vscode-extension-telemetry"],
17 "excludedDirs": [],
18 "applyEndpoints": true
19 },
20 {
21 "eventPrefix": "vscode-markdown/",
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\cli\Cargo.toml:

```sh
34 serde_json = "1.0.96"
35 rmp-serde = "1.1.1"
36 uuid = { version = "1.4", features = ["serde", "v4"] }
37 dirs = "5.0.1"
38 rand = "0.8.5"
39: opentelemetry = { version = "0.19.0", features = ["rt-tokio"] }
40 serde_bytes = "0.11.9"
41 chrono = { version = "0.4.26", features = [
42 "serde",
43 "std",
44 "clock",
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\cli\ThirdPartyNotices.txt:

```sh
5007 DEALINGS IN THE SOFTWARE.
5008 ---------------------------------------------------------
5009
5010 ---------------------------------------------------------
5011
5012: opentelemetry 0.19.0 - Apache-2.0
5013: https://github.com/open-telemetry/opentelemetry-rust
5014
5015 Apache License
5016 Version 2.0, January 2004
5017 http://www.apache.org/licenses/
5018

5215 limitations under the License.
5216 ---------------------------------------------------------
5217
5218 ---------------------------------------------------------
5219
5220: opentelemetry_api 0.19.0 - Apache-2.0
5221: https://github.com/open-telemetry/opentelemetry-rust
5222
5223 Apache License
5224 Version 2.0, January 2004
5225 http://www.apache.org/licenses/
5226

5423 limitations under the License.
5424 ---------------------------------------------------------
5425
5426 ---------------------------------------------------------
5427
5428: opentelemetry_sdk 0.19.0 - Apache-2.0
5429: https://github.com/open-telemetry/opentelemetry-rust
5430
5431 Apache License
5432 Version 2.0, January 2004
5433 http://www.apache.org/licenses/
5434
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\cli\Source\log.rs:

```sh
    2   *  Copyright (c) Microsoft Corporation. All rights reserved.
    3   *  Licensed under the MIT License. See License.txt in the project root for license information.
    4   *--------------------------------------------------------------------------------------------*/
    5
    6  use chrono::Local;
    7: use opentelemetry::{
    8  	sdk::trace::{Tracer, TracerProvider},
    9  	trace::{SpanBuilder, Tracer as TraitTracer, TracerProvider as TracerProviderTrait},
   10  };
   11  use serde::{Deserialize, Serialize};
   12  use std::{

  412   }
  413
  414  #[macro_export]
  415  macro_rules! span {
  416  	($logger:expr, $span:expr, $func:expr) => {{
  417: 		use opentelemetry::trace::TraceContextExt;
  418
  419  		let span = $span.start($logger.tracer());
  420: 		let cx = opentelemetry::Context::current_with_span(span);
  421  		let guard = cx.clone().attach();
  422  		let t = $func;
  423
  424  		if let Err(e) = &t {
  425  			cx.span().record_error(e);

  432  }
  433
  434  #[macro_export]
  435  macro_rules! spanf {
  436  	($logger:expr, $span:expr, $func:expr) => {{
  437: 		use opentelemetry::trace::{FutureExt, TraceContextExt};
  438
  439  		let span = $span.start($logger.tracer());
  440: 		let cx = opentelemetry::Context::current_with_span(span);
  441  		let t = $func.with_context(cx.clone()).await;
  442
  443  		if let Err(e) = &t {
  444  			cx.span().record_error(e);
  445  		}
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\cli\Source\bin\code\main.rs:

```sh
  17  		is_integrated_cli,
  18  		prereqs::PreReqChecker,
  19  	},
  20  };
  21  use legacy_args::try_parse_legacy;
  22: use opentelemetry::{sdk::trace::TracerProvider as SdkTracerProvider, trace::TracerProvider};
  23
  24  #[tokio::main]
  25  async fn main() -> Result<(), std::convert::Infallible> {
  26  	let raw_args = std::env::args_os().collect::<Vec<_>>();
  27  	let parsed = try_parse_legacy(&raw_args)
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\cli\Source\commands\args.rs:

```sh
  495
  496  	/// Log level to use.
  497  	#[clap(long, value_enum, value_name = "level", global = true)]
  498  	pub log: Option<log::Level>,
  499
  500: 	/// Disable telemetry for the current command, even if it was previously
  501: 	/// accepted as part of the license prompt or specified in '--telemetry-level'
  502  	#[clap(long, global = true, hide = true)]
  503: 	pub disable_telemetry: bool,
  504  }
  505
  506  impl GlobalOptions {
  507  	pub fn add_code_args(&self, target: &mut Vec<String>) {
  508  		if self.verbose {
  509  			target.push("--verbose".to_string());
  510  		}
  511  		if let Some(log) = self.log {
  512  			target.push(format!("--log={}", log));
  513  		}
  514: 		if self.disable_telemetry {
  515: 			target.push("--disable-telemetry".to_string());
  516  		}
  517: 		if let Some(telemetry_level) = &self.telemetry_level {
  518: 			target.push(format!("--telemetry-level={}", telemetry_level));
  519  		}
  520  	}
  521  }
  522
  523  #[derive(Args, Debug, Default, Clone)]

  549
  550  	/// Disable GPU hardware acceleration.
  551  	#[clap(long)]
  552  	pub disable_gpu: bool,
  553
  554: 	/// Shows all telemetry events which the editor collects.
  555  	#[clap(long)]
  556: 	pub telemetry: bool,
  557  }
  558
  559  impl EditorTroubleshooting {
  560  	pub fn add_code_args(&self, target: &mut Vec<String>) {
  561  		if self.prof_startup {

  577  			target.push(format!("--inspect-brk-extensions={}", port));
  578  		}
  579  		if self.disable_gpu {
  580  			target.push("--disable-gpu".to_string());
  581  		}
  582: 		if self.telemetry {
  583: 			target.push("--telemetry".to_string());
  584  		}
  585  	}
  586  }
  587
  588  #[derive(ValueEnum, Clone, Copy, Debug)]
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\cli\Source\tunnels\code_server.rs:

```sh
   29  		prereqs::skip_requirements_check,
   30  	},
   31  	warning,
   32  };
   33  use lazy_static::lazy_static;
   34: use opentelemetry::KeyValue;
   35  use regex::Regex;
   36  use serde::Deserialize;
   37  use std::{
   38  	fs,
   39  	fs::File,

   61  	pub host: Option<String>,
   62  	pub port: Option<u16>,
   63  	pub socket_path: Option<String>,
   64
   65  	// common argument
   66: 	pub telemetry_level: Option<TelemetryLevel>,
   67  	pub log: Option<log::Level>,
   68  	pub accept_server_license_terms: bool,
   69  	pub verbose: bool,
   70  	pub server_data_dir: Option<String>,
   71  	pub extensions_dir: Option<String>,

   92  		} else {
   93  			self.log.unwrap_or(log::Level::Info)
   94  		}
   95  	}
   96
   97: 	pub fn telemetry_disabled(&self) -> bool {
   98: 		self.telemetry_level == Some(TelemetryLevel::Off)
   99  	}
  100
  101  	pub fn command_arguments(&self) -> Vec<String> {
  102  		let mut args = Vec::new();
  103  		if let Some(i) = &self.socket_path {

  121  			args.push(String::from("--without-connection-token"));
  122  		}
  123  		if self.accept_server_license_terms {
  124  			args.push(String::from("--accept-server-license-terms"));
  125  		}
  126: 		if let Some(i) = self.telemetry_level {
  127: 			args.push(format!("--telemetry-level={}", i));
  128  		}
  129  		if let Some(i) = self.log {
  130  			args.push(format!("--log={}", i));
  131  		}
  132
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\cli\Source\tunnels\control_server.rs:

```sh
   27  		sync::{new_barrier, Barrier, BarrierOpener},
   28  	},
   29  };
   30
   31  use futures::{stream::FuturesUnordered, FutureExt};
   32: use opentelemetry::{trace::SpanKind, KeyValue};
   33  use std::{collections::HashMap, path::PathBuf, process::Stdio};
   34  use tokio::{
   35  	net::TcpStream,
   36  	pin,
   37  	process::{ChildStderr, ChildStdin},

  257  				let own_exit = exit_barrier.clone();
  258  				let own_code_server_args = code_server_args.clone();
  259  				let own_forwarding = forwarding.handle();
  260
  261  				tokio::spawn(async move {
  262: 					use opentelemetry::trace::{FutureExt, TraceContextExt};
  263
  264  					let span = own_log.span("server.socket").with_kind(SpanKind::Consumer).start(own_log.tracer());
  265: 					let cx = opentelemetry::Context::current_with_span(span);
  266  					let serve_at = Instant::now();
  267
  268  					debug!(own_log, "Serving new connection");
  269
  270  					let (writehalf, readhalf) = socket.into_split();
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\extensions\shared.webpack.config.js:

```sh
61 },
62 externals: {
63 'vscode': 'commonjs vscode', // ignored because it doesn't exist,
   64  			'applicationinsights-native-metrics': 'commonjs applicationinsights-native-metrics', // ignored because we don't ship native module
65 '@azure/functions-core': 'commonjs azure/functions-core', // optioinal dependency of appinsights that we don't use
   66: 			'@opentelemetry/tracing': 'commonjs @opentelemetry/tracing', // ignored because we don't ship this module
67: '@opentelemetry/instrumentation': 'commonjs @opentelemetry/instrumentation', // ignored because we don't ship this module
   68: 			'@azure/opentelemetry-instrumentation-azure-sdk': 'commonjs @azure/opentelemetry-instrumentation-azure-sdk', // ignored because we don't ship this module
69 },
70 output: {
71 // all output goes into $(dist).
72 // packaging depends on that and this must always be like it
73 filename: '[name].js',

148 },
149 externals: {
150 'vscode': 'commonjs vscode', // ignored because it doesn't exist,
  151  			'applicationinsights-native-metrics': 'commonjs applicationinsights-native-metrics', // ignored because we don't ship native module
152 '@azure/functions-core': 'commonjs azure/functions-core', // optioinal dependency of appinsights that we don't use
  153: 			'@opentelemetry/tracing': 'commonjs @opentelemetry/tracing', // ignored because we don't ship this module
154: '@opentelemetry/instrumentation': 'commonjs @opentelemetry/instrumentation', // ignored because we don't ship this module
  155: 			'@azure/opentelemetry-instrumentation-azure-sdk': 'commonjs @azure/opentelemetry-instrumentation-azure-sdk', // ignored because we don't ship this module
156 },
157 performance: {
158 hints: false
159 },
160 output: {
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\extensions\git\Source\commands.ts:

```sh
    10  	adjectives,
    11  	animals,
    12  	colors,
    13  	uniqueNamesGenerator,
    14  } from "@joaomoreno/unique-names-generator";
    15: import type TelemetryReporter from "@vscode/extension-telemetry";
    16  import {
    17  	type Command,
    18  	type Disposable,
    19  	type InputBoxValidationMessage,
    20  	InputBoxValidationSeverity,

   826  	constructor(
   827  		private git: Git,
   828  		private model: Model,
   829  		private globalState: Memento,
   830  		private logger: LogOutputChannel,
   831: 		private telemetryReporter: TelemetryReporter,
   832  	) {
   833  		this.disposables = Commands.map(
   834  			({ commandId, key, method, options }) => {
   835  				const command = this.createCommand(
   836  					commandId,

  1061  				"clone" : {
  1062  					"owner": "lszomoru",
  1063  					"outcome" : { "classification": "SystemMetaData", "purpose": "FeatureInsight", "comment": "The outcome of the git operation" }
  1064  				}
  1065  			*/
  1066: 			this.telemetryReporter.sendTelemetryEvent("clone", {
  1067  				outcome: "no_URL",
  1068  			});
  1069  			return;
  1070  		}
  1071

  1094  					"clone" : {
  1095  						"owner": "lszomoru",
  1096  						"outcome" : { "classification": "SystemMetaData", "purpose": "FeatureInsight", "comment": "The outcome of the git operation" }
  1097  					}
  1098  				*/
  1099: 				this.telemetryReporter.sendTelemetryEvent("clone", {
  1100  					outcome: "no_directory",
  1101  				});
  1102  				return;
  1103  			}
  1104

  1188  					"owner": "lszomoru",
  1189  					"outcome" : { "classification": "SystemMetaData", "purpose": "FeatureInsight", "comment": "The outcome of the git operation" },
  1190  					"openFolder": { "classification": "SystemMetaData", "purpose": "PerformanceAndHealth", "isMeasurement": true, "comment": "Indicates whether the folder is opened following the clone operation" }
  1191  				}
  1192  			*/
  1193: 			this.telemetryReporter.sendTelemetryEvent(
  1194  				"clone",
  1195  				{ outcome: "success" },
  1196  				{
  1197  					openFolder:
  1198  						action === PostCloneAction.Open ||

  1229  					"clone" : {
  1230  						"owner": "lszomoru",
  1231  						"outcome" : { "classification": "SystemMetaData", "purpose": "FeatureInsight", "comment": "The outcome of the git operation" }
  1232  					}
  1233  				*/
  1234: 				this.telemetryReporter.sendTelemetryEvent("clone", {
  1235  					outcome: "directory_not_empty",
  1236  				});
  1237  			} else if (
  1238  				/Cancelled/i.test(err && (err.message || err.stderr || ""))
  1239  			) {

  1243  					"clone" : {
  1244  						"owner": "lszomoru",
  1245  						"outcome" : { "classification": "SystemMetaData", "purpose": "FeatureInsight", "comment": "The outcome of the git operation" }
  1246  					}
  1247  				*/
  1248: 				this.telemetryReporter.sendTelemetryEvent("clone", {
  1249  					outcome: "error",
  1250  				});
  1251  			}
  1252
  1253  			throw err;

  5934  				"git.command" : {
  5935  					"owner": "lszomoru",
  5936  					"command" : { "classification": "SystemMetaData", "purpose": "FeatureInsight", "comment": "The command id of the command being executed" }
  5937  				}
  5938  			*/
  5939: 			this.telemetryReporter.sendTelemetryEvent("git.command", {
  5940  				command: id,
  5941  			});
  5942
  5943  			return result.catch((err) => {
  5944  				const options: MessageOptions = {
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\extensions\git\Source\main.ts:

```sh
    4   *--------------------------------------------------------------------------------------------*/
    5
    6  import * as fs from "fs";
    7  import * as os from "os";
    8  import * as path from "path";
    9: import TelemetryReporter from "@vscode/extension-telemetry";
   10  import {
   11  	Disposable,
   12  	type ExtensionContext,
   13  	LogLevel,
   14  	type LogOutputChannel,

   55  }
   56
   57  async function createModel(
   58  	context: ExtensionContext,
   59  	logger: LogOutputChannel,
   60: 	telemetryReporter: TelemetryReporter,
   61  	disposables: Disposable[],
   62  ): Promise<Model> {
   63  	const pathValue = workspace
   64  		.getConfiguration("git")
   65  		.get<string | string[]>("path");

  143  		git,
  144  		askpass,
  145  		context.globalState,
  146  		context.workspaceState,
  147  		logger,
  148: 		telemetryReporter,
  149  	);
  150  	disposables.push(model);
  151
  152  	const onRepository = () =>
  153  		commands.executeCommand(

  176  	const cc = new CommandCenter(
  177  		git,
  178  		model,
  179  		context.globalState,
  180  		logger,
  181: 		telemetryReporter,
  182  	);
  183  	disposables.push(
  184  		cc,
  185  		new GitFileSystemProvider(model),
  186  		new GitDecorations(model),

  284  	};
  285  	disposables.push(logger.onDidChangeLogLevel(onDidChangeLogLevel));
  286  	onDidChangeLogLevel(logger.logLevel);
  287
  288  	const { aiKey } = require("../package.json") as { aiKey: string };
  289: 	const telemetryReporter = new TelemetryReporter(aiKey);
  290: 	deactivateTasks.push(() => telemetryReporter.dispose());
  291
  292  	const config = workspace.getConfiguration("git", null);
  293  	const enabled = config.get<boolean>("enabled");
  294
  295  	if (!enabled) {

  309  		eventToPromise(onEnabled).then(
  310  			async () =>
  311  				(result.model = await createModel(
  312  					context,
  313  					logger,
  314: 					telemetryReporter,
  315  					disposables,
  316  				)),
  317  		);
  318  		return result;
  319  	}
  320
  321  	try {
  322  		const model = await createModel(
  323  			context,
  324  			logger,
  325: 			telemetryReporter,
  326  			disposables,
  327  		);
  328  		return new GitExtensionImpl(model);
  329  	} catch (err) {
  330  		console.warn(err.message);

  337  		/* __GDPR__
  338  			"git.missing" : {
  339  				"owner": "lszomoru"
  340  			}
  341  		*/
  342: 		telemetryReporter.sendTelemetryEvent("git.missing");
  343
  344  		commands.executeCommand("setContext", "git.missing", true);
  345  		warnAboutMissingGit();
  346
  347  		return new GitExtensionImpl();
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\extensions\git\Source\model.ts:

```sh
    3   *  Licensed under the MIT License. See License.txt in the project root for license information.
    4   *--------------------------------------------------------------------------------------------*/
    5
    6  import * as fs from "fs";
    7  import * as path from "path";
    8: import type TelemetryReporter from "@vscode/extension-telemetry";
    9  import {
   10  	type Disposable,
   11  	type Event,
   12  	EventEmitter,
   13  	type LogOutputChannel,

  351  		readonly git: Git,
  352  		private readonly askpass: Askpass,
  353  		private globalState: Memento,
  354  		readonly workspaceState: Memento,
  355  		private logger: LogOutputChannel,
  356: 		private telemetryReporter: TelemetryReporter,
  357  	) {
  358  		// Repositories managers
  359  		this._closedRepositoriesManager = new ClosedRepositoriesManager(
  360  			workspaceState,
  361  		);

  458  				"owner": "lszomoru",
  459  				"autoRepositoryDetection": { "classification": "SystemMetaData", "purpose": "FeatureInsight", "comment": "Setting that controls the initial repository scan" },
  460  				"repositoryCount": { "classification": "SystemMetaData", "purpose": "FeatureInsight", "isMeasurement": true, "comment": "Number of repositories opened during initial repository scan" }
  461  			}
  462  		*/
  463: 		this.telemetryReporter.sendTelemetryEvent(
  464  			"git.repositoryInitialScan",
  465  			{ autoRepositoryDetection: String(autoRepositoryDetection) },
  466  			{ repositoryCount: this.openRepositories.length },
  467  		);
  468  		this.logger.info(

  934  				this,
  935  				this,
  936  				this,
  937  				this.globalState,
  938  				this.logger,
  939: 				this.telemetryReporter,
  940  			);
  941
  942  			this.open(repository);
  943  			this._closedRepositoriesManager.deleteRepository(repository.root);
  944
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\extensions\git\Source\repository.ts:

```sh
     1  /*---------------------------------------------------------------------------------------------
     2   *  Copyright (c) Microsoft Corporation. All rights reserved.
     3   *  Licensed under the MIT License. See License.txt in the project root for license information.
     4   *--------------------------------------------------------------------------------------------*/
     5
     6: import TelemetryReporter from '@vscode/extension-telemetry';
     7  import * as fs from 'fs';
     8  import * as path from 'path';
     9  import * as picomatch from 'picomatch';
    10  import { CancellationError, CancellationToken, CancellationTokenSource, Command, commands, Disposable, Event, EventEmitter, FileDecoration, l10n, LogLevel, LogOutputChannel, Memento, ProgressLocation, ProgressOptions, RelativePattern, scm, SourceControl, SourceControlInputBox, SourceControlInputBoxValidation, SourceControlInputBoxValidationType, SourceControlResourceDecorations, SourceControlResourceGroup, SourceControlResourceState, TabInputNotebookDiff, TabInputTextDiff, TabInputTextMultiDiff, ThemeColor, Uri, window, workspace, WorkspaceEdit } from 'vscode';
    11  import { ActionButton } from './actionButton';

   834  		remoteSourcePublisherRegistry: IRemoteSourcePublisherRegistry,
   835  		postCommitCommandsProviderRegistry: IPostCommitCommandsProviderRegistry,
   836  		private readonly branchProtectionProviderRegistry: IBranchProtectionProviderRegistry,
   837  		globalState: Memento,
   838  		private readonly logger: LogOutputChannel,
   839: 		private telemetryReporter: TelemetryReporter
   840  	) {
   841  		const repositoryWatcher = workspace.createFileSystemWatcher(new RelativePattern(Uri.file(repository.root), '**'));
   842  		this.disposables.push(repositoryWatcher);
   843
   844  		const onRepositoryFileChange = anyEvent(repositoryWatcher.onDidChange, repositoryWatcher.onDidCreate, repositoryWatcher.onDidDelete);

  2238  					"limit": { "classification": "SystemMetaData", "purpose": "FeatureInsight", "isMeasurement": true, "comment": "Setting indicating the limit of status entries" },
  2239  					"statusLength": { "classification": "SystemMetaData", "purpose": "FeatureInsight", "isMeasurement": true, "comment": "Total number of status entries" },
  2240  					"totalTime": { "classification": "SystemMetaData", "purpose": "FeatureInsight", "isMeasurement": true, "comment": "Total number of ms the operation took" }
  2241  				}
  2242  			*/
  2243: 			this.telemetryReporter.sendTelemetryEvent('statusLimit', { ignoreSubmodules: String(ignoreSubmodules) }, { limit, statusLength, totalTime });
  2244  		}
  2245
  2246  		if (totalTime > 5000) {
  2247  			/* __GDPR__
  2248  				"statusSlow" : {

  2254  					"didWarnAboutLimit": { "classification": "SystemMetaData", "purpose": "FeatureInsight", "comment": "True when the user was warned about slow git status" },
  2255  					"statusLength": { "classification": "SystemMetaData", "purpose": "FeatureInsight", "isMeasurement": true, "comment": "Total number of status entries" },
  2256  					"totalTime": { "classification": "SystemMetaData", "purpose": "FeatureInsight", "isMeasurement": true, "comment": "Total number of ms the operation took" }
  2257  				}
  2258  			*/
  2259: 			this.telemetryReporter.sendTelemetryEvent('statusSlow', { ignoreSubmodules: String(ignoreSubmodules), didHitLimit: String(didHitLimit), didWarnAboutLimit: String(this.didWarnAboutLimit) }, { statusLength, totalTime });
  2260  		}
  2261
  2262  		// Triggers or clears any validation warning
  2263  		this._sourceControl.inputBox.validateInput = this._sourceControl.inputBox.validateInput;
  2264
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\extensions\github\Source\branchProtection.ts:

```sh
    5
    6  import type {
    7  	Repository as GitHubRepository,
    8  	RepositoryRuleset,
    9  } from "@octokit/graphql-schema";
   10: import type TelemetryReporter from "@vscode/extension-telemetry";
   11  import {
   12  	EventEmitter,
   13  	type LogOutputChannel,
   14  	type Memento,
   15  	type Uri,

   81  						repository.rootUri,
   82  						new GithubBranchProtectionProvider(
   83  							repository,
   84  							this.globalState,
   85  							this.logger,
   86: 							this.telemetryReporter,
   87  						),
   88  					),
   89  				);
   90  			}
   91  		} else {

   97
   98  	constructor(
   99  		private readonly gitAPI: API,
  100  		private readonly globalState: Memento,
  101  		private readonly logger: LogOutputChannel,
  102: 		private readonly telemetryReporter: TelemetryReporter,
  103  	) {
  104  		this.disposables.add(
  105  			this.gitAPI.onDidOpenRepository((repository) => {
  106  				if (this._enabled) {
  107  					this.providerDisposables.add(

  109  							repository.rootUri,
  110  							new GithubBranchProtectionProvider(
  111  								repository,
  112  								this.globalState,
  113  								this.logger,
  114: 								this.telemetryReporter,
  115  							),
  116  						),
  117  					);
  118  				}
  119  			}),

  153
  154  	constructor(
  155  		private readonly repository: Repository,
  156  		private readonly globalState: Memento,
  157  		private readonly logger: LogOutputChannel,
  158: 		private readonly telemetryReporter: TelemetryReporter,
  159  	) {
  160  		// Restore branch protection from global state
  161  		this.branchProtection = this.globalState.get<BranchProtection[]>(
  162  			this.globalStateKey,
  163  			[],

  306  				"branchProtection" : {
  307  					"owner": "lszomoru",
  308  					"rulesetCount": { "classification": "SystemMetaData", "purpose": "FeatureInsight", "isMeasurement": true, "comment": "Number of repository rulesets" }
  309  				}
  310  			*/
  311: 			this.telemetryReporter.sendTelemetryEvent(
  312  				"branchProtection",
  313  				undefined,
  314  				{ rulesetCount: this.branchProtection.length },
  315  			);
  316  		} catch (err) {
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\extensions\github\Source\extension.ts:

```sh
    1  /*---------------------------------------------------------------------------------------------
    2   *  Copyright (c) Microsoft Corporation. All rights reserved.
    3   *  Licensed under the MIT License. See License.txt in the project root for license information.
    4   *--------------------------------------------------------------------------------------------*/
    5
    6: import TelemetryReporter from "@vscode/extension-telemetry";
    7  import {
    8  	Disposable,
    9  	type ExtensionContext,
   10  	LogLevel,
   11  	type LogOutputChannel,

   40  	};
   41  	disposables.push(logger.onDidChangeLogLevel(onDidChangeLogLevel));
   42  	onDidChangeLogLevel(logger.logLevel);
   43
   44  	const { aiKey } = require("../package.json") as { aiKey: string };
   45: 	const telemetryReporter = new TelemetryReporter(aiKey);
   46: 	disposables.push(telemetryReporter);
   47
   48  	disposables.push(initializeGitBaseExtension());
   49  	disposables.push(
   50: 		initializeGitExtension(context, telemetryReporter, logger),
   51  	);
   52  }
   53
   54  function initializeGitBaseExtension(): Disposable {
   55  	const disposables = new DisposableStore();

  108  	}
  109  }
  110
  111  function initializeGitExtension(
  112  	context: ExtensionContext,
  113: 	telemetryReporter: TelemetryReporter,
  114  	logger: LogOutputChannel,
  115  ): Disposable {
  116  	const disposables = new DisposableStore();
  117
  118  	let gitExtension = extensions.getExtension<GitExtension>("vscode.git");

  130  					disposables.add(
  131  						new GithubBranchProtectionProviderManager(
  132  							gitAPI,
  133  							context.globalState,
  134  							logger,
  135: 							telemetryReporter,
  136  						),
  137  					);
  138  					disposables.add(
  139  						gitAPI.registerPushErrorHandler(
  140: 							new GithubPushErrorHandler(telemetryReporter),
  141  						),
  142  					);
  143  					disposables.add(
  144  						gitAPI.registerRemoteSourcePublisher(
  145  							new GithubRemoteSourcePublisher(gitAPI),
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\extensions\github\Source\pushErrorHandler.ts:

```sh
    3   *  Licensed under the MIT License. See License.txt in the project root for license information.
    4   *--------------------------------------------------------------------------------------------*/
    5
    6  import * as path from "path";
    7  import { TextDecoder } from "util";
    8: import type TelemetryReporter from "@vscode/extension-telemetry";
    9  import {
   10  	type Disposable,
   11  	FileType,
   12  	ProgressLocation,
   13  	type QuickPickOptions,

  148
  149  export class GithubPushErrorHandler implements PushErrorHandler {
  150  	private disposables: Disposable[] = [];
  151  	private commandErrors = new CommandErrorOutputTextDocumentContentProvider();
  152
  153: 	constructor(private readonly telemetryReporter: TelemetryReporter) {
  154  		this.disposables.push(
  155  			workspace.registerTextDocumentContentProvider(
  156  				"github-output",
  157  				this.commandErrors,
  158  			),

  205  				"pushErrorHandler" : {
  206  					"owner": "lszomoru",
  207  					"handler": { "classification": "SystemMetaData", "purpose": "FeatureInsight" }
  208  				}
  209  			*/
  210: 			this.telemetryReporter.sendTelemetryEvent("pushErrorHandler", {
  211  				handler: "PermissionDenied",
  212  			});
  213
  214  			return true;
  215  		}

  222  				"pushErrorHandler" : {
  223  					"owner": "lszomoru",
  224  					"handler": { "classification": "SystemMetaData", "purpose": "FeatureInsight" }
  225  				}
  226  			*/
  227: 			this.telemetryReporter.sendTelemetryEvent("pushErrorHandler", {
  228  				handler: "PushRejected.PushProtection",
  229  			});
  230
  231  			return true;
  232  		}

  235  			"pushErrorHandler" : {
  236  				"owner": "lszomoru",
  237  				"handler": { "classification": "SystemMetaData", "purpose": "FeatureInsight" }
  238  			}
  239  		*/
  240: 		this.telemetryReporter.sendTelemetryEvent("pushErrorHandler", {
  241  			handler: "None",
  242  		});
  243
  244  		return false;
  245  	}
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\extensions\github-authentication\Source\github.ts:

```sh
    2   *  Copyright (c) Microsoft Corporation. All rights reserved.
    3   *  Licensed under the MIT License. See License.txt in the project root for license information.
    4   *--------------------------------------------------------------------------------------------*/
    5
    6  import * as vscode from 'vscode';
    7: import TelemetryReporter from '@vscode/extension-telemetry';
    8  import { Keychain } from './common/keychain';
    9  import { GitHubServer, IGitHubServer } from './githubServer';
   10  import { PromiseAdapter, arrayEquals, promiseFromEvent } from './common/utils';
   11  import { ExperimentationTelemetry } from './common/experimentationService';
   12  import { Log } from './common/logger';

  120  {
  121  	private readonly _sessionChangeEmitter =
  122  		new vscode.EventEmitter<vscode.AuthenticationProviderAuthenticationSessionsChangeEvent>();
  123  	private readonly _logger: Log;
  124  	private readonly _githubServer: IGitHubServer;
  125: 	private readonly _telemetryReporter: ExperimentationTelemetry;
  126  	private readonly _keychain: Keychain;
  127  	private readonly _accountsSeen = new Set<string>();
  128  	private readonly _disposable: vscode.Disposable | undefined;
  129  	private _supportsMultipleAccounts = false;
  130

  138  		const { aiKey } = context.extension.packageJSON as {
  139  			name: string;
  140  			version: string;
  141  			aiKey: string;
  142  		};
  143: 		this._telemetryReporter = new ExperimentationTelemetry(
  144  			context,
  145  			new TelemetryReporter(aiKey),
  146  		);
  147
  148  		const type = ghesUri

  159  			this._logger,
  160  		);
  161
  162  		this._githubServer = new GitHubServer(
  163  			this._logger,
  164: 			this._telemetryReporter,
  165  			uriHandler,
  166  			context.extension.extensionKind,
  167  			ghesUri,
  168  		);
  169
  170  		// Contains the current state of the sessions we have available.
  171  		this._sessionsPromise = this.readSessions().then((sessions) => {
  172: 			// fire telemetry after a second to allow the workbench to focus on loading
  173  			setTimeout(
  174  				() => sessions.forEach((s) => this.afterSessionLoad(s)),
  175  				1000,
  176  			);
  177  			return sessions;

  180  		this._supportsMultipleAccounts = vscode.workspace
  181  			.getConfiguration("github.experimental")
  182  			.get<boolean>("multipleAccounts", false);
  183
  184  		this._disposable = vscode.Disposable.from(
  185: 			this._telemetryReporter,
  186  			vscode.authentication.registerAuthenticationProvider(
  187  				type,
  188  				this._githubServer.friendlyName,
  189  				this,
  190  				{ supportsMultipleAccounts: this._supportsMultipleAccounts },

  256  	}
  257
  258  	private async afterSessionLoad(
  259  		session: vscode.AuthenticationSession,
  260  	): Promise<void> {
  261: 		// We only want to fire a telemetry if we haven't seen this account yet in this session.
  262  		if (!this._accountsSeen.has(session.account.id)) {
  263  			this._accountsSeen.add(session.account.id);
  264  			this._githubServer.sendAdditionalTelemetryInfo(session);
  265  		}
  266  	}

  417  					"owner": "TylerLeonhardt",
  418  					"comment": "Used to determine how much usage the GitHub Auth Provider gets.",
  419  					"scopes": { "classification": "PublicNonPersonalData", "purpose": "FeatureInsight", "comment": "Used to determine what scope combinations are being requested." }
  420  				}
  421  			*/
  422: 			this._telemetryReporter?.sendTelemetryEvent("login", {
  423  				scopes: JSON.stringify(scopes),
  424  			});
  425
  426  			const sessions = await this._sessionsPromise;
  427

  464  			// If login was cancelled, do not notify user.
  465  			if (e === "Cancelled" || e.message === "Cancelled") {
  466  				/* __GDPR__
  467  					"loginCancelled" : { "owner": "TylerLeonhardt", "comment": "Used to determine how often users cancel the login flow." }
  468  				*/
  469: 				this._telemetryReporter?.sendTelemetryEvent("loginCancelled");
  470  				throw e;
  471  			}
  472
  473  			/* __GDPR__
  474  				"loginFailed" : { "owner": "TylerLeonhardt", "comment": "Used to determine how often users run into an error login flow." }
  475  			*/
  476: 			this._telemetryReporter?.sendTelemetryEvent("loginFailed");
  477
  478  			vscode.window.showErrorMessage(
  479  				vscode.l10n.t("Sign in failed: {0}", `${e}`),
  480  			);
  481  			this._logger.error(e);

  501  	public async removeSession(id: string) {
  502  		try {
  503  			/* __GDPR__
  504  				"logout" : { "owner": "TylerLeonhardt", "comment": "Used to determine how often users log out of an account." }
  505  			*/
  506: 			this._telemetryReporter?.sendTelemetryEvent("logout");
  507
  508  			this._logger.info(`Logging out of ${id}`);
  509
  510  			const sessions = await this._sessionsPromise;
  511  			const sessionIndex = sessions.findIndex(

  528  			}
  529  		} catch (e) {
  530  			/* __GDPR__
  531  				"logoutFailed" : { "owner": "TylerLeonhardt", "comment": "Used to determine how often logging out of an account fails." }
  532  			*/
  533: 			this._telemetryReporter?.sendTelemetryEvent("logoutFailed");
  534
  535  			vscode.window.showErrorMessage(
  536  				vscode.l10n.t("Sign out failed: {0}", `${e}`),
  537  			);
  538  			this._logger.error(e);
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\extensions\github-authentication\Source\githubServer.ts:

```sh
   39
   40  	private _redirectEndpoint: string | undefined;
   41
   42  	constructor(
   43  		private readonly _logger: Log,
   44: 		private readonly _telemetryReporter: ExperimentationTelemetry,
   45  		private readonly _uriHandler: UriEventHandler,
   46  		private readonly _extensionKind: vscode.ExtensionKind,
   47  		private readonly _ghesUri?: vscode.Uri,
   48  	) {
   49  		this._type = _ghesUri

  381  				"owner": "TylerLeonhardt",
  382  				"isEdu": { "classification": "SystemMetaData", "purpose": "FeatureInsight" },
  383  				"isManaged": { "classification": "SystemMetaData", "purpose": "FeatureInsight" }
  384  			}
  385  		*/
  386: 		this._telemetryReporter.sendTelemetryEvent("session", {
  387  			isEdu: edu,
  388  			// Apparently, this is how you tell if a user is an EMU...
  389  			isManaged: session.account.label.includes("_") ? "true" : "false",
  390  		});
  391  	}

  421  				"ghe-session" : {
  422  					"owner": "TylerLeonhardt",
  423  					"version": { "classification": "SystemMetaData", "purpose": "FeatureInsight" }
  424  				}
  425  			*/
  426: 			this._telemetryReporter.sendTelemetryEvent("ghe-session", {
  427  				version,
  428  			});
  429  		} catch {
  430  			// No-op
  431  		}
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\extensions\github-authentication\Source\common\experimentationService.ts:

```sh
   1  /*---------------------------------------------------------------------------------------------
   2   *  Copyright (c) Microsoft Corporation. All rights reserved.
   3   *  Licensed under the MIT License. See License.txt in the project root for license information.
   4   *--------------------------------------------------------------------------------------------*/
   5
   6: import type TelemetryReporter from "@vscode/extension-telemetry";
   7  import * as vscode from "vscode";
   8  import {
   9  	type IExperimentationService,
  10  	type IExperimentationTelemetry,
  11  	TargetPopulation,

  55  		await experimentationService.initialFetch;
  56  		return experimentationService;
  57  	}
  58
  59  	/**
  60: 	 * @returns A promise that you shouldn't need to await because this is just telemetry.
  61  	 */
  62  	async sendTelemetryEvent(
  63  		eventName: string,
  64  		properties?: Record<string, string>,
  65  		measurements?: Record<string, number>,

  79  			measurements,
  80  		);
  81  	}
  82
  83  	/**
  84: 	 * @returns A promise that you shouldn't need to await because this is just telemetry.
  85  	 */
  86  	async sendTelemetryErrorEvent(
  87  		eventName: string,
  88  		properties?: Record<string, string>,
  89  		_measurements?: Record<string, number>,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\extensions\html-language-features\client\Source\htmlClient.ts:

```sh
  127  export interface Runtime {
  128  	TextDecoder: {
  129  		new (encoding?: string): { decode(buffer: ArrayBuffer): string };
  130  	};
  131  	fileFs?: FileSystemProvider;
  132: 	telemetry?: TelemetryReporter;
  133  	readonly timer: {
  134  		setTimeout(
  135  			callback: (...args: any[]) => void,
  136  			ms: number,
  137  			...args: any[]

  361  		runtime,
  362  	);
  363  	toDispose.push(disposable);
  364
  365  	const disposable2 = client.onTelemetry((e) => {
  366: 		runtime.telemetry?.sendTelemetryEvent(e.key, e.data);
  367  	});
  368  	toDispose.push(disposable2);
  369
  370  	// manually register / deregister format provider based on the `html.format.enable` setting avoiding issues with late registration. See #71652.
  371  	updateFormatterRegistration();
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\extensions\html-language-features\client\Source\node\htmlClientMain.ts:

```sh
   3   *  Licensed under the MIT License. See License.txt in the project root for license information.
   4   *--------------------------------------------------------------------------------------------*/
   5
   6  import * as fs from "fs";
   7  import { TextDecoder } from "util";
   8: import TelemetryReporter from "@vscode/extension-telemetry";
   9  import { type Disposable, type ExtensionContext, l10n } from "vscode";
  10  import {
  11  	LanguageClient,
  12  	type LanguageClientOptions,
  13  	type ServerOptions,

  18  	type LanguageClientConstructor,
  19  	startClient,
  20  } from "../htmlClient";
  21  import { getNodeFileFS } from "./nodeFs";
  22
  23: let telemetry: TelemetryReporter | undefined;
  24  let client: AsyncDisposable | undefined;
  25
  26  // this method is called when vs code is activated
  27  export async function activate(context: ExtensionContext) {
  28  	const clientPackageJSON = getPackageInfo(context);
  29: 	telemetry = new TelemetryReporter(clientPackageJSON.aiKey);
  30
  31  	const serverMain = `./server/${clientPackageJSON.main.indexOf("/dist/") !== -1 ? "dist" : "out"}/node/htmlServerMain`;
  32  	const serverModule = context.asAbsolutePath(serverMain);
  33
  34  	// The debug options for the server

  73  	process.env["VSCODE_L10N_BUNDLE_LOCATION"] = l10n.uri?.toString() ?? "";
  74
  75  	client = await startClient(context, newLanguageClient, {
  76  		fileFs: getNodeFileFS(),
  77  		TextDecoder,
  78: 		telemetry,
  79  		timer,
  80  	});
  81  }
  82
  83  export async function deactivate(): Promise<void> {
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\extensions\json-language-features\client\Source\jsonClient.ts:

```sh
  187  	clientOptions: LanguageClientOptions,
  188  ) => BaseLanguageClient;
  189
  190  export interface Runtime {
  191  	schemaRequests: SchemaRequestService;
  192: 	telemetry?: TelemetryReporter;
  193  	readonly timer: {
  194  		setTimeout(
  195  			callback: (...args: any[]) => void,
  196  			ms: number,
  197  			...args: any[]

  608  			} catch (e) {
  609  				throw new ResponseError(2, e.toString(), e);
  610  			}
  611  		} else if (schemaDownloadEnabled) {
  612  			if (
  613: 				runtime.telemetry &&
  614  				uri.authority === "schema.management.azure.com"
  615  			) {
  616  				/* __GDPR__
  617  					"json.schema" : {
  618  						"owner": "aeschli",
  619  						"comment": "Measure the use of the Azure resource manager schemas",
  620  						"schemaURL" : { "classification": "SystemMetaData", "purpose": "FeatureInsight", "comment": "The azure schema URL that was requested." }
  621  					}
  622  				*/
  623: 				runtime.telemetry.sendTelemetryEvent("json.schema", {
  624  					schemaURL: uriString,
  625  				});
  626  			}
  627  			try {
  628  				return await runtime.schemaRequests.getContent(uriString);
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\extensions\json-language-features\client\Source\node\jsonClientMain.ts:

```sh
   33  	type XHRResponse,
   34  	getErrorStatusDescription,
   35  	xhr,
   36  } from "request-light";
   37
   38: import TelemetryReporter from "@vscode/extension-telemetry";
   39  import { JSONSchemaCache } from "./schemaCache";
   40
   41  let client: AsyncDisposable | undefined;
   42
   43  // this method is called when vs code is activated
   44  export async function activate(context: ExtensionContext) {
   45  	const clientPackageJSON = await getPackageInfo(context);
   46: 	const telemetry = new TelemetryReporter(clientPackageJSON.aiKey);
   47: 	context.subscriptions.push(telemetry);
   48
   49  	const logOutputChannel = window.createOutputChannel(
   50  		languageServerDescription,
   51  		{ log: true },
   52  	);

  101  		logOutputChannel,
  102  	);
  103
  104  	client = await startClient(context, newLanguageClient, {
  105  		schemaRequests,
  106: 		telemetry,
  107  		timer,
  108  		logOutputChannel,
  109  	});
  110  }
  111
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\extensions\markdown-language-features\Source\extension.shared.ts:

```sh
  17  import type { IMdParser, MarkdownItEngine } from "./markdownEngine";
  18  import type { MarkdownContributionProvider } from "./markdownExtensions";
  19  import { MdDocumentRenderer } from "./preview/documentRenderer";
  20  import { MarkdownPreviewManager } from "./preview/previewManager";
  21  import { ExtensionContentSecurityPolicyArbiter } from "./preview/security";
  22: import { loadDefaultTelemetryReporter } from "./telemetryReporter";
  23  import { MdLinkOpener } from "./util/openDocumentLink";
  24
  25  export function activateShared(
  26  	context: vscode.ExtensionContext,
  27  	client: MdLanguageClient,
  28  	engine: MarkdownItEngine,
  29  	logger: ILogger,
  30  	contributions: MarkdownContributionProvider,
  31  ) {
  32: 	const telemetryReporter = loadDefaultTelemetryReporter();
  33: 	context.subscriptions.push(telemetryReporter);
  34
  35  	const cspArbiter = new ExtensionContentSecurityPolicyArbiter(
  36  		context.globalState,
  37  		context.workspaceState,
  38  	);

  60  	);
  61  	context.subscriptions.push(
  62  		registerMarkdownCommands(
  63  			commandManager,
  64  			previewManager,
  65: 			telemetryReporter,
  66  			cspArbiter,
  67  			engine,
  68  		),
  69  	);
  70
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\extensions\markdown-language-features\Source\telemetryReporter.ts:

```sh
  1  /*---------------------------------------------------------------------------------------------
  2   *  Copyright (c) Microsoft Corporation. All rights reserved.
  3   *  Licensed under the MIT License. See License.txt in the project root for license information.
  4   *--------------------------------------------------------------------------------------------*/
  5: import { default as VSCodeTelemetryReporter } from "@vscode/extension-telemetry";
  6  import * as vscode from "vscode";
  7
  8  interface IPackageInfo {
  9  	name: string;
  10  	version: string;
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\extensions\markdown-language-features\Source\commands\index.ts:

```sh
   9  import type { MarkdownPreviewManager } from "../preview/previewManager";
  10  import {
  11  	type ContentSecurityPolicyArbiter,
  12  	PreviewSecuritySelector,
  13  } from "../preview/security";
  14: import type { TelemetryReporter } from "../telemetryReporter";
  15  import { CopyImageCommand } from "./copyImage";
  16  import {
  17  	InsertImageFromWorkspace,
  18  	InsertLinkFromWorkspace,
  19  } from "./insertResource";

  30  import { ToggleLockCommand } from "./toggleLock";
  31
  32  export function registerMarkdownCommands(
  33  	commandManager: CommandManager,
  34  	previewManager: MarkdownPreviewManager,
  35: 	telemetryReporter: TelemetryReporter,
  36  	cspArbiter: ContentSecurityPolicyArbiter,
  37  	engine: MarkdownItEngine,
  38  ): vscode.Disposable {
  39  	const previewSecuritySelector = new PreviewSecuritySelector(
  40  		cspArbiter,
  41  		previewManager,
  42  	);
  43
  44  	commandManager.register(new CopyImageCommand(previewManager));
  45  	commandManager.register(
  46: 		new ShowPreviewCommand(previewManager, telemetryReporter),
  47  	);
  48  	commandManager.register(
  49: 		new ShowPreviewToSideCommand(previewManager, telemetryReporter),
  50  	);
  51  	commandManager.register(
  52: 		new ShowLockedPreviewToSideCommand(previewManager, telemetryReporter),
  53  	);
  54  	commandManager.register(new ShowSourceCommand(previewManager));
  55  	commandManager.register(new RefreshPreviewCommand(previewManager, engine));
  56  	commandManager.register(
  57  		new ShowPreviewSecuritySelectorCommand(
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\extensions\markdown-language-features\Source\commands\showPreview.ts:

```sh
    7  import type { Command } from "../commandManager";
    8  import type {
    9  	DynamicPreviewSettings,
   10  	MarkdownPreviewManager,
   11  } from "../preview/previewManager";
   12: import type { TelemetryReporter } from "../telemetryReporter";
   13
   14  interface ShowPreviewSettings {
   15  	readonly sideBySide?: boolean;
   16  	readonly locked?: boolean;
   17  }
   18
   19  async function showPreview(
   20  	webviewManager: MarkdownPreviewManager,
   21: 	telemetryReporter: TelemetryReporter,
   22  	uri: vscode.Uri | undefined,
   23  	previewSettings: ShowPreviewSettings,
   24  ): Promise<any> {
   25  	let resource = uri;
   26  	if (!(resource instanceof vscode.Uri)) {

   49  			? vscode.ViewColumn.Beside
   50  			: resourceColumn,
   51  		locked: !!previewSettings.locked,
   52  	});
   53
   54: 	telemetryReporter.sendTelemetryEvent("openPreview", {
   55  		where: previewSettings.sideBySide ? "sideBySide" : "inPlace",
   56  		how: uri instanceof vscode.Uri ? "action" : "pallete",
   57  	});
   58  }
   59
   60  export class ShowPreviewCommand implements Command {
   61  	public readonly id = "markdown.showPreview";
   62
   63  	public constructor(
   64  		private readonly _webviewManager: MarkdownPreviewManager,
   65: 		private readonly _telemetryReporter: TelemetryReporter,
   66  	) {}
   67
   68  	public execute(
   69  		mainUri?: vscode.Uri,
   70  		allUris?: vscode.Uri[],
   71  		previewSettings?: DynamicPreviewSettings,
   72  	) {
   73  		for (const uri of Array.isArray(allUris) ? allUris : [mainUri]) {
   74: 			showPreview(this._webviewManager, this._telemetryReporter, uri, {
   75  				sideBySide: false,
   76  				locked: previewSettings && previewSettings.locked,
   77  			});
   78  		}
   79  	}

   82  export class ShowPreviewToSideCommand implements Command {
   83  	public readonly id = "markdown.showPreviewToSide";
   84
   85  	public constructor(
   86  		private readonly _webviewManager: MarkdownPreviewManager,
   87: 		private readonly _telemetryReporter: TelemetryReporter,
   88  	) {}
   89
   90  	public execute(uri?: vscode.Uri, previewSettings?: DynamicPreviewSettings) {
   91: 		showPreview(this._webviewManager, this._telemetryReporter, uri, {
   92  			sideBySide: true,
   93  			locked: previewSettings && previewSettings.locked,
   94  		});
   95  	}
   96  }

   98  export class ShowLockedPreviewToSideCommand implements Command {
   99  	public readonly id = "markdown.showLockedPreviewToSide";
  100
  101  	public constructor(
  102  		private readonly _webviewManager: MarkdownPreviewManager,
  103: 		private readonly _telemetryReporter: TelemetryReporter,
  104  	) {}
  105
  106  	public execute(uri?: vscode.Uri) {
  107: 		showPreview(this._webviewManager, this._telemetryReporter, uri, {
  108  			sideBySide: true,
  109  			locked: true,
  110  		});
  111  	}
  112  }
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\extensions\merge-conflict\Source\documentMergeConflict.ts:

```sh
   1: import type TelemetryReporter from "@vscode/extension-telemetry";
   2  import type * as vscode from "vscode";
   3  /*---------------------------------------------------------------------------------------------
   4   *  Copyright (c) Microsoft Corporation. All rights reserved.
   5   *  Licensed under the MIT License. See License.txt in the project root for license information.
   6   *--------------------------------------------------------------------------------------------*/

  16  	public splitter: vscode.Range;
  17  	private applied = false;
  18
  19  	constructor(
  20  		descriptor: interfaces.IDocumentMergeConflictDescriptor,
  21: 		private readonly telemetryReporter: TelemetryReporter,
  22  	) {
  23  		this.range = descriptor.range;
  24  		this.current = descriptor.current;
  25  		this.incoming = descriptor.incoming;
  26  		this.commonAncestors = descriptor.commonAncestors;

  48  				"owner": "hediet",
  49  				"comment": "Used to understand how the inline merge editor experience is used.",
  50  				"resolution": { "classification": "SystemMetaData", "purpose": "FeatureInsight", "comment": "Indicates how the merge conflict was resolved by the user" }
  51  			}
  52  		*/
  53: 		this.telemetryReporter.sendTelemetryEvent("mergeMarkers.accept", {
  54  			resolution: commitTypeToString(type),
  55  		});
  56
  57  		if (edit) {
  58  			this.applyEdit(type, editor.document, edit);
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\extensions\merge-conflict\Source\documentTracker.ts:

```sh
    1  /*---------------------------------------------------------------------------------------------
    2   *  Copyright (c) Microsoft Corporation. All rights reserved.
    3   *  Licensed under the MIT License. See License.txt in the project root for license information.
    4   *--------------------------------------------------------------------------------------------*/
    5
    6: import type TelemetryReporter from "@vscode/extension-telemetry";
    7  import type * as vscode from "vscode";
    8  import { Delayer } from "./delayer";
    9  import type * as interfaces from "./interfaces";
   10  import { MergeConflictParser } from "./mergeConflictParser";
   11

   58  		interfaces.IDocumentMergeConflictTrackerService
   59  {
   60  	private cache: Map<string, ScanTask> = new Map();
   61  	private delayExpireTime = 0;
   62
   63: 	constructor(private readonly telemetryReporter: TelemetryReporter) {}
   64
   65  	getConflicts(
   66  		document: vscode.TextDocument,
   67  		origin: string,
   68  	): PromiseLike<interfaces.IDocumentMergeConflict[]> {

  143  			return [];
  144  		}
  145
  146  		const conflicts = MergeConflictParser.scanDocument(
  147  			document,
  148: 			this.telemetryReporter,
  149  		);
  150
  151  		const key = document.uri.toString();
  152: 		// Don't report telemetry for the same document twice. This is an approximation, but good enough.
  153  		// Otherwise redo/undo could trigger this event multiple times.
  154  		if (!this.seenDocumentsWithConflicts.has(key)) {
  155  			this.seenDocumentsWithConflicts.add(key);
  156
  157  			/* __GDPR__

  159  					"owner": "hediet",
  160  					"comment": "Used to determine how many documents with conflicts are opened.",
  161  					"conflictCount": { "classification": "SystemMetaData", "purpose": "FeatureInsight", "isMeasurement": true, "comment": "Total number of conflict counts" }
  162  				}
  163  			*/
  164: 			this.telemetryReporter.sendTelemetryEvent(
  165  				"mergeMarkers.documentWithConflictMarkersOpened",
  166  				{},
  167  				{
  168  					conflictCount: conflicts.length,
  169  				},
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\extensions\merge-conflict\Source\mergeConflictParser.ts:

```sh
    1: import type TelemetryReporter from "@vscode/extension-telemetry";
    2  /*---------------------------------------------------------------------------------------------
    3   *  Copyright (c) Microsoft Corporation. All rights reserved.
    4   *  Licensed under the MIT License. See License.txt in the project root for license information.
    5   *--------------------------------------------------------------------------------------------*/
    6  import * as vscode from "vscode";

   20  }
   21
   22  export class MergeConflictParser {
   23  	static scanDocument(
   24  		document: vscode.TextDocument,
   25: 		telemetryReporter: TelemetryReporter,
   26  	): interfaces.IDocumentMergeConflict[] {
   27  		// Scan each line in the document, we already know there is at least a <<<<<<< and
   28  		// >>>>>> marker within the document, we need to group these into conflict ranges.
   29  		// We initially build a scan match, that references the lines of the header, splitter
   30  		// and footer. This is then converted into a full descriptor containing all required

   96
   97  		return conflictDescriptors
   98  			.filter(Boolean)
   99  			.map(
  100  				(descriptor) =>
  101: 					new DocumentMergeConflict(descriptor, telemetryReporter),
  102  			);
  103  	}
  104
  105  	private static scanItemTolMergeConflictDescriptor(
  106  		document: vscode.TextDocument,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\extensions\merge-conflict\Source\services.ts:

```sh
   1: import TelemetryReporter from "@vscode/extension-telemetry";
   2  /*---------------------------------------------------------------------------------------------
   3   *  Copyright (c) Microsoft Corporation. All rights reserved.
   4   *  Licensed under the MIT License. See License.txt in the project root for license information.
   5   *--------------------------------------------------------------------------------------------*/
   6  import * as vscode from "vscode";

  13
  14  const ConfigurationSectionName = "merge-conflict";
  15
  16  export default class ServiceWrapper implements vscode.Disposable {
  17  	private services: vscode.Disposable[] = [];
  18: 	private telemetryReporter: TelemetryReporter;
  19
  20  	constructor(private context: vscode.ExtensionContext) {
  21  		const { aiKey } = context.extension.packageJSON as { aiKey: string };
  22: 		this.telemetryReporter = new TelemetryReporter(aiKey);
  23: 		context.subscriptions.push(this.telemetryReporter);
  24  	}
  25
  26  	begin() {
  27  		const configuration = this.createExtensionConfiguration();
  28: 		const documentTracker = new DocumentTracker(this.telemetryReporter);
  29
  30  		this.services.push(
  31  			documentTracker,
  32  			new CommandHandler(documentTracker),
  33  			new CodeLensProvider(documentTracker),
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\extensions\microsoft-authentication\Source\AADHelper.ts:

```sh
    3   *  Licensed under the MIT License. See License.txt in the project root for license information.
    4   *--------------------------------------------------------------------------------------------*/
    5
    6  import * as path from "path";
    7  import { Environment } from "@azure/ms-rest-azure-env";
    8: import type TelemetryReporter from "@vscode/extension-telemetry";
    9  import * as vscode from "vscode";
   10  import type { UriEventHandler } from "./UriEventHandler";
   11  import type {
   12  	BetterTokenStorage,
   13  	IDidChangeInOtherWindowEvent,

  127  	constructor(
  128  		private readonly _logger: vscode.LogOutputChannel,
  129  		_context: vscode.ExtensionContext,
  130  		private readonly _uriHandler: UriEventHandler,
  131  		private readonly _tokenStorage: BetterTokenStorage<IStoredSession>,
  132: 		private readonly _telemetryReporter: TelemetryReporter,
  133  		private readonly _env: Environment,
  134  	) {
  135  		_context.subscriptions.push(
  136  			this._tokenStorage.onDidChangeInOtherWindow((e) =>
  137  				this.checkForUpdates(e),

  233  					"comment": "Used to determine the usage of the Microsoft Auth Provider.",
  234  					"scopes": { "classification": "PublicNonPersonalData", "purpose": "FeatureInsight", "comment": "Used to determine what scope combinations are being requested." },
  235  					"accountType": { "classification": "PublicNonPersonalData", "purpose": "FeatureInsight", "comment": "Used to determine what account types are being used." }
  236  				}
  237  			*/
  238: 			this._telemetryReporter.sendTelemetryEvent("account", {
  239: 				// Get rid of guids from telemetry.
  240  				scopes: JSON.stringify(
  241  					token.scope
  242  						.replace(
  243  							/[0-9A-F]{8}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{12}/i,
  244  							"{guid}",
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\extensions\microsoft-authentication\Source\extension.ts:

```sh
   5
   6  import { commands, env, ExtensionContext, l10n, window, workspace } from 'vscode';
   7  import * as extensionV1 from './extensionV1';
   8  import * as extensionV2 from './extensionV2';
   9  import { createExperimentationService } from './common/experimentation';
  10: import { MicrosoftAuthenticationTelemetryReporter } from './common/telemetryReporter';
  11  import { IExperimentationService } from 'vscode-tas-client';
  12  import Logger from './logger';
  13
  14  function shouldUseMsal(expService: IExperimentationService): boolean {
  15  	// First check if there is a setting value to allow user to override the default

  70  	}));
  71  	// Only activate the new extension if we are not running in a browser environment
  72  	if (useMsal && typeof navigator === 'undefined') {
  73  		await extensionV2.activate(context, mainTelemetryReporter);
  74  	} else {
  75: 		await extensionV1.activate(context, mainTelemetryReporter.telemetryReporter);
  76  	}
  77  }
  78
  79  export function deactivate() {
  80  	if (useMsal) {
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\extensions\microsoft-authentication\Source\extensionV1.ts:

```sh
    6  import * as vscode from 'vscode';
    7  import { Environment, EnvironmentParameters } from '@azure/ms-rest-azure-env';
    8  import { AzureActiveDirectoryService, IStoredSession } from './AADHelper';
    9  import { BetterTokenStorage } from './betterSecretStorage';
   10  import { UriEventHandler } from './UriEventHandler';
   11: import TelemetryReporter from '@vscode/extension-telemetry';
   12  import Logger from './logger';
   13
   14: async function initMicrosoftSovereignCloudAuthProvider(context: vscode.ExtensionContext, telemetryReporter: TelemetryReporter, uriHandler: UriEventHandler, tokenStorage: BetterTokenStorage<IStoredSession>): Promise<vscode.Disposable | undefined> {
   15  	const environment = vscode.workspace.getConfiguration('microsoft-sovereign-cloud').get<string | undefined>('environment');
   16  	let authProviderName: string | undefined;
   17  	if (!environment) {
   18  		return undefined;
   19  	}

   50  	const aadService = new AzureActiveDirectoryService(
   51  		vscode.window.createOutputChannel(vscode.l10n.t('Microsoft Sovereign Cloud Authentication'), { log: true }),
   52  		context,
   53  		uriHandler,
   54  		tokenStorage,
   55: 		telemetryReporter,
   56  		env);
   57  	await aadService.initialize();
   58
   59  	const disposable = vscode.authentication.registerAuthenticationProvider('microsoft-sovereign-cloud', authProviderName, {
   60  		onDidChangeSessions: aadService.onDidChangeSessions,

   66  						"owner": "TylerLeonhardt",
   67  						"comment": "Used to determine the usage of the Microsoft Sovereign Cloud Auth Provider.",
   68  						"scopes": { "classification": "PublicNonPersonalData", "purpose": "FeatureInsight", "comment": "Used to determine what scope combinations are being requested." }
   69  					}
   70  				*/
   71: 				telemetryReporter.sendTelemetryEvent('loginMicrosoftSovereignCloud', {
   72: 					// Get rid of guids from telemetry.
   73  					scopes: JSON.stringify(scopes.map(s => s.replace(/[0-9A-F]{8}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{12}/i, '{guid}'))),
   74  				});
   75
   76  				return await aadService.createSession(scopes);
   77  			} catch (e) {
   78  				/* __GDPR__
   79  					"loginFailed" : { "owner": "TylerLeonhardt", "comment": "Used to determine how often users run into issues with the login flow." }
   80  				*/
   81: 				telemetryReporter.sendTelemetryEvent('loginMicrosoftSovereignCloudFailed');
   82
   83  				throw e;
   84  			}
   85  		},
   86  		removeSession: async (id: string) => {
   87  			try {
   88  				/* __GDPR__
   89  					"logout" : { "owner": "TylerLeonhardt", "comment": "Used to determine how often users log out." }
   90  				*/
   91: 				telemetryReporter.sendTelemetryEvent('logoutMicrosoftSovereignCloud');
   92
   93  				await aadService.removeSessionById(id);
   94  			} catch (e) {
   95  				/* __GDPR__
   96  					"logoutFailed" : { "owner": "TylerLeonhardt", "comment": "Used to determine how often fail to log out." }
   97  				*/
   98: 				telemetryReporter.sendTelemetryEvent('logoutMicrosoftSovereignCloudFailed');
   99  			}
  100  		}
  101  	}, { supportsMultipleAccounts: true });
  102
  103  	context.subscriptions.push(disposable);
  104  	return disposable;
  105  }
  106
  107: export async function activate(context: vscode.ExtensionContext, telemetryReporter: TelemetryReporter) {
  108  	const uriHandler = new UriEventHandler();
  109  	context.subscriptions.push(uriHandler);
  110  	const betterSecretStorage = new BetterTokenStorage<IStoredSession>('microsoft.login.keylist', context);
  111
  112  	const loginService = new AzureActiveDirectoryService(
  113  		Logger,
  114  		context,
  115  		uriHandler,
  116  		betterSecretStorage,
  117: 		telemetryReporter,
  118  		Environment.AzureCloud);
  119  	await loginService.initialize();
  120
  121  	context.subscriptions.push(vscode.authentication.registerAuthenticationProvider('microsoft', 'Microsoft', {
  122  		onDidChangeSessions: loginService.onDidChangeSessions,

  128  						"owner": "TylerLeonhardt",
  129  						"comment": "Used to determine the usage of the Microsoft Auth Provider.",
  130  						"scopes": { "classification": "PublicNonPersonalData", "purpose": "FeatureInsight", "comment": "Used to determine what scope combinations are being requested." }
  131  					}
  132  				*/
  133: 				telemetryReporter.sendTelemetryEvent('login', {
  134: 					// Get rid of guids from telemetry.
  135  					scopes: JSON.stringify(scopes.map(s => s.replace(/[0-9A-F]{8}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{12}/i, '{guid}'))),
  136  				});
  137
  138  				return await loginService.createSession(scopes, options?.account);
  139  			} catch (e) {
  140  				/* __GDPR__
  141  					"loginFailed" : { "owner": "TylerLeonhardt", "comment": "Used to determine how often users run into issues with the login flow." }
  142  				*/
  143: 				telemetryReporter.sendTelemetryEvent('loginFailed');
  144
  145  				throw e;
  146  			}
  147  		},
  148  		removeSession: async (id: string) => {
  149  			try {
  150  				/* __GDPR__
  151  					"logout" : { "owner": "TylerLeonhardt", "comment": "Used to determine how often users log out." }
  152  				*/
  153: 				telemetryReporter.sendTelemetryEvent('logout');
  154
  155  				await loginService.removeSessionById(id);
  156  			} catch (e) {
  157  				/* __GDPR__
  158  					"logoutFailed" : { "owner": "TylerLeonhardt", "comment": "Used to determine how often fail to log out." }
  159  				*/
  160: 				telemetryReporter.sendTelemetryEvent('logoutFailed');
  161  			}
  162  		}
  163  	}, { supportsMultipleAccounts: true }));
  164
  165: 	let microsoftSovereignCloudAuthProviderDisposable = await initMicrosoftSovereignCloudAuthProvider(context, telemetryReporter, uriHandler, betterSecretStorage);
  166
  167  	context.subscriptions.push(vscode.workspace.onDidChangeConfiguration(async e => {
  168  		if (e.affectsConfiguration('microsoft-sovereign-cloud')) {
  169  			microsoftSovereignCloudAuthProviderDisposable?.dispose();
  170: 			microsoftSovereignCloudAuthProviderDisposable = await initMicrosoftSovereignCloudAuthProvider(context, telemetryReporter, uriHandler, betterSecretStorage);
  171  		}
  172  	}));
  173
  174  	return;
  175  }
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\extensions\microsoft-authentication\Source\extensionV2.ts:

```sh
   6  import { Environment, EnvironmentParameters } from '@azure/ms-rest-azure-env';
   7  import Logger from './logger';
   8  import { MsalAuthProvider } from './node/authProvider';
   9  import { UriEventHandler } from './UriEventHandler';
  10  import { authentication, commands, ExtensionContext, l10n, window, workspace, Disposable } from 'vscode';
  11: import { MicrosoftAuthenticationTelemetryReporter, MicrosoftSovereignCloudAuthenticationTelemetryReporter } from './common/telemetryReporter';
  12
  13  async function initMicrosoftSovereignCloudAuthProvider(
  14  	context: ExtensionContext,
  15  	uriHandler: UriEventHandler
  16  ): Promise<Disposable | undefined> {
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\extensions\microsoft-authentication\Source\common\telemetryReporter.ts:

```sh
    1  /*---------------------------------------------------------------------------------------------
    2   *  Copyright (c) Microsoft Corporation. All rights reserved.
    3   *  Licensed under the MIT License. See License.txt in the project root for license information.
    4   *--------------------------------------------------------------------------------------------*/
    5
    6: import TelemetryReporter, { TelemetryEventProperties } from '@vscode/extension-telemetry';
    7  import { IExperimentationTelemetry } from 'vscode-tas-client';
    8
    9  export const enum MicrosoftAccountType {
   10  	AAD = 'aad',
   11  	MSA = 'msa',
   12  	Unknown = 'unknown'
   13  }
   14
   15  export class MicrosoftAuthenticationTelemetryReporter implements IExperimentationTelemetry {
   16  	private sharedProperties: Record<string, string> = {};
   17: 	protected _telemetryReporter: TelemetryReporter;
   18  	constructor(aiKey: string) {
   19: 		this._telemetryReporter = new TelemetryReporter(aiKey);
   20  	}
   21
   22: 	get telemetryReporter(): TelemetryReporter {
   23: 		return this._telemetryReporter;
   24  	}
   25
   26  	setSharedProperty(name: string, value: string): void {
   27  		this.sharedProperties[name] = value;
   28  	}
   29
   30  	postEvent(eventName: string, props: Map<string, string>): void {
   31  		const eventProperties: TelemetryEventProperties = { ...this.sharedProperties, ...Object.fromEntries(props) };
   32: 		this._telemetryReporter.sendTelemetryEvent(
   33  			eventName,
   34  			eventProperties
   35  		);
   36  	}
   37

   41  				"owner": "TylerLeonhardt",
   42  				"comment": "Used to determine the usage of the Microsoft Auth Provider.",
   43  				"scopes": { "classification": "PublicNonPersonalData", "purpose": "FeatureInsight", "comment": "Used to determine what scope combinations are being requested." }
   44  			}
   45  		*/
   46: 		this._telemetryReporter.sendTelemetryEvent('login', {
   47: 			// Get rid of guids from telemetry.
   48  			scopes: JSON.stringify(this._scrubGuids(scopes)),
   49  		});
   50  	}
   51  	sendLoginFailedEvent(): void {
   52  		/* __GDPR__
   53  			"loginFailed" : { "owner": "TylerLeonhardt", "comment": "Used to determine how often users run into issues with the login flow." }
   54  		*/
   55: 		this._telemetryReporter.sendTelemetryEvent('loginFailed');
   56  	}
   57  	sendLogoutEvent(): void {
   58  		/* __GDPR__
   59  			"logout" : { "owner": "TylerLeonhardt", "comment": "Used to determine how often users log out." }
   60  		*/
   61: 		this._telemetryReporter.sendTelemetryEvent('logout');
   62  	}
   63  	sendLogoutFailedEvent(): void {
   64  		/* __GDPR__
   65  			"logoutFailed" : { "owner": "TylerLeonhardt", "comment": "Used to determine how often fail to log out." }
   66  		*/
   67: 		this._telemetryReporter.sendTelemetryEvent('logoutFailed');
   68  	}
   69  	/**
   70  	 * Sends an event for an account type available at startup.
   71  	 * @param scopes The scopes for the session
   72  	 * @param accountType The account type for the session

   79  				"comment": "Used to determine the usage of the Microsoft Auth Provider.",
   80  				"scopes": { "classification": "PublicNonPersonalData", "purpose": "FeatureInsight", "comment": "Used to determine what scope combinations are being requested." },
   81  				"accountType": { "classification": "PublicNonPersonalData", "purpose": "FeatureInsight", "comment": "Used to determine what account types are being used." }
   82  			}
   83  		*/
   84: 		this._telemetryReporter.sendTelemetryEvent('account', {
   85: 			// Get rid of guids from telemetry.
   86  			scopes: JSON.stringify(this._scrubGuids(scopes)),
   87  			accountType
   88  		});
   89  	}
   90

  100  				"owner": "TylerLeonhardt",
  101  				"comment": "Used to determine the usage of the Microsoft Auth Provider.",
  102  				"scopes": { "classification": "PublicNonPersonalData", "purpose": "FeatureInsight", "comment": "Used to determine what scope combinations are being requested." }
  103  			}
  104  		*/
  105: 		this._telemetryReporter.sendTelemetryEvent('loginMicrosoftSovereignCloud', {
  106: 			// Get rid of guids from telemetry.
  107  			scopes: JSON.stringify(this._scrubGuids(scopes)),
  108  		});
  109  	}
  110  	override sendLoginFailedEvent(): void {
  111  		/* __GDPR__
  112  			"loginMicrosoftSovereignCloudFailed" : { "owner": "TylerLeonhardt", "comment": "Used to determine how often users run into issues with the login flow." }
  113  		*/
  114: 		this._telemetryReporter.sendTelemetryEvent('loginMicrosoftSovereignCloudFailed');
  115  	}
  116  	override sendLogoutEvent(): void {
  117  		/* __GDPR__
  118  			"logoutMicrosoftSovereignCloud" : { "owner": "TylerLeonhardt", "comment": "Used to determine how often users log out." }
  119  		*/
  120: 		this._telemetryReporter.sendTelemetryEvent('logoutMicrosoftSovereignCloud');
  121  	}
  122  	override sendLogoutFailedEvent(): void {
  123  		/* __GDPR__
  124  			"logoutMicrosoftSovereignCloudFailed" : { "owner": "TylerLeonhardt", "comment": "Used to determine how often fail to log out." }
  125  		*/
  126: 		this._telemetryReporter.sendTelemetryEvent('logoutMicrosoftSovereignCloudFailed');
  127  	}
  128  }
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\extensions\microsoft-authentication\Source\node\authProvider.ts:

```sh
    7  import { Environment } from '@azure/ms-rest-azure-env';
    8  import { CachedPublicClientApplicationManager } from './publicClientCache';
    9  import { UriHandlerLoopbackClient } from '../common/loopbackClientAndOpener';
   10  import { UriEventHandler } from '../UriEventHandler';
   11  import { ICachedPublicClientApplication } from '../common/publicClientCache';
   12: import { MicrosoftAccountType, MicrosoftAuthenticationTelemetryReporter } from '../common/telemetryReporter';
   13  import { loopbackTemplate } from './loopbackTemplate';
   14  import { ScopeData } from '../common/scopeData';
   15
   16  const redirectUri = 'https://vscode.dev/redirect';
   17  const MSA_TID = '9188040d-6c67-4c5b-b112-36a304b66dad';

   40  	 */
   41  	onDidChangeSessions = this._onDidChangeSessionsEmitter.event;
   42
   43  	constructor(
   44  		context: ExtensionContext,
   45: 		private readonly _telemetryReporter: MicrosoftAuthenticationTelemetryReporter,
   46  		private readonly _logger: LogOutputChannel,
   47  		private readonly _uriHandler: UriEventHandler,
   48  		private readonly _env: Environment = Environment.AzureCloud
   49  	) {
   50  		this._disposables = context.subscriptions;

   60  	}
   61
   62  	async initialize(): Promise<void> {
   63  		await this._publicClientManager.initialize();
   64
   65: 		// Send telemetry for existing accounts
   66  		for (const cachedPca of this._publicClientManager.getAll()) {
   67  			for (const account of cachedPca.accounts) {
   68  				if (!account.idTokenClaims?.tid) {
   69  					continue;
   70  				}
   71  				const tid = account.idTokenClaims.tid;
   72  				const type = tid === MSA_TID || tid === MSA_PASSTHRU_TID ? MicrosoftAccountType.MSA : MicrosoftAccountType.AAD;
   73: 				this._telemetryReporter.sendAccountEvent([], type);
   74  			}
   75  		}
   76  	}
   77
   78  	/**

  143  						detail: l10n.t('Would you like to try a different way to sign in to your Microsoft account? ({0})', 'protocol handler')
  144  					},
  145  					yes
  146  				);
  147  				if (!result) {
  148: 					this._telemetryReporter.sendLoginFailedEvent();
  149  					throw e;
  150  				}
  151  			}
  152  			// This error comes from the backend and is likely not due to the user's machine
  153  			// failing to open a port or something local that would require us to try the
  154  			// URL handler loopback client.
  155  			if (e instanceof ServerError) {
  156: 				this._telemetryReporter.sendLoginFailedEvent();
  157  				throw e;
  158  			}
  159  			const loopbackClient = new UriHandlerLoopbackClient(this._uriHandler, redirectUri);
  160  			try {
  161  				result = await cachedPca.acquireTokenInteractive({
  162  					openBrowser: (url: string) => loopbackClient.openBrowser(url),
  163  					scopes: scopeData.scopesToSend,
  164  					loopbackClient
  165  				});
  166  			} catch (e) {
  167: 				this._telemetryReporter.sendLoginFailedEvent();
  168  				throw e;
  169  			}
  170  		}
  171
  172  		const session = this.toAuthenticationSession(result, scopeData.originalScopes);
  173: 		this._telemetryReporter.sendLoginEvent(session.scopes);
  174  		this._logger.info('[createSession]', scopeData.scopeStr, 'returned session');
  175  		return session;
  176  	}
  177
  178  	async removeSession(sessionId: string): Promise<void> {
  179  		this._logger.info('[removeSession]', sessionId, 'starting');
  180  		for (const cachedPca of this._publicClientManager.getAll()) {
  181  			const accounts = cachedPca.accounts;
  182  			for (const account of accounts) {
  183  				if (account.homeAccountId === sessionId) {
  184: 					this._telemetryReporter.sendLogoutEvent();
  185  					try {
  186  						await cachedPca.removeAccount(account);
  187  					} catch (e) {
  188: 						this._telemetryReporter.sendLogoutFailedEvent();
  189  						throw e;
  190  					}
  191  					this._logger.info('[removeSession]', sessionId, 'removed session');
  192  					return;
  193  				}
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\extensions\typescript-language-features\Source\experimentationService.ts:

```sh
  10
  11  type ExperimentTypes = {};
  12
  13  export class ExperimentationService {
  14  	private readonly _experimentationServicePromise: Promise<tas.IExperimentationService>;
  15: 	private readonly _telemetryReporter: IExperimentationTelemetryReporter;
  16
  17  	constructor(
  18: 		telemetryReporter: IExperimentationTelemetryReporter,
  19  		id: string,
  20  		version: string,
  21  		globalState: vscode.Memento,
  22  	) {
  23: 		this._telemetryReporter = telemetryReporter;
  24  		this._experimentationServicePromise = createTasExperimentationService(
  25: 			this._telemetryReporter,
  26  			id,
  27  			version,
  28  			globalState,
  29  		);
  30  	}
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\extensions\typescript-language-features\Source\experimentTelemetryReporter.ts:

```sh
   1  /*---------------------------------------------------------------------------------------------
   2   *  Copyright (c) Microsoft Corporation. All rights reserved.
   3   *  Licensed under the MIT License. See License.txt in the project root for license information.
   4   *--------------------------------------------------------------------------------------------*/
   5
   6: import type VsCodeTelemetryReporter from "@vscode/extension-telemetry";
   7  import type * as vscode from "vscode";
   8  import type * as tas from "vscode-tas-client";
   9
  10  export interface IExperimentationTelemetryReporter
  11  	extends tas.IExperimentationTelemetry,
  12  		vscode.Disposable {
  13  	postEventObj(eventName: string, props: { [prop: string]: string }): void;
  14  }
  15
  16  /**
  17:  * This reporter *supports* experimentation telemetry,
  18   * but will only do so when passed to an {@link ExperimentationService}.
  19   */
  20
  21  export class ExperimentationTelemetryReporter
  22  	implements IExperimentationTelemetryReporter
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\extensions\typescript-language-features\Source\extension.browser.ts:

```sh
  1  /*---------------------------------------------------------------------------------------------
  2   *  Copyright (c) Microsoft Corporation. All rights reserved.
  3   *  Licensed under the MIT License. See License.txt in the project root for license information.
  4   *--------------------------------------------------------------------------------------------*/
  5
  6: import VsCodeTelemetryReporter from '@vscode/extension-telemetry';
  7  import * as vscode from 'vscode';
  8  import { Api, getExtensionApi } from './api';
  9  import { CommandManager } from './commands/commandManager';
  10  import { registerBaseCommands } from './commands/index';
  11  import { TypeScriptServiceConfiguration } from './configuration/configuration';
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\extensions\typescript-language-features\Source\extension.ts:

```sh
  2   *  Copyright (c) Microsoft Corporation. All rights reserved.
  3   *  Licensed under the MIT License. See License.txt in the project root for license information.
  4   *--------------------------------------------------------------------------------------------*/
  5
  6  import * as fs from "fs";
  7: import VsCodeTelemetryReporter from "@vscode/extension-telemetry";
  8  import * as vscode from "vscode";
  9  import { type Api, getExtensionApi } from "./api";
  10  import { CommandManager } from "./commands/commandManager";
  11  import { registerBaseCommands } from "./commands/index";
  12  import { ElectronServiceConfigurationProvider } from "./configuration/configuration.electron";
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\extensions\typescript-language-features\Source\languageProvider.ts:

```sh
   10  import * as fileSchemes from "./configuration/fileSchemes";
   11  import type { LanguageDescription } from "./configuration/languageDescription";
   12  import { Schemes } from "./configuration/schemes";
   13  import { DiagnosticKind } from "./languageFeatures/diagnostics";
   14  import type FileConfigurationManager from "./languageFeatures/fileConfigurationManager";
   15: import type { TelemetryReporter } from "./logging/telemetry";
   16  import { CachedResponse } from "./tsServer/cachedResponse";
   17  import { ClientCapability } from "./typescriptService";
   18  import type TypeScriptServiceClient from "./typescriptServiceClient";
   19  import type TypingsStatus from "./ui/typingsStatus";
   20  import { Disposable } from "./utils/dispose";

   30  export default class LanguageProvider extends Disposable {
   31  	constructor(
   32  		private readonly client: TypeScriptServiceClient,
   33  		private readonly description: LanguageDescription,
   34  		private readonly commandManager: CommandManager,
   35: 		private readonly telemetryReporter: TelemetryReporter,
   36  		private readonly typingsStatus: TypingsStatus,
   37  		private readonly fileConfigurationManager: FileConfigurationManager,
   38  		private readonly onCompletionAccepted: (
   39  			item: vscode.CompletionItem,
   40  		) => void,

  101  						this.description,
  102  						this.client,
  103  						this.typingsStatus,
  104  						this.fileConfigurationManager,
  105  						this.commandManager,
  106: 						this.telemetryReporter,
  107  						this.onCompletionAccepted,
  108  					),
  109  				),
  110  			),
  111  			import("./languageFeatures/copyPaste").then((provider) =>

  177  					provider.register(
  178  						selector,
  179  						this.description,
  180  						this.client,
  181  						this.fileConfigurationManager,
  182: 						this.telemetryReporter,
  183  					),
  184  				),
  185  			),
  186  			import("./languageFeatures/jsDocCompletions").then((provider) =>
  187  				this._register(

  205  					provider.register(
  206  						selector,
  207  						this.client,
  208  						this.commandManager,
  209  						this.fileConfigurationManager,
  210: 						this.telemetryReporter,
  211  					),
  212  				),
  213  			),
  214  			import("./languageFeatures/quickFix").then((provider) =>
  215  				this._register(

  217  						selector,
  218  						this.client,
  219  						this.fileConfigurationManager,
  220  						this.commandManager,
  221  						this.client.diagnosticsManager,
  222: 						this.telemetryReporter,
  223  					),
  224  				),
  225  			),
  226  			import("./languageFeatures/refactor").then((provider) =>
  227  				this._register(

  229  						selector,
  230  						this.client,
  231  						cachedNavTreeResponse,
  232  						this.fileConfigurationManager,
  233  						this.commandManager,
  234: 						this.telemetryReporter,
  235  					),
  236  				),
  237  			),
  238  			import("./languageFeatures/references").then((provider) =>
  239  				this._register(provider.register(selector, this.client)),
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\extensions\typescript-language-features\Source\typescriptService.ts:

```sh
    3   *  Licensed under the MIT License. See License.txt in the project root for license information.
    4   *--------------------------------------------------------------------------------------------*/
    5
    6  import type * as vscode from "vscode";
    7  import type { TypeScriptServiceConfiguration } from "./configuration/configuration";
    8: import type { TelemetryReporter } from "./logging/telemetry";
    9  import type { API } from "./tsServer/api";
   10  import type BufferSyncSupport from "./tsServer/bufferSyncSupport";
   11  import type { PluginManager } from "./tsServer/plugins";
   12  import type * as Proto from "./tsServer/protocol/protocol";
   13  import type { ExecutionTarget } from "./tsServer/server";

  266  	readonly apiVersion: API;
  267
  268  	readonly pluginManager: PluginManager;
  269  	readonly configuration: TypeScriptServiceConfiguration;
  270  	readonly bufferSyncSupport: BufferSyncSupport;
  271: 	readonly telemetryReporter: TelemetryReporter;
  272
  273  	execute<K extends keyof StandardTsServerRequests>(
  274  		command: K,
  275  		args: StandardTsServerRequests[K][0],
  276  		token: vscode.CancellationToken,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\extensions\typescript-language-features\Source\typescriptServiceClient.ts:

```sh
     9  import * as fileSchemes from './configuration/fileSchemes';
    10  import { Schemes } from './configuration/schemes';
    11  import { IExperimentationTelemetryReporter } from './experimentTelemetryReporter';
    12  import { DiagnosticKind, DiagnosticsManager } from './languageFeatures/diagnostics';
    13  import { Logger } from './logging/logger';
    14: import { TelemetryProperties, TelemetryReporter, VSCodeTelemetryReporter } from './logging/telemetry';
    15  import Tracer from './logging/tracer';
    16  import { ProjectType, inferredProjectCompilerOptions } from './tsconfig';
    17  import { API } from './tsServer/api';
    18  import BufferSyncSupport from './tsServer/bufferSyncSupport';
    19  import { OngoingRequestCancellerFactory } from './tsServer/cancellation';

   132  	private hasServerFatallyCrashedTooManyTimes = false;
   133  	private readonly loadingIndicator = this._register(
   134  		new ServerInitializingIndicator(),
   135  	);
   136
   137: 	public readonly telemetryReporter: TelemetryReporter;
   138  	public readonly bufferSyncSupport: BufferSyncSupport;
   139  	public readonly diagnosticsManager: DiagnosticsManager;
   140  	public readonly pluginManager: PluginManager;
   141
   142  	private readonly logDirectoryProvider: ILogDirectoryProvider;

   277  			},
   278  			this,
   279  			this._disposables,
   280  		);
   281
   282: 		this.telemetryReporter = new VSCodeTelemetryReporter(
   283  			services.experimentTelemetryReporter,
   284  			() => {
   285  				if (this.serverState.type === ServerState.Type.Running) {
   286  					if (this.serverState.tsserverVersion) {
   287  						return this.serverState.tsserverVersion;

   292  		);
   293
   294  		this.diagnosticsManager = new DiagnosticsManager(
   295  			"typescript",
   296  			this._configuration,
   297: 			this.telemetryReporter,
   298  			onCaseInsensitiveFileSystem,
   299  		);
   300  		this.typescriptServerSpawner = new TypeScriptServerSpawner(
   301  			this.versionProvider,
   302  			this._versionManager,
   303  			this._nodeVersionManager,
   304  			this.logDirectoryProvider,
   305  			this.pluginPathsProvider,
   306  			this.logger,
   307: 			this.telemetryReporter,
   308  			this.tracer,
   309  			this.processFactory,
   310  		);
   311
   312  		this._register(

   492  	private error(message: string, ...data: any[]): void {
   493  		this.logger.error(message, ...data);
   494  	}
   495
   496  	private logTelemetry(eventName: string, properties?: TelemetryProperties) {
   497: 		this.telemetryReporter.logTelemetry(eventName, properties);
   498  	}
   499
   500  	public ensureServiceStarted() {
   501  		if (this.serverState.type !== ServerState.Type.Running) {
   502  			this.startService();

  1260  				"command" : { "classification": "SystemMetaData", "purpose": "FeatureInsight" }
  1261  			}
  1262  		*/
  1263  		this.logTelemetry("fatalError", {
  1264  			...(error instanceof TypeScriptServerError
  1265: 				? error.telemetry
  1266  				: { command }),
  1267  		});
  1268  		console.error(
  1269  			`A non-recoverable error occurred while executing tsserver command: ${command}`,
  1270  		);

  1305  			}
  1306  			case EventName.configFileDiag:
  1307  				this._onConfigDiagnosticsReceived.fire(event as Proto.ConfigFileDiagnosticEvent);
  1308  				return;
  1309
  1310: 			case EventName.telemetry: {
  1311  				const body = (event as Proto.TelemetryEvent).body;
  1312  				this.dispatchTelemetryEvent(body);
  1313  				return;
  1314  			}
  1315  			case EventName.projectLanguageServiceState: {

  1521  		const existing = this.watches.get(id);
  1522  		existing?.dispose();
  1523  	}
  1524
  1525  	private dispatchTelemetryEvent(
  1526: 		telemetryData: Proto.TelemetryEventBody,
  1527  	): void {
  1528  		const properties: { [key: string]: string } = Object.create(null);
  1529: 		switch (telemetryData.telemetryEventName) {
  1530  			case "typingsInstalled": {
  1531  				const typingsInstalledPayload: Proto.TypingsInstalledTelemetryEventPayload =
  1532: 					telemetryData.payload as Proto.TypingsInstalledTelemetryEventPayload;
  1533  				properties["installedPackages"] =
  1534  					typingsInstalledPayload.installedPackages;
  1535
  1536  				if (
  1537  					typeof typingsInstalledPayload.installSuccess === "boolean"

  1547  						typingsInstalledPayload.typingsInstallerVersion;
  1548  				}
  1549  				break;
  1550  			}
  1551  			default: {
  1552: 				const payload = telemetryData.payload;
  1553  				if (payload) {
  1554  					Object.keys(payload).forEach((key) => {
  1555  						try {
  1556  							if (payload.hasOwnProperty(key)) {
  1557  								properties[key] =

  1567  				break;
  1568  			}
  1569  		}
  1570
  1571  		// Add plugin data here
  1572: 		if (telemetryData.telemetryEventName === 'projectInfo') {
  1573  			if (this.serverState.type === ServerState.Type.Running) {
  1574  				this.serverState.updateTsserverVersion(properties["version"]);
  1575  			}
  1576  		}
  1577

  1585  					"${TypeScriptCommonProperties}"
  1586  				]
  1587  			}
  1588  		*/
  1589  		// __GDPR__COMMENT__: Other events are defined by TypeScript.
  1590: 		this.logTelemetry(telemetryData.telemetryEventName, properties);
  1591  	}
  1592
  1593  	private configurePlugin(pluginName: string, configuration: {}): any {
  1594  		this.executeWithoutWaitingForResponse('configurePlugin', { pluginName, configuration });
  1595  	}
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\extensions\typescript-language-features\Source\typeScriptServiceClientHost.ts:

```sh
  141  		for (const description of descriptions) {
  142  			const manager = new LanguageProvider(
  143  				this.client,
  144  				description,
  145  				this.commandManager,
  146: 				this.client.telemetryReporter,
  147  				this.typingsStatus,
  148  				this.fileConfigurationManager,
  149  				onCompletionAccepted,
  150  			);
  151  			this.languages.push(manager);

  226  	) {
  227  		const manager = new LanguageProvider(
  228  			this.client,
  229  			description,
  230  			this.commandManager,
  231: 			this.client.telemetryReporter,
  232  			this.typingsStatus,
  233  			this.fileConfigurationManager,
  234  			onCompletionAccepted,
  235  		);
  236  		this.languages.push(manager);
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\extensions\typescript-language-features\Source\languageFeatures\completions.ts:

```sh
     5
     6  import * as vscode from "vscode";
     7  import type { Command, CommandManager } from "../commands/commandManager";
     8  import type { DocumentSelector } from "../configuration/documentSelector";
     9  import type { LanguageDescription } from "../configuration/languageDescription";
    10: import type { TelemetryReporter } from "../logging/telemetry";
    11  import { API } from "../tsServer/api";
    12  import { parseKindModifier } from "../tsServer/protocol/modifiers";
    13  import type * as Proto from "../tsServer/protocol/protocol";
    14  import * as PConst from "../tsServer/protocol/protocol.const";
    15  import * as typeConverters from "../typeConverters";

   672
   673  	public constructor(
   674  		private readonly onCompletionAccepted: (
   675  			item: vscode.CompletionItem,
   676  		) => void,
   677: 		private readonly telemetryReporter: TelemetryReporter,
   678  	) {}
   679
   680  	public execute(item: vscode.CompletionItem) {
   681  		this.onCompletionAccepted(item);
   682  		if (item instanceof MyCompletionItem) {

   688  					"${include}": [
   689  						"${TypeScriptCommonProperties}"
   690  					]
   691  				}
   692  			*/
   693: 			this.telemetryReporter.logTelemetry("completions.accept", {
   694  				isPackageJsonImport: item.tsEntry.isPackageJsonImport
   695  					? "true"
   696  					: undefined,
   697  				isImportStatementCompletion: item.tsEntry
   698  					.isImportStatementCompletion

   844  		private readonly client: ITypeScriptServiceClient,
   845  		private readonly language: LanguageDescription,
   846  		private readonly typingsStatus: TypingsStatus,
   847  		private readonly fileConfigurationManager: FileConfigurationManager,
   848  		commandManager: CommandManager,
   849: 		private readonly telemetryReporter: TelemetryReporter,
   850  		onCompletionAccepted: (item: vscode.CompletionItem) => void,
   851  	) {
   852  		commandManager.register(
   853  			new ApplyCompletionCodeActionCommand(this.client),
   854  		);
   855  		commandManager.register(
   856  			new CompletionAcceptedCommand(
   857  				onCompletionAccepted,
   858: 				this.telemetryReporter,
   859  			),
   860  		);
   861  		commandManager.register(new ApplyCompletionCommand(this.client));
   862  	}
   863

  1056  				"${include}": [
  1057  					"${TypeScriptCommonProperties}"
  1058  				]
  1059  			}
  1060  		*/
  1061: 		this.telemetryReporter.logTelemetry("completions.execute", {
  1062  			duration: String(duration),
  1063  			type: response?.type ?? "unknown",
  1064  			flags:
  1065  				response?.type === "response" &&
  1066  				typeof response.body?.flags === "number"

  1170  	language: LanguageDescription,
  1171  	client: ITypeScriptServiceClient,
  1172  	typingsStatus: TypingsStatus,
  1173  	fileConfigurationManager: FileConfigurationManager,
  1174  	commandManager: CommandManager,
  1175: 	telemetryReporter: TelemetryReporter,
  1176  	onCompletionAccepted: (item: vscode.CompletionItem) => void,
  1177  ) {
  1178  	return conditionalRegistration(
  1179  		[
  1180  			requireSomeCapability(

  1190  					client,
  1191  					language,
  1192  					typingsStatus,
  1193  					fileConfigurationManager,
  1194  					commandManager,
  1195: 					telemetryReporter,
  1196  					onCompletionAccepted,
  1197  				),
  1198  				...TypeScriptCompletionItemProvider.triggerCharacters,
  1199  			);
  1200  		},
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\extensions\typescript-language-features\Source\languageFeatures\diagnostics.ts:

```sh
    4   *--------------------------------------------------------------------------------------------*/
    5
    6  import * as vscode from "vscode";
    7  import type { TypeScriptServiceConfiguration } from "../configuration/configuration";
    8  import type { DiagnosticLanguage } from "../configuration/languageDescription";
    9: import type { TelemetryReporter } from "../logging/telemetry";
   10  // @ts-expect-error until ts 5.6
   11  import type { DiagnosticPerformanceData as TsDiagnosticPerformanceData } from "../tsServer/protocol/protocol";
   12  import * as arrays from "../utils/arrays";
   13  import { Disposable } from "../utils/dispose";
   14  import { equals } from "../utils/objects";

  228  	private readonly _diagnosticCodesMap = new Map<number, number>();
  229  	private readonly _diagnosticSnapshotsMap = new ResourceMap<
  230  		readonly vscode.Diagnostic[]
  231  	>((uri) => uri.toString(), { onCaseInsensitiveFileSystem: false });
  232  	private _timeout: NodeJS.Timeout | undefined;
  233: 	private _telemetryEmitter: NodeJS.Timeout | undefined;
  234
  235  	constructor(
  236: 		private readonly _telemetryReporter: TelemetryReporter,
  237  		private readonly _diagnosticsCollection: vscode.DiagnosticCollection,
  238  	) {
  239  		super();
  240  		this._register(
  241  			vscode.workspace.onDidChangeTextDocument((e) => {

  266  					"${include}": [
  267  						"${TypeScriptCommonProperties}"
  268  					]
  269  				}
  270  			*/
  271: 			this._telemetryReporter.logTelemetry("diagnostics.performance", {
  272  				// @ts-expect-error until ts 5.6
  273  				syntaxDiagDuration: data.syntaxDiag,
  274  				// @ts-expect-error until ts 5.6
  275  				semanticDiagDuration: data.semanticDiag,
  276  				// @ts-expect-error until ts 5.6

  317  			});
  318  		});
  319  	}
  320
  321  	private _registerTelemetryEventEmitter() {
  322: 		this._telemetryEmitter = setInterval(
  323  			() => {
  324  				if (this._diagnosticCodesMap.size > 0) {
  325  					let diagnosticCodes = "";
  326  					this._diagnosticCodesMap.forEach((value, key) => {
  327  						diagnosticCodes += `${key}:${value},`;

  334  						"${include}": [
  335  							"${TypeScriptCommonProperties}"
  336  						]
  337  					}
  338  				*/
  339: 					this._telemetryReporter.logTelemetry(
  340  						"typescript.diagnostics",
  341  						{
  342  							diagnosticCodes: diagnosticCodes,
  343  						},
  344  					);

  349  	}
  350
  351  	override dispose() {
  352  		super.dispose();
  353  		clearTimeout(this._timeout);
  354: 		clearInterval(this._telemetryEmitter);
  355  	}
  356  }
  357
  358  export class DiagnosticsManager extends Disposable {
  359  	private readonly _diagnostics: ResourceMap<FileDiagnostics>;

  368  		| undefined;
  369
  370  	constructor(
  371  		owner: string,
  372  		configuration: TypeScriptServiceConfiguration,
  373: 		telemetryReporter: TelemetryReporter,
  374  		onCaseInsensitiveFileSystem: boolean,
  375  	) {
  376  		super();
  377  		this._diagnostics = new ResourceMap<FileDiagnostics>(undefined, {
  378  			onCaseInsensitiveFileSystem,

  382  		});
  383
  384  		this._currentDiagnostics = this._register(
  385  			vscode.languages.createDiagnosticCollection(owner),
  386  		);
  387: 		// Here we are selecting only 1 user out of 1000 to send telemetry diagnostics
  388  		if (
  389  			Math.random() * 1000 <= 1 ||
  390  			configuration.enableDiagnosticsTelemetry
  391  		) {
  392  			this._diagnosticsTelemetryManager = this._register(
  393  				new DiagnosticsTelemetryManager(
  394: 					telemetryReporter,
  395  					this._currentDiagnostics,
  396  				),
  397  			);
  398  		}
  399  	}
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\extensions\typescript-language-features\Source\languageFeatures\inlayHints.ts:

```sh
    4   *--------------------------------------------------------------------------------------------*/
    5
    6  import * as vscode from "vscode";
    7  import type { DocumentSelector } from "../configuration/documentSelector";
    8  import type { LanguageDescription } from "../configuration/languageDescription";
    9: import type { TelemetryReporter } from "../logging/telemetry";
   10  import { API } from "../tsServer/api";
   11  import type * as Proto from "../tsServer/protocol/protocol";
   12  import { Location, Position } from "../typeConverters";
   13  import {
   14  	ClientCapability,

   51
   52  	constructor(
   53  		private readonly language: LanguageDescription,
   54  		private readonly client: ITypeScriptServiceClient,
   55  		private readonly fileConfigurationManager: FileConfigurationManager,
   56: 		private readonly telemetryReporter: TelemetryReporter,
   57  	) {
   58  		super();
   59
   60  		this._register(
   61  			vscode.workspace.onDidChangeConfiguration((e) => {

  113  					"${include}": [
  114  						"${TypeScriptCommonProperties}"
  115  					]
  116  				}
  117  			*/
  118: 			this.telemetryReporter.logTelemetry("inlayHints.provide", {});
  119  		}
  120
  121  		const response = await this.client.execute(
  122  			"provideInlayHints",
  123  			{ file: filepath, start, length },

  201  export function register(
  202  	selector: DocumentSelector,
  203  	language: LanguageDescription,
  204  	client: ITypeScriptServiceClient,
  205  	fileConfigurationManager: FileConfigurationManager,
  206: 	telemetryReporter: TelemetryReporter,
  207  ) {
  208  	return conditionalRegistration(
  209  		[
  210  			requireMinVersion(client, TypeScriptInlayHintsProvider.minVersion),
  211  			requireSomeCapability(client, ClientCapability.Semantic),

  213  		() => {
  214  			const provider = new TypeScriptInlayHintsProvider(
  215  				language,
  216  				client,
  217  				fileConfigurationManager,
  218: 				telemetryReporter,
  219  			);
  220  			return vscode.languages.registerInlayHintsProvider(
  221  				selector.semantic,
  222  				provider,
  223  			);
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\extensions\typescript-language-features\Source\languageFeatures\organizeImports.ts:

```sh
    4   *--------------------------------------------------------------------------------------------*/
    5
    6  import * as vscode from "vscode";
    7  import type { Command, CommandManager } from "../commands/commandManager";
    8  import type { DocumentSelector } from "../configuration/documentSelector";
    9: import type { TelemetryReporter } from "../logging/telemetry";
   10  import { API } from "../tsServer/api";
   11  import type * as Proto from "../tsServer/protocol/protocol";
   12  import { OrganizeImportsMode } from "../tsServer/protocol/protocol.const";
   13  import * as typeConverters from "../typeConverters";
   14  import {

   59
   60  class DidOrganizeImportsCommand implements Command {
   61  	public static readonly ID = "_typescript.didOrganizeImports";
   62  	public readonly id = DidOrganizeImportsCommand.ID;
   63
   64: 	constructor(private readonly telemetryReporter: TelemetryReporter) {}
   65
   66  	public async execute(): Promise<any> {
   67  		/* __GDPR__
   68  			"organizeImports.execute" : {
   69  				"owner": "mjbvz",
   70  				"${include}": [
   71  					"${TypeScriptCommonProperties}"
   72  				]
   73  			}
   74  		*/
   75: 		this.telemetryReporter.logTelemetry("organizeImports.execute", {});
   76  	}
   77  }
   78
   79  class ImportCodeAction extends vscode.CodeAction {
   80  	constructor(

   92  	constructor(
   93  		private readonly client: ITypeScriptServiceClient,
   94  		private readonly commandMetadata: OrganizeImportsCommandMetadata,
   95  		commandManager: CommandManager,
   96  		private readonly fileConfigManager: FileConfigurationManager,
   97: 		telemetryReporter: TelemetryReporter,
   98  	) {
   99  		commandManager.register(
  100: 			new DidOrganizeImportsCommand(telemetryReporter),
  101  		);
  102  	}
  103
  104  	public provideCodeActions(
  105  		document: vscode.TextDocument,

  187  export function register(
  188  	selector: DocumentSelector,
  189  	client: ITypeScriptServiceClient,
  190  	commandManager: CommandManager,
  191  	fileConfigurationManager: FileConfigurationManager,
  192: 	telemetryReporter: TelemetryReporter,
  193  ): vscode.Disposable {
  194  	const disposables: vscode.Disposable[] = [];
  195
  196  	for (const command of [
  197  		organizeImportsCommand,

  211  					const provider = new ImportsCodeActionProvider(
  212  						client,
  213  						command,
  214  						commandManager,
  215  						fileConfigurationManager,
  216: 						telemetryReporter,
  217  					);
  218  					return vscode.Disposable.from(
  219  						vscode.languages.registerCodeActionsProvider(
  220  							selector.semantic,
  221  							provider,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\extensions\typescript-language-features\Source\languageFeatures\quickFix.ts:

```sh
    4   *--------------------------------------------------------------------------------------------*/
    5
    6  import * as vscode from "vscode";
    7  import type { Command, CommandManager } from "../commands/commandManager";
    8  import type { DocumentSelector } from "../configuration/documentSelector";
    9: import type { TelemetryReporter } from "../logging/telemetry";
   10  import * as fixNames from "../tsServer/protocol/fixNames";
   11  import type * as Proto from "../tsServer/protocol/protocol";
   12  import * as typeConverters from "../typeConverters";
   13  import {
   14  	ClientCapability,

   46  	public readonly id = ApplyCodeActionCommand.ID;
   47
   48  	constructor(
   49  		private readonly client: ITypeScriptServiceClient,
   50  		private readonly diagnosticManager: DiagnosticsManager,
   51: 		private readonly telemetryReporter: TelemetryReporter,
   52  	) {}
   53
   54  	public async execute({
   55  		document,
   56  		action,

   64  				"${include}": [
   65  					"${TypeScriptCommonProperties}"
   66  				]
   67  			}
   68  		*/
   69: 		this.telemetryReporter.logTelemetry("quickFix.execute", {
   70  			fixName: action.fixName,
   71  		});
   72
   73  		this.diagnosticManager.deleteDiagnostic(document.uri, diagnostic);
   74  		const codeActionResult = await applyCodeActionCommands(

   89  	public static readonly ID = "_typescript.applyFixAllCodeAction";
   90  	public readonly id = ApplyFixAllCodeAction.ID;
   91
   92  	constructor(
   93  		private readonly client: ITypeScriptServiceClient,
   94: 		private readonly telemetryReporter: TelemetryReporter,
   95  	) {}
   96
   97  	public async execute(args: ApplyFixAllCodeAction_args): Promise<void> {
   98  		/* __GDPR__
   99  			"quickFixAll.execute" : {

  102  				"${include}": [
  103  					"${TypeScriptCommonProperties}"
  104  				]
  105  			}
  106  		*/
  107: 		this.telemetryReporter.logTelemetry("quickFixAll.execute", {
  108  			fixName: args.action.tsAction.fixName,
  109  		});
  110
  111  		if (args.action.combinedResponse) {
  112  			await applyCodeActionCommands(

  266  	constructor(
  267  		private readonly client: ITypeScriptServiceClient,
  268  		private readonly formattingConfigurationManager: FileConfigurationManager,
  269  		commandManager: CommandManager,
  270  		private readonly diagnosticsManager: DiagnosticsManager,
  271: 		telemetryReporter: TelemetryReporter,
  272  	) {
  273  		commandManager.register(new CompositeCommand());
  274  		commandManager.register(
  275  			new ApplyCodeActionCommand(
  276  				client,
  277  				diagnosticsManager,
  278: 				telemetryReporter,
  279  			),
  280  		);
  281  		commandManager.register(
  282: 			new ApplyFixAllCodeAction(client, telemetryReporter),
  283  		);
  284  		commandManager.register(
  285: 			new EditorChatFollowUp(client, telemetryReporter),
  286  		);
  287
  288  		this.supportedCodeActionProvider = new SupportedCodeActionProvider(
  289  			client,
  290  		);

  712  	selector: DocumentSelector,
  713  	client: ITypeScriptServiceClient,
  714  	fileConfigurationManager: FileConfigurationManager,
  715  	commandManager: CommandManager,
  716  	diagnosticsManager: DiagnosticsManager,
  717: 	telemetryReporter: TelemetryReporter,
  718  ) {
  719  	return conditionalRegistration(
  720  		[requireSomeCapability(client, ClientCapability.Semantic)],
  721  		() => {
  722  			return vscode.languages.registerCodeActionsProvider(

  724  				new TypeScriptQuickFixProvider(
  725  					client,
  726  					fileConfigurationManager,
  727  					commandManager,
  728  					diagnosticsManager,
  729: 					telemetryReporter,
  730  				),
  731  				TypeScriptQuickFixProvider.metadata,
  732  			);
  733  		},
  734  	);
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\extensions\typescript-language-features\Source\languageFeatures\refactor.ts:

```sh
     9  import type { Command, CommandManager } from "../commands/commandManager";
    10  import { LearnMoreAboutRefactoringsCommand } from "../commands/learnMoreAboutRefactorings";
    11  import type { DocumentSelector } from "../configuration/documentSelector";
    12  import * as fileSchemes from "../configuration/fileSchemes";
    13  import { Schemes } from "../configuration/schemes";
    14: import type { TelemetryReporter } from "../logging/telemetry";
    15  import { API } from "../tsServer/api";
    16  import type { CachedResponse } from "../tsServer/cachedResponse";
    17  import type * as Proto from "../tsServer/protocol/protocol";
    18  import * as PConst from "../tsServer/protocol/protocol.const";
    19  import * as typeConverters from "../typeConverters";

    58
    59  class DidApplyRefactoringCommand implements Command {
    60  	public static readonly ID = "_typescript.didApplyRefactoring";
    61  	public readonly id = DidApplyRefactoringCommand.ID;
    62
    63: 	constructor(private readonly telemetryReporter: TelemetryReporter) {}
    64
    65  	public async execute(args: DidApplyRefactoringCommand.Args): Promise<void> {
    66  		/* __GDPR__
    67  			"refactor.execute" : {
    68  				"owner": "mjbvz",

    71  				"${include}": [
    72  					"${TypeScriptCommonProperties}"
    73  				]
    74  			}
    75  		*/
    76: 		this.telemetryReporter.logTelemetry("refactor.execute", {
    77  			action: args.action,
    78  			trigger: args.trigger,
    79  		});
    80  	}
    81  }

   662  	constructor(
   663  		private readonly client: ITypeScriptServiceClient,
   664  		private readonly cachedNavTree: CachedResponse<Proto.NavTreeResponse>,
   665  		private readonly formattingOptionsManager: FormattingOptionsManager,
   666  		commandManager: CommandManager,
   667: 		telemetryReporter: TelemetryReporter,
   668  	) {
   669  		const didApplyRefactoringCommand = new DidApplyRefactoringCommand(
   670: 			telemetryReporter,
   671  		);
   672  		commandManager.register(didApplyRefactoringCommand);
   673
   674  		commandManager.register(new CompositeCommand());
   675  		commandManager.register(new SelectRefactorCommand(this.client));

   678  				this.client,
   679  				didApplyRefactoringCommand,
   680  			),
   681  		);
   682  		commandManager.register(
   683: 			new EditorChatFollowUp(this.client, telemetryReporter),
   684  		);
   685  	}
   686
   687  	public static readonly metadata: vscode.CodeActionProviderMetadata = {
   688  		providedCodeActionKinds: [

  1066  	selector: DocumentSelector,
  1067  	client: ITypeScriptServiceClient,
  1068  	cachedNavTree: CachedResponse<Proto.NavTreeResponse>,
  1069  	formattingOptionsManager: FormattingOptionsManager,
  1070  	commandManager: CommandManager,
  1071: 	telemetryReporter: TelemetryReporter,
  1072  ) {
  1073  	return conditionalRegistration(
  1074  		[requireSomeCapability(client, ClientCapability.Semantic)],
  1075  		() => {
  1076  			return vscode.languages.registerCodeActionsProvider(

  1078  				new TypeScriptRefactorProvider(
  1079  					client,
  1080  					cachedNavTree,
  1081  					formattingOptionsManager,
  1082  					commandManager,
  1083: 					telemetryReporter,
  1084  				),
  1085  				TypeScriptRefactorProvider.metadata,
  1086  			);
  1087  		},
  1088  	);
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\extensions\typescript-language-features\Source\languageFeatures\semanticTokens.ts:

```sh
  103  			// cannot convert result's offsets to (line;col) values correctly
  104  			// a new request will come in soon...
  105  			//
  106  			// here we cannot return null, because returning null would remove all semantic tokens.
  107  			// we must throw to indicate that the semantic tokens should not be removed.
  108: 			// using the string busy here because it is not logged to error telemetry if the error text contains busy.
  109
  110  			// as the new request will come in right after our response, we first wait for the document activity to stop
  111  			await waitForDocumentChangesToEnd(document);
  112
  113  			throw new vscode.CancellationError();
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\extensions\typescript-language-features\Source\languageFeatures\util\copilot.ts:

```sh
   3   *  Licensed under the MIT License. See License.txt in the project root for license information.
   4   *--------------------------------------------------------------------------------------------*/
   5
   6  import * as vscode from "vscode";
   7  import type { Command } from "../../commands/commandManager";
   8: import type { TelemetryReporter } from "../../logging/telemetry";
   9  import type * as Proto from "../../tsServer/protocol/protocol";
  10  import * as typeConverters from "../../typeConverters";
  11  import type { ITypeScriptServiceClient } from "../../typescriptService";
  12  import { nulToken } from "../../utils/cancellation";
  13

  15  	public static readonly ID = "_typescript.quickFix.editorChatReplacement2";
  16  	public readonly id = EditorChatFollowUp.ID;
  17
  18  	constructor(
  19  		private readonly client: ITypeScriptServiceClient,
  20: 		private readonly telemetryReporter: TelemetryReporter,
  21  	) {}
  22
  23  	async execute({
  24  		message,
  25  		document,

  34  					"${include}": [
  35  						"${TypeScriptCommonProperties}"
  36  					]
  37  				}
  38  			*/
  39: 			this.telemetryReporter.logTelemetry("aiQuickfix.execute", {
  40  				action: action.quickfix.fixName,
  41  			});
  42  		} else {
  43  			/* __GDPR__
  44  				"aiRefactor.execute" : {

  47  					"${include}": [
  48  						"${TypeScriptCommonProperties}"
  49  					]
  50  				}
  51  			*/
  52: 			this.telemetryReporter.logTelemetry("aiRefactor.execute", {
  53  				action: action.refactor.name,
  54  			});
  55  		}
  56
  57  		const initialRange =
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\extensions\typescript-language-features\Source\tsServer\server.ts:

```sh
    4   *--------------------------------------------------------------------------------------------*/
    5
    6  import { Cancellation } from "@vscode/sync-api-common/lib/common/messageCancellation";
    7  import * as vscode from "vscode";
    8  import type { TypeScriptServiceConfiguration } from "../configuration/configuration";
    9: import type { TelemetryReporter } from "../logging/telemetry";
   10  import type Tracer from "../logging/tracer";
   11  import { CallbackMap } from "../tsServer/callbackMap";
   12  import {
   13  	type RequestItem,
   14  	RequestQueue,

  114  		private readonly _serverSource: ServerType,
  115  		private readonly _process: TsServerProcess,
  116  		private readonly _tsServerLog: TsServerLog | undefined,
  117  		private readonly _requestCanceller: OngoingRequestCanceller,
  118  		private readonly _version: TypeScriptVersion,
  119: 		private readonly _telemetryReporter: TelemetryReporter,
  120  		private readonly _tracer: Tracer,
  121  	) {
  122  		super();
  123
  124  		this._process.onData((msg) => {

  327  									"${TypeScriptCommonProperties}",
  328  									"${TypeScriptRequestErrorProperties}"
  329  								]
  330  							}
  331  						*/
  332: 						this._telemetryReporter.logTelemetry(
  333  							"languageServiceErrorResponse",
  334: 							err.telemetry,
  335  						);
  336  					}
  337  				}
  338
  339  				throw err;
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\extensions\typescript-language-features\Source\tsServer\serverError.ts:

```sh
  42
  43  	public get serverCommand() {
  44  		return this.response.command;
  45  	}
  46
  47: 	public get telemetry() {
  48  		// The "sanitizedstack" has been purged of error messages, paths, and file names (other than tsserver)
  49  		// and, thus, can be classified as SystemMetaData, rather than CallstackOrException.
  50  		/* __GDPR__FRAGMENT__
  51  			"TypeScriptRequestErrorProperties" : {
  52  				"command" : { "classification": "SystemMetaData", "purpose": "FeatureInsight" },

  63  		} as const;
  64  	}
  65
  66  	/**
  67  	 * Given a `errorText` from a tsserver request indicating failure in handling a request,
  68: 	 * prepares a payload for telemetry-logging.
  69  	 */
  70  	private static parseErrorText(response: Proto.Response) {
  71  		const errorText = response.message;
  72  		if (errorText) {
  73  			const errorPrefix = "Error processing request. ";
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\extensions\typescript-language-features\Source\tsServer\spawner.ts:

```sh
    4   *--------------------------------------------------------------------------------------------*/
    5
    6  import * as vscode from 'vscode';
    7  import { SyntaxServerConfiguration, TsServerLogLevel, TypeScriptServiceConfiguration } from '../configuration/configuration';
    8  import { Logger } from '../logging/logger';
    9: import { TelemetryReporter } from '../logging/telemetry';
   10  import Tracer from '../logging/tracer';
   11  import { OngoingRequestCancellerFactory } from '../tsServer/cancellation';
   12  import { ClientCapabilities, ClientCapability, ServerType } from '../typescriptService';
   13  import { memoize } from '../utils/memoize';
   14  import { isWeb, isWebAndHasSharedArrayBuffers } from '../utils/platform';

   47  		private readonly _versionManager: TypeScriptVersionManager,
   48  		private readonly _nodeVersionManager: NodeVersionManager,
   49  		private readonly _logDirectoryProvider: ILogDirectoryProvider,
   50  		private readonly _pluginPathsProvider: TypeScriptPluginPathsProvider,
   51  		private readonly _logger: Logger,
   52: 		private readonly _telemetryReporter: TelemetryReporter,
   53  		private readonly _tracer: Tracer,
   54  		private readonly _factory: TsServerProcessFactory,
   55  	) { }
   56
   57  	public spawn(

  167  			this.kindToServerType(kind),
  168  			process!,
  169  			tsServerLog,
  170  			canceller,
  171  			version,
  172: 			this._telemetryReporter,
  173  			this._tracer);
  174  	}
  175
  176  	private kindToServerType(kind: TsServerProcessKind): ServerType {
  177  		switch (kind) {
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\extensions\typescript-language-features\Source\tsServer\protocol\protocol.const.ts:

```sh
77 syntaxDiag = "syntaxDiag",
78 semanticDiag = "semanticDiag",
79 suggestionDiag = "suggestionDiag",
80 regionSemanticDiag = "regionSemanticDiag",
81 configFileDiag = "configFileDiag",
82: telemetry = "telemetry",
83 projectLanguageServiceState = "projectLanguageServiceState",
84 projectsUpdatedInBackground = "projectsUpdatedInBackground",
85 beginInstallTypes = "beginInstallTypes",
86 endInstallTypes = "endInstallTypes",
87 typesInstallerInitializationFailed = "typesInstallerInitializationFailed",
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\extensions\typescript-language-features\Source\ui\largeProjectStatus.ts:

```sh
    2   *  Copyright (c) Microsoft Corporation. All rights reserved.
    3   *  Licensed under the MIT License. See License.txt in the project root for license information.
    4   *--------------------------------------------------------------------------------------------*/
    5
    6  import * as vscode from "vscode";
    7: import type { TelemetryReporter } from "../logging/telemetry";
    8  import {
    9  	ProjectType,
   10  	isImplicitProjectConfigFile,
   11  	openOrCreateConfig,
   12  } from "../tsconfig";

   19  class ExcludeHintItem {
   20  	public configFileName?: string;
   21  	private readonly _item: vscode.StatusBarItem;
   22  	private _currentHint?: Hint;
   23
   24: 	constructor(private readonly telemetryReporter: TelemetryReporter) {
   25  		this._item = vscode.window.createStatusBarItem(
   26  			"status.typescript.exclude",
   27  			vscode.StatusBarAlignment.Right,
   28  			98 /* to the right of typescript version status (99) */,
   29  		);

   63  				"${include}": [
   64  					"${TypeScriptCommonProperties}"
   65  				]
   66  			}
   67  		*/
   68: 		this.telemetryReporter.logTelemetry("js.hintProjectExcludes");
   69  	}
   70  }
   71
   72  function createLargeProjectMonitorFromTypeScript(
   73  	item: ExcludeHintItem,

  129  }
  130
  131  export function create(client: ITypeScriptServiceClient): vscode.Disposable {
  132  	const toDispose: vscode.Disposable[] = [];
  133
  134: 	const item = new ExcludeHintItem(client.telemetryReporter);
  135  	toDispose.push(
  136  		vscode.commands.registerCommand("js.projectStatus.command", () => {
  137  			if (item.configFileName) {
  138  				onConfigureExcludesSelected(client, item.configFileName);
  139  			}
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\extensions\vscode-api-tests\package.json:

```sh
231 "scmActionButton",
232 "scmSelectedProvider",
233 "scmTextDocument",
234 "scmValidation",
235 "taskPresentationGroup",
236: "telemetry",
237 "terminalDataWriteEvent",
238 "terminalDimensions",
239 "testObserver",
240 "textSearchProvider",
241 "timeline",
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\extensions\vscode-test-resolver\Source\extension.ts:

```sh
  186  					dataFolderName,
  187  				} = getProductConfiguration();
  188  				const commandArgs = [
  189  					"--host=127.0.0.1",
  190  					"--port=0",
  191: 					"--disable-telemetry",
  192  					"--use-host-proxy",
  193  					"--accept-server-license-terms",
  194  				];
  195  				const env = getNewEnv();
  196  				const remoteDataDir =
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\resources\completions\zsh_code:

```sh
12 '(-w --wait)'{-w,--wait}'[wait for the files to be closed before returning]'
13 '--locale=[the locale to use (e.g. en-US or zh-TW)]:locale (e.g. en-US or zh-TW):(de en en-US es fr it ja ko ru zh-CN zh-TW bg hu pt-br tr)'
14 '--user-data-dir[specify the directory that user data is kept in]:directory:_directories'
15 '(- *)'{-v,--version}'[print version]'
16 '(- *)'{-h,--help}'[print usage]'
17: '--telemetry[show all telemetry events which VS code collects]'
18 '--extensions-dir[set the root path for extensions]:root path:_directories'
19 '--list-extensions[list the installed extensions]'
20 '--category[filters installed extension list by category, when using --list-extensions]'
21 '--show-versions[show versions of installed extensions, when using --list-extensions]'
22 '--install-extension[install an extension]:id or path:_files -g "*.vsix(-.)"'
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\scripts\test-integration-esm.bat:

```sh
33 if %errorlevel% neq 0 exit /b %errorlevel%
34
35
36 :: Tests in the extension host
37
38: set API_TESTS_EXTRA_ARGS=--disable-telemetry --skip-welcome --skip-release-notes --crash-reporter-directory=%VSCODECRASHDIR% --logsPath=%VSCODELOGSDIR% --no-cached-data --disable-updates --use-inmemory-secretstorage --disable-extensions --disable-workspace-trust --user-data-dir=%VSCODEUSERDATADIR%
39
40 echo.
41 echo ### API tests (folder)
42 call "%INTEGRATION_TEST_ELECTRON_PATH%" %~dp0\..\extensions\vscode-api-tests\testWorkspace --enable-proposed-api=vscode.vscode-api-tests --extensionDevelopmentPath=%~dp0\..\extensions\vscode-api-tests --extensionTestsPath=%~dp0\..\extensions\vscode-api-tests\out\singlefolder-tests %API_TESTS_EXTRA_ARGS%
43 if %errorlevel% neq 0 exit /b %errorlevel%
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\scripts\test-integration-esm.sh:

```sh
  42  ./scripts/test-esm.sh --runGlob **/*.integrationTest.js "$@"
  43
  44
  45  # Tests in the extension host
  46
  47: API_TESTS_EXTRA_ARGS="--disable-telemetry --skip-welcome --skip-release-notes --crash-reporter-directory=$VSCODECRASHDIR --logsPath=$VSCODELOGSDIR --no-cached-data --disable-updates --use-inmemory-secretstorage --disable-extensions --disable-workspace-trust --user-data-dir=$VSCODEUSERDATADIR"
  48
  49  if [ -z "$INTEGRATION_TEST_APP_NAME" ]; then
  50  	kill_app() { true; }
  51  else
  52  	kill_app() { killall $INTEGRATION_TEST_APP_NAME || true; }
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\scripts\test-integration.bat:

```sh
33 if %errorlevel% neq 0 exit /b %errorlevel%
34
35
36 :: Tests in the extension host
37
38: set API_TESTS_EXTRA_ARGS=--disable-telemetry --skip-welcome --skip-release-notes --crash-reporter-directory=%VSCODECRASHDIR% --logsPath=%VSCODELOGSDIR% --no-cached-data --disable-updates --use-inmemory-secretstorage --disable-extensions --disable-workspace-trust --user-data-dir=%VSCODEUSERDATADIR%
39
40 echo.
41 echo ### API tests (folder)
42 call "%INTEGRATION_TEST_ELECTRON_PATH%" %~dp0\..\extensions\vscode-api-tests\testWorkspace --enable-proposed-api=vscode.vscode-api-tests --extensionDevelopmentPath=%~dp0\..\extensions\vscode-api-tests --extensionTestsPath=%~dp0\..\extensions\vscode-api-tests\out\singlefolder-tests %API_TESTS_EXTRA_ARGS%
43 if %errorlevel% neq 0 exit /b %errorlevel%
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\scripts\test-integration.sh:

```sh
  39  echo
  40  ./scripts/test.sh --runGlob **/*.integrationTest.js "$@"
  41
  42  # Tests in the extension host
  43
  44: API_TESTS_EXTRA_ARGS="--disable-telemetry --skip-welcome --skip-release-notes --crash-reporter-directory=$VSCODECRASHDIR --logsPath=$VSCODELOGSDIR --no-cached-data --disable-updates --use-inmemory-secretstorage --disable-extensions --disable-workspace-trust --user-data-dir=$VSCODEUSERDATADIR"
  45
  46  if [ -z "$INTEGRATION_TEST_APP_NAME" ]; then
  47  	kill_app() { true; }
  48  else
  49  	kill_app() { killall $INTEGRATION_TEST_APP_NAME || true; }
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\scripts\test-remote-integration.bat:

```sh
53 echo Storing log files into '%VSCODELOGSDIR%'
54
55
56 :: Tests in the extension host
57
58: set API_TESTS_EXTRA_ARGS=--disable-telemetry --skip-welcome --skip-release-notes --crash-reporter-directory=%VSCODECRASHDIR% --logsPath=%VSCODELOGSDIR% --no-cached-data --disable-updates --use-inmemory-secretstorage --disable-inspect --disable-workspace-trust --user-data-dir=%VSCODEUSERDATADIR%
59
60 echo.
61 echo ### API tests (folder)
62 call "%INTEGRATION_TEST_ELECTRON_PATH%" --folder-uri=%REMOTE_EXT_PATH%/vscode-api-tests/testWorkspace --extensionDevelopmentPath=%REMOTE_EXT_PATH%/vscode-api-tests --extensionTestsPath=%REMOTE_EXT_PATH%/vscode-api-tests/out/singlefolder-tests %API_TESTS_EXTRA_ARGS% %API_TESTS_EXTRA_ARGS_BUILT%
63 if %errorlevel% neq 0 exit /b %errorlevel%
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\scripts\test-remote-integration.sh:

```sh
  64  	kill_app() { true; }
  65  else
  66  	kill_app() { killall $INTEGRATION_TEST_APP_NAME || true; }
  67  fi
  68
  69: API_TESTS_EXTRA_ARGS="--disable-telemetry --skip-welcome --skip-release-notes --crash-reporter-directory=$VSCODECRASHDIR --logsPath=$VSCODELOGSDIR --no-cached-data --disable-updates --use-inmemory-secretstorage --disable-workspace-trust --user-data-dir=$VSCODEUSERDATADIR"
  70
  71  echo "Storing crash reports into '$VSCODECRASHDIR'."
  72  echo "Storing log files into '$VSCODELOGSDIR'."
  73
  74  # Tests in the extension host
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\bootstrap-fork.js:

```sh
  158
  159  	/**
  160  	 * Wraps a console message so that it is transmitted to the renderer.
  161  	 *
  162  	 * The wrapped property is not defined with `writable: false` to avoid
  163: 	 * throwing errors, but rather a no-op setting. See https://github.com/microsoft/vscode-extension-telemetry/issues/88
  164  	 *
  165  	 * @param {'log' | 'info' | 'warn' | 'error'} method
  166  	 * @param {'log' | 'warn' | 'error'} severity
  167  	 */
  168  	function wrapConsoleMethod(method, severity) {
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\tsconfig.monaco.json:

```sh
27 ],
28 "exclude": [
29 "node_modules/*",
30 "vs/platform/files/browser/htmlFileSystemProvider.ts",
31 "vs/platform/files/browser/webFileSystemAccess.ts",
32: "vs/platform/telemetry/*",
33 "vs/platform/assignment/*",
34 "vs/platform/terminal/*",
35 "vs/platform/externalTerminal/*"
36 ]
37 }
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\base\common\errors.ts:

```sh
  270  export class ExpectedError extends Error {
  271  	readonly isExpected = true;
  272  }
  273
  274  /**
  275:  * Error that when thrown won't be logged in telemetry as an unhandled error.
  276   */
  277  export class ErrorNoTelemetry extends Error {
  278  	override readonly name: string;
  279
  280  	constructor(msg?: string) {
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\base\common\product.ts:

```sh
98 readonly settingsSearchBuildId?: number
99 readonly settingsSearchUrl?: string
100
101 readonly tasConfig?: {
102 endpoint: string
103: telemetryEventName: string
104 assignmentContextTelemetryPropertyName: string
105 }
106
107 readonly extensionsGallery?: {
108 readonly serviceUrl: string
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\code\browser\workbench\workbench.ts:

```sh
  218  				const decrypted = JSON.parse(
  219  					await this.crypto.unseal(encrypted),
  220  				);
  221  				return { ...record, ...decrypted };
  222  			} catch (err) {
  223: 				// TODO: send telemetry
  224  				console.error(
  225  					"Failed to decrypt secrets from localStorage",
  226  					err,
  227  				);
  228  				localStorage.removeItem(this._storageKey);
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\code\electron-main\app.ts:

```sh
   164  	ApplicationStorageMainService,
   165  	IApplicationStorageMainService,
   166  	IStorageMainService,
   167  	StorageMainService,
   168  } from "vs/platform/storage/electron-main/storageMainService";
   169: import { resolveCommonProperties } from "vs/platform/telemetry/common/commonProperties";
   170  import {
   171  	ITelemetryService,
   172  	TelemetryLevel,
   173: } from "vs/platform/telemetry/common/telemetry";
   174: import { TelemetryAppenderClient } from "vs/platform/telemetry/common/telemetryIpc";
   175  import {
   176  	ITelemetryServiceConfig,
   177  	TelemetryService,
   178: } from "vs/platform/telemetry/common/telemetryService";
   179  import {
   180  	getPiiPathsFromEnvironment,
   181  	getTelemetryLevel,
   182  	isInternalTelemetry,
   183  	NullTelemetryService,
   184  	supportsTelemetry,
   185: } from "vs/platform/telemetry/common/telemetryUtils";
   186  import {
   187  	resolvedevDeviceId,
   188  	resolveMachineId,
   189  	resolveSqmId,
   190: } from "vs/platform/telemetry/electron-main/telemetryUtils";
   191  import {
   192  	ILocalPtyService,
   193  	LocalReconnectConstants,
   194  	TerminalIpcChannels,
   195  	TerminalSettingId,

  1781  				this.productService,
  1782  				this.configurationService,
  1783  			);
  1784  			const channel = getDelayedChannel(
  1785  				sharedProcessReady.then((client) =>
  1786: 					client.getChannel("telemetryAppender"),
  1787  				),
  1788  			);
  1789  			const appender = new TelemetryAppenderClient(channel);
  1790  			const commonProperties = resolveCommonProperties(
  1791  				release(),

  2331  		return {};
  2332  	}
  2333
  2334  	private async updateCrashReporterEnablement(): Promise<void> {
  2335  		// If enable-crash-reporter argv is undefined then this is a fresh start,
  2336: 		// based on `telemetry.enableCrashreporter` settings, generate a UUID which
  2337  		// will be used as crash reporter id and also update the json file.
  2338
  2339  		try {
  2340  			const argvContent = await this.fileService.readFile(
  2341  				this.environmentMainService.argvResource,
  2342  			);
  2343  			const argvString = argvContent.value.toString();
  2344  			const argvJSON = parse(argvString);
  2345: 			const telemetryLevel = getTelemetryLevel(this.configurationService);
  2346: 			const enableCrashReporter = telemetryLevel >= TelemetryLevel.CRASH;
  2347
  2348  			// Initial startup
  2349  			if (argvJSON["enable-crash-reporter"] === undefined) {
  2350  				const additionalArgvContent = [
  2351  					"",
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\code\electron-main\main.ts:

```sh
106 import { IStateReadService, IStateService } from "vs/platform/state/node/state"
107 import {
108 SaveStrategy,
109 StateService,
110 } from "vs/platform/state/node/stateService"
111: import { NullTelemetryService } from "vs/platform/telemetry/common/telemetryUtils"
112 import {
113 IThemeMainService,
114 ThemeMainService,
115 } from "vs/platform/theme/electron-main/themeMainService"
116 import { ITunnelService } from "vs/platform/tunnel/common/tunnel"
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\code\node\cli.ts:

```sh
  59  		!!argv["list-extensions"] ||
  60  		!!argv["install-extension"] ||
  61  		!!argv["uninstall-extension"] ||
  62  		!!argv["update-extensions"] ||
  63  		!!argv["locate-extension"] ||
  64: 		!!argv["telemetry"]
  65  	);
  66  }
  67
  68  export async function main(argv: string[]): Promise<any> {
  69  	let args: NativeParsedArgs;
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\code\node\cliProcessMain.ts:

```sh
   76  import { RequestService } from "vs/platform/request/node/requestService";
   77  import {
   78  	SaveStrategy,
   79  	StateReadonlyService,
   80  } from "vs/platform/state/node/stateService";
   81: import { resolveCommonProperties } from "vs/platform/telemetry/common/commonProperties";
   82: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   83  import {
   84  	ITelemetryServiceConfig,
   85  	TelemetryService,
   86: } from "vs/platform/telemetry/common/telemetryService";
   87  import {
   88  	getPiiPathsFromEnvironment,
   89  	isInternalTelemetry,
   90  	ITelemetryAppender,
   91  	NullTelemetryService,
   92  	supportsTelemetry,
   93: } from "vs/platform/telemetry/common/telemetryUtils";
   94: import { OneDataSystemAppender } from "vs/platform/telemetry/node/1dsAppender";
   95: import { buildTelemetryMessage } from "vs/platform/telemetry/node/telemetry";
   96  import {
   97  	resolvedevDeviceId,
   98  	resolveMachineId,
   99  	resolveSqmId,
  100: } from "vs/platform/telemetry/node/telemetryUtils";
  101  import { IUriIdentityService } from "vs/platform/uriIdentity/common/uriIdentity";
  102  import { UriIdentityService } from "vs/platform/uriIdentity/common/uriIdentityService";
  103  import { FileUserDataProvider } from "vs/platform/userData/common/fileUserDataProvider";
  104  import {
  105  	IUserDataProfile,

  529  				)
  530  				.locateExtension(this.argv["locate-extension"]);
  531  		}
  532
  533  		// Telemetry
  534: 		else if (this.argv["telemetry"]) {
  535  			console.log(
  536  				await buildTelemetryMessage(
  537  					environmentService.appRoot,
  538  					environmentService.extensionsPath,
  539  				),
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\code\node\sharedProcess\sharedProcessMain.ts:

```sh
   147  import { ISharedProcessConfiguration } from "vs/platform/sharedProcess/node/sharedProcess";
   148  import { ISignService } from "vs/platform/sign/common/sign";
   149  import { SignService } from "vs/platform/sign/node/signService";
   150  import { IStorageService } from "vs/platform/storage/common/storage";
   151  import { RemoteStorageService } from "vs/platform/storage/common/storageService";
   152: import { resolveCommonProperties } from "vs/platform/telemetry/common/commonProperties";
   153  import {
   154  	ICustomEndpointTelemetryService,
   155  	ITelemetryService,
   156: } from "vs/platform/telemetry/common/telemetry";
   157: import { TelemetryAppenderChannel } from "vs/platform/telemetry/common/telemetryIpc";
   158: import { TelemetryLogAppender } from "vs/platform/telemetry/common/telemetryLogAppender";
   159: import { TelemetryService } from "vs/platform/telemetry/common/telemetryService";
   160  import {
   161  	getPiiPathsFromEnvironment,
   162  	isInternalTelemetry,
   163  	isLoggingOnly,
   164  	ITelemetryAppender,
   165  	NullAppender,
   166  	NullTelemetryService,
   167  	supportsTelemetry,
   168: } from "vs/platform/telemetry/common/telemetryUtils";
   169: import { OneDataSystemAppender } from "vs/platform/telemetry/node/1dsAppender";
   170: import { CustomEndpointTelemetryService } from "vs/platform/telemetry/node/customEndpointTelemetryService";
   171  import { ISharedTunnelsService } from "vs/platform/tunnel/common/tunnel";
   172  import { SharedProcessTunnelService } from "vs/platform/tunnel/node/sharedProcessTunnelService";
   173  import { SharedTunnelsService } from "vs/platform/tunnel/node/tunnelService";
   174  import { IUriIdentityService } from "vs/platform/uriIdentity/common/uriIdentity";
   175  import { UriIdentityService } from "vs/platform/uriIdentity/common/uriIdentityService";

   258  		// Config
   259  		registerUserDataSyncConfiguration();
   260
   261  		instantiationService.invokeFunction((accessor) => {
   262  			const logService = accessor.get(ILogService);
   263: 			const telemetryService = accessor.get(ITelemetryService);
   264  			const userDataProfilesService = accessor.get(
   265  				IUserDataProfilesService,
   266  			);
   267
   268  			// Log info

   276
   277  			// Error handler
   278  			this.registerErrorHandler(logService);
   279
   280  			// Report Profiles Info
   281: 			this.reportProfilesInfo(telemetryService, userDataProfilesService);
   282  			this._register(
   283  				userDataProfilesService.onDidChangeProfiles(() =>
   284  					this.reportProfilesInfo(
   285: 						telemetryService,
   286  						userDataProfilesService,
   287  					),
   288  				),
   289  			);
   290
   291  			// Report Client OS/DE Info
   292: 			this.reportClientOSInfo(telemetryService, logService);
   293  		});
   294
   295  		// Instantiate Contributions
   296  		this._register(
   297  			combinedDisposable(

   513  				),
   514  			),
   515  		);
   516
   517  		// Telemetry
   518: 		let telemetryService: ITelemetryService;
   519  		const appenders: ITelemetryAppender[] = [];
   520  		const internalTelemetry = isInternalTelemetry(
   521  			productService,
   522  			configurationService,
   523  		);

   542  				);
   543  				this._register(toDisposable(() => collectorAppender.flush())); // Ensure the 1DS appender is disposed so that it flushes remaining data
   544  				appenders.push(collectorAppender);
   545  			}
   546
   547: 			telemetryService = new TelemetryService(
   548  				{
   549  					appenders,
   550  					commonProperties: resolveCommonProperties(
   551  						release(),
   552  						hostname(),

   563  				},
   564  				configurationService,
   565  				productService,
   566  			);
   567  		} else {
   568: 			telemetryService = NullTelemetryService;
   569  			const nullAppender = NullAppender;
   570  			appenders.push(nullAppender);
   571  		}
   572
   573  		this.server.registerChannel(
   574: 			"telemetryAppender",
   575  			new TelemetryAppenderChannel(appenders),
   576  		);
   577: 		services.set(ITelemetryService, telemetryService);
   578
   579  		// Custom Endpoint Telemetry
   580  		const customEndpointTelemetryService =
   581  			new CustomEndpointTelemetryService(
   582  				configurationService,
   583: 				telemetryService,
   584  				logService,
   585  				loggerService,
   586  				environmentService,
   587  				productService,
   588  			);

   926  			);
   927  		});
   928  	}
   929
   930  	private reportProfilesInfo(
   931: 		telemetryService: ITelemetryService,
   932  		userDataProfilesService: IUserDataProfilesService,
   933  	): void {
   934  		type ProfilesInfoClassification = {
   935  			owner: "sandy081";
   936  			comment: "Report profiles information";

   941  			};
   942  		};
   943  		type ProfilesInfoEvent = {
   944  			count: number;
   945  		};
   946: 		telemetryService.publicLog2<
   947  			ProfilesInfoEvent,
   948  			ProfilesInfoClassification
   949  		>("profilesInfo", {
   950  			count: userDataProfilesService.profiles.length,
   951  		});
   952  	}
   953
   954  	private async reportClientOSInfo(
   955: 		telemetryService: ITelemetryService,
   956  		logService: ILogService,
   957  	): Promise<void> {
   958  		if (isLinux) {
   959  			const [releaseInfo, displayProtocol] = await Promise.all([
   960  				getOSReleaseInfo(logService.error.bind(logService)),

  1006  					platformIdLike: string | undefined;
  1007  					desktopEnvironment: string | undefined;
  1008  					displayProtocol: string | undefined;
  1009  					codeDisplayProtocol: string | undefined;
  1010  				};
  1011: 				telemetryService.publicLog2<
  1012  					ClientPlatformInfoEvent,
  1013  					ClientPlatformInfoClassification
  1014  				>("clientPlatformInfo", {
  1015  					platformId: releaseInfo.id,
  1016  					platformVersionId: releaseInfo.version_id,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\editor\browser\editorExtensions.ts:

```sh
  45  	KeybindingsRegistry,
  46  	KeybindingWeight,
  47  } from "vs/platform/keybinding/common/keybindingsRegistry";
  48  import { ILogService } from "vs/platform/log/common/log";
  49  import { Registry } from "vs/platform/registry/common/platform";
  50: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
  51
  52  export type ServicesAccessor = InstantiationServicesAccessor;
  53  export type EditorContributionCtor = IConstructorSignature<
  54  	IEditorContribution,
  55  	[ICodeEditor]
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\editor\browser\services\treeSitter\treeSitterParserService.ts:

```sh
   37  import { IModelContentChange } from "vs/editor/common/textModelEvents";
   38  import { IConfigurationService } from "vs/platform/configuration/common/configuration";
   39  import { IEnvironmentService } from "vs/platform/environment/common/environment";
   40  import { IFileService } from "vs/platform/files/common/files";
   41  import { ILogService } from "vs/platform/log/common/log";
   42: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   43
   44  const EDITOR_TREESITTER_TELEMETRY = "editor.experimental.treeSitterTelemetry";
   45  const MODULE_LOCATION_SUBPATH = `@vscode/tree-sitter-wasm/wasm`;
   46  const FILENAME_TREESITTER_WASM = `tree-sitter.wasm`;
   47

   61  	constructor(
   62  		readonly model: ITextModel,
   63  		private readonly _treeSitterLanguages: TreeSitterLanguages,
   64  		private readonly _treeSitterImporter: TreeSitterImporter,
   65  		private readonly _logService: ILogService,
   66: 		private readonly _telemetryService: ITelemetryService,
   67  	) {
   68  		super();
   69  		this._register(
   70  			Event.runAndSubscribe(this.model.onDidChangeLanguage, (e) =>
   71  				this._onDidChangeLanguage(

  104  		const treeSitterTree = this._languageSessionDisposables.add(
  105  			new TreeSitterParseResult(
  106  				new Parser(),
  107  				language,
  108  				this._logService,
  109: 				this._telemetryService,
  110  			),
  111  		);
  112  		this._languageSessionDisposables.add(
  113  			this.model.onDidChangeContent((e) =>
  114  				this._onDidChangeContent(treeSitterTree, e.changes),

  173  	private _isDisposed: boolean = false;
  174  	constructor(
  175  		public readonly parser: Parser,
  176  		public readonly /** exposed for tests **/ language: Parser.Language,
  177  		private readonly _logService: ILogService,
  178: 		private readonly _telemetryService: ITelemetryService,
  179  	) {
  180  		this.parser.setTimeoutMicros(50 * 1000); // 50 ms
  181  		this.parser.setLanguage(language);
  182  	}
  183  	dispose(): void {

  329  				isMeasurement: true;
  330  				comment: "The number of passes it took to parse";
  331  			};
  332  		};
  333  		if (parseType === TelemetryParseType.Full) {
  334: 			this._telemetryService.publicLog2<
  335  				{ languageId: string; time: number; passes: number },
  336  				ParseTimeClassification
  337  			>(`treeSitter.fullParse`, { languageId, time, passes });
  338  		} else {
  339: 			this._telemetryService.publicLog2<
  340  				{ languageId: string; time: number; passes: number },
  341  				ParseTimeClassification
  342  			>(`treeSitter.incrementalParse`, { languageId, time, passes });
  343  		}
  344  	}

  461
  462  	constructor(
  463  		@IModelService private readonly _modelService: IModelService,
  464  		@IFileService fileService: IFileService,
  465  		@ITelemetryService
  466: 		private readonly _telemetryService: ITelemetryService,
  467  		@ILogService private readonly _logService: ILogService,
  468  		@IConfigurationService
  469  		private readonly _configurationService: IConfigurationService,
  470  		@IEnvironmentService
  471  		private readonly _environmentService: IEnvironmentService,

  589  		const textModelTreeSitter = new TextModelTreeSitter(
  590  			model,
  591  			this._treeSitterLanguages,
  592  			this._treeSitterImporter,
  593  			this._logService,
  594: 			this._telemetryService,
  595  		);
  596  		this._textModelTreeSitters.set(model, textModelTreeSitter);
  597  	}
  598
  599  	private _addGrammar(languageId: string, grammarName: string) {
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\editor\browser\widget\codeEditor\codeEditorWidget.ts:

```sh
   479
   480  	public get contextMenuId(): MenuId {
   481  		return this._configuration.contextMenuId;
   482  	}
   483
   484: 	private readonly _telemetryData?: object;
   485
   486  	private readonly _domElement: HTMLElement;
   487  	private readonly _overflowWidgetsDomNode: HTMLElement | undefined;
   488  	private readonly _id: number;
   489  	private readonly _configuration: IEditorConfiguration;

   548  		this._overflowWidgetsDomNode = options.overflowWidgetsDomNode;
   549  		delete options.overflowWidgetsDomNode;
   550  		this._id = ++EDITOR_ID;
   551  		this._decorationTypeKeysToIds = {};
   552  		this._decorationTypeSubtypes = {};
   553: 		this._telemetryData = codeEditorWidgetOptions.telemetryData;
   554
   555  		this._configuration = this._register(
   556  			this._createConfiguration(
   557  				codeEditorWidgetOptions.isSimpleWidget || false,
   558  				codeEditorWidgetOptions.contextMenuId ??

  2788  			writable,
  2789  		);
  2790  	}
  2791
  2792  	public getTelemetryData(): { [key: string]: any } | undefined {
  2793: 		return this._telemetryData;
  2794  	}
  2795
  2796  	public hasModel(): this is editorBrowser.IActiveCodeEditor {
  2797  		return this._modelData !== null;
  2798  	}

  2856
  2857  	/**
  2858  	 * Telemetry data associated with this CodeEditorWidget.
  2859  	 * Defaults to null.
  2860  	 */
  2861: 	telemetryData?: object;
  2862
  2863  	/**
  2864  	 * The ID of the context menu.
  2865  	 * Defaults to MenuId.SimpleEditorContext or MenuId.EditorContext depending on whether the widget is simple.
  2866  	 */
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\editor\browser\widget\diffEditor\diffProviderFactoryService.ts:

```sh
   28  } from "vs/platform/instantiation/common/extensions";
   29  import {
   30  	createDecorator,
   31  	IInstantiationService,
   32  } from "vs/platform/instantiation/common/instantiation";
   33: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   34
   35  export const IDiffProviderFactoryService =
   36  	createDecorator<IDiffProviderFactoryService>("diffProviderFactoryService");
   37
   38  export interface IDocumentDiffFactoryOptions {

   91
   92  	constructor(
   93  		options: IWorkerBasedDocumentDiffProviderOptions,
   94  		@IEditorWorkerService
   95  		private readonly editorWorkerService: IEditorWorkerService,
   96: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
   97  	) {
   98  		this.setOptions(options);
   99  	}
  100
  101  	public dispose(): void {

  186  			options,
  187  			this.diffAlgorithm,
  188  		);
  189  		const timeMs = sw.elapsed();
  190
  191: 		this.telemetryService.publicLog2<
  192  			{
  193  				timeMs: number;
  194  				timedOut: boolean;
  195  				detectedMoves: number;
  196  			},
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\editor\common\languages.ts:

```sh
  689   * when a completion item is shown in the UI and gains focus this provider is asked to resolve
  690   * the item, like adding {@link CompletionItem.documentation doc-comment} or {@link CompletionItem.detail details}.
  691   */
  692  export interface CompletionItemProvider {
  693  	/**
  694: 	 * Used to identify completions in the (debug) UI and telemetry. This isn't the extension identifier because extensions
  695  	 * often contribute multiple completion item providers.
  696  	 *
  697  	 * @internal
  698  	 */
  699  	_debugDisplayName: string;
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\editor\common\config\editorConfigurationSchema.ts:

```sh
  187  		"editor.experimental.treeSitterTelemetry": {
  188  			type: "boolean",
  189  			default: false,
  190  			markdownDescription: nls.localize(
  191  				"editor.experimental.treeSitterTelemetry",
  192: 				"Controls whether tree sitter parsing should be turned on and telemetry collected. Setting `editor.experimental.preferTreeSitter` for specific languages will take precedence.",
  193  			),
  194  			tags: ["experimental"],
  195  		},
  196  		"editor.language.brackets": {
  197  			type: ["array", "null"],
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\editor\contrib\codeAction\browser\codeAction.ts:

```sh
   29  	ICommandService,
   30  } from "vs/platform/commands/common/commands";
   31  import { ServicesAccessor } from "vs/platform/instantiation/common/instantiation";
   32  import { INotificationService } from "vs/platform/notification/common/notification";
   33  import { IProgress, Progress } from "vs/platform/progress/common/progress";
   34: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   35
   36  import {
   37  	CodeActionFilter,
   38  	CodeActionItem,
   39  	CodeActionKind,

  341  	options?: { readonly preview?: boolean; readonly editor?: ICodeEditor },
  342  	token: CancellationToken = CancellationToken.None,
  343  ): Promise<void> {
  344  	const bulkEditService = accessor.get(IBulkEditService);
  345  	const commandService = accessor.get(ICommandService);
  346: 	const telemetryService = accessor.get(ITelemetryService);
  347  	const notificationService = accessor.get(INotificationService);
  348
  349  	type ApplyCodeActionEvent = {
  350  		codeActionTitle: string;
  351  		codeActionKind: string | undefined;

  375  		};
  376  		owner: "justschen";
  377  		comment: "Event used to gain insights into which code actions are being triggered";
  378  	};
  379
  380: 	telemetryService.publicLog2<
  381  		ApplyCodeActionEvent,
  382  		ApplyCodeEventClassification
  383  	>("codeAction.applyCodeAction", {
  384  		codeActionTitle: item.action.title,
  385  		codeActionKind: item.action.kind,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\editor\contrib\codeAction\browser\codeActionController.ts:

```sh
   48  import { IConfigurationService } from "vs/platform/configuration/common/configuration";
   49  import { IContextKeyService } from "vs/platform/contextkey/common/contextkey";
   50  import { IInstantiationService } from "vs/platform/instantiation/common/instantiation";
   51  import { IMarkerService } from "vs/platform/markers/common/markers";
   52  import { IEditorProgressService } from "vs/platform/progress/common/progress";
   53: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   54  import {
   55  	editorFindMatchHighlight,
   56  	editorFindMatchHighlightBorder,
   57  } from "vs/platform/theme/common/colorRegistry";
   58  import { isHighContrast } from "vs/platform/theme/common/theme";

  104  		@IActionWidgetService
  105  		private readonly _actionWidgetService: IActionWidgetService,
  106  		@IInstantiationService
  107  		private readonly _instantiationService: IInstantiationService,
  108  		@ITelemetryService
  109: 		private readonly _telemetryService: ITelemetryService,
  110  	) {
  111  		super();
  112
  113  		this._editor = editor;
  114  		this._model = this._register(

  117  				languageFeaturesService.codeActionProvider,
  118  				markerService,
  119  				contextKeyService,
  120  				progressService,
  121  				_configurationService,
  122: 				this._telemetryService,
  123  			),
  124  		);
  125  		this._register(
  126  			this._model.onDidChangeState((newState) => this.update(newState)),
  127  		);
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\editor\contrib\codeAction\browser\codeActionModel.ts:

```sh
   36  import { IMarkerService } from "vs/platform/markers/common/markers";
   37  import {
   38  	IEditorProgressService,
   39  	Progress,
   40  } from "vs/platform/progress/common/progress";
   41: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   42
   43  import {
   44  	CodeActionKind,
   45  	CodeActionSet,
   46  	CodeActionTrigger,

  223  		private readonly _registry: LanguageFeatureRegistry<CodeActionProvider>,
  224  		private readonly _markerService: IMarkerService,
  225  		contextKeyService: IContextKeyService,
  226  		private readonly _progressService?: IEditorProgressService,
  227  		private readonly _configurationService?: IConfigurationService,
  228: 		private readonly _telemetryService?: ITelemetryService,
  229  	) {
  230  		super();
  231  		this._supportedCodeActions =
  232  			SUPPORTED_CODE_ACTIONS.bindTo(contextKeyService);
  233

  559  								Progress.None,
  560  								token,
  561  							);
  562
  563  							// Telemetry for duration of each code action on save.
  564: 							if (this._telemetryService) {
  565  								type RenderActionMenu = {
  566  									codeActions: number;
  567  									duration: number;
  568  								};
  569

  580  										purpose: "FeatureInsight";
  581  										comment: "Duration it took for TS to return the action to run for each kind. ";
  582  									};
  583  								};
  584
  585: 								this._telemetryService.publicLog2<
  586  									RenderActionMenu,
  587  									RenderActionMenuClassification
  588  								>("codeAction.invokedDurations", {
  589  									codeActions:
  590  										codeActions.validActions.length,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\editor\contrib\inlineCompletions\browser\hintsWidget\hoverParticipant.ts:

```sh
   32  import { InlineSuggestionHintsContentWidget } from "vs/editor/contrib/inlineCompletions/browser/hintsWidget/inlineCompletionsHintsWidget";
   33  import * as nls from "vs/nls";
   34  import { IAccessibilityService } from "vs/platform/accessibility/common/accessibility";
   35  import { IInstantiationService } from "vs/platform/instantiation/common/instantiation";
   36  import { IOpenerService } from "vs/platform/opener/common/opener";
   37: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   38
   39  export class InlineCompletionsHover implements IHoverPart {
   40  	constructor(
   41  		public readonly owner: IEditorHoverParticipant<InlineCompletionsHover>,
   42  		public readonly range: Range,

   64  		@IAccessibilityService
   65  		private readonly accessibilityService: IAccessibilityService,
   66  		@IInstantiationService
   67  		private readonly _instantiationService: IInstantiationService,
   68  		@ITelemetryService
   69: 		private readonly _telemetryService: ITelemetryService,
   70  	) {}
   71
   72  	suggestHoverAnchor(mouseEvent: IEditorMouseEvent): HoverAnchor | null {
   73  		const controller = InlineCompletionsController.get(this._editor);
   74  		if (!controller) {

  153  		hoverParts: InlineCompletionsHover[],
  154  	): IRenderedHoverParts<InlineCompletionsHover> {
  155  		const disposables = new DisposableStore();
  156  		const part = hoverParts[0];
  157
  158: 		this._telemetryService.publicLog2<
  159  			{},
  160  			{
  161  				owner: "hediet";
  162  				comment: "This event tracks whenever an inline completion hover is shown.";
  163  			}
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\editor\contrib\inlineCompletions\browser\hintsWidget\inlineCompletionsHintsWidget.ts:

```sh
   63  import { ICommandService } from "vs/platform/commands/common/commands";
   64  import { IContextKeyService } from "vs/platform/contextkey/common/contextkey";
   65  import { IContextMenuService } from "vs/platform/contextview/browser/contextView";
   66  import { IInstantiationService } from "vs/platform/instantiation/common/instantiation";
   67  import { IKeybindingService } from "vs/platform/keybinding/common/keybinding";
   68: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   69  import { registerIcon } from "vs/platform/theme/common/iconRegistry";
   70
   71  export class InlineCompletionsHintsWidget extends Disposable {
   72  	private readonly alwaysShowToolbar = observableFromEvent(
   73  		this,

  327  							a.setClass("availableSuggestionCount");
  328  							return a;
  329  						}
  330  						return undefined;
  331  					},
  332: 					telemetrySource: "InlineSuggestionToolbar",
  333  				},
  334  			),
  335  		);
  336
  337  		this.toolBar.setPrependedPrimaryActions([

  499  		@IContextKeyService
  500  		private readonly contextKeyService: IContextKeyService,
  501  		@IContextMenuService contextMenuService: IContextMenuService,
  502  		@IKeybindingService keybindingService: IKeybindingService,
  503  		@ICommandService commandService: ICommandService,
  504: 		@ITelemetryService telemetryService: ITelemetryService,
  505  	) {
  506  		super(
  507  			container,
  508  			{ resetMenu: menuId, ...options2 },
  509  			menuService,
  510  			contextKeyService,
  511  			contextMenuService,
  512  			keybindingService,
  513  			commandService,
  514: 			telemetryService,
  515  		);
  516
  517  		this._store.add(this.menu.onDidChange(() => this.updateToolbar()));
  518  		this.updateToolbar();
  519  	}
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\editor\contrib\inlineEdit\browser\hoverParticipant.ts:

```sh
   26  } from "vs/editor/contrib/hover/browser/hoverTypes";
   27  import { InlineEditController } from "vs/editor/contrib/inlineEdit/browser/inlineEditController";
   28  import { InlineEditHintsContentWidget } from "vs/editor/contrib/inlineEdit/browser/inlineEditHintsWidget";
   29  import * as nls from "vs/nls";
   30  import { IInstantiationService } from "vs/platform/instantiation/common/instantiation";
   31: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   32
   33  export class InlineEditHover implements IHoverPart {
   34  	constructor(
   35  		public readonly owner: IEditorHoverParticipant<InlineEditHover>,
   36  		public readonly range: Range,

   54  	constructor(
   55  		private readonly _editor: ICodeEditor,
   56  		@IInstantiationService
   57  		private readonly _instantiationService: IInstantiationService,
   58  		@ITelemetryService
   59: 		private readonly _telemetryService: ITelemetryService,
   60  	) {}
   61
   62  	suggestHoverAnchor(mouseEvent: IEditorMouseEvent): HoverAnchor | null {
   63  		const controller = InlineEditController.get(this._editor);
   64  		if (!controller) {

  137  		context: IEditorHoverRenderContext,
  138  		hoverParts: InlineEditHover[],
  139  	): IRenderedHoverParts<InlineEditHover> {
  140  		const disposables = new DisposableStore();
  141
  142: 		this._telemetryService.publicLog2<
  143  			{},
  144  			{
  145  				owner: "hediet";
  146  				comment: "This event tracks whenever an inline edit hover is shown.";
  147  			}
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\editor\contrib\inlineEdit\browser\inlineEditHintsWidget.ts:

```sh
   48  import { ICommandService } from "vs/platform/commands/common/commands";
   49  import { IContextKeyService } from "vs/platform/contextkey/common/contextkey";
   50  import { IContextMenuService } from "vs/platform/contextview/browser/contextView";
   51  import { IInstantiationService } from "vs/platform/instantiation/common/instantiation";
   52  import { IKeybindingService } from "vs/platform/keybinding/common/keybinding";
   53: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   54
   55  export class InlineEditHintsWidget extends Disposable {
   56  	private readonly alwaysShowToolbar = observableFromEvent(
   57  		this,
   58  		this.editor.onDidChangeConfiguration,

  190  								undefined,
  191  							);
  192  						}
  193  						return undefined;
  194  					},
  195: 					telemetrySource: "InlineEditToolbar",
  196  				},
  197  			),
  198  		);
  199
  200  		this._register(

  305  		@IContextKeyService
  306  		private readonly contextKeyService: IContextKeyService,
  307  		@IContextMenuService contextMenuService: IContextMenuService,
  308  		@IKeybindingService keybindingService: IKeybindingService,
  309  		@ICommandService commandService: ICommandService,
  310: 		@ITelemetryService telemetryService: ITelemetryService,
  311  	) {
  312  		super(
  313  			container,
  314  			{ resetMenu: menuId, ...options2 },
  315  			menuService,
  316  			contextKeyService,
  317  			contextMenuService,
  318  			keybindingService,
  319  			commandService,
  320: 			telemetryService,
  321  		);
  322
  323  		this._store.add(this.menu.onDidChange(() => this.updateToolbar()));
  324  		this._store.add(
  325  			this.editor.onDidChangeCursorPosition(() => this.updateToolbar()),
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\editor\contrib\parameterHints\browser\parameterHintsWidget.ts:

```sh
   39  import {
   40  	IContextKey,
   41  	IContextKeyService,
   42  } from "vs/platform/contextkey/common/contextkey";
   43  import { IOpenerService } from "vs/platform/opener/common/opener";
   44: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   45  import {
   46  	listHighlightForeground,
   47  	registerColor,
   48  } from "vs/platform/theme/common/colorRegistry";
   49  import { registerIcon } from "vs/platform/theme/common/iconRegistry";

   93  		private readonly editor: ICodeEditor,
   94  		private readonly model: ParameterHintsModel,
   95  		@IContextKeyService contextKeyService: IContextKeyService,
   96  		@IOpenerService openerService: IOpenerService,
   97  		@ILanguageService languageService: ILanguageService,
   98: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
   99  	) {
  100  		super();
  101
  102  		this.markdownRenderer = this._register(
  103  			new MarkdownRenderer({ editor }, languageService, openerService),

  380  		type RenderMarkdownPerformanceEvent = {
  381  			renderDuration: number;
  382  		};
  383  		const renderDuration = stopWatch.elapsed();
  384  		if (renderDuration > 300) {
  385: 			this.telemetryService.publicLog2<
  386  				RenderMarkdownPerformanceEvent,
  387  				RenderMarkdownPerformanceClassification
  388  			>("parameterHints.parseMarkdown", {
  389  				renderDuration,
  390  			});
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\editor\contrib\quickAccess\browser\commandsQuickAccess.ts:

```sh
  14  import {
  15  	AbstractCommandsQuickAccessProvider,
  16  	ICommandQuickPick,
  17  	ICommandsQuickAccessOptions,
  18  } from "vs/platform/quickinput/browser/commandsQuickAccess";
  19: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
  20
  21  export abstract class AbstractEditorCommandsQuickAccessProvider extends AbstractCommandsQuickAccessProvider {
  22  	constructor(
  23  		options: ICommandsQuickAccessOptions,
  24  		instantiationService: IInstantiationService,
  25  		keybindingService: IKeybindingService,
  26  		commandService: ICommandService,
  27: 		telemetryService: ITelemetryService,
  28  		dialogService: IDialogService,
  29  	) {
  30  		super(
  31  			options,
  32  			instantiationService,
  33  			keybindingService,
  34  			commandService,
  35: 			telemetryService,
  36  			dialogService,
  37  		);
  38  	}
  39
  40  	/**
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\editor\contrib\rename\browser\rename.ts:

```sh
   60  import { KeybindingWeight } from "vs/platform/keybinding/common/keybindingsRegistry";
   61  import { ILogService } from "vs/platform/log/common/log";
   62  import { INotificationService } from "vs/platform/notification/common/notification";
   63  import { IEditorProgressService } from "vs/platform/progress/common/progress";
   64  import { Registry } from "vs/platform/registry/common/platform";
   65: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   66
   67  import {
   68  	CONTEXT_RENAME_INPUT_VISIBLE,
   69  	NewNameSource,
   70  	RenameWidget,

  232  		@ITextResourceConfigurationService
  233  		private readonly _configService: ITextResourceConfigurationService,
  234  		@ILanguageFeaturesService
  235  		private readonly _languageFeaturesService: ILanguageFeaturesService,
  236  		@ITelemetryService
  237: 		private readonly _telemetryService: ITelemetryService,
  238  	) {
  239  		this._renameWidget = this._disposableStore.add(
  240  			this._instaService.createInstance(RenameWidget, this.editor, [
  241  				"acceptRenameInput",
  242  				"acceptRenameInputWithPreview",

  398  			cts2,
  399  		);
  400  		trace("received response from rename input field");
  401
  402  		if (newSymbolNamesProviders.length > 0) {
  403: 			// @ulugbekna: we're interested only in telemetry for rename suggestions currently
  404  			this._reportTelemetry(
  405  				newSymbolNamesProviders.length,
  406  				model.getLanguageId(),
  407  				inputFieldResult,
  408  			);

  647  						hadAutomaticRenameSuggestionsInvocation:
  648  							inputFieldResult.stats
  649  								.hadAutomaticRenameSuggestionsInvocation,
  650  					};
  651
  652: 		this._telemetryService.publicLog2<
  653  			RenameInvokedEvent,
  654  			RenameInvokedClassification
  655  		>("renameInvokedEvent", value);
  656  	}
  657  }
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\editor\contrib\suggest\browser\suggestController.ts:

```sh
   64  	IContextKeyService,
   65  } from "vs/platform/contextkey/common/contextkey";
   66  import { IInstantiationService } from "vs/platform/instantiation/common/instantiation";
   67  import { KeybindingWeight } from "vs/platform/keybinding/common/keybindingsRegistry";
   68  import { ILogService } from "vs/platform/log/common/log";
   69: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   70
   71  import {
   72  	CompletionItem,
   73  	ISuggestItemPreselector,
   74  	Context as SuggestContext,

  188  		private readonly _contextKeyService: IContextKeyService,
  189  		@IInstantiationService
  190  		private readonly _instantiationService: IInstantiationService,
  191  		@ILogService private readonly _logService: ILogService,
  192  		@ITelemetryService
  193: 		private readonly _telemetryService: ITelemetryService,
  194  	) {
  195  		this.editor = editor;
  196  		this.model = _instantiationService.createInstance(
  197  			SuggestModel,
  198  			this.editor,

  539  		// keep item in memory
  540  		this._memoryService.memorize(model, this.editor.getPosition(), item);
  541
  542  		const isResolved = item.isResolved;
  543
  544: 		// telemetry data points: duration of command execution, info about async additional edits (-1=n/a, -2=none, 1=success, 0=failed)
  545  		let _commandExectionDuration = -1;
  546  		let _additionalEditsAppliedAsync = -1;
  547
  548  		if (Array.isArray(item.completion.additionalTextEdits)) {
  549  			// cancel -> stops all listening and closes widget

  785  		additionalEditsAppliedAsync: number,
  786  		index: number,
  787  		completionItems: CompletionItem[],
  788  	): void {
  789  		if (Math.floor(Math.random() * 100) === 0) {
  790: 			// throttle telemetry event because accepting completions happens a lot
  791  			return;
  792  		}
  793
  794  		const labelMap = new Map<string, number[]>();
  795

  884  				purpose: "FeatureInsight";
  885  				comment: "When there are multiple completions, the index of the first instance.";
  886  			};
  887  		};
  888
  889: 		this._telemetryService.publicLog2<
  890  			AcceptedSuggestion,
  891  			AcceptedSuggestionClassification
  892  		>("suggest.acceptedSuggestion", {
  893  			extensionId: item.extensionId?.value ?? "unknown",
  894  			providerId: item.provider._debugDisplayName ?? "unknown",
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\editor\contrib\suggest\browser\suggestModel.ts:

```sh
   43  import { IClipboardService } from "vs/platform/clipboard/common/clipboardService";
   44  import { IConfigurationService } from "vs/platform/configuration/common/configuration";
   45  import { IContextKeyService } from "vs/platform/contextkey/common/contextkey";
   46  import { IEnvironmentService } from "vs/platform/environment/common/environment";
   47  import { ILogService } from "vs/platform/log/common/log";
   48: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   49
   50  import { CompletionModel } from "./completionModel";
   51  import {
   52  	CompletionDurations,
   53  	CompletionItem,

  209  		@IEditorWorkerService
  210  		private readonly _editorWorkerService: IEditorWorkerService,
  211  		@IClipboardService
  212  		private readonly _clipboardService: IClipboardService,
  213  		@ITelemetryService
  214: 		private readonly _telemetryService: ITelemetryService,
  215  		@ILogService private readonly _logService: ILogService,
  216  		@IContextKeyService
  217  		private readonly _contextKeyService: IContextKeyService,
  218  		@IConfigurationService
  219  		private readonly _configurationService: IConfigurationService,

  717  				// store containers so that they can be disposed later
  718  				this._completionDisposables.add(completions.disposable);
  719
  720  				this._onNewContext(ctx);
  721
  722: 				// finally report telemetry about durations
  723  				this._reportDurationsTelemetry(completions.durations);
  724
  725  				// report invalid completions by source
  726  				if (
  727  					!this._envService.isBuilt ||

  738  				}
  739  			})
  740  			.catch(onUnexpectedError);
  741  	}
  742
  743: 	private _telemetryGate: number = 0;
  744
  745  	private _reportDurationsTelemetry(durations: CompletionDurations): void {
  746: 		if (this._telemetryGate++ % 230 !== 0) {
  747  			return;
  748  		}
  749
  750  		setTimeout(() => {
  751  			type Durations = { data: string };

  756  					comment: "Durations per source and overall";
  757  					classification: "SystemMetaData";
  758  					purpose: "PerformanceAndHealth";
  759  				};
  760  			};
  761: 			this._telemetryService.publicLog2<
  762  				Durations,
  763  				DurationsClassification
  764  			>("suggest.durations.json", { data: JSON.stringify(durations) });
  765  			this._logService.debug("suggest.durations.json", durations);
  766  		});
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\editor\standalone\browser\standaloneServices.ts:

```sh
   228  	IStorageService,
   229  } from "vs/platform/storage/common/storage";
   230  import {
   231  	ITelemetryService,
   232  	TelemetryLevel,
   233: } from "vs/platform/telemetry/common/telemetry";
   234  import {
   235  	ISingleFolderWorkspaceIdentifier,
   236  	IWorkspace,
   237  	IWorkspaceContextService,
   238  	IWorkspaceFolder,

   636  	private readonly _domNodeListeners: DomNodeListeners[];
   637
   638  	constructor(
   639  		@IContextKeyService contextKeyService: IContextKeyService,
   640  		@ICommandService commandService: ICommandService,
   641: 		@ITelemetryService telemetryService: ITelemetryService,
   642  		@INotificationService notificationService: INotificationService,
   643  		@ILogService logService: ILogService,
   644  		@ICodeEditorService codeEditorService: ICodeEditorService,
   645  	) {
   646  		super(
   647  			contextKeyService,
   648  			commandService,
   649: 			telemetryService,
   650  			notificationService,
   651  			logService,
   652  		);
   653
   654  		this._cachedResolver = null;

  1155  	}
  1156  }
  1157
  1158  class StandaloneTelemetryService implements ITelemetryService {
  1159  	declare readonly _serviceBrand: undefined;
  1160: 	readonly telemetryLevel = TelemetryLevel.NONE;
  1161  	readonly sessionId = "someValue.sessionId";
  1162  	readonly machineId = "someValue.machineId";
  1163  	readonly sqmId = "someValue.sqmId";
  1164  	readonly devDeviceId = "someValue.devDeviceId";
  1165  	readonly firstSessionDate = "someValue.firstSessionDate";

  1491  	}
  1492  }
  1493
  1494  class StandaloneContextMenuService extends ContextMenuService {
  1495  	constructor(
  1496: 		@ITelemetryService telemetryService: ITelemetryService,
  1497  		@INotificationService notificationService: INotificationService,
  1498  		@IContextViewService contextViewService: IContextViewService,
  1499  		@IKeybindingService keybindingService: IKeybindingService,
  1500  		@IMenuService menuService: IMenuService,
  1501  		@IContextKeyService contextKeyService: IContextKeyService,
  1502  	) {
  1503  		super(
  1504: 			telemetryService,
  1505  			notificationService,
  1506  			contextViewService,
  1507  			keybindingService,
  1508  			menuService,
  1509  			contextKeyService,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\editor\standalone\browser\quickAccess\standaloneCommandsQuickAccess.ts:

```sh
  26  	Extensions,
  27  	IQuickAccessRegistry,
  28  } from "vs/platform/quickinput/common/quickAccess";
  29  import { IQuickInputService } from "vs/platform/quickinput/common/quickInput";
  30  import { Registry } from "vs/platform/registry/common/platform";
  31: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
  32
  33  export class StandaloneCommandsQuickAccessProvider extends AbstractEditorCommandsQuickAccessProvider {
  34  	protected get activeTextEditorControl(): IEditor | undefined {
  35  		return this.codeEditorService.getFocusedCodeEditor() ?? undefined;
  36  	}

  39  		@IInstantiationService instantiationService: IInstantiationService,
  40  		@ICodeEditorService
  41  		private readonly codeEditorService: ICodeEditorService,
  42  		@IKeybindingService keybindingService: IKeybindingService,
  43  		@ICommandService commandService: ICommandService,
  44: 		@ITelemetryService telemetryService: ITelemetryService,
  45  		@IDialogService dialogService: IDialogService,
  46  	) {
  47  		super(
  48  			{ showAlias: false },
  49  			instantiationService,
  50  			keybindingService,
  51  			commandService,
  52: 			telemetryService,
  53  			dialogService,
  54  		);
  55  	}
  56
  57  	protected async getCommandPicks(): Promise<Array<ICommandQuickPick>> {
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\platform\accessibilitySignal\browser\accessibilitySignalService.ts:

```sh
   17  import { localize } from "vs/nls";
   18  import { IAccessibilityService } from "vs/platform/accessibility/common/accessibility";
   19  import { IConfigurationService } from "vs/platform/configuration/common/configuration";
   20  import { createDecorator } from "vs/platform/instantiation/common/instantiation";
   21  import { observableConfigValue } from "vs/platform/observable/common/platformObservableUtils";
   22: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   23
   24  export const IAccessibilitySignalService =
   25  	createDecorator<IAccessibilitySignalService>("accessibilitySignalService");
   26
   27  export interface IAccessibilitySignalService {

  111  	constructor(
  112  		@IConfigurationService
  113  		private readonly configurationService: IConfigurationService,
  114  		@IAccessibilityService
  115  		private readonly accessibilityService: IAccessibilityService,
  116: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
  117  	) {
  118  		super();
  119  	}
  120
  121  	public getEnabledState(

  203  		if (this.sentTelemetry.has(key) || this.getVolumeInPercent() === 0) {
  204  			return;
  205  		}
  206  		this.sentTelemetry.add(key);
  207
  208: 		this.telemetryService.publicLog2<
  209  			{
  210  				signal: string;
  211  				source: string;
  212  				isScreenReaderOptimized: boolean;
  213  			},
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\platform\actions\browser\buttonbar.ts:

```sh
   28  } from "vs/platform/actions/common/actions";
   29  import { IContextKeyService } from "vs/platform/contextkey/common/contextkey";
   30  import { IContextMenuService } from "vs/platform/contextview/browser/contextView";
   31  import { IHoverService } from "vs/platform/hover/browser/hover";
   32  import { IKeybindingService } from "vs/platform/keybinding/common/keybinding";
   33: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   34
   35  export type IButtonConfigProvider = (
   36  	action: IAction,
   37  	index: number,
   38  ) =>

   42  			isSecondary?: boolean;
   43  	  }
   44  	| undefined;
   45
   46  export interface IWorkbenchButtonBarOptions {
   47: 	telemetrySource?: string;
   48  	buttonConfigProvider?: IButtonConfigProvider;
   49  }
   50
   51  export class WorkbenchButtonBar extends ButtonBar {
   52  	protected readonly _store = new DisposableStore();

   61  		private readonly _options: IWorkbenchButtonBarOptions | undefined,
   62  		@IContextMenuService
   63  		private readonly _contextMenuService: IContextMenuService,
   64  		@IKeybindingService
   65  		private readonly _keybindingService: IKeybindingService,
   66: 		@ITelemetryService telemetryService: ITelemetryService,
   67  		@IHoverService private readonly _hoverService: IHoverService,
   68  	) {
   69  		super(container);
   70
   71  		this._actionRunner = this._store.add(new ActionRunner());
   72: 		if (_options?.telemetrySource) {
   73  			this._actionRunner.onDidRun(
   74  				(e) => {
   75: 					telemetryService.publicLog2<
   76  						WorkbenchActionExecutedEvent,
   77  						WorkbenchActionExecutedClassification
   78  					>("workbenchActionExecuted", {
   79  						id: e.action.id,
   80: 						from: _options.telemetrySource!,
   81  					});
   82  				},
   83  				undefined,
   84  				this._store,
   85  			);

  227  		options: IMenuWorkbenchButtonBarOptions | undefined,
  228  		@IMenuService menuService: IMenuService,
  229  		@IContextKeyService contextKeyService: IContextKeyService,
  230  		@IContextMenuService contextMenuService: IContextMenuService,
  231  		@IKeybindingService keybindingService: IKeybindingService,
  232: 		@ITelemetryService telemetryService: ITelemetryService,
  233  		@IHoverService hoverService: IHoverService,
  234  	) {
  235  		super(
  236  			container,
  237  			options,
  238  			contextMenuService,
  239  			keybindingService,
  240: 			telemetryService,
  241  			hoverService,
  242  		);
  243
  244  		const menu = menuService.createMenu(menuId, contextKeyService);
  245  		this._store.add(menu);
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\platform\actions\browser\toolbar.ts:

```sh
   36  import { createConfigureKeybindingAction } from "vs/platform/actions/common/menuService";
   37  import { ICommandService } from "vs/platform/commands/common/commands";
   38  import { IContextKeyService } from "vs/platform/contextkey/common/contextkey";
   39  import { IContextMenuService } from "vs/platform/contextview/browser/contextView";
   40  import { IKeybindingService } from "vs/platform/keybinding/common/keybinding";
   41: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   42
   43  export const enum HiddenItemStrategy {
   44  	/** This toolbar doesn't support hiding*/
   45  	NoHide = -1,
   46  	/** Hidden items aren't shown anywhere */

   73  	 */
   74  	menuOptions?: IMenuActionOptions;
   75
   76  	/**
   77  	 * When set the `workbenchActionExecuted` is automatically send for each invoked action. The `from` property
   78: 	 * of the event will the passed `telemetrySource`-value
   79  	 */
   80: 	telemetrySource?: string;
   81
   82  	/** This is controlled by the WorkbenchToolBar */
   83  	allowContextMenu?: never;
   84
   85  	/**

  112  		@IContextMenuService
  113  		private readonly _contextMenuService: IContextMenuService,
  114  		@IKeybindingService
  115  		private readonly _keybindingService: IKeybindingService,
  116  		@ICommandService private readonly _commandService: ICommandService,
  117: 		@ITelemetryService telemetryService: ITelemetryService,
  118  	) {
  119  		super(container, _contextMenuService, {
  120  			// defaults
  121  			getKeyBinding: (action) =>
  122  				_keybindingService.lookupKeybinding(action.id) ?? undefined,
  123  			// options (override defaults)
  124  			..._options,
  125  			// mandatory (overide options)
  126  			allowContextMenu: true,
  127: 			skipTelemetry: typeof _options?.telemetrySource === "string",
  128  		});
  129
  130: 		// telemetry logic
  131: 		const telemetrySource = _options?.telemetrySource;
  132: 		if (telemetrySource) {
  133  			this._store.add(
  134  				this.actionBar.onDidRun((e) =>
  135: 					telemetryService.publicLog2<
  136  						WorkbenchActionExecutedEvent,
  137  						WorkbenchActionExecutedClassification
  138  					>("workbenchActionExecuted", {
  139  						id: e.action.id,
  140: 						from: telemetrySource,
  141  					}),
  142  				),
  143  			);
  144  		}
  145  	}

  354  						menuActionOptions: {
  355  							renderShortTitle: true,
  356  							...this._options?.menuOptions,
  357  						},
  358  						skipTelemetry:
  359: 							typeof this._options?.telemetrySource === "string",
  360  						contextKeyService: this._contextKeyService,
  361  					});
  362  				}),
  363  			);
  364  		}

  421  		@IMenuService menuService: IMenuService,
  422  		@IContextKeyService contextKeyService: IContextKeyService,
  423  		@IContextMenuService contextMenuService: IContextMenuService,
  424  		@IKeybindingService keybindingService: IKeybindingService,
  425  		@ICommandService commandService: ICommandService,
  426: 		@ITelemetryService telemetryService: ITelemetryService,
  427  	) {
  428  		super(
  429  			container,
  430  			{ resetMenu: menuId, ...options },
  431  			menuService,
  432  			contextKeyService,
  433  			contextMenuService,
  434  			keybindingService,
  435  			commandService,
  436: 			telemetryService,
  437  		);
  438
  439  		// update logic
  440  		const menu = this._store.add(
  441  			menuService.createMenu(menuId, contextKeyService, {
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\platform\assignment\common\assignmentService.ts:

```sh
   17  	TargetPopulation,
   18  } from "vs/platform/assignment/common/assignment";
   19  import { IConfigurationService } from "vs/platform/configuration/common/configuration";
   20  import { IEnvironmentService } from "vs/platform/environment/common/environment";
   21  import { IProductService } from "vs/platform/product/common/productService";
   22: import { TelemetryLevel } from "vs/platform/telemetry/common/telemetry";
   23: import { getTelemetryLevel } from "vs/platform/telemetry/common/telemetryUtils";
   24
   25  export abstract class BaseAssignmentService implements IAssignmentService {
   26  	_serviceBrand: undefined;
   27  	protected tasClient: Promise<TASClient> | undefined;
   28  	private networkInitialized = false;

   35  	constructor(
   36  		private readonly machineId: string,
   37  		protected readonly configurationService: IConfigurationService,
   38  		protected readonly productService: IProductService,
   39  		protected readonly environmentService: IEnvironmentService,
   40: 		protected telemetry: IExperimentationTelemetry,
   41  		private keyValueStorage?: IKeyValueStorage,
   42  	) {
   43  		const isTesting =
   44  			environmentService.extensionTestsLocationURI !== undefined;
   45  		if (

  125  				"tas-client-umd",
  126  				"lib/tas-client-umd.js",
  127  			)
  128  		).ExperimentationService({
  129  			filterProviders: [filterProvider],
  130: 			telemetry: this.telemetry,
  131  			storageKey: ASSIGNMENT_STORAGE_KEY,
  132  			keyValueStorage: this.keyValueStorage,
  133  			assignmentContextTelemetryPropertyName:
  134  				tasConfig.assignmentContextTelemetryPropertyName,
  135: 			telemetryEventName: tasConfig.telemetryEventName,
  136  			endpoint: tasConfig.endpoint,
  137  			refetchInterval: ASSIGNMENT_REFETCH_INTERVAL,
  138  		});
  139
  140  		await tasClient.initializePromise;
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\platform\contextview\browser\contextMenuHandler.ts:

```sh
   28  	IDisposable,
   29  } from "vs/base/common/lifecycle";
   30  import { IContextViewService } from "vs/platform/contextview/browser/contextView";
   31  import { IKeybindingService } from "vs/platform/keybinding/common/keybinding";
   32  import { INotificationService } from "vs/platform/notification/common/notification";
   33: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   34  import { defaultMenuStyles } from "vs/platform/theme/browser/defaultStyles";
   35
   36  export interface IContextMenuHandlerOptions {
   37  	blockMouse: boolean;
   38  }

   44  	private blockDisposable: IDisposable | null = null;
   45  	private options: IContextMenuHandlerOptions = { blockMouse: true };
   46
   47  	constructor(
   48  		private contextViewService: IContextViewService,
   49: 		private telemetryService: ITelemetryService,
   50  		private notificationService: INotificationService,
   51  		private keybindingService: IKeybindingService,
   52  	) {}
   53
   54  	configure(options: IContextMenuHandlerOptions): void {

  224  		);
  225  	}
  226
  227  	private onActionRun(e: IRunEvent, logTelemetry: boolean): void {
  228  		if (logTelemetry) {
  229: 			this.telemetryService.publicLog2<
  230  				WorkbenchActionExecutedEvent,
  231  				WorkbenchActionExecutedClassification
  232  			>("workbenchActionExecuted", {
  233  				id: e.action.id,
  234  				from: "contextMenu",
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\platform\contextview\browser\contextMenuService.ts:

```sh
  11  import { createAndFillInContextMenuActions } from "vs/platform/actions/browser/menuEntryActionViewItem";
  12  import { IMenuService, MenuId } from "vs/platform/actions/common/actions";
  13  import { IContextKeyService } from "vs/platform/contextkey/common/contextkey";
  14  import { IKeybindingService } from "vs/platform/keybinding/common/keybinding";
  15  import { INotificationService } from "vs/platform/notification/common/notification";
  16: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
  17
  18  import {
  19  	ContextMenuHandler,
  20  	IContextMenuHandlerOptions,
  21  } from "./contextMenuHandler";

  34  	private _contextMenuHandler: ContextMenuHandler | undefined = undefined;
  35  	private get contextMenuHandler(): ContextMenuHandler {
  36  		if (!this._contextMenuHandler) {
  37  			this._contextMenuHandler = new ContextMenuHandler(
  38  				this.contextViewService,
  39: 				this.telemetryService,
  40  				this.notificationService,
  41  				this.keybindingService,
  42  			);
  43  		}
  44

  54  		new Emitter<void>(),
  55  	);
  56  	readonly onDidHideContextMenu = this._onDidHideContextMenu.event;
  57
  58  	constructor(
  59: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
  60  		@INotificationService
  61  		private readonly notificationService: INotificationService,
  62  		@IContextViewService
  63  		private readonly contextViewService: IContextViewService,
  64  		@IKeybindingService
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\platform\diagnostics\common\diagnostics.ts:

```sh
   99  	processInfo?: string;
  100  	workspaceInfo?: string;
  101  }
  102
  103  export interface IWorkspaceInformation extends IWorkspace {
  104: 	telemetryId: string | undefined;
  105  	rendererSessionId: string;
  106  }
  107
  108  export function isRemoteDiagnosticError(x: any): x is IRemoteDiagnosticError {
  109  	return !!x.hostName && !!x.errorMessage;
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\platform\diagnostics\node\diagnosticsService.ts:

```sh
   29  	WorkspaceStatItem,
   30  	WorkspaceStats,
   31  } from "vs/platform/diagnostics/common/diagnostics";
   32  import { ByteSize } from "vs/platform/files/common/files";
   33  import { IProductService } from "vs/platform/product/common/productService";
   34: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   35  import { IWorkspace } from "vs/platform/workspace/common/workspace";
   36
   37  interface ConfigFilePatterns {
   38  	tag: string;
   39  	filePattern: RegExp;

  262
  263  export class DiagnosticsService implements IDiagnosticsService {
  264  	declare readonly _serviceBrand: undefined;
  265
  266  	constructor(
  267: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
  268  		@IProductService private readonly productService: IProductService,
  269  	) {}
  270
  271  	private formatMachineInfo(info: IMachineInfo): string {
  272  		const output: string[] = [];

  715  				};
  716  				type WorkspaceStatsEvent = {
  717  					"workspace.id": string | undefined;
  718  					rendererSessionId: string;
  719  				};
  720: 				this.telemetryService.publicLog2<
  721  					WorkspaceStatsEvent,
  722  					WorkspaceStatsClassification
  723  				>("workspace.stats", {
  724: 					"workspace.id": workspace.telemetryId,
  725  					rendererSessionId: workspace.rendererSessionId,
  726  				});
  727  				type WorkspaceStatsFileClassification = {
  728  					owner: "lramos15";
  729  					comment: "Helps us gain insights into what type of files are being used in a workspace";

  747  					rendererSessionId: string;
  748  					type: string;
  749  					count: number;
  750  				};
  751  				stats.fileTypes.forEach((e) => {
  752: 					this.telemetryService.publicLog2<
  753  						WorkspaceStatsFileEvent,
  754  						WorkspaceStatsFileClassification
  755  					>("workspace.stats.file", {
  756  						rendererSessionId: workspace.rendererSessionId,
  757  						type: e.name,
  758  						count: e.count,
  759  					});
  760  				});
  761  				stats.launchConfigFiles.forEach((e) => {
  762: 					this.telemetryService.publicLog2<
  763  						WorkspaceStatsFileEvent,
  764  						WorkspaceStatsFileClassification
  765  					>("workspace.stats.launchConfigFile", {
  766  						rendererSessionId: workspace.rendererSessionId,
  767  						type: e.name,
  768  						count: e.count,
  769  					});
  770  				});
  771  				stats.configFiles.forEach((e) => {
  772: 					this.telemetryService.publicLog2<
  773  						WorkspaceStatsFileEvent,
  774  						WorkspaceStatsFileClassification
  775  					>("workspace.stats.configFiles", {
  776  						rendererSessionId: workspace.rendererSessionId,
  777  						type: e.name,

  808  					duration: number;
  809  					reachedLimit: boolean;
  810  					fileCount: number;
  811  					readdirCount: number;
  812  				};
  813: 				this.telemetryService.publicLog2<
  814  					WorkspaceStatsMetadata,
  815  					WorkspaceStatsMetadataClassification
  816  				>("workspace.stats.metadata", {
  817  					duration: stats.totalScanTime,
  818  					reachedLimit: stats.maxFilesReached,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\platform\dialogs\common\dialogs.ts:

```sh
14 import { URI } from "vs/base/common/uri"
15 import { MessageBoxOptions } from "vs/base/parts/sandbox/common/electronTypes"
16 import { localize } from "vs/nls"
17 import { createDecorator } from "vs/platform/instantiation/common/instantiation"
18 import { IProductService } from "vs/platform/product/common/productService"
19: import { ITelemetryData } from "vs/platform/telemetry/common/telemetry"
20
21 export interface IDialogArgs {
22 readonly confirmArgs?: IConfirmDialogArgs
23 readonly inputArgs?: IInputDialogArgs
24 readonly promptArgs?: IPromptDialogArgs

177 }
178
179 export interface IPickAndOpenOptions {
180 readonly forceNewWindow?: boolean
181 defaultUri?: URI
182: readonly telemetryExtraData?: ITelemetryData
183 availableFileSystems?: string[]
184 remoteAuthority?: string | null
185 }
186
187 export interface FileFilter {

679 export interface INativeOpenDialogOptions {
680 readonly forceNewWindow?: boolean
681
682 readonly defaultPath?: string
683
684: readonly telemetryEventName?: string
685: readonly telemetryExtraData?: ITelemetryData
686 }
687
688 export interface IMassagedMessageBoxOptions {
689 /**
690 * OS massaged message box options.
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\platform\environment\common\argv.ts:

```sh
3 * Licensed under the MIT License. See License.txt in the project root for license information.
4 *--------------------------------------------------------------------------------------------*/
5
6 export interface INativeCliOptions {
7 "cli-data-dir"?: string
8: "disable-telemetry"?: boolean
9: "telemetry-level"?: string
10 }
11
12 /**
13 * A list of command line arguments we support natively.
14 */

27 "folder-uri"?: string[]
// undefined or array of 1 or more
28 "file-uri"?: string[]
// undefined or array of 1 or more
29 _urls?: string[]
30 help?: boolean
31 version?: boolean
32: telemetry?: boolean
33 status?: boolean
34 wait?: boolean
35 waitMarkerFilePath?: string
36 diff?: boolean
37 merge?: boolean

85 "locate-extension"?: string[]
// undefined or array of 1 or more
86 "enable-proposed-api"?: string[]
// undefined or array of 1 or more
87 "open-url"?: boolean
88 "skip-release-notes"?: boolean
89 "skip-welcome"?: boolean
90: "disable-telemetry"?: boolean
91 "export-default-configuration"?: string
92 "install-source"?: string
93 "disable-updates"?: boolean
94 "use-inmemory-secretstorage"?: boolean
95 "password-store"?: string
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\platform\environment\common\environment.ts:

```sh
87 logLevel?: string
88 extensionLogLevel?: [string, string][]
89 verbose: boolean
90 isBuilt: boolean
91
92: // --- telemetry
93 disableTelemetry: boolean
94 serviceMachineIdResource: URI
95
96 // --- Policy
97 policyFile?: URI
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\platform\environment\common\environmentService.ts:

```sh
  307  		return this.args["crash-reporter-directory"];
  308  	}
  309
  310  	@memoize
  311  	get disableTelemetry(): boolean {
  312: 		return !!this.args["disable-telemetry"];
  313  	}
  314
  315  	@memoize
  316  	get disableWorkspaceTrust(): boolean {
  317  		return !!this.args["disable-workspace-trust"];
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\platform\environment\node\argv.ts:

```sh
   60  				description: localize(
   61  					"cliDataDir",
   62  					"Directory where CLI metadata should be stored.",
   63  				),
   64  			},
   65: 			"disable-telemetry": { type: "boolean" },
   66: 			"telemetry-level": { type: "string" },
   67  			user: {
   68  				type: "subcommand",
   69  				options: {
   70  					login: {
   71  						type: "subcommand",

   88  				description: localize(
   89  					"cliDataDir",
   90  					"Directory where CLI metadata should be stored.",
   91  				),
   92  			},
   93: 			"disable-telemetry": { type: "boolean" },
   94: 			"telemetry-level": { type: "string" },
   95  		},
   96  	},
   97
   98  	"diff": {
   99  		type: "boolean",

  386  			"disableChromiumSandbox",
  387  			"Use this option only when there is requirement to launch the application as sudo user on Linux or when running as an elevated user in an applocker environment on Windows.",
  388  		),
  389  	},
  390  	"sandbox": { type: "boolean" },
  391: 	"telemetry": {
  392  		type: "boolean",
  393  		cat: "t",
  394  		description: localize(
  395: 			"telemetry",
  396: 			"Shows all telemetry events which VS code collects.",
  397  		),
  398  	},
  399
  400  	"remote": { type: "string", allowEmptyValue: true },
  401  	"folder-uri": { type: "string[]", cat: "o", args: "uri" },

  426  	"install-source": { type: "string" },
  427  	"enable-smoke-test-driver": { type: "boolean" },
  428  	"logExtensionHostCommunication": { type: "boolean" },
  429  	"skip-release-notes": { type: "boolean" },
  430  	"skip-welcome": { type: "boolean" },
  431: 	"disable-telemetry": { type: "boolean" },
  432  	"disable-updates": { type: "boolean" },
  433  	"use-inmemory-secretstorage": {
  434  		type: "boolean",
  435  		deprecates: ["disable-keytar"],
  436  	},
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\platform\extensionManagement\common\abstractExtensionManagementService.ts:

```sh
    66  	TargetPlatform,
    67  } from "vs/platform/extensions/common/extensions";
    68  import { areApiProposalsCompatible } from "vs/platform/extensions/common/extensionValidator";
    69  import { ILogService } from "vs/platform/log/common/log";
    70  import { IProductService } from "vs/platform/product/common/productService";
    71: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
    72  import { IUriIdentityService } from "vs/platform/uriIdentity/common/uriIdentity";
    73  import { IUserDataProfilesService } from "vs/platform/userDataProfile/common/userDataProfile";
    74
    75  export type ExtensionVerificationStatus = boolean | string;
    76  export type InstallableExtension = {

   164
   165  	constructor(
   166  		@IExtensionGalleryService
   167  		protected readonly galleryService: IExtensionGalleryService,
   168  		@ITelemetryService
   169: 		protected readonly telemetryService: ITelemetryService,
   170  		@IUriIdentityService
   171  		protected readonly uriIdentityService: IUriIdentityService,
   172  		@ILogService protected readonly logService: ILogService,
   173  		@IProductService protected readonly productService: IProductService,
   174  		@IUserDataProfilesService

   715  							);
   716  						} catch (e) {
   717  							const error = toExtensionManagementError(e);
   718  							if (!URI.isUri(task.source)) {
   719  								reportTelemetry(
   720: 									this.telemetryService,
   721  									task.operation === InstallOperation.Update
   722  										? "extensionGallery:update"
   723  										: "extensionGallery:install",
   724  									{
   725  										extensionData:

   758  								? undefined
   759  								: (new Date().getTime() -
   760  										task.source.lastUpdated) /
   761  									1000;
   762  							reportTelemetry(
   763: 								this.telemetryService,
   764  								isUpdate
   765  									? "extensionGallery:update"
   766  									: "extensionGallery:install",
   767  								{
   768  									extensionData:

  1466  					`${extension.identifier.id}@${extension.manifest.version}`,
  1467  					uninstallOptions.profileLocation.toString(),
  1468  				);
  1469  			}
  1470  			reportTelemetry(
  1471: 				this.telemetryService,
  1472  				"extensionGallery:uninstall",
  1473  				{
  1474  					extensionData: getLocalExtensionTelemetryData(extension),
  1475  					error,
  1476  				},

  1916  	extensionManagementError.stack = error.stack;
  1917  	return extensionManagementError;
  1918  }
  1919
  1920  function reportTelemetry(
  1921: 	telemetryService: ITelemetryService,
  1922  	eventName: string,
  1923  	{
  1924  		extensionData,
  1925  		verificationStatus,
  1926  		duration,

  1997  			"${include}": [
  1998  				"${GalleryExtensionTelemetryData}"
  1999  			]
  2000  		}
  2001  	*/
  2002: 	telemetryService.publicLog(eventName, {
  2003  		...extensionData,
  2004  		verificationStatus,
  2005  		success: !error,
  2006  		duration,
  2007  		errorcode,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\platform\extensionManagement\common\extensionGalleryService.ts:

```sh
    75  	asTextOrError,
    76  	IRequestService,
    77  	isSuccess,
    78  } from "vs/platform/request/common/request";
    79  import { IStorageService } from "vs/platform/storage/common/storage";
    80: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
    81
    82  const CURRENT_TARGET_PLATFORM = isWeb
    83  	? TargetPlatform.WEB
    84  	: getTargetPlatform(platform, arch);
    85  const ACTIVITY_HEADER_NAME = "X-Market-Search-Activity-Id";

   506  			(criterium) => criterium.filterType === FilterType.SearchText,
   507  		)[0];
   508  		return criterium && criterium.value ? criterium.value : "";
   509  	}
   510
   511: 	get telemetryData(): QueryTelemetryData {
   512  		return {
   513  			filterTypes: this.state.criteria.map((criterium) =>
   514  				String(criterium.filterType),
   515  			),
   516  			flags: this.state.flags,

   746  		"index" : { "classification": "SystemMetaData", "purpose": "FeatureInsight", "isMeasurement": true },
   747  		"querySource": { "classification": "SystemMetaData", "purpose": "FeatureInsight" },
   748  		"queryActivityId": { "classification": "SystemMetaData", "purpose": "FeatureInsight" }
   749  	}
   750  	*/
   751: 	extension.telemetryData = {
   752  		index,
   753  		querySource,
   754  		queryActivityId: extension.queryContext?.[ACTIVITY_HEADER_NAME],
   755  	};
   756  }

   865  		storageService: IStorageService | undefined,
   866  		@IRequestService private readonly requestService: IRequestService,
   867  		@ILogService private readonly logService: ILogService,
   868  		@IEnvironmentService
   869  		private readonly environmentService: IEnvironmentService,
   870: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
   871  		@IFileService private readonly fileService: IFileService,
   872  		@IProductService private readonly productService: IProductService,
   873  		@IConfigurationService
   874  		private readonly configurationService: IConfigurationService,
   875  	) {

   893  			productService,
   894  			this.environmentService,
   895  			this.configurationService,
   896  			this.fileService,
   897  			storageService,
   898: 			this.telemetryService,
   899  		);
   900  	}
   901
   902  	private api(path = ""): string {
   903  		return `${this.extensionsGalleryUrl}${path}`;

   940  				extensionInfosByName.push({ ...e, uuid: undefined });
   941  			}
   942  		}
   943
   944  		if (extensionInfosByName.length) {
   945: 			// report telemetry data for additional query
   946: 			this.telemetryService.publicLog2<
   947  				{ count: number },
   948  				{
   949  					owner: "sandy081";
   950  					comment: "Report the query to the the Marketplace for fetching extensions by name";
   951  					readonly count: {

  1489  			const { extensions } = await this.queryGalleryExtensions(
  1490  				query,
  1491  				criteria,
  1492  				token,
  1493  			);
  1494: 			this.telemetryService.publicLog2<
  1495  				GalleryServiceAdditionalQueryEvent,
  1496  				GalleryServiceAdditionalQueryClassification
  1497  			>("galleryService:additionalQuery", {
  1498  				duration: stopWatch.elapsed(),
  1499  				count: needAllVersions.size,

  1712  						? ExtensionGalleryErrorCode.Timeout
  1713  						: ExtensionGalleryErrorCode.Failed;
  1714  				throw new ExtensionGalleryError(errorMessage, errorCode);
  1715  			}
  1716  		} finally {
  1717: 			this.telemetryService.publicLog2<
  1718  				GalleryServiceQueryEvent,
  1719  				GalleryServiceQueryClassification
  1720  			>("galleryService:query", {
  1721: 				...query.telemetryData,
  1722  				requestBodySize: String(data.length),
  1723  				duration: stopWatch.elapsed(),
  1724  				success: !!context && isSuccess(context),
  1725  				responseBodySize: context?.res.headers["Content-Length"],
  1726  				statusCode: context

  1834  				"${include}": [
  1835  					"${GalleryExtensionTelemetryData}"
  1836  				]
  1837  			}
  1838  		*/
  1839: 		this.telemetryService.publicLog("galleryService:downloadVSIX", {
  1840  			...data,
  1841  			duration: new Date().getTime() - startTime,
  1842  		});
  1843  	}
  1844

  2119  			type GalleryServiceCDNFallbackEvent = {
  2120  				extension: string;
  2121  				assetType: string;
  2122  				message: string;
  2123  			};
  2124: 			this.telemetryService.publicLog2<
  2125  				GalleryServiceCDNFallbackEvent,
  2126  				GalleryServiceCDNFallbackClassification
  2127  			>("galleryService:cdnFallback", { extension, assetType, message });
  2128
  2129  			const fallbackOptions = { ...options, url: fallbackUrl };

  2153  			};
  2154  			type GalleryServiceEngineFallbackEvent = {
  2155  				extension: string;
  2156  				version: string;
  2157  			};
  2158: 			this.telemetryService.publicLog2<
  2159  				GalleryServiceEngineFallbackEvent,
  2160  				GalleryServiceEngineFallbackClassification
  2161  			>("galleryService:engineFallback", {
  2162  				extension,
  2163  				version: rawExtensionVersion.version,

  2268  	constructor(
  2269  		@IStorageService storageService: IStorageService,
  2270  		@IRequestService requestService: IRequestService,
  2271  		@ILogService logService: ILogService,
  2272  		@IEnvironmentService environmentService: IEnvironmentService,
  2273: 		@ITelemetryService telemetryService: ITelemetryService,
  2274  		@IFileService fileService: IFileService,
  2275  		@IProductService productService: IProductService,
  2276  		@IConfigurationService configurationService: IConfigurationService,
  2277  	) {
  2278  		super(
  2279  			storageService,
  2280  			requestService,
  2281  			logService,
  2282  			environmentService,
  2283: 			telemetryService,
  2284  			fileService,
  2285  			productService,
  2286  			configurationService,
  2287  		);
  2288  	}

  2291  export class ExtensionGalleryServiceWithNoStorageService extends AbstractExtensionGalleryService {
  2292  	constructor(
  2293  		@IRequestService requestService: IRequestService,
  2294  		@ILogService logService: ILogService,
  2295  		@IEnvironmentService environmentService: IEnvironmentService,
  2296: 		@ITelemetryService telemetryService: ITelemetryService,
  2297  		@IFileService fileService: IFileService,
  2298  		@IProductService productService: IProductService,
  2299  		@IConfigurationService configurationService: IConfigurationService,
  2300  	) {
  2301  		super(
  2302  			undefined,
  2303  			requestService,
  2304  			logService,
  2305  			environmentService,
  2306: 			telemetryService,
  2307  			fileService,
  2308  			productService,
  2309  			configurationService,
  2310  		);
  2311  	}
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\platform\extensionManagement\common\extensionManagement.ts:

```sh
  287  	hasReleaseVersion: boolean;
  288  	isSigned: boolean;
  289  	allTargetPlatforms: TargetPlatform[];
  290  	assets: IGalleryExtensionAssets;
  291  	properties: IGalleryExtensionProperties;
  292: 	telemetryData?: any;
  293  	queryContext?: IStringDictionary<any>;
  294  	supportLink?: string;
  295  }
  296
  297  export type InstallSource = "gallery" | "vsix" | "resource";
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\platform\extensionManagement\common\extensionManagementUtil.ts:

```sh
   20  	TargetPlatform,
   21  	UNDEFINED_PUBLISHER,
   22  } from "vs/platform/extensions/common/extensions";
   23  import { IFileService } from "vs/platform/files/common/files";
   24  import { ILogService } from "vs/platform/log/common/log";
   25: import { TelemetryTrustedValue } from "vs/platform/telemetry/common/telemetryUtils";
   26
   27  export function areSameExtensions(
   28  	a: IExtensionIdentifier,
   29  	b: IExtensionIdentifier,
   30  ): boolean {

  193  		dependencies: !!(
  194  			extension.properties.dependencies &&
  195  			extension.properties.dependencies.length > 0
  196  		),
  197  		isSigned: extension.isSigned,
  198: 		...extension.telemetryData,
  199  	};
  200  }
  201
  202  export const BetterMergeId = new ExtensionIdentifier("pprice.better-merge");
  203
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\platform\extensionManagement\common\extensionsProfileScannerService.ts:

```sh
   25  	IFileService,
   26  	toFileOperationResult,
   27  } from "vs/platform/files/common/files";
   28  import { createDecorator } from "vs/platform/instantiation/common/instantiation";
   29  import { ILogService } from "vs/platform/log/common/log";
   30: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   31  import { IUriIdentityService } from "vs/platform/uriIdentity/common/uriIdentity";
   32  import { IUserDataProfilesService } from "vs/platform/userDataProfile/common/userDataProfile";
   33
   34  interface IStoredProfileExtension {
   35  	identifier: IExtensionIdentifier;

  151  		@IFileService private readonly fileService: IFileService,
  152  		@IUserDataProfilesService
  153  		private readonly userDataProfilesService: IUserDataProfilesService,
  154  		@IUriIdentityService
  155  		private readonly uriIdentityService: IUriIdentityService,
  156: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
  157  		@ILogService private readonly logService: ILogService,
  158  	) {
  159  		super();
  160  	}
  161

  486  		};
  487  		const error = new ExtensionsProfileScanningError(
  488  			`Invalid extensions content in ${file.toString()}`,
  489  			ExtensionsProfileScanningErrorCode.ERROR_INVALID_CONTENT,
  490  		);
  491: 		this.telemetryService.publicLogError2<
  492  			{ code: string },
  493  			ErrorClassification
  494  		>("extensionsProfileScanningError", { code: error.code });
  495  		throw error;
  496  	}
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\platform\extensionManagement\common\extensionTipsService.ts:

```sh
   33  import {
   34  	IStorageService,
   35  	StorageScope,
   36  	StorageTarget,
   37  } from "vs/platform/storage/common/storage";
   38: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   39
   40  //#region Base Extension Tips Service
   41
   42  export class ExtensionTipsService
   43  	extends Disposable

  180  		private readonly userHome: URI,
  181  		private readonly windowEvents: {
  182  			readonly onDidOpenMainWindow: Event<unknown>;
  183  			readonly onDidFocusMainWindow: Event<unknown>;
  184  		},
  185: 		private readonly telemetryService: ITelemetryService,
  186  		private readonly extensionManagementService: IExtensionManagementService,
  187  		private readonly storageService: IStorageService,
  188  		private readonly extensionRecommendationNotificationService: IExtensionRecommendationNotificationService,
  189  		fileService: IFileService,
  190  		productService: IProductService,

  258  			);
  259  		}
  260
  261  		/*
  262  			3s has come out to be the good number to fetch and prompt important exe based recommendations
  263: 			Also fetch important exe based recommendations for reporting telemetry
  264  		*/
  265  		disposableTimeout(
  266  			async () => {
  267  				await this.collectTips();
  268  				this.promptHighImportanceExeBasedTip();

  339
  340  		/* Log installed and uninstalled exe based recommendations */
  341  		for (const extensionId of installed) {
  342  			const tip = importantExeBasedRecommendations.get(extensionId);
  343  			if (tip) {
  344: 				this.telemetryService.publicLog2<
  345  					{ exeName: string; extensionId: string },
  346  					ExeExtensionRecommendationsClassification
  347  				>("exeExtensionRecommendations:alreadyInstalled", {
  348  					extensionId,
  349  					exeName: tip.exeName,

  351  			}
  352  		}
  353  		for (const extensionId of recommendations) {
  354  			const tip = importantExeBasedRecommendations.get(extensionId);
  355  			if (tip) {
  356: 				this.telemetryService.publicLog2<
  357  					{ exeName: string; extensionId: string },
  358  					ExeExtensionRecommendationsClassification
  359  				>("exeExtensionRecommendations:notInstalled", {
  360  					extensionId,
  361  					exeName: tip.exeName,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\platform\extensionManagement\electron-sandbox\extensionsProfileScannerService.ts:

```sh
  13  import {
  14  	InstantiationType,
  15  	registerSingleton,
  16  } from "vs/platform/instantiation/common/extensions";
  17  import { ILogService } from "vs/platform/log/common/log";
  18: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
  19  import { IUriIdentityService } from "vs/platform/uriIdentity/common/uriIdentity";
  20  import { IUserDataProfilesService } from "vs/platform/userDataProfile/common/userDataProfile";
  21
  22  export class ExtensionsProfileScannerService extends AbstractExtensionsProfileScannerService {
  23  	constructor(

  25  		environmentService: INativeEnvironmentService,
  26  		@IFileService fileService: IFileService,
  27  		@IUserDataProfilesService
  28  		userDataProfilesService: IUserDataProfilesService,
  29  		@IUriIdentityService uriIdentityService: IUriIdentityService,
  30: 		@ITelemetryService telemetryService: ITelemetryService,
  31  		@ILogService logService: ILogService,
  32  	) {
  33  		super(
  34  			URI.file(environmentService.extensionsPath),
  35  			fileService,
  36  			userDataProfilesService,
  37  			uriIdentityService,
  38: 			telemetryService,
  39  			logService,
  40  		);
  41  	}
  42  }
  43
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\platform\extensionManagement\node\extensionDownloader.ts:

```sh
   41  import {
   42  	IFileService,
   43  	IFileStatWithMetadata,
   44  } from "vs/platform/files/common/files";
   45  import { ILogService } from "vs/platform/log/common/log";
   46: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   47
   48  type RetryDownloadClassification = {
   49  	owner: "sandy081";
   50  	comment: "Event reporting the retry of downloading";
   51  	extensionId: {

   80  		private readonly extensionGalleryService: IExtensionGalleryService,
   81  		@IConfigurationService
   82  		private readonly configurationService: IConfigurationService,
   83  		@IExtensionSignatureVerificationService
   84  		private readonly extensionSignatureVerificationService: IExtensionSignatureVerificationService,
   85: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
   86  		@ILogService private readonly logService: ILogService,
   87  	) {
   88  		super();
   89  		this.extensionsDownloadDir =
   90  			environmentService.extensionsDownloadLocation;

  217  				},
  218  				2,
  219  			);
  220
  221  			if (attempts > 1) {
  222: 				this.telemetryService.publicLog2<
  223  					RetryDownloadEvent,
  224  					RetryDownloadClassification
  225  				>("extensiongallery:downloadvsix:retry", {
  226  					extensionId: extension.identifier.id,
  227  					attempts,

  269  				},
  270  				2,
  271  			);
  272
  273  			if (attempts > 1) {
  274: 				this.telemetryService.publicLog2<
  275  					RetryDownloadEvent,
  276  					RetryDownloadClassification
  277  				>("extensiongallery:downloadsigzip:retry", {
  278  					extensionId: extension.identifier.id,
  279  					attempts,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\platform\extensionManagement\node\extensionManagementService.ts:

```sh
    95  	IInstantiationService,
    96  	refineServiceDecorator,
    97  } from "vs/platform/instantiation/common/instantiation";
    98  import { ILogService } from "vs/platform/log/common/log";
    99  import { IProductService } from "vs/platform/product/common/productService";
   100: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   101  import { IUriIdentityService } from "vs/platform/uriIdentity/common/uriIdentity";
   102  import { IUserDataProfilesService } from "vs/platform/userDataProfile/common/userDataProfile";
   103
   104  export const INativeServerExtensionManagementService = refineServiceDecorator<
   105  	IExtensionManagementService,

   135  		Promise<ExtractExtensionResult>
   136  	>();
   137
   138  	constructor(
   139  		@IExtensionGalleryService galleryService: IExtensionGalleryService,
   140: 		@ITelemetryService telemetryService: ITelemetryService,
   141  		@ILogService logService: ILogService,
   142  		@INativeEnvironmentService
   143  		environmentService: INativeEnvironmentService,
   144  		@IExtensionsScannerService
   145  		private readonly extensionsScannerService: IExtensionsScannerService,

   154  		@IUserDataProfilesService
   155  		userDataProfilesService: IUserDataProfilesService,
   156  	) {
   157  		super(
   158  			galleryService,
   159: 			telemetryService,
   160  			uriIdentityService,
   161  			logService,
   162  			productService,
   163  			userDataProfilesService,
   164  		);

  1013  		private readonly extensionsScannerService: IExtensionsScannerService,
  1014  		@IExtensionsProfileScannerService
  1015  		private readonly extensionsProfileScannerService: IExtensionsProfileScannerService,
  1016  		@IUriIdentityService
  1017  		private readonly uriIdentityService: IUriIdentityService,
  1018: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
  1019  		@ILogService private readonly logService: ILogService,
  1020  	) {
  1021  		super();
  1022  		this.uninstalledResource = joinPath(
  1023  			this.extensionsScannerService.userExtensionsLocation,

  1223  				await this.extensionsScannerService.updateMetadata(
  1224  					tempLocation,
  1225  					metadata,
  1226  				);
  1227  			} catch (error) {
  1228: 				this.telemetryService.publicLog2<
  1229  					UpdateMetadataErrorEvent,
  1230  					UpdateMetadataErrorClassification
  1231  				>("extension:extract", {
  1232  					extensionId: extensionKey.id,
  1233  					code: `${toFileOperationResult(error)}`,

  1331  					local.location,
  1332  					metadata,
  1333  				);
  1334  			}
  1335  		} catch (error) {
  1336: 			this.telemetryService.publicLog2<
  1337  				UpdateMetadataErrorEvent,
  1338  				UpdateMetadataErrorClassification
  1339  			>("extension:extract", {
  1340  				extensionId: local.identifier.id,
  1341  				code: `${toFileOperationResult(error)}`,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\platform\extensionManagement\node\extensionSignatureVerificationService.ts:

```sh
    7  import { getErrorMessage } from "vs/base/common/errors";
    8  import { IGalleryExtension } from "vs/platform/extensionManagement/common/extensionManagement";
    9  import { TargetPlatform } from "vs/platform/extensions/common/extensions";
   10  import { createDecorator } from "vs/platform/instantiation/common/instantiation";
   11  import { ILogService, LogLevel } from "vs/platform/log/common/log";
   12: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   13
   14  export const IExtensionSignatureVerificationService =
   15  	createDecorator<IExtensionSignatureVerificationService>(
   16  		"IExtensionSignatureVerificationService",
   17  	);

  101
  102  	private moduleLoadingPromise: Promise<typeof vsceSign> | undefined;
  103
  104  	constructor(
  105  		@ILogService private readonly logService: ILogService,
  106: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
  107  	) {}
  108
  109  	private vsceSign(): Promise<typeof vsceSign> {
  110  		if (!this.moduleLoadingPromise) {
  111  			this.moduleLoadingPromise = this.resolveVsceSign();

  225  			internalCode?: number;
  226  			duration: number;
  227  			didExecute: boolean;
  228  			clientTargetPlatform?: string;
  229  		};
  230: 		this.telemetryService.publicLog2<
  231  			ExtensionSignatureVerificationEvent,
  232  			ExtensionSignatureVerificationClassification
  233  		>("extensionsignature:verification", {
  234  			extensionId,
  235  			extensionVersion: extension.version,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\platform\extensionManagement\node\extensionsProfileScannerService.ts:

```sh
   6  import { URI } from "vs/base/common/uri";
   7  import { INativeEnvironmentService } from "vs/platform/environment/common/environment";
   8  import { AbstractExtensionsProfileScannerService } from "vs/platform/extensionManagement/common/extensionsProfileScannerService";
   9  import { IFileService } from "vs/platform/files/common/files";
  10  import { ILogService } from "vs/platform/log/common/log";
  11: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
  12  import { IUriIdentityService } from "vs/platform/uriIdentity/common/uriIdentity";
  13  import { IUserDataProfilesService } from "vs/platform/userDataProfile/common/userDataProfile";
  14
  15  export class ExtensionsProfileScannerService extends AbstractExtensionsProfileScannerService {
  16  	constructor(

  18  		environmentService: INativeEnvironmentService,
  19  		@IFileService fileService: IFileService,
  20  		@IUserDataProfilesService
  21  		userDataProfilesService: IUserDataProfilesService,
  22  		@IUriIdentityService uriIdentityService: IUriIdentityService,
  23: 		@ITelemetryService telemetryService: ITelemetryService,
  24  		@ILogService logService: ILogService,
  25  	) {
  26  		super(
  27  			URI.file(environmentService.extensionsPath),
  28  			fileService,
  29  			userDataProfilesService,
  30  			uriIdentityService,
  31: 			telemetryService,
  32  			logService,
  33  		);
  34  	}
  35  }
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\platform\extensionManagement\node\extensionTipsService.ts:

```sh
   9  import { IExtensionRecommendationNotificationService } from "vs/platform/extensionRecommendations/common/extensionRecommendations";
  10  import { IFileService } from "vs/platform/files/common/files";
  11  import { INativeHostService } from "vs/platform/native/common/native";
  12  import { IProductService } from "vs/platform/product/common/productService";
  13  import { IStorageService } from "vs/platform/storage/common/storage";
  14: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
  15
  16  export class ExtensionTipsService extends AbstractNativeExtensionTipsService {
  17  	constructor(
  18  		@INativeEnvironmentService
  19  		environmentService: INativeEnvironmentService,
  20: 		@ITelemetryService telemetryService: ITelemetryService,
  21  		@IExtensionManagementService
  22  		extensionManagementService: IExtensionManagementService,
  23  		@IStorageService storageService: IStorageService,
  24  		@INativeHostService nativeHostService: INativeHostService,
  25  		@IExtensionRecommendationNotificationService

  28  		@IProductService productService: IProductService,
  29  	) {
  30  		super(
  31  			environmentService.userHome,
  32  			nativeHostService,
  33: 			telemetryService,
  34  			extensionManagementService,
  35  			storageService,
  36  			extensionRecommendationNotificationService,
  37  			fileService,
  38  			productService,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\platform\extensionResourceLoader\common\extensionResourceLoader.ts:

```sh
  13  import { getServiceMachineId } from "vs/platform/externalServices/common/serviceMachineId";
  14  import { IFileService } from "vs/platform/files/common/files";
  15  import { createDecorator } from "vs/platform/instantiation/common/instantiation";
  16  import { IProductService } from "vs/platform/product/common/productService";
  17  import { IStorageService } from "vs/platform/storage/common/storage";
  18: import { TelemetryLevel } from "vs/platform/telemetry/common/telemetry";
  19  import {
  20  	getTelemetryLevel,
  21  	supportsTelemetry,
  22: } from "vs/platform/telemetry/common/telemetryUtils";
  23
  24  const WEB_EXTENSION_RESOURCE_END_POINT_SEGMENT = "/web-extension-resource/";
  25
  26  export const IExtensionResourceLoaderService =
  27  	createDecorator<IExtensionResourceLoaderService>(
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\platform\extensions\common\extensionsApiProposals.ts:

```sh
458 },
459 taskPresentationGroup: {
460 proposal:
461 "https://raw.githubusercontent.com/microsoft/vscode/main/src/vscode-dts/vscode.proposed.taskPresentationGroup.d.ts",
462 },
463: telemetry: {
464 proposal:
465: "https://raw.githubusercontent.com/microsoft/vscode/main/src/vscode-dts/vscode.proposed.telemetry.d.ts",
466 },
467 terminalDataWriteEvent: {
468 proposal:
469 "https://raw.githubusercontent.com/microsoft/vscode/main/src/vscode-dts/vscode.proposed.terminalDataWriteEvent.d.ts",
470 },
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\platform\extensions\electron-main\extensionHostStarter.ts:

```sh
  11  	IExtensionHostProcessOptions,
  12  	IExtensionHostStarter,
  13  } from "vs/platform/extensions/common/extensionHostStarter";
  14  import { ILifecycleMainService } from "vs/platform/lifecycle/electron-main/lifecycleMainService";
  15  import { ILogService } from "vs/platform/log/common/log";
  16: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
  17  import { WindowUtilityProcess } from "vs/platform/utilityProcess/electron-main/utilityProcess";
  18  import { IWindowsMainService } from "vs/platform/windows/electron-main/windows";
  19
  20  export class ExtensionHostStarter
  21  	extends Disposable

  33  		@ILifecycleMainService
  34  		private readonly _lifecycleMainService: ILifecycleMainService,
  35  		@IWindowsMainService
  36  		private readonly _windowsMainService: IWindowsMainService,
  37  		@ITelemetryService
  38: 		private readonly _telemetryService: ITelemetryService,
  39  	) {
  40  		super();
  41
  42  		// On shutdown: gracefully await extension host shutdowns
  43  		this._register(

  83  		}
  84  		const id = String(++ExtensionHostStarter._lastId);
  85  		const extHost = new WindowUtilityProcess(
  86  			this._logService,
  87  			this._windowsMainService,
  88: 			this._telemetryService,
  89  			this._lifecycleMainService,
  90  		);
  91  		this._extHosts.set(id, extHost);
  92  		const disposable = extHost.onExit(({ pid, code, signal }) => {
  93  			disposable.dispose();
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\platform\externalServices\common\marketplace.ts:

```sh
  11  import { IProductService } from "vs/platform/product/common/productService";
  12  import { IStorageService } from "vs/platform/storage/common/storage";
  13  import {
  14  	ITelemetryService,
  15  	TelemetryLevel,
  16: } from "vs/platform/telemetry/common/telemetry";
  17  import {
  18  	getTelemetryLevel,
  19  	supportsTelemetry,
  20: } from "vs/platform/telemetry/common/telemetryUtils";
  21
  22  export async function resolveMarketplaceHeaders(
  23  	version: string,
  24  	productService: IProductService,
  25  	environmentService: IEnvironmentService,
  26  	configurationService: IConfigurationService,
  27  	fileService: IFileService,
  28  	storageService: IStorageService | undefined,
  29: 	telemetryService: ITelemetryService,
  30  ): Promise<IHeaders> {
  31  	const headers: IHeaders = {
  32  		"X-Market-Client-Id": `VSCode ${version}`,
  33  		"User-Agent": `VSCode ${version} (${productService.nameShort})`,
  34  	};

  41  			environmentService,
  42  			fileService,
  43  			storageService,
  44  		);
  45  		headers["X-Market-User-Id"] = serviceMachineId;
  46: 		// Send machineId as VSCode-SessionId so we can correlate telemetry events across different services
  47  		// machineId can be undefined sometimes (eg: when launching from CLI), so send serviceMachineId instead otherwise
  48  		// Marketplace will reject the request if there is no VSCode-SessionId header
  49  		headers["VSCode-SessionId"] =
  50: 			telemetryService.machineId || serviceMachineId;
  51  	}
  52
  53  	return headers;
  54  }
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\platform\keybinding\common\abstractKeybindingService.ts:

```sh
   38  	ResultKind,
   39  } from "vs/platform/keybinding/common/keybindingResolver";
   40  import { ResolvedKeybindingItem } from "vs/platform/keybinding/common/resolvedKeybindingItem";
   41  import { ILogService } from "vs/platform/log/common/log";
   42  import { INotificationService } from "vs/platform/notification/common/notification";
   43: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   44
   45  interface CurrentChord {
   46  	keypress: string;
   47  	label: string | null;
   48  }

   88  	}
   89
   90  	constructor(
   91  		private _contextKeyService: IContextKeyService,
   92  		protected _commandService: ICommandService,
   93: 		protected _telemetryService: ITelemetryService,
   94  		private _notificationService: INotificationService,
   95  		protected _logService: ILogService,
   96  	) {
   97  		super();
   98

  542  					} finally {
  543  						this._currentlyDispatchingCommandId = null;
  544  					}
  545
  546  					if (!HIGH_FREQ_COMMANDS.test(resolveResult.commandId)) {
  547: 						this._telemetryService.publicLog2<
  548  							WorkbenchActionExecutedEvent,
  549  							WorkbenchActionExecutedClassification
  550  						>("workbenchActionExecuted", {
  551  							id: resolveResult.commandId,
  552  							from: "keybinding",
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\platform\menubar\electron-main\menubar.ts:

```sh
    40  	MenubarMenuItem,
    41  } from "vs/platform/menubar/common/menubar";
    42  import { INativeHostMainService } from "vs/platform/native/electron-main/nativeHostMainService";
    43  import { IProductService } from "vs/platform/product/common/productService";
    44  import { IStateService } from "vs/platform/state/node/state";
    45: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
    46  import { IUpdateService, StateType } from "vs/platform/update/common/update";
    47  import {
    48  	hasNativeTitlebar,
    49  	INativeRunActionInWindowRequest,
    50  	INativeRunKeybindingInWindowRequest,

    55  	IWindowsMainService,
    56  	OpenContext,
    57  } from "vs/platform/windows/electron-main/windows";
    58  import { IWorkspacesHistoryMainService } from "vs/platform/workspaces/electron-main/workspacesHistoryMainService";
    59
    60: const telemetryFrom = "menu";
    61
    62  interface IMenuItemClickHandler {
    63  	inDevTools: (contents: WebContents) => void;
    64  	inNoWindow: () => void;
    65  }

   105  		private readonly configurationService: IConfigurationService,
   106  		@IWindowsMainService
   107  		private readonly windowsMainService: IWindowsMainService,
   108  		@IEnvironmentMainService
   109  		private readonly environmentMainService: IEnvironmentMainService,
   110: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
   111  		@IWorkspacesHistoryMainService
   112  		private readonly workspacesHistoryMainService: IWorkspacesHistoryMainService,
   113  		@IStateService private readonly stateService: IStateService,
   114  		@ILifecycleMainService
   115  		private readonly lifecycleMainService: ILifecycleMainService,

   196  			win,
   197  			event,
   198  		) =>
   199  			this.nativeHostMainService.pickFileFolderAndOpen(undefined, {
   200  				forceNewWindow: this.isOptionClick(event),
   201: 				telemetryExtraData: { from: telemetryFrom },
   202  			});
   203  		this.fallbackMenuHandlers["workbench.action.files.openFolder"] = (
   204  			menuItem,
   205  			win,
   206  			event,
   207  		) =>
   208  			this.nativeHostMainService.pickFolderAndOpen(undefined, {
   209  				forceNewWindow: this.isOptionClick(event),
   210: 				telemetryExtraData: { from: telemetryFrom },
   211  			});
   212  		this.fallbackMenuHandlers["workbench.action.openWorkspace"] = (
   213  			menuItem,
   214  			win,
   215  			event,
   216  		) =>
   217  			this.nativeHostMainService.pickWorkspaceAndOpen(undefined, {
   218  				forceNewWindow: this.isOptionClick(event),
   219: 				telemetryExtraData: { from: telemetryFrom },
   220  			});
   221
   222  		// Recent Menu Items
   223  		this.fallbackMenuHandlers["workbench.action.clearRecentFiles"] = () =>
   224  			this.workspacesHistoryMainService.clearRecentlyOpened({

  1440  		this.nativeHostMainService.openExternal(undefined, url);
  1441  		this.reportMenuActionTelemetry(id);
  1442  	}
  1443
  1444  	private reportMenuActionTelemetry(id: string): void {
  1445: 		this.telemetryService.publicLog2<
  1446  			WorkbenchActionExecutedEvent,
  1447  			WorkbenchActionExecutedClassification
  1448: 		>("workbenchActionExecuted", { id, from: telemetryFrom });
  1449  	}
  1450
  1451  	private mnemonicLabel(label: string): string {
  1452  		return mnemonicMenuLabel(label, !this.currentEnableMenuBarMnemonics);
  1453  	}
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\platform\profiling\common\profilingTelemetrySpec.ts:

```sh
   4   *--------------------------------------------------------------------------------------------*/
   5
   6  import { errorHandler } from "vs/base/common/errors";
   7  import { ILogService } from "vs/platform/log/common/log";
   8  import { BottomUpSample } from "vs/platform/profiling/common/profilingModel";
   9: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
  10
  11  type TelemetrySampleData = {
  12  	selfTime: number;
  13  	totalTime: number;
  14  	percentage: number;

  70  	source: string;
  71  }
  72
  73  export function reportSample(
  74  	data: SampleData,
  75: 	telemetryService: ITelemetryService,
  76  	logService: ILogService,
  77  	sendAsErrorTelemtry: boolean,
  78  ): void {
  79  	const { sample, perfBaseline, source } = data;
  80
  81: 	// send telemetry event
  82: 	telemetryService.publicLog2<
  83  		TelemetrySampleData,
  84  		TelemetrySampleDataClassification
  85  	>(`unresponsive.sample`, {
  86  		perfBaseline,
  87  		selfTime: sample.selfTime,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\platform\profiling\electron-sandbox\profileAnalysisWorkerService.ts:

```sh
  13  import { createDecorator } from "vs/platform/instantiation/common/instantiation";
  14  import { ILogService } from "vs/platform/log/common/log";
  15  import { IV8Profile } from "vs/platform/profiling/common/profiling";
  16  import { BottomUpSample } from "vs/platform/profiling/common/profilingModel";
  17  import { reportSample } from "vs/platform/profiling/common/profilingTelemetrySpec";
  18: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
  19
  20  export const enum ProfilingOutput {
  21  	Failure,
  22  	Irrelevant,
  23  	Interesting,

  51  class ProfileAnalysisWorkerService implements IProfileAnalysisWorkerService {
  52  	declare _serviceBrand: undefined;
  53
  54  	constructor(
  55  		@ITelemetryService
  56: 		private readonly _telemetryService: ITelemetryService,
  57  		@ILogService private readonly _logService: ILogService,
  58  	) {}
  59
  60  	private async _withWorker<R>(
  61  		callback: (worker: Proxied<IProfileAnalysisWorker>) => Promise<R>,

  87  						{
  88  							sample,
  89  							perfBaseline,
  90  							source: callFrameClassifier(sample.url),
  91  						},
  92: 						this._telemetryService,
  93  						this._logService,
  94  						sendAsErrorTelemtry,
  95  					);
  96  				}
  97  			}
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\platform\quickinput\browser\commandsQuickAccess.ts:

```sh
   48  	IStorageService,
   49  	StorageScope,
   50  	StorageTarget,
   51  	WillSaveStateReason,
   52  } from "vs/platform/storage/common/storage";
   53: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   54
   55  export interface ICommandQuickPick extends IPickerQuickAccessItem {
   56  	readonly commandId: string;
   57  	readonly commandWhen?: string;
   58  	readonly commandAlias?: string;

   93  		@IInstantiationService
   94  		private readonly instantiationService: IInstantiationService,
   95  		@IKeybindingService
   96  		protected readonly keybindingService: IKeybindingService,
   97  		@ICommandService private readonly commandService: ICommandService,
   98: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
   99  		@IDialogService private readonly dialogService: IDialogService,
  100  	) {
  101  		super(AbstractCommandsQuickAccessProvider.PREFIX, options);
  102
  103  		this.options = options;

  389  			accept: async () => {
  390  				// Add to history
  391  				this.commandsHistory.push(commandPick.commandId);
  392
  393  				// Telementry
  394: 				this.telemetryService.publicLog2<
  395  					WorkbenchActionExecutedEvent,
  396  					WorkbenchActionExecutedClassification
  397  				>("workbenchActionExecuted", {
  398  					id: commandPick.commandId,
  399  					from: runOptions?.from ?? "quick open",
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\platform\remote\browser\remoteAuthorityResolverService.ts:

```sh
  174  	}
  175
  176  	_setResolvedAuthorityError(authority: string, err: any): void {
  177  		if (this._resolveAuthorityRequests.has(authority)) {
  178  			const request = this._resolveAuthorityRequests.get(authority)!;
  179: 			// Avoid that this error makes it to telemetry
  180  			request.error(errors.ErrorNoTelemetry.fromError(err));
  181  		}
  182  	}
  183
  184  	_setAuthorityConnectionToken(
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\platform\remote\electron-sandbox\remoteAuthorityResolverService.ts:

```sh
  141  	}
  142
  143  	_setResolvedAuthorityError(authority: string, err: any): void {
  144  		if (this._resolveAuthorityRequests.has(authority)) {
  145  			const request = this._resolveAuthorityRequests.get(authority)!;
  146: 			// Avoid that this error makes it to telemetry
  147  			request.error(errors.ErrorNoTelemetry.fromError(err));
  148  		}
  149  	}
  150
  151  	_setAuthorityConnectionToken(
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\platform\remoteTunnel\node\remoteTunnelService.ts:

```sh
   44  import {
   45  	IStorageService,
   46  	StorageScope,
   47  	StorageTarget,
   48  } from "vs/platform/storage/common/storage";
   49: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   50
   51  type RemoteTunnelEnablementClassification = {
   52  	owner: "aeschli";
   53  	comment: "Reporting when Remote Tunnel access is turned on or off";
   54  	enabled?: {

  122  	private _tunnelCommand: string | undefined;
  123
  124  	private _initialized = false;
  125
  126  	constructor(
  127: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
  128  		@IProductService private readonly productService: IProductService,
  129  		@INativeEnvironmentService
  130  		private readonly environmentService: INativeEnvironmentService,
  131  		@ILoggerService loggerService: ILoggerService,
  132  		@ISharedProcessLifecycleService

  313
  314  		this.setTunnelStatus(TunnelStates.disconnected());
  315  	}
  316
  317  	private async updateTunnelProcess(): Promise<void> {
  318: 		this.telemetryService.publicLog2<
  319  			RemoteTunnelEnablementEvent,
  320  			RemoteTunnelEnablementClassification
  321  		>("remoteTunnel.enablement", {
  322  			enabled: this._mode.active,
  323  			service: this._mode.active && this._mode.asService,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\platform\sharedProcess\electron-main\sharedProcess.ts:

```sh
  19  	SharedProcessChannelConnection,
  20  	SharedProcessLifecycle,
  21  	SharedProcessRawConnection,
  22  } from "vs/platform/sharedProcess/common/sharedProcess";
  23  import { ISharedProcessConfiguration } from "vs/platform/sharedProcess/node/sharedProcess";
  24: import { NullTelemetryService } from "vs/platform/telemetry/common/telemetryUtils";
  25  import { IUserDataProfilesService } from "vs/platform/userDataProfile/common/userDataProfile";
  26  import { UtilityProcess } from "vs/platform/utilityProcess/electron-main/utilityProcess";
  27
  28  export class SharedProcess extends Disposable {
  29  	private readonly firstWindowConnectionBarrier = new Barrier();
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\platform\storage\electron-main\storageMain.ts:

```sh
   30  import { IS_NEW_KEY } from "vs/platform/storage/common/storage";
   31  import {
   32  	currentSessionDateStorageKey,
   33  	firstSessionDateStorageKey,
   34  	lastSessionDateStorageKey,
   35: } from "vs/platform/telemetry/common/telemetry";
   36  import {
   37  	IUserDataProfile,
   38  	IUserDataProfilesService,
   39  } from "vs/platform/userDataProfile/common/userDataProfile";
   40  import {

  391  	}
  392
  393  	protected override async doInit(storage: IStorage): Promise<void> {
  394  		await super.doInit(storage);
  395
  396: 		// Apply telemetry values as part of the application storage initialization
  397  		this.updateTelemetryState(storage);
  398  	}
  399
  400  	private updateTelemetryState(storage: IStorage): void {
  401  		// First session date (once)
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\platform\telemetry\browser\1dsAppender.ts:

```sh
   4   *--------------------------------------------------------------------------------------------*/
   5
   6  import {
   7  	AbstractOneDataSystemAppender,
   8  	IAppInsightsCore,
   9: } from "vs/platform/telemetry/common/1dsAppender";
  10
  11  export class OneDataSystemWebAppender extends AbstractOneDataSystemAppender {
  12  	constructor(
  13  		isInternalTelemetry: boolean,
  14  		eventPrefix: string,

  20  			eventPrefix,
  21  			defaultData,
  22  			iKeyOrClientFactory,
  23  		);
  24
  25: 		// If we cannot fetch the endpoint it means it is down and we should not send any telemetry.
  26  		// This is most likely due to ad blockers
  27  		fetch(this.endPointHealthUrl, { method: "GET" }).catch((err) => {
  28  			this._aiCoreOrKey = undefined;
  29  		});
  30  	}
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\platform\telemetry\browser\errorTelemetry.ts:

```sh
   6  import { mainWindow } from "vs/base/browser/window";
   7  import { ErrorNoTelemetry } from "vs/base/common/errors";
   8  import { toDisposable } from "vs/base/common/lifecycle";
   9  import BaseErrorTelemetry, {
  10  	ErrorEvent,
  11: } from "vs/platform/telemetry/common/errorTelemetry";
  12
  13  export default class ErrorTelemetry extends BaseErrorTelemetry {
  14  	protected override installErrorListeners(): void {
  15  		let oldOnError: OnErrorEventHandler;
  16  		const that = this;

  56  			line,
  57  			column,
  58  		};
  59
  60  		if (err) {
  61: 			// If it's the no telemetry error it doesn't get logged
  62  			if (ErrorNoTelemetry.isErrorNoTelemetry(err)) {
  63  				return;
  64  			}
  65
  66  			const { name, message, stack } = err;
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\platform\telemetry\common\1dsAppender.ts:

```sh
   19  import { mixin } from "vs/base/common/objects";
   20  import { isWeb } from "vs/base/common/platform";
   21  import {
   22  	ITelemetryAppender,
   23  	validateTelemetryData,
   24: } from "vs/platform/telemetry/common/telemetryUtils";
   25
   26  // Interface type which is a subset of @microsoft/1ds-core-js AppInsightsCore.
   27  // Allows us to more easily build mock objects for testing as the interface is quite large and we only need a few properties.
   28  export interface IAppInsightsCore {
   29  	pluginVersionString: string;

  103  	});
  104
  105  	return appInsightsCore;
  106  }
  107
  108: // TODO @lramos15 maybe make more in line with src/vs/platform/telemetry/browser/appInsightsAppender.ts with caching support
  109  export abstract class AbstractOneDataSystemAppender
  110  	implements ITelemetryAppender
  111  {
  112  	protected _aiCoreOrKey: IAppInsightsCore | string | undefined;
  113  	private _asyncAiCore: Promise<IAppInsightsCore> | null;
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\platform\telemetry\common\commonProperties.ts:

```sh
   9  	Platform,
  10  	PlatformToString,
  11  } from "vs/base/common/platform";
  12  import { env, platform as nodePlatform } from "vs/base/common/process";
  13  import { generateUuid } from "vs/base/common/uuid";
  14: import { ICommonProperties } from "vs/platform/telemetry/common/telemetry";
  15
  16  function getPlatformDetail(hostname: string): string | undefined {
  17  	if (platform === Platform.Linux && /^penguin(\.|$)/i.test(hostname)) {
  18  		return "chromebook";
  19  	}
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\platform\telemetry\common\errorTelemetry.ts:

```sh
    6  import { binarySearch } from "vs/base/common/arrays";
    7  import { errorHandler, ErrorNoTelemetry } from "vs/base/common/errors";
    8  import { DisposableStore, toDisposable } from "vs/base/common/lifecycle";
    9  import { safeStringify } from "vs/base/common/objects";
   10  import { FileOperationError } from "vs/platform/files/common/files";
   11: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   12
   13  type ErrorEventFragment = {
   14  	owner: "lramos15, sbatten";
   15  	comment: "Whenever an error in VS Code is thrown.";
   16  	callstack: {

   77  }
   78
   79  export default abstract class BaseErrorTelemetry {
   80  	public static ERROR_FLUSH_TIMEOUT: number = 5 * 1000;
   81
   82: 	private _telemetryService: ITelemetryService;
   83  	private _flushDelay: number;
   84  	private _flushHandle: any = -1;
   85  	private _buffer: ErrorEvent[] = [];
   86  	protected readonly _disposables = new DisposableStore();
   87
   88  	constructor(
   89: 		telemetryService: ITelemetryService,
   90  		flushDelay = BaseErrorTelemetry.ERROR_FLUSH_TIMEOUT,
   91  	) {
   92: 		this._telemetryService = telemetryService;
   93  		this._flushDelay = flushDelay;
   94
   95  		// (1) check for unexpected but handled errors
   96  		const unbind = errorHandler.addListener((err) =>
   97  			this._onErrorEvent(err),

  120  		// unwrap nested errors from loader
  121  		if (err.detail && err.detail.stack) {
  122  			err = err.detail;
  123  		}
  124
  125: 		// If it's the no telemetry error it doesn't get logged
  126  		// TOOD @lramos15 hacking in FileOperation error because it's too messy to adopt ErrorNoTelemetry. A better solution should be found
  127  		if (
  128  			ErrorNoTelemetry.isErrorNoTelemetry(err) ||
  129  			err instanceof FileOperationError ||
  130  			(typeof err?.message === "string" &&

  137  		const callstack = Array.isArray(err.stack)
  138  			? err.stack.join("\n")
  139  			: err.stack;
  140  		const msg = err.message ? err.message : safeStringify(err);
  141
  142: 		// errors without a stack are not useful telemetry
  143  		if (!callstack) {
  144  			return;
  145  		}
  146
  147  		this._enqueue({ msg, callstack });

  168  	}
  169
  170  	private _flushBuffer(): void {
  171  		for (const error of this._buffer) {
  172  			type UnhandledErrorClassification = {} & ErrorEventFragment;
  173: 			this._telemetryService.publicLogError2<
  174  				ErrorEvent,
  175  				UnhandledErrorClassification
  176  			>("UnhandledError", error);
  177  		}
  178  		this._buffer.length = 0;
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\platform\telemetry\common\remoteTelemetryChannel.ts:

```sh
   4   *--------------------------------------------------------------------------------------------*/
   5
   6  import { Event } from "vs/base/common/event";
   7  import { Disposable } from "vs/base/common/lifecycle";
   8  import { IServerChannel } from "vs/base/parts/ipc/common/ipc";
   9: import { IServerTelemetryService } from "vs/platform/telemetry/common/serverTelemetryService";
  10: import { TelemetryLevel } from "vs/platform/telemetry/common/telemetry";
  11: import { ITelemetryAppender } from "vs/platform/telemetry/common/telemetryUtils";
  12
  13  export class ServerTelemetryChannel
  14  	extends Disposable
  15  	implements IServerChannel
  16  {
  17  	constructor(
  18: 		private readonly telemetryService: IServerTelemetryService,
  19: 		private readonly telemetryAppender: ITelemetryAppender | null,
  20  	) {
  21  		super();
  22  	}
  23
  24  	async call(_: any, command: string, arg?: any): Promise<any> {
  25  		switch (command) {
  26  			case "updateTelemetryLevel": {
  27: 				const { telemetryLevel } = arg;
  28: 				return this.telemetryService.updateInjectedTelemetryLevel(
  29: 					telemetryLevel,
  30  				);
  31  			}
  32
  33  			case "logTelemetry": {
  34  				const { eventName, data } = arg;
  35: 				// Logging is done directly to the appender instead of through the telemetry service
  36  				// as the data sent from the client has already had common properties added to it and
  37: 				// has already been sent to the telemetry output channel
  38: 				if (this.telemetryAppender) {
  39: 					return this.telemetryAppender.log(eventName, data);
  40  				}
  41
  42  				return Promise.resolve();
  43  			}
  44
  45  			case "flushTelemetry": {
  46: 				if (this.telemetryAppender) {
  47: 					return this.telemetryAppender.flush();
  48  				}
  49
  50  				return Promise.resolve();
  51  			}
  52

  61  	listen(_: any, event: string, arg: any): Event<any> {
  62  		throw new Error("Not supported");
  63  	}
  64
  65  	/**
  66: 	 * Disposing the channel also disables the telemetryService as there is
  67  	 * no longer a way to control it
  68  	 */
  69  	public override dispose(): void {
  70: 		this.telemetryService.updateInjectedTelemetryLevel(TelemetryLevel.NONE);
  71  		super.dispose();
  72  	}
  73  }
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\platform\telemetry\common\serverTelemetryService.ts:

```sh
    9  import {
   10  	ClassifiedEvent,
   11  	IGDPRProperty,
   12  	OmitMetadata,
   13  	StrictPropertyCheck,
   14: } from "vs/platform/telemetry/common/gdprTypings";
   15  import {
   16  	ITelemetryData,
   17  	ITelemetryService,
   18  	TelemetryLevel,
   19: } from "vs/platform/telemetry/common/telemetry";
   20  import {
   21  	ITelemetryServiceConfig,
   22  	TelemetryService,
   23: } from "vs/platform/telemetry/common/telemetryService";
   24: import { NullTelemetryServiceShape } from "vs/platform/telemetry/common/telemetryUtils";
   25
   26  export interface IServerTelemetryService extends ITelemetryService {
   27: 	updateInjectedTelemetryLevel(telemetryLevel: TelemetryLevel): Promise<void>;
   28  }
   29
   30  export class ServerTelemetryService
   31  	extends TelemetryService
   32  	implements IServerTelemetryService
   33  {
   34  	// Because we cannot read the workspace config on the remote site
   35: 	// the ServerTelemetryService is responsible for knowing its telemetry level
   36  	// this is done through IPC calls and initial value injections
   37  	private _injectedTelemetryLevel: TelemetryLevel;
   38  	constructor(
   39  		config: ITelemetryServiceConfig,
   40  		injectedTelemetryLevel: TelemetryLevel,

   75  			data as ITelemetryData | undefined,
   76  		);
   77  	}
   78
   79  	async updateInjectedTelemetryLevel(
   80: 		telemetryLevel: TelemetryLevel,
   81  	): Promise<void> {
   82: 		if (telemetryLevel === undefined) {
   83  			this._injectedTelemetryLevel = TelemetryLevel.NONE;
   84  			throw new Error(
   85  				"Telemetry level cannot be undefined. This will cause infinite looping!",
   86  			);
   87  		}
   88  		// We always take the most restrictive level because we don't want multiple clients to connect and send data when one client does not consent
   89  		this._injectedTelemetryLevel = this._injectedTelemetryLevel
   90: 			? Math.min(this._injectedTelemetryLevel, telemetryLevel)
   91: 			: telemetryLevel;
   92  		if (this._injectedTelemetryLevel === TelemetryLevel.NONE) {
   93  			this.dispose();
   94  		}
   95  	}
   96  }

   99  	extends NullTelemetryServiceShape
  100  	implements IServerTelemetryService
  101  {
  102  	async updateInjectedTelemetryLevel(): Promise<void> {
  103  		return;
  104: 	} // No-op, telemetry is already disabled
  105  })();
  106
  107  export const IServerTelemetryService = refineServiceDecorator<
  108  	ITelemetryService,
  109  	IServerTelemetryService
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\platform\telemetry\common\telemetry.ts:

```sh
    7  import {
    8  	ClassifiedEvent,
    9  	IGDPRProperty,
   10  	OmitMetadata,
   11  	StrictPropertyCheck,
   12: } from "vs/platform/telemetry/common/gdprTypings";
   13
   14  export const ITelemetryService =
   15: 	createDecorator<ITelemetryService>("telemetryService");
   16
   17  export interface ITelemetryData {
   18  	from?: string;
   19  	target?: string;
   20  	[key: string]: any;
   21  }
   22
   23  export interface ITelemetryService {
   24  	readonly _serviceBrand: undefined;
   25
   26: 	readonly telemetryLevel: TelemetryLevel;
   27
   28  	readonly sessionId: string;
   29  	readonly machineId: string;
   30  	readonly sqmId: string;
   31  	readonly devDeviceId: string;
   32  	readonly firstSessionDate: string;
   33  	readonly msftInternal?: boolean;
   34
   35  	/**
   36: 	 * Whether error telemetry will get sent. If false, `publicLogError` will no-op.
   37  	 */
   38  	readonly sendErrorTelemetry: boolean;
   39
   40  	/**
   41  	 * @deprecated Use publicLog2 and the typescript GDPR annotation where possible
   42  	 */
   43  	publicLog(eventName: string, data?: ITelemetryData): void;
   44
   45  	/**
   46: 	 * Sends a telemetry event that has been privacy approved.
   47  	 * Do not call this unless you have been given approval.
   48  	 */
   49  	publicLog2<
   50  		E extends ClassifiedEvent<OmitMetadata<T>> = never,
   51  		T extends IGDPRProperty = never,

   95  		data?: ITelemetryData,
   96  	): void;
   97  }
   98
   99  // Keys
  100: export const currentSessionDateStorageKey = "telemetry.currentSessionDate";
  101: export const firstSessionDateStorageKey = "telemetry.firstSessionDate";
  102: export const lastSessionDateStorageKey = "telemetry.lastSessionDate";
  103: export const machineIdKey = "telemetry.machineId";
  104: export const sqmIdKey = "telemetry.sqmId";
  105: export const devDeviceIdKey = "telemetry.devDeviceId";
  106
  107  // Configuration Keys
  108: export const TELEMETRY_SECTION_ID = "telemetry";
  109: export const TELEMETRY_SETTING_ID = "telemetry.telemetryLevel";
  110  export const TELEMETRY_CRASH_REPORTER_SETTING_ID =
  111: 	"telemetry.enableCrashReporter";
  112: export const TELEMETRY_OLD_SETTING_ID = "telemetry.enableTelemetry";
  113
  114  export const enum TelemetryLevel {
  115  	NONE = 0,
  116  	CRASH = 1,
  117  	ERROR = 2,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\platform\telemetry\common\telemetryIpc.ts:

```sh
   3   *  Licensed under the MIT License. See License.txt in the project root for license information.
   4   *--------------------------------------------------------------------------------------------*/
   5
   6  import { Event } from "vs/base/common/event";
   7  import { IChannel, IServerChannel } from "vs/base/parts/ipc/common/ipc";
   8: import { ITelemetryAppender } from "vs/platform/telemetry/common/telemetryUtils";
   9
  10  export interface ITelemetryLog {
  11  	eventName: string;
  12  	data?: any;
  13  }

  35  	log(eventName: string, data?: any): any {
  36  		this.channel
  37  			.call("log", { eventName, data })
  38  			.then(
  39  				undefined,
  40: 				(err) => `Failed to log telemetry: ${console.warn(err)}`,
  41  			);
  42
  43  		return Promise.resolve(null);
  44  	}
  45
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\platform\telemetry\common\telemetryLogAppender.ts:

```sh
  15  import { IProductService } from "vs/platform/product/common/productService";
  16  import {
  17  	isLoggingOnly,
  18  	ITelemetryAppender,
  19  	supportsTelemetry,
  20: 	telemetryLogId,
  21  	validateTelemetryData,
  22: } from "vs/platform/telemetry/common/telemetryUtils";
  23
  24  export class TelemetryLogAppender
  25  	extends Disposable
  26  	implements ITelemetryAppender
  27  {

  34  		@IProductService productService: IProductService,
  35  		private readonly prefix: string = "",
  36  	) {
  37  		super();
  38
  39: 		const logger = loggerService.getLogger(telemetryLogId);
  40  		if (logger) {
  41  			this.logger = this._register(logger);
  42  		} else {
  43  			// Not a perfect check, but a nice way to indicate if we only have logging enabled for debug purposes and nothing is actually being sent
  44  			const justLoggingAndNotSending = isLoggingOnly(

  48  			const logSuffix = justLoggingAndNotSending ? " (Not Sent)" : "";
  49  			const isVisible = () =>
  50  				supportsTelemetry(productService, environmentService) &&
  51  				logService.getLevel() === LogLevel.Trace;
  52  			this.logger = this._register(
  53: 				loggerService.createLogger(telemetryLogId, {
  54: 					name: localize("telemetryLog", "Telemetry{0}", logSuffix),
  55  					hidden: !isVisible(),
  56  				}),
  57  			);
  58  			this._register(
  59  				logService.onDidChangeLogLevel(() =>
  60: 					loggerService.setVisibility(telemetryLogId, isVisible()),
  61  				),
  62  			);
  63  			this.logger.info(
  64: 				"Below are logs for every telemetry event sent from VS Code once the log level is set to trace.",
  65  			);
  66  			this.logger.info(
  67  				"===========================================================",
  68  			);
  69  		}

  73  		return Promise.resolve(undefined);
  74  	}
  75
  76  	log(eventName: string, data: any): void {
  77  		this.logger.trace(
  78: 			`${this.prefix}telemetry/${eventName}`,
  79  			validateTelemetryData(data),
  80  		);
  81  	}
  82  }
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\platform\telemetry\common\telemetryService.ts:

```sh
   20  import {
   21  	ClassifiedEvent,
   22  	IGDPRProperty,
   23  	OmitMetadata,
   24  	StrictPropertyCheck,
   25: } from "vs/platform/telemetry/common/gdprTypings";
   26  import {
   27  	ICommonProperties,
   28  	ITelemetryData,
   29  	ITelemetryService,
   30  	TELEMETRY_CRASH_REPORTER_SETTING_ID,
   31  	TELEMETRY_OLD_SETTING_ID,
   32  	TELEMETRY_SECTION_ID,
   33  	TELEMETRY_SETTING_ID,
   34  	TelemetryConfiguration,
   35  	TelemetryLevel,
   36: } from "vs/platform/telemetry/common/telemetry";
   37  import {
   38  	cleanData,
   39  	getTelemetryLevel,
   40  	ITelemetryAppender,
   41: } from "vs/platform/telemetry/common/telemetryUtils";
   42
   43  export interface ITelemetryServiceConfig {
   44  	appenders: ITelemetryAppender[];
   45  	sendErrorTelemetry?: boolean;
   46  	commonProperties?: ICommonProperties;

   62
   63  	private _appenders: ITelemetryAppender[];
   64  	private _commonProperties: ICommonProperties;
   65  	private _experimentProperties: { [name: string]: string } = {};
   66  	private _piiPaths: string[];
   67: 	private _telemetryLevel: TelemetryLevel;
   68  	private _sendErrorTelemetry: boolean;
   69
   70  	private readonly _disposables = new DisposableStore();
   71  	private _cleanupPatterns: RegExp[] = [];
   72

   91  		this.msftInternal = this._commonProperties["common.msftInternal"] as
   92  			| boolean
   93  			| undefined;
   94
   95  		this._piiPaths = config.piiPaths || [];
   96: 		this._telemetryLevel = TelemetryLevel.USAGE;
   97  		this._sendErrorTelemetry = !!config.sendErrorTelemetry;
   98
   99  		// static cleanup pattern for: `vscode-file:///DANGEROUS/PATH/resources/app/Useful/Information`
  100  		this._cleanupPatterns = [
  101  			/(vscode-)?file:\/\/\/.*?\/resources\/app\//gi,

  117  		}
  118
  119  		this._updateTelemetryLevel();
  120  		this._disposables.add(
  121  			this._configurationService.onDidChangeConfiguration((e) => {
  122: 				// Check on the telemetry settings and update the state if changed
  123  				const affectsTelemetryConfig =
  124  					e.affectsConfiguration(TELEMETRY_SETTING_ID) ||
  125  					e.affectsConfiguration(TELEMETRY_OLD_SETTING_ID) ||
  126  					e.affectsConfiguration(TELEMETRY_CRASH_REPORTER_SETTING_ID);
  127  				if (affectsTelemetryConfig) {

  137
  138  	private _updateTelemetryLevel(): void {
  139  		let level = getTelemetryLevel(this._configurationService);
  140  		const collectableTelemetry =
  141  			this._productService.enabledTelemetryLevels;
  142: 		// Also ensure that error telemetry is respecting the product configuration for collectable telemetry
  143  		if (collectableTelemetry) {
  144  			this._sendErrorTelemetry = this.sendErrorTelemetry
  145  				? collectableTelemetry.error
  146  				: false;
  147: 			// Make sure the telemetry level from the service is the minimum of the config and product
  148  			const maxCollectableTelemetryLevel = collectableTelemetry.usage
  149  				? TelemetryLevel.USAGE
  150  				: collectableTelemetry.error
  151  					? TelemetryLevel.ERROR
  152  					: TelemetryLevel.NONE;
  153  			level = Math.min(level, maxCollectableTelemetryLevel);
  154  		}
  155
  156: 		this._telemetryLevel = level;
  157  	}
  158
  159  	get sendErrorTelemetry(): boolean {
  160  		return this._sendErrorTelemetry;
  161  	}
  162
  163: 	get telemetryLevel(): TelemetryLevel {
  164: 		return this._telemetryLevel;
  165  	}
  166
  167  	dispose(): void {
  168  		this._disposables.dispose();
  169  	}

  172  		eventName: string,
  173  		eventLevel: TelemetryLevel,
  174  		data?: ITelemetryData,
  175  	) {
  176  		// don't send events when the user is optout
  177: 		if (this._telemetryLevel < eventLevel) {
  178  			return;
  179  		}
  180
  181  		// add experiment properties
  182  		data = mixin(data, this._experimentProperties);

  218  		this.publicLogError(eventName, data as ITelemetryData);
  219  	}
  220  }
  221
  222  function getTelemetryLevelSettingDescription(): string {
  223: 	const telemetryText = localize(
  224: 		"telemetry.telemetryLevelMd",
  225: 		"Controls {0} telemetry, first-party extension telemetry, and participating third-party extension telemetry. Some third party extensions might not respect this setting. Consult the specific extension's documentation to be sure. Telemetry helps us better understand how {0} is performing, where improvements need to be made, and how features are being used.",
  226  		product.nameLong,
  227  	);
  228  	const externalLinksStatement = !product.privacyStatementUrl
  229  		? localize(
  230: 				"telemetry.docsStatement",
  231  				"Read more about the [data we collect]({0}).",
  232: 				"https://aka.ms/vscode-telemetry",
  233  			)
  234  		: localize(
  235: 				"telemetry.docsAndPrivacyStatement",
  236  				"Read more about the [data we collect]({0}) and our [privacy statement]({1}).",
  237: 				"https://aka.ms/vscode-telemetry",
  238  				product.privacyStatementUrl,
  239  			);
  240  	const restartString = !isWeb
  241  		? localize(
  242: 				"telemetry.restart",
  243  				"A full restart of the application is necessary for crash reporting changes to take effect.",
  244  			)
  245  		: "";
  246
  247  	const crashReportsHeader = localize(
  248: 		"telemetry.crashReports",
  249  		"Crash Reports",
  250  	);
  251: 	const errorsHeader = localize("telemetry.errors", "Error Telemetry");
  252: 	const usageHeader = localize("telemetry.usage", "Usage Data");
  253
  254: 	const telemetryTableDescription = localize(
  255: 		"telemetry.telemetryLevel.tableDescription",
  256  		"The following table outlines the data sent with each setting:",
  257  	);
  258: 	const telemetryTable = `
  259  |       | ${crashReportsHeader} | ${errorsHeader} | ${usageHeader} |
  260  |:------|:---------------------:|:---------------:|:--------------:|
  261  | all   |            ✓          |        ✓        |        ✓       |
  262  | error |            ✓          |        ✓        |        -       |
  263  | crash |            ✓          |        -        |        -       |
  264  | off   |            -          |        -        |        -       |
  265  `;
  266
  267  	const deprecatedSettingNote = localize(
  268: 		"telemetry.telemetryLevel.deprecated",
  269: 		"****Note:*** If this setting is 'off', no telemetry will be sent regardless of other telemetry settings. If this setting is set to anything except 'off' and telemetry is disabled with deprecated settings, no telemetry will be sent.*",
  270  	);
  271: 	const telemetryDescription = `
  272: ${telemetryText} ${externalLinksStatement} ${restartString}
  273
  274  &nbsp;
  275
  276: ${telemetryTableDescription}
  277: ${telemetryTable}
  278
  279  &nbsp;
  280
  281  ${deprecatedSettingNote}
  282  `;
  283
  284: 	return telemetryDescription;
  285  }
  286
  287  Registry.as<IConfigurationRegistry>(
  288  	Extensions.Configuration,
  289  ).registerConfiguration({
  290  	"id": TELEMETRY_SECTION_ID,
  291  	"order": 1,
  292  	"type": "object",
  293: 	"title": localize("telemetryConfigurationTitle", "Telemetry"),
  294  	"properties": {
  295  		[TELEMETRY_SETTING_ID]: {
  296  			"type": "string",
  297  			"enum": [
  298  				TelemetryConfiguration.ON,

  300  				TelemetryConfiguration.CRASH,
  301  				TelemetryConfiguration.OFF,
  302  			],
  303  			"enumDescriptions": [
  304  				localize(
  305: 					"telemetry.telemetryLevel.default",
  306  					"Sends usage data, errors, and crash reports.",
  307  				),
  308  				localize(
  309: 					"telemetry.telemetryLevel.error",
  310: 					"Sends general error telemetry and crash reports.",
  311  				),
  312  				localize(
  313: 					"telemetry.telemetryLevel.crash",
  314  					"Sends OS level crash reports.",
  315  				),
  316  				localize(
  317: 					"telemetry.telemetryLevel.off",
  318: 					"Disables all product telemetry.",
  319  				),
  320  			],
  321  			"markdownDescription": getTelemetryLevelSettingDescription(),
  322  			"default": TelemetryConfiguration.ON,
  323  			"restricted": true,
  324  			"scope": ConfigurationScope.APPLICATION,
  325: 			"tags": ["usesOnlineServices", "telemetry"],
  326  		},
  327  	},
  328  });
  329
  330: // Deprecated telemetry setting
  331  Registry.as<IConfigurationRegistry>(
  332  	Extensions.Configuration,
  333  ).registerConfiguration({
  334  	"id": TELEMETRY_SECTION_ID,
  335  	"order": 110,
  336  	"type": "object",
  337: 	"title": localize("telemetryConfigurationTitle", "Telemetry"),
  338  	"properties": {
  339  		[TELEMETRY_OLD_SETTING_ID]: {
  340  			"type": "boolean",
  341  			"markdownDescription": !product.privacyStatementUrl
  342  				? localize(
  343: 						"telemetry.enableTelemetry",
  344  						"Enable diagnostic data to be collected. This helps us to better understand how {0} is performing and where improvements need to be made.",
  345  						product.nameLong,
  346  					)
  347  				: localize(
  348: 						"telemetry.enableTelemetryMd",
  349  						"Enable diagnostic data to be collected. This helps us to better understand how {0} is performing and where improvements need to be made. [Read more]({1}) about what we collect and our privacy statement.",
  350  						product.nameLong,
  351  						product.privacyStatementUrl,
  352  					),
  353  			"default": true,
  354  			"restricted": true,
  355  			"markdownDeprecationMessage": localize(
  356  				"enableTelemetryDeprecated",
  357: 				"If this setting is false, no telemetry will be sent regardless of the new setting's value. Deprecated in favor of the {0} setting.",
  358  				`\`#${TELEMETRY_SETTING_ID}#\``,
  359  			),
  360  			"scope": ConfigurationScope.APPLICATION,
  361: 			"tags": ["usesOnlineServices", "telemetry"],
  362  		},
  363  	},
  364  });
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\platform\telemetry\common\telemetryUtils.ts:

```sh
    8  import { URI } from "vs/base/common/uri";
    9  import { IConfigurationService } from "vs/platform/configuration/common/configuration";
   10  import { IEnvironmentService } from "vs/platform/environment/common/environment";
   11  import { IProductService } from "vs/platform/product/common/productService";
   12  import { getRemoteName } from "vs/platform/remote/common/remoteHosts";
   13: import { verifyMicrosoftInternalDomain } from "vs/platform/telemetry/common/commonProperties";
   14  import {
   15  	ICustomEndpointTelemetryService,
   16  	ITelemetryData,
   17  	ITelemetryEndpoint,
   18  	ITelemetryService,
   19  	TELEMETRY_CRASH_REPORTER_SETTING_ID,
   20  	TELEMETRY_OLD_SETTING_ID,
   21  	TELEMETRY_SETTING_ID,
   22  	TelemetryConfiguration,
   23  	TelemetryLevel,
   24: } from "vs/platform/telemetry/common/telemetry";
   25
   26  /**
   27:  * A special class used to denoting a telemetry value which should not be clean.
   28   * This is because that value is "Trusted" not to contain identifiable information such as paths.
   29   * NOTE: This is used as an API type as well, and should not be changed.
   30   */
   31  export class TelemetryTrustedValue<T> {
   32  	// This is merely used as an identifier as the instance will be lost during serialization over the exthost

   34  	constructor(public readonly value: T) {}
   35  }
   36
   37  export class NullTelemetryServiceShape implements ITelemetryService {
   38  	declare readonly _serviceBrand: undefined;
   39: 	readonly telemetryLevel = TelemetryLevel.NONE;
   40  	readonly sessionId = "someValue.sessionId";
   41  	readonly machineId = "someValue.machineId";
   42  	readonly sqmId = "someValue.sqmId";
   43  	readonly devDeviceId = "someValue.devDeviceId";
   44  	readonly firstSessionDate = "someValue.firstSessionDate";

   72  	): Promise<void> {
   73  		// noop
   74  	}
   75  }
   76
   77: export const telemetryLogId = "telemetry";
   78  export const extensionTelemetryLogChannelId = "extensionTelemetryLog";
   79
   80  export interface ITelemetryAppender {
   81  	log(eventName: string, data: any): void;
   82  	flush(): Promise<any>;

  101  	ext?: string;
  102  	path?: string;
  103  }
  104
  105  /**
  106:  * Determines whether or not we support logging telemetry.
  107:  * This checks if the product is capable of collecting telemetry but not whether or not it can send it
  108:  * For checking the user setting and what telemetry you can send please check `getTelemetryLevel`.
  109:  * This returns true if `--disable-telemetry` wasn't used, the product.json allows for telemetry, and we're not testing an extension
  110:  * If false telemetry is disabled throughout the product
  111   * @param productService
  112   * @param environmentService
  113:  * @returns false - telemetry is completely disabled, true - telemetry is logged locally, but may not be sent
  114   */
  115  export function supportsTelemetry(
  116  	productService: IProductService,
  117  	environmentService: IEnvironmentService,
  118  ): boolean {
  119: 	// If it's OSS and telemetry isn't disabled via the CLI we will allow it for logging only purposes
  120  	if (!environmentService.isBuilt && !environmentService.disableTelemetry) {
  121  		return true;
  122  	}
  123  	return !(
  124  		environmentService.disableTelemetry || !productService.enableTelemetry
  125  	);
  126  }
  127
  128  /**
  129:  * Checks to see if we're in logging only mode to debug telemetry.
  130:  * This is if telemetry is enabled and we're in OSS, but no telemetry key is provided so it's not being sent just logged.
  131   * @param productService
  132   * @param environmentService
  133:  * @returns True if telemetry is actually disabled and we're only logging for debug purposes
  134   */
  135  export function isLoggingOnly(
  136  	productService: IProductService,
  137  	environmentService: IEnvironmentService,
  138  ): boolean {
  139: 	// If we're testing an extension, log telemetry for debug purposes
  140  	if (environmentService.extensionTestsLocationURI) {
  141  		return true;
  142  	}
  143  	// Logging only mode is only for OSS
  144  	if (environmentService.isBuilt) {

  155
  156  	return true;
  157  }
  158
  159  /**
  160:  * Determines how telemetry is handled based on the user's configuration.
  161   *
  162   * @param configurationService
  163   * @returns OFF, ERROR, ON
  164   */
  165  export function getTelemetryLevel(

  174  	>(TELEMETRY_CRASH_REPORTER_SETTING_ID);
  175  	const oldConfig = configurationService.getValue<boolean | undefined>(
  176  		TELEMETRY_OLD_SETTING_ID,
  177  	);
  178
  179: 	// If `telemetry.enableCrashReporter` is false or `telemetry.enableTelemetry' is false, disable telemetry
  180  	if (oldConfig === false || crashReporterConfig === false) {
  181  		return TelemetryLevel.NONE;
  182  	}
  183
  184: 	// Maps new telemetry setting to a telemetry level
  185  	switch (newConfig ?? TelemetryConfiguration.ON) {
  186  		case TelemetryConfiguration.ON:
  187  			return TelemetryLevel.USAGE;
  188  		case TelemetryConfiguration.ERROR:
  189  			return TelemetryLevel.ERROR;

  239  		properties,
  240  		measurements,
  241  	};
  242  }
  243
  244: const telemetryAllowedAuthorities = new Set([
  245  	"ssh-remote",
  246  	"dev-container",
  247  	"attached-container",
  248  	"wsl",
  249  	"tunnel",

  254  export function cleanRemoteAuthority(remoteAuthority?: string): string {
  255  	if (!remoteAuthority) {
  256  		return "none";
  257  	}
  258  	const remoteName = getRemoteName(remoteAuthority);
  259: 	return telemetryAllowedAuthorities.has(remoteName) ? remoteName : "other";
  260  }
  261
  262  function flatten(
  263  	obj: any,
  264  	result: { [key: string]: any },

  300  	productService: IProductService,
  301  	configService: IConfigurationService,
  302  ) {
  303  	const msftInternalDomains = productService.msftInternalDomains || [];
  304  	const internalTesting = configService.getValue<boolean>(
  305: 		"telemetry.internalTesting",
  306  	);
  307  	return (
  308  		verifyMicrosoftInternalDomain(msftInternalDomains) || internalTesting
  309  	);
  310  }

  413  			regex: /((login|psexec|(certutil|psexec)\.exe).{1,50}(\s-u(ser(name)?)?\s+.{3,100})?\s-(admin|user|vm|root)?p(ass(word)?)?\s+["']?[^$\-\/\s]|(^|[\s\r\n\\])net(\.exe)?.{1,5}(user\s+|share\s+\/user:| user -? secrets ? set) \s + [^ $\s \/])/,
  414  		},
  415  		{ label: "Email", regex: /@[a-zA-Z0-9-]+\.[a-zA-Z0-9-]+/ }, // Regex which matches @*.site
  416  	];
  417
  418: 	// Check for common user data in the telemetry events
  419  	for (const secretRegex of userDataRegexes) {
  420  		if (secretRegex.regex.test(property)) {
  421  			return `<REDACTED: ${secretRegex.label}>`;
  422  		}
  423  	}
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\platform\telemetry\electron-main\telemetryUtils.ts:

```sh
   7  import { IStateService } from "vs/platform/state/node/state";
   8  import {
   9  	devDeviceIdKey,
  10  	machineIdKey,
  11  	sqmIdKey,
  12: } from "vs/platform/telemetry/common/telemetry";
  13  import {
  14  	resolvedevDeviceId as resolveNodedevDeviceId,
  15  	resolveMachineId as resolveNodeMachineId,
  16  	resolveSqmId as resolveNodeSqmId,
  17: } from "vs/platform/telemetry/node/telemetryUtils";
  18
  19  export async function resolveMachineId(
  20  	stateService: IStateService,
  21  	logService: ILogService,
  22  ): Promise<string> {
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\platform\telemetry\electron-sandbox\customEndpointTelemetryService.ts:

```sh
  2   *  Copyright (c) Microsoft Corporation. All rights reserved.
  3   *  Licensed under the MIT License. See License.txt in the project root for license information.
  4   *--------------------------------------------------------------------------------------------*/
  5
  6  import { registerSharedProcessRemoteService } from "vs/platform/ipc/electron-sandbox/services";
  7: import { ICustomEndpointTelemetryService } from "vs/platform/telemetry/common/telemetry";
  8
  9  registerSharedProcessRemoteService(
  10  	ICustomEndpointTelemetryService,
  11  	"customEndpointTelemetry",
  12  );
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\platform\telemetry\node\1dsAppender.ts:

```sh
   10  import { IRequestOptions } from "vs/base/parts/request/common/request";
   11  import { IRequestService } from "vs/platform/request/common/request";
   12  import {
   13  	AbstractOneDataSystemAppender,
   14  	IAppInsightsCore,
   15: } from "vs/platform/telemetry/common/1dsAppender";
   16
   17  type OnCompleteFunc = (
   18  	status: number,
   19  	headers: { [headerName: string]: string },
   20  	response?: string,

   25  	statusCode: number;
   26  	responseData: string;
   27  }
   28
   29  /**
   30:  * Completes a request to submit telemetry to the server utilizing the request service
   31   * @param options The options which will be used to make the request
   32   * @param requestService The request service
   33   * @returns An object containing the headers, statusCode, and responseData
   34   */
   35  async function makeTelemetryRequest(

   49  		responseData,
   50  	};
   51  }
   52
   53  /**
   54:  * Complete a request to submit telemetry to the server utilizing the https module. Only used when the request service is not available
   55   * @param options The options which will be used to make the request
   56   * @returns An object containing the headers, statusCode, and responseData
   57   */
   58  async function makeLegacyTelemetryRequest(
   59  	options: IRequestOptions,

   89  async function sendPostAsync(
   90  	requestService: IRequestService | undefined,
   91  	payload: IPayloadData,
   92  	oncomplete: OnCompleteFunc,
   93  ) {
   94: 	const telemetryRequestData =
   95  		typeof payload.data === "string"
   96  			? payload.data
   97  			: new TextDecoder().decode(payload.data);
   98  	const requestOptions: IRequestOptions = {
   99  		type: "POST",

  101  			...payload.headers,
  102  			"Content-Type": "application/json",
  103  			"Content-Length": Buffer.byteLength(payload.data).toString(),
  104  		},
  105  		url: payload.urlString,
  106: 		data: telemetryRequestData,
  107  	};
  108
  109  	try {
  110  		const responseData = requestService
  111  			? await makeTelemetryRequest(requestOptions, requestService)
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\platform\telemetry\node\customEndpointTelemetryService.ts:

```sh
   12  import {
   13  	ICustomEndpointTelemetryService,
   14  	ITelemetryData,
   15  	ITelemetryEndpoint,
   16  	ITelemetryService,
   17: } from "vs/platform/telemetry/common/telemetry";
   18: import { TelemetryAppenderClient } from "vs/platform/telemetry/common/telemetryIpc";
   19: import { TelemetryLogAppender } from "vs/platform/telemetry/common/telemetryLogAppender";
   20: import { TelemetryService } from "vs/platform/telemetry/common/telemetryService";
   21
   22  export class CustomEndpointTelemetryService
   23  	implements ICustomEndpointTelemetryService
   24  {
   25  	declare readonly _serviceBrand: undefined;

   27  	private customTelemetryServices = new Map<string, ITelemetryService>();
   28
   29  	constructor(
   30  		@IConfigurationService
   31  		private readonly configurationService: IConfigurationService,
   32: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
   33  		@ILogService private readonly logService: ILogService,
   34  		@ILoggerService private readonly loggerService: ILoggerService,
   35  		@IEnvironmentService
   36  		private readonly environmentService: IEnvironmentService,
   37  		@IProductService private readonly productService: IProductService,

   39
   40  	private getCustomTelemetryService(
   41  		endpoint: ITelemetryEndpoint,
   42  	): ITelemetryService {
   43  		if (!this.customTelemetryServices.has(endpoint.id)) {
   44: 			const telemetryInfo: { [key: string]: string } =
   45  				Object.create(null);
   46: 			telemetryInfo["common.vscodemachineid"] =
   47: 				this.telemetryService.machineId;
   48: 			telemetryInfo["common.vscodesessionid"] =
   49: 				this.telemetryService.sessionId;
   50  			const args = [
   51  				endpoint.id,
   52: 				JSON.stringify(telemetryInfo),
   53  				endpoint.aiKey,
   54  			];
   55  			const client = new TelemetryClient(
   56  				FileAccess.asFileUri("bootstrap-fork").fsPath,
   57  				{

   60  					args,
   61  					env: {
   62  						ELECTRON_RUN_AS_NODE: 1,
   63  						VSCODE_PIPE_LOGGING: "true",
   64  						VSCODE_AMD_ENTRYPOINT:
   65: 							"vs/workbench/contrib/debug/node/telemetryApp",
   66  					},
   67  				},
   68  			);
   69
   70: 			const channel = client.getChannel("telemetryAppender");
   71  			const appenders = [
   72  				new TelemetryAppenderClient(channel),
   73  				new TelemetryLogAppender(
   74  					this.logService,
   75  					this.loggerService,

   94
   95  		return this.customTelemetryServices.get(endpoint.id)!;
   96  	}
   97
   98  	publicLog(
   99: 		telemetryEndpoint: ITelemetryEndpoint,
  100  		eventName: string,
  101  		data?: ITelemetryData,
  102  	) {
  103  		const customTelemetryService =
  104: 			this.getCustomTelemetryService(telemetryEndpoint);
  105  		customTelemetryService.publicLog(eventName, data);
  106  	}
  107
  108  	publicLogError(
  109: 		telemetryEndpoint: ITelemetryEndpoint,
  110  		errorEventName: string,
  111  		data?: ITelemetryData,
  112  	) {
  113  		const customTelemetryService =
  114: 			this.getCustomTelemetryService(telemetryEndpoint);
  115  		customTelemetryService.publicLogError(errorEventName, data);
  116  	}
  117  }
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\platform\telemetry\node\errorTelemetry.ts:

```sh
   7  	isCancellationError,
   8  	isSigPipeError,
   9  	onUnexpectedError,
  10  	setUnexpectedErrorHandler,
  11  } from "vs/base/common/errors";
  12: import BaseErrorTelemetry from "vs/platform/telemetry/common/errorTelemetry";
  13
  14  export default class ErrorTelemetry extends BaseErrorTelemetry {
  15  	protected override installErrorListeners(): void {
  16  		setUnexpectedErrorHandler((err) => console.error(err));
  17
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\platform\telemetry\node\telemetry.ts:

```sh
  11  	appRoot: string,
  12  	extensionsPath?: string,
  13  ): Promise<string> {
  14  	const mergedTelemetry = Object.create(null);
  15
  16: 	// Simple function to merge the telemetry into one json object
  17  	const mergeTelemetry = (contents: string, dirName: string) => {
  18: 		const telemetryData = JSON.parse(contents);
  19: 		mergedTelemetry[dirName] = telemetryData;
  20  	};
  21
  22  	if (extensionsPath) {
  23  		const dirs: string[] = [];
  24

  34  			} catch {
  35  				// This handles case where broken symbolic links can cause statSync to throw and error
  36  			}
  37  		}
  38
  39: 		const telemetryJsonFolders: string[] = [];
  40  		for (const dir of dirs) {
  41  			const files = (
  42  				await Promises.readdir(join(extensionsPath, dir))
  43: 			).filter((file) => file === "telemetry.json");
  44  			if (files.length === 1) {
  45: 				telemetryJsonFolders.push(dir); // // We know it contains a telemetry.json file so we add it to the list of folders which have one
  46  			}
  47  		}
  48
  49: 		for (const folder of telemetryJsonFolders) {
  50  			const contents = (
  51  				await fs.promises.readFile(
  52: 					join(extensionsPath, folder, "telemetry.json"),
  53  				)
  54  			).toString();
  55  			mergeTelemetry(contents, folder);
  56  		}
  57  	}
  58
  59  	let contents = (
  60: 		await fs.promises.readFile(join(appRoot, "telemetry-core.json"))
  61  	).toString();
  62  	mergeTelemetry(contents, "vscode-core");
  63
  64  	contents = (
  65: 		await fs.promises.readFile(join(appRoot, "telemetry-extensions.json"))
  66  	).toString();
  67  	mergeTelemetry(contents, "vscode-extensions");
  68
  69  	return JSON.stringify(mergedTelemetry, null, 4);
  70  }
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\platform\telemetry\node\telemetryUtils.ts:

```sh
   9  import { IStateReadService } from "vs/platform/state/node/state";
  10  import {
  11  	devDeviceIdKey,
  12  	machineIdKey,
  13  	sqmIdKey,
  14: } from "vs/platform/telemetry/common/telemetry";
  15
  16  export async function resolveMachineId(
  17  	stateService: IStateReadService,
  18  	logService: ILogService,
  19  ): Promise<string> {
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\platform\terminal\common\xterm\shellIntegrationAddon.ts:

```sh
   16  import { removeAnsiEscapeCodesFromPrompt } from "vs/base/common/strings";
   17  import { URI } from "vs/base/common/uri";
   18  import { ILogService } from "vs/platform/log/common/log";
   19  // Importing types is safe in any layer
   20  // eslint-disable-next-line local/code-import-patterns
   21: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   22  import { BufferMarkCapability } from "vs/platform/terminal/common/capabilities/bufferMarkCapability";
   23  import {
   24  	IBufferMarkCapability,
   25  	ICommandDetectionCapability,
   26  	ICwdDetectionCapability,

  286  	readonly onDidChangeStatus = this._onDidChangeStatus.event;
  287
  288  	constructor(
  289  		private _nonce: string,
  290  		private readonly _disableTelemetry: boolean | undefined,
  291: 		private readonly _telemetryService: ITelemetryService | undefined,
  292  		private readonly _logService: ILogService,
  293  	) {
  294  		super();
  295  		this._register(
  296  			toDisposable(() => {

  400  	}
  401
  402  	private _handleVSCodeSequence(data: string): boolean {
  403  		const didHandle = this._doHandleVSCodeSequence(data);
  404  		if (!this._hasUpdatedTelemetry && didHandle) {
  405: 			this._telemetryService?.publicLog2<
  406  				{},
  407  				{
  408  					owner: "meganrogge";
  409  					comment: "Indicates shell integration was activated";
  410  				}

  418  		}
  419  		return didHandle;
  420  	}
  421
  422  	private async _ensureCapabilitiesOrAddFailureTelemetry(): Promise<void> {
  423: 		if (!this._telemetryService || this._disableTelemetry) {
  424  			return;
  425  		}
  426  		this._activationTimeout = setTimeout(() => {
  427  			if (
  428  				!this.capabilities.get(TerminalCapability.CommandDetection) &&
  429  				!this.capabilities.get(TerminalCapability.CwdDetection)
  430  			) {
  431: 				this._telemetryService?.publicLog2<{
  432  					classification: "SystemMetaData";
  433  					purpose: "FeatureInsight";
  434  				}>("terminal/shellIntegrationActivationTimeout");
  435  				this._logService.warn(
  436  					"Shell integration failed to add capabilities within 10 seconds",
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\platform\terminal\electron-main\electronPtyHostStarter.ts:

```sh
17 import { IConfigurationService } from "vs/platform/configuration/common/configuration"
18 import { IEnvironmentMainService } from "vs/platform/environment/electron-main/environmentMainService"
19 import { parsePtyHostDebugPort } from "vs/platform/environment/node/environmentService"
20 import { ILifecycleMainService } from "vs/platform/lifecycle/electron-main/lifecycleMainService"
21 import { ILogService } from "vs/platform/log/common/log"
22: import { NullTelemetryService } from "vs/platform/telemetry/common/telemetryUtils"
23 import {
24 IReconnectConstants,
25 TerminalSettingId,
26 } from "vs/platform/terminal/common/terminal"
27 import {
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\platform\update\electron-main\updateService.darwin.ts:

```sh
   16  	IRelaunchOptions,
   17  } from "vs/platform/lifecycle/electron-main/lifecycleMainService";
   18  import { ILogService } from "vs/platform/log/common/log";
   19  import { IProductService } from "vs/platform/product/common/productService";
   20  import { IRequestService } from "vs/platform/request/common/request";
   21: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   22  import {
   23  	IUpdate,
   24  	State,
   25  	StateType,
   26  	UpdateType,

   70  	}
   71
   72  	constructor(
   73  		@ILifecycleMainService lifecycleMainService: ILifecycleMainService,
   74  		@IConfigurationService configurationService: IConfigurationService,
   75: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
   76  		@IEnvironmentMainService
   77  		environmentMainService: IEnvironmentMainService,
   78  		@IRequestService requestService: IRequestService,
   79  		@ILogService logService: ILogService,
   80  		@IProductService productService: IProductService,

  127  			this.disposables,
  128  		);
  129  	}
  130
  131  	private onError(err: string): void {
  132: 		this.telemetryService.publicLog2<
  133  			{ messageHash: string },
  134  			UpdateErrorClassification
  135  		>("update:error", { messageHash: String(hash(String(err))) });
  136  		this.logService.error("UpdateService error:", err);
  137

  189  				purpose: "FeatureInsight";
  190  				comment: "The version number of the new VS Code that has been downloaded.";
  191  			};
  192  			comment: "This is used to know how often VS Code has successfully downloaded the update.";
  193  		};
  194: 		this.telemetryService.publicLog2<
  195  			{ version: String },
  196  			UpdateDownloadedClassification
  197  		>("update:downloaded", { version: update.version });
  198
  199  		this.setState(State.Ready(update));

  201
  202  	private onUpdateNotAvailable(): void {
  203  		if (this.state.type !== StateType.CheckingForUpdates) {
  204  			return;
  205  		}
  206: 		this.telemetryService.publicLog2<
  207  			{ explicit: boolean },
  208  			UpdateNotAvailableClassification
  209  		>("update:notAvailable", { explicit: this.state.explicit });
  210
  211  		this.setState(State.Idle(UpdateType.Archive));
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\platform\update\electron-main\updateService.linux.ts:

```sh
   9  import { ILifecycleMainService } from "vs/platform/lifecycle/electron-main/lifecycleMainService";
  10  import { ILogService } from "vs/platform/log/common/log";
  11  import { INativeHostMainService } from "vs/platform/native/electron-main/nativeHostMainService";
  12  import { IProductService } from "vs/platform/product/common/productService";
  13  import { asJson, IRequestService } from "vs/platform/request/common/request";
  14: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
  15  import {
  16  	AvailableForDownload,
  17  	IUpdate,
  18  	State,
  19  	UpdateType,

  26
  27  export class LinuxUpdateService extends AbstractUpdateService {
  28  	constructor(
  29  		@ILifecycleMainService lifecycleMainService: ILifecycleMainService,
  30  		@IConfigurationService configurationService: IConfigurationService,
  31: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
  32  		@IEnvironmentMainService
  33  		environmentMainService: IEnvironmentMainService,
  34  		@IRequestService requestService: IRequestService,
  35  		@ILogService logService: ILogService,
  36  		@INativeHostMainService

  69  					!update ||
  70  					!update.url ||
  71  					!update.version ||
  72  					!update.productVersion
  73  				) {
  74: 					this.telemetryService.publicLog2<
  75  						{ explicit: boolean },
  76  						UpdateNotAvailableClassification
  77  					>("update:notAvailable", { explicit: !!context });
  78
  79  					this.setState(State.Idle(UpdateType.Archive));
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\platform\update\electron-main\updateService.snap.ts:

```sh
    9  import { Emitter, Event } from "vs/base/common/event";
   10  import * as path from "vs/base/common/path";
   11  import { IEnvironmentMainService } from "vs/platform/environment/electron-main/environmentMainService";
   12  import { ILifecycleMainService } from "vs/platform/lifecycle/electron-main/lifecycleMainService";
   13  import { ILogService } from "vs/platform/log/common/log";
   14: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   15  import {
   16  	AvailableForDownload,
   17  	IUpdateService,
   18  	State,
   19  	StateType,

  168  		private snapRevision: string,
  169  		@ILifecycleMainService lifecycleMainService: ILifecycleMainService,
  170  		@IEnvironmentMainService
  171  		environmentMainService: IEnvironmentMainService,
  172  		@ILogService logService: ILogService,
  173: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
  174  	) {
  175  		super(lifecycleMainService, environmentMainService, logService);
  176
  177  		const watcher = watch(path.dirname(this.snap));
  178  		const onChange = Event.fromNodeEventEmitter(

  201  		this.isUpdateAvailable().then(
  202  			(result) => {
  203  				if (result) {
  204  					this.setState(State.Ready({ version: "something" }));
  205  				} else {
  206: 					this.telemetryService.publicLog2<
  207  						{ explicit: boolean },
  208  						UpdateNotAvailableClassification
  209  					>("update:notAvailable", { explicit: false });
  210
  211  					this.setState(State.Idle(UpdateType.Snap));
  212  				}
  213  			},
  214  			(err) => {
  215  				this.logService.error(err);
  216: 				this.telemetryService.publicLog2<
  217  					{ explicit: boolean },
  218  					UpdateNotAvailableClassification
  219  				>("update:notAvailable", { explicit: false });
  220  				this.setState(State.Idle(UpdateType.Snap, err.message || err));
  221  			},
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\platform\update\electron-main\updateService.win32.ts:

```sh
   24  } from "vs/platform/lifecycle/electron-main/lifecycleMainService";
   25  import { ILogService } from "vs/platform/log/common/log";
   26  import { INativeHostMainService } from "vs/platform/native/electron-main/nativeHostMainService";
   27  import { IProductService } from "vs/platform/product/common/productService";
   28  import { asJson, IRequestService } from "vs/platform/request/common/request";
   29: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   30  import {
   31  	AvailableForDownload,
   32  	DisablementReason,
   33  	IUpdate,
   34  	State,

   84  	}
   85
   86  	constructor(
   87  		@ILifecycleMainService lifecycleMainService: ILifecycleMainService,
   88  		@IConfigurationService configurationService: IConfigurationService,
   89: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
   90  		@IEnvironmentMainService
   91  		environmentMainService: IEnvironmentMainService,
   92  		@IRequestService requestService: IRequestService,
   93  		@ILogService logService: ILogService,
   94  		@IFileService private readonly fileService: IFileService,

  169  					!update ||
  170  					!update.url ||
  171  					!update.version ||
  172  					!update.productVersion
  173  				) {
  174: 					this.telemetryService.publicLog2<
  175  						{ explicit: boolean },
  176  						UpdateNotAvailableClassification
  177  					>("update:notAvailable", { explicit: !!context });
  178
  179  					this.setState(State.Idle(updateType));

  248  							}
  249  						});
  250  				});
  251  			})
  252  			.then(undefined, (err) => {
  253: 				this.telemetryService.publicLog2<
  254  					{ messageHash: string },
  255  					UpdateErrorClassification
  256  				>("update:error", { messageHash: String(hash(String(err))) });
  257  				this.logService.error(err);
  258
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\platform\userDataSync\common\abstractSynchronizer.ts:

```sh
    37  import {
    38  	IStorageService,
    39  	StorageScope,
    40  	StorageTarget,
    41  } from "vs/platform/storage/common/storage";
    42: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
    43  import { IUriIdentityService } from "vs/platform/uriIdentity/common/uriIdentity";
    44  import {
    45  	IUserDataProfile,
    46  	IUserDataProfilesService,
    47  } from "vs/platform/userDataProfile/common/userDataProfile";

   239  		@IUserDataSyncLocalStoreService
   240  		protected readonly userDataSyncLocalStoreService: IUserDataSyncLocalStoreService,
   241  		@IUserDataSyncEnablementService
   242  		protected readonly userDataSyncEnablementService: IUserDataSyncEnablementService,
   243  		@ITelemetryService
   244: 		protected readonly telemetryService: ITelemetryService,
   245  		@IUserDataSyncLogService
   246  		protected readonly logService: IUserDataSyncLogService,
   247  		@IConfigurationService
   248  		protected readonly configurationService: IConfigurationService,
   249  		@IUriIdentityService uriIdentityService: IUriIdentityService,

   535  		if (
   536  			remoteUserData.syncData &&
   537  			remoteUserData.syncData.version > this.version
   538  		) {
   539  			// current version is not compatible with cloud version
   540: 			this.telemetryService.publicLog2<
   541  				{ source: string },
   542  				IncompatibleSyncSourceClassification
   543  			>("sync/incompatible", { source: this.resource });
   544  			throw new UserDataSyncError(
   545  				localize(

  1416  		userDataSyncStoreService: IUserDataSyncStoreService,
  1417  		@IUserDataSyncLocalStoreService
  1418  		userDataSyncLocalStoreService: IUserDataSyncLocalStoreService,
  1419  		@IUserDataSyncEnablementService
  1420  		userDataSyncEnablementService: IUserDataSyncEnablementService,
  1421: 		@ITelemetryService telemetryService: ITelemetryService,
  1422  		@IUserDataSyncLogService logService: IUserDataSyncLogService,
  1423  		@IConfigurationService configurationService: IConfigurationService,
  1424  		@IUriIdentityService uriIdentityService: IUriIdentityService,
  1425  	) {
  1426  		super(

  1430  			environmentService,
  1431  			storageService,
  1432  			userDataSyncStoreService,
  1433  			userDataSyncLocalStoreService,
  1434  			userDataSyncEnablementService,
  1435: 			telemetryService,
  1436  			logService,
  1437  			configurationService,
  1438  			uriIdentityService,
  1439  		);
  1440  		this._register(this.fileService.watch(this.extUri.dirname(file)));

  1526  		userDataSyncStoreService: IUserDataSyncStoreService,
  1527  		@IUserDataSyncLocalStoreService
  1528  		userDataSyncLocalStoreService: IUserDataSyncLocalStoreService,
  1529  		@IUserDataSyncEnablementService
  1530  		userDataSyncEnablementService: IUserDataSyncEnablementService,
  1531: 		@ITelemetryService telemetryService: ITelemetryService,
  1532  		@IUserDataSyncLogService logService: IUserDataSyncLogService,
  1533  		@IUserDataSyncUtilService
  1534  		protected readonly userDataSyncUtilService: IUserDataSyncUtilService,
  1535  		@IConfigurationService configurationService: IConfigurationService,
  1536  		@IUriIdentityService uriIdentityService: IUriIdentityService,

  1543  			environmentService,
  1544  			storageService,
  1545  			userDataSyncStoreService,
  1546  			userDataSyncLocalStoreService,
  1547  			userDataSyncEnablementService,
  1548: 			telemetryService,
  1549  			logService,
  1550  			configurationService,
  1551  			uriIdentityService,
  1552  		);
  1553  	}
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\platform\userDataSync\common\extensionsSync.ts:

```sh
   42  import { IFileService } from "vs/platform/files/common/files";
   43  import { IInstantiationService } from "vs/platform/instantiation/common/instantiation";
   44  import { ServiceCollection } from "vs/platform/instantiation/common/serviceCollection";
   45  import { ILogService } from "vs/platform/log/common/log";
   46  import { IStorageService } from "vs/platform/storage/common/storage";
   47: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   48  import { IUriIdentityService } from "vs/platform/uriIdentity/common/uriIdentity";
   49  import {
   50  	IUserDataProfile,
   51  	IUserDataProfilesService,
   52  } from "vs/platform/userDataProfile/common/userDataProfile";

  208  		private readonly ignoredExtensionsManagementService: IIgnoredExtensionsManagementService,
  209  		@IUserDataSyncLogService logService: IUserDataSyncLogService,
  210  		@IConfigurationService configurationService: IConfigurationService,
  211  		@IUserDataSyncEnablementService
  212  		userDataSyncEnablementService: IUserDataSyncEnablementService,
  213: 		@ITelemetryService telemetryService: ITelemetryService,
  214  		@IExtensionStorageService
  215  		extensionStorageService: IExtensionStorageService,
  216  		@IUriIdentityService uriIdentityService: IUriIdentityService,
  217  		@IUserDataProfileStorageService
  218  		userDataProfileStorageService: IUserDataProfileStorageService,

  226  			environmentService,
  227  			storageService,
  228  			userDataSyncStoreService,
  229  			userDataSyncLocalStoreService,
  230  			userDataSyncEnablementService,
  231: 			telemetryService,
  232  			logService,
  233  			configurationService,
  234  			uriIdentityService,
  235  		);
  236  		this.localExtensionsProvider = this.instantiationService.createInstance(
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\platform\userDataSync\common\globalStateSync.ts:

```sh
   24  	IStorageEntry,
   25  	IStorageService,
   26  	StorageScope,
   27  	StorageTarget,
   28  } from "vs/platform/storage/common/storage";
   29: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   30  import { IUriIdentityService } from "vs/platform/uriIdentity/common/uriIdentity";
   31  import {
   32  	IUserDataProfile,
   33  	IUserDataProfilesService,
   34  } from "vs/platform/userDataProfile/common/userDataProfile";

  160  		userDataSyncLocalStoreService: IUserDataSyncLocalStoreService,
  161  		@IUserDataSyncLogService logService: IUserDataSyncLogService,
  162  		@IEnvironmentService environmentService: IEnvironmentService,
  163  		@IUserDataSyncEnablementService
  164  		userDataSyncEnablementService: IUserDataSyncEnablementService,
  165: 		@ITelemetryService telemetryService: ITelemetryService,
  166  		@IConfigurationService configurationService: IConfigurationService,
  167  		@IStorageService storageService: IStorageService,
  168  		@IUriIdentityService uriIdentityService: IUriIdentityService,
  169  		@IInstantiationService instantiationService: IInstantiationService,
  170  	) {

  175  			environmentService,
  176  			storageService,
  177  			userDataSyncStoreService,
  178  			userDataSyncLocalStoreService,
  179  			userDataSyncEnablementService,
  180: 			telemetryService,
  181  			logService,
  182  			configurationService,
  183  			uriIdentityService,
  184  		);
  185  		this.localGlobalStateProvider = instantiationService.createInstance(
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\platform\userDataSync\common\keybindingsSync.ts:

```sh
   19  	FileOperationResult,
   20  	IFileService,
   21  } from "vs/platform/files/common/files";
   22  import { ILogService } from "vs/platform/log/common/log";
   23  import { IStorageService } from "vs/platform/storage/common/storage";
   24: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   25  import { IUriIdentityService } from "vs/platform/uriIdentity/common/uriIdentity";
   26  import {
   27  	IUserDataProfile,
   28  	IUserDataProfilesService,
   29  } from "vs/platform/userDataProfile/common/userDataProfile";

  132  		@IFileService fileService: IFileService,
  133  		@IEnvironmentService environmentService: IEnvironmentService,
  134  		@IStorageService storageService: IStorageService,
  135  		@IUserDataSyncUtilService
  136  		userDataSyncUtilService: IUserDataSyncUtilService,
  137: 		@ITelemetryService telemetryService: ITelemetryService,
  138  		@IUriIdentityService uriIdentityService: IUriIdentityService,
  139  	) {
  140  		super(
  141  			profile.keybindingsResource,
  142  			{ syncResource: SyncResource.Keybindings, profile },

  145  			environmentService,
  146  			storageService,
  147  			userDataSyncStoreService,
  148  			userDataSyncLocalStoreService,
  149  			userDataSyncEnablementService,
  150: 			telemetryService,
  151  			logService,
  152  			userDataSyncUtilService,
  153  			configurationService,
  154  			uriIdentityService,
  155  		);
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\platform\userDataSync\common\settingsSync.ts:

```sh
   21  	FileOperationError,
   22  	FileOperationResult,
   23  	IFileService,
   24  } from "vs/platform/files/common/files";
   25  import { IStorageService } from "vs/platform/storage/common/storage";
   26: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   27  import { IUriIdentityService } from "vs/platform/uriIdentity/common/uriIdentity";
   28  import {
   29  	IUserDataProfile,
   30  	IUserDataProfilesService,
   31  } from "vs/platform/userDataProfile/common/userDataProfile";

  128  		@IUserDataSyncUtilService
  129  		userDataSyncUtilService: IUserDataSyncUtilService,
  130  		@IConfigurationService configurationService: IConfigurationService,
  131  		@IUserDataSyncEnablementService
  132  		userDataSyncEnablementService: IUserDataSyncEnablementService,
  133: 		@ITelemetryService telemetryService: ITelemetryService,
  134  		@IExtensionManagementService
  135  		private readonly extensionManagementService: IExtensionManagementService,
  136  		@IUriIdentityService uriIdentityService: IUriIdentityService,
  137  	) {
  138  		super(

  143  			environmentService,
  144  			storageService,
  145  			userDataSyncStoreService,
  146  			userDataSyncLocalStoreService,
  147  			userDataSyncEnablementService,
  148: 			telemetryService,
  149  			logService,
  150  			userDataSyncUtilService,
  151  			configurationService,
  152  			uriIdentityService,
  153  		);
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\platform\userDataSync\common\snippetsSync.ts:

```sh
  17  	IFileContent,
  18  	IFileService,
  19  	IFileStat,
  20  } from "vs/platform/files/common/files";
  21  import { IStorageService } from "vs/platform/storage/common/storage";
  22: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
  23  import { IUriIdentityService } from "vs/platform/uriIdentity/common/uriIdentity";
  24  import {
  25  	IUserDataProfile,
  26  	IUserDataProfilesService,
  27  } from "vs/platform/userDataProfile/common/userDataProfile";

  81  		userDataSyncLocalStoreService: IUserDataSyncLocalStoreService,
  82  		@IUserDataSyncLogService logService: IUserDataSyncLogService,
  83  		@IConfigurationService configurationService: IConfigurationService,
  84  		@IUserDataSyncEnablementService
  85  		userDataSyncEnablementService: IUserDataSyncEnablementService,
  86: 		@ITelemetryService telemetryService: ITelemetryService,
  87  		@IUriIdentityService uriIdentityService: IUriIdentityService,
  88  	) {
  89  		super(
  90  			{ syncResource: SyncResource.Snippets, profile },
  91  			collection,

  93  			environmentService,
  94  			storageService,
  95  			userDataSyncStoreService,
  96  			userDataSyncLocalStoreService,
  97  			userDataSyncEnablementService,
  98: 			telemetryService,
  99  			logService,
  100  			configurationService,
  101  			uriIdentityService,
  102  		);
  103  		this.snippetsFolder = profile.snippetsHome;
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\platform\userDataSync\common\tasksSync.ts:

```sh
    9  import { IConfigurationService } from "vs/platform/configuration/common/configuration";
   10  import { IEnvironmentService } from "vs/platform/environment/common/environment";
   11  import { IFileService } from "vs/platform/files/common/files";
   12  import { ILogService } from "vs/platform/log/common/log";
   13  import { IStorageService } from "vs/platform/storage/common/storage";
   14: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   15  import { IUriIdentityService } from "vs/platform/uriIdentity/common/uriIdentity";
   16  import {
   17  	IUserDataProfile,
   18  	IUserDataProfilesService,
   19  } from "vs/platform/userDataProfile/common/userDataProfile";

   96  		@IUserDataSyncEnablementService
   97  		userDataSyncEnablementService: IUserDataSyncEnablementService,
   98  		@IFileService fileService: IFileService,
   99  		@IEnvironmentService environmentService: IEnvironmentService,
  100  		@IStorageService storageService: IStorageService,
  101: 		@ITelemetryService telemetryService: ITelemetryService,
  102  		@IUriIdentityService uriIdentityService: IUriIdentityService,
  103  	) {
  104  		super(
  105  			profile.tasksResource,
  106  			{ syncResource: SyncResource.Tasks, profile },

  109  			environmentService,
  110  			storageService,
  111  			userDataSyncStoreService,
  112  			userDataSyncLocalStoreService,
  113  			userDataSyncEnablementService,
  114: 			telemetryService,
  115  			logService,
  116  			configurationService,
  117  			uriIdentityService,
  118  		);
  119  	}
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\platform\userDataSync\common\userDataAutoSyncService.ts:

```sh
   29  import {
   30  	IStorageService,
   31  	StorageScope,
   32  	StorageTarget,
   33  } from "vs/platform/storage/common/storage";
   34: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   35  import {
   36  	IUserDataAutoSyncService,
   37  	IUserDataManifest,
   38  	IUserDataSyncEnablementService,
   39  	IUserDataSyncLogService,

  158  		private readonly userDataSyncService: IUserDataSyncService,
  159  		@IUserDataSyncLogService
  160  		private readonly logService: IUserDataSyncLogService,
  161  		@IUserDataSyncAccountService
  162  		private readonly userDataSyncAccountService: IUserDataSyncAccountService,
  163: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
  164  		@IUserDataSyncMachinesService
  165  		private readonly userDataSyncMachinesService: IUserDataSyncMachinesService,
  166  		@IStorageService private readonly storageService: IStorageService,
  167  	) {
  168  		super();

  262  					this.userDataSyncStoreManagementService,
  263  					this.userDataSyncStoreService,
  264  					this.userDataSyncService,
  265  					this.userDataSyncMachinesService,
  266  					this.logService,
  267: 					this.telemetryService,
  268  					this.storageService,
  269  				);
  270  				this.autoSync.value.register(
  271  					this.autoSync.value.onDidStartSync(
  272  						() => (this.lastSyncTriggerTime = new Date().getTime()),

  354  			// Reset Session
  355  			this.storageService.remove(sessionIdKey, StorageScope.APPLICATION);
  356
  357  			// Reset
  358  			if (everywhere) {
  359: 				this.telemetryService.publicLog2<
  360  					{},
  361  					{
  362  						owner: "sandy081";
  363  						comment: "Reporting when settings sync is turned off in all devices";
  364  					}

  400  		}
  401
  402  		// Error while syncing
  403  		const userDataSyncError = UserDataSyncError.toUserDataSyncError(error);
  404
  405: 		// Log to telemetry
  406  		if (userDataSyncError instanceof UserDataAutoSyncError) {
  407: 			this.telemetryService.publicLog2<
  408  				{ code: string; service: string },
  409  				AutoSyncErrorClassification
  410  			>(`autosync/error`, {
  411  				code: userDataSyncError.code,
  412  				service:

  617  			async () => {
  618  				this.logService.trace("activity sources", ...this.sources);
  619  				const providerId =
  620  					this.userDataSyncAccountService.account
  621  						?.authenticationProviderId || "";
  622: 				this.telemetryService.publicLog2<
  623  					{ sources: string[]; providerId: string },
  624  					AutoSyncClassification
  625  				>("sync/triggered", { sources: this.sources, providerId });
  626  				this.sources = [];
  627  				if (this.autoSync.value) {

  669  		private readonly userDataSyncStoreManagementService: IUserDataSyncStoreManagementService,
  670  		private readonly userDataSyncStoreService: IUserDataSyncStoreService,
  671  		private readonly userDataSyncService: IUserDataSyncService,
  672  		private readonly userDataSyncMachinesService: IUserDataSyncMachinesService,
  673  		private readonly logService: IUserDataSyncLogService,
  674: 		private readonly telemetryService: ITelemetryService,
  675  		private readonly storageService: IStorageService,
  676  	) {
  677  		super();
  678  	}
  679

  892  			);
  893  		}
  894
  895  		const startTime = new Date().getTime();
  896  		await this.syncTask.run();
  897: 		this.telemetryService.publicLog2<
  898  			{
  899  				duration: number;
  900  			},
  901  			{
  902  				owner: "sandy081";
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\platform\userDataSync\common\userDataProfilesManifestSync.ts:

```sh
    8  import { URI } from "vs/base/common/uri";
    9  import { IConfigurationService } from "vs/platform/configuration/common/configuration";
   10  import { IEnvironmentService } from "vs/platform/environment/common/environment";
   11  import { IFileService } from "vs/platform/files/common/files";
   12  import { IStorageService } from "vs/platform/storage/common/storage";
   13: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   14  import { IUriIdentityService } from "vs/platform/uriIdentity/common/uriIdentity";
   15  import {
   16  	IUserDataProfile,
   17  	IUserDataProfilesService,
   18  } from "vs/platform/userDataProfile/common/userDataProfile";

   98  		userDataSyncLocalStoreService: IUserDataSyncLocalStoreService,
   99  		@IUserDataSyncLogService logService: IUserDataSyncLogService,
  100  		@IConfigurationService configurationService: IConfigurationService,
  101  		@IUserDataSyncEnablementService
  102  		userDataSyncEnablementService: IUserDataSyncEnablementService,
  103: 		@ITelemetryService telemetryService: ITelemetryService,
  104  		@IUriIdentityService uriIdentityService: IUriIdentityService,
  105  	) {
  106  		super(
  107  			{ syncResource: SyncResource.Profiles, profile },
  108  			collection,

  110  			environmentService,
  111  			storageService,
  112  			userDataSyncStoreService,
  113  			userDataSyncLocalStoreService,
  114  			userDataSyncEnablementService,
  115: 			telemetryService,
  116  			logService,
  117  			configurationService,
  118  			uriIdentityService,
  119  		);
  120  		this._register(
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\platform\userDataSync\common\userDataSyncEnablementService.ts:

```sh
  11  	IApplicationStorageValueChangeEvent,
  12  	IStorageService,
  13  	StorageScope,
  14  	StorageTarget,
  15  } from "vs/platform/storage/common/storage";
  16: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
  17  import {
  18  	ALL_SYNC_RESOURCES,
  19  	getEnablementKey,
  20  	IUserDataSyncEnablementService,
  21  	IUserDataSyncStoreManagementService,

  50  	readonly onDidChangeResourceEnablement: Event<[SyncResource, boolean]> =
  51  		this._onDidChangeResourceEnablement.event;
  52
  53  	constructor(
  54  		@IStorageService private readonly storageService: IStorageService,
  55: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
  56  		@IEnvironmentService
  57  		protected readonly environmentService: IEnvironmentService,
  58  		@IUserDataSyncStoreManagementService
  59  		private readonly userDataSyncStoreManagementService: IUserDataSyncStoreManagementService,
  60  	) {

  91
  92  	setEnablement(enabled: boolean): void {
  93  		if (enabled && !this.canToggleEnablement()) {
  94  			return;
  95  		}
  96: 		this.telemetryService.publicLog2<
  97  			{ enabled: boolean },
  98  			SyncEnablementClassification
  99  		>(enablementKey, { enabled });
  100  		this.storageService.store(
  101  			enablementKey,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\platform\userDataSync\common\userDataSyncService.ts:

```sh
    32  import {
    33  	IStorageService,
    34  	StorageScope,
    35  	StorageTarget,
    36  } from "vs/platform/storage/common/storage";
    37: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
    38  import {
    39  	IUserDataProfile,
    40  	IUserDataProfilesService,
    41  } from "vs/platform/userDataProfile/common/userDataProfile";
    42  import { ExtensionsSynchroniser } from "vs/platform/userDataSync/common/extensionsSync";

   178  		private readonly userDataSyncStoreManagementService: IUserDataSyncStoreManagementService,
   179  		@IInstantiationService
   180  		private readonly instantiationService: IInstantiationService,
   181  		@IUserDataSyncLogService
   182  		private readonly logService: IUserDataSyncLogService,
   183: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
   184  		@IStorageService private readonly storageService: IStorageService,
   185  		@IUserDataSyncEnablementService
   186  		private readonly userDataSyncEnablementService: IUserDataSyncEnablementService,
   187  		@IUserDataProfilesService
   188  		private readonly userDataProfilesService: IUserDataProfilesService,

   235  				UserDataSyncError.toUserDataSyncError(error);
   236  			reportUserDataSyncError(
   237  				userDataSyncError,
   238  				executionId,
   239  				this.userDataSyncStoreManagementService,
   240: 				this.telemetryService,
   241  			);
   242  			throw userDataSyncError;
   243  		}
   244
   245  		const executed = false;

   294  				UserDataSyncError.toUserDataSyncError(error);
   295  			reportUserDataSyncError(
   296  				userDataSyncError,
   297  				executionId,
   298  				this.userDataSyncStoreManagementService,
   299: 				this.telemetryService,
   300  			);
   301  			throw userDataSyncError;
   302  		}
   303
   304  		/* Manual sync shall start on clean local state */

  1125  		private readonly instantiationService: IInstantiationService,
  1126  		@IExtensionGalleryService
  1127  		private readonly extensionGalleryService: IExtensionGalleryService,
  1128  		@IUserDataSyncStoreManagementService
  1129  		private readonly userDataSyncStoreManagementService: IUserDataSyncStoreManagementService,
  1130: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
  1131  		@IUserDataSyncLogService
  1132  		private readonly logService: IUserDataSyncLogService,
  1133  		@IUserDataProfilesService
  1134  		private readonly userDataProfilesService: IUserDataProfilesService,
  1135  		@IConfigurationService

  1364  						UserDataSyncError.toUserDataSyncError(e);
  1365  					reportUserDataSyncError(
  1366  						userDataSyncError,
  1367  						executionId,
  1368  						this.userDataSyncStoreManagementService,
  1369: 						this.telemetryService,
  1370  					);
  1371  					if (canBailout(e)) {
  1372  						throw userDataSyncError;
  1373  					}
  1374

  1400  					UserDataSyncError.toUserDataSyncError(e);
  1401  				reportUserDataSyncError(
  1402  					userDataSyncError,
  1403  					executionId,
  1404  					this.userDataSyncStoreManagementService,
  1405: 					this.telemetryService,
  1406  				);
  1407  				if (canBailout(e)) {
  1408  					throw userDataSyncError;
  1409  				}
  1410

  1546
  1547  function reportUserDataSyncError(
  1548  	userDataSyncError: UserDataSyncError,
  1549  	executionId: string,
  1550  	userDataSyncStoreManagementService: IUserDataSyncStoreManagementService,
  1551: 	telemetryService: ITelemetryService,
  1552  ): void {
  1553: 	telemetryService.publicLog2<
  1554  		{
  1555  			code: string;
  1556  			service: string;
  1557  			serverCode?: string;
  1558  			url?: string;
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\platform\userDataSync\node\userDataAutoSyncService.ts:

```sh
   5  //
   6  import { Event } from "vs/base/common/event";
   7  import { INativeHostService } from "vs/platform/native/common/native";
   8  import { IProductService } from "vs/platform/product/common/productService";
   9  import { IStorageService } from "vs/platform/storage/common/storage";
  10: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
  11  import { UserDataAutoSyncService as BaseUserDataAutoSyncService } from "vs/platform/userDataSync/common/userDataAutoSyncService";
  12  import {
  13  	IUserDataSyncEnablementService,
  14  	IUserDataSyncLogService,
  15  	IUserDataSyncService,

  31  		@IUserDataSyncService userDataSyncService: IUserDataSyncService,
  32  		@INativeHostService nativeHostService: INativeHostService,
  33  		@IUserDataSyncLogService logService: IUserDataSyncLogService,
  34  		@IUserDataSyncAccountService
  35  		authTokenService: IUserDataSyncAccountService,
  36: 		@ITelemetryService telemetryService: ITelemetryService,
  37  		@IUserDataSyncMachinesService
  38  		userDataSyncMachinesService: IUserDataSyncMachinesService,
  39  		@IStorageService storageService: IStorageService,
  40  	) {
  41  		super(

  44  			userDataSyncStoreService,
  45  			userDataSyncEnablementService,
  46  			userDataSyncService,
  47  			logService,
  48  			authTokenService,
  49: 			telemetryService,
  50  			userDataSyncMachinesService,
  51  			storageService,
  52  		);
  53
  54  		this._register(
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\platform\utilityProcess\electron-main\utilityProcess.ts:

```sh
   26  	getUNCHostAllowlist,
   27  	isUNCAccessRestrictionsDisabled,
   28  } from "vs/base/node/unc";
   29  import { ILifecycleMainService } from "vs/platform/lifecycle/electron-main/lifecycleMainService";
   30  import { ILogService } from "vs/platform/log/common/log";
   31: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   32  import { IWindowsMainService } from "vs/platform/windows/electron-main/windows";
   33
   34  export interface IUtilityProcessConfiguration {
   35  	/**
   36  	 * A way to group utility processes of same type together.

  200  	private configuration: IUtilityProcessConfiguration | undefined = undefined;
  201  	private killed = false;
  202
  203  	constructor(
  204  		@ILogService private readonly logService: ILogService,
  205: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
  206  		@ILifecycleMainService
  207  		protected readonly lifecycleMainService: ILifecycleMainService,
  208  	) {
  209  		super();
  210  	}

  473  					type UtilityProcessCrashEvent = {
  474  						type: string;
  475  						reason: string;
  476  						code: number;
  477  					};
  478: 					this.telemetryService.publicLog2<
  479  						UtilityProcessCrashEvent,
  480  						UtilityProcessCrashClassification
  481  					>("utilityprocesscrash", {
  482  						type: configuration.type,
  483  						reason: details.reason,

  613  export class WindowUtilityProcess extends UtilityProcess {
  614  	constructor(
  615  		@ILogService logService: ILogService,
  616  		@IWindowsMainService
  617  		private readonly windowsMainService: IWindowsMainService,
  618: 		@ITelemetryService telemetryService: ITelemetryService,
  619  		@ILifecycleMainService lifecycleMainService: ILifecycleMainService,
  620  	) {
  621: 		super(logService, telemetryService, lifecycleMainService);
  622  	}
  623
  624  	override start(configuration: IWindowUtilityProcessConfiguration): boolean {
  625  		const responseWindow = this.windowsMainService.getWindowById(
  626  			configuration.responseWindowId,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\platform\utilityProcess\electron-main\utilityProcessWorkerMainService.ts:

```sh
    8  import { hash } from "vs/base/common/hash";
    9  import { Disposable } from "vs/base/common/lifecycle";
   10  import { createDecorator } from "vs/platform/instantiation/common/instantiation";
   11  import { ILifecycleMainService } from "vs/platform/lifecycle/electron-main/lifecycleMainService";
   12  import { ILogService } from "vs/platform/log/common/log";
   13: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   14  import {
   15  	IOnDidTerminateUtilityrocessWorkerProcess,
   16  	IUtilityProcessWorkerConfiguration,
   17  	IUtilityProcessWorkerCreateConfiguration,
   18  	IUtilityProcessWorkerProcessExit,

   39
   40  	constructor(
   41  		@ILogService private readonly logService: ILogService,
   42  		@IWindowsMainService
   43  		private readonly windowsMainService: IWindowsMainService,
   44: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
   45  		@ILifecycleMainService
   46  		private readonly lifecycleMainService: ILifecycleMainService,
   47  	) {
   48  		super();
   49  	}

   68
   69  		// Create new worker
   70  		const worker = new UtilityProcessWorker(
   71  			this.logService,
   72  			this.windowsMainService,
   73: 			this.telemetryService,
   74  			this.lifecycleMainService,
   75  			configuration,
   76  		);
   77  		if (!worker.spawn()) {
   78  			return { reason: { code: 1, signal: "EINVALID" } };

  134
  135  	private readonly utilityProcess = this._register(
  136  		new WindowUtilityProcess(
  137  			this.logService,
  138  			this.windowsMainService,
  139: 			this.telemetryService,
  140  			this.lifecycleMainService,
  141  		),
  142  	);
  143
  144  	constructor(
  145  		@ILogService private readonly logService: ILogService,
  146  		@IWindowsMainService
  147  		private readonly windowsMainService: IWindowsMainService,
  148: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
  149  		@ILifecycleMainService
  150  		private readonly lifecycleMainService: ILifecycleMainService,
  151  		private readonly configuration: IUtilityProcessWorkerCreateConfiguration,
  152  	) {
  153  		super();
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\platform\windows\electron-main\windowImpl.ts:

```sh
    48  import { IStateService } from "vs/platform/state/node/state";
    49  import {
    50  	IApplicationStorageMainService,
    51  	IStorageMainService,
    52  } from "vs/platform/storage/electron-main/storageMainService";
    53: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
    54  import { IThemeMainService } from "vs/platform/theme/electron-main/themeMainService";
    55  import { IUserDataProfile } from "vs/platform/userDataProfile/common/userDataProfile";
    56  import { IUserDataProfilesMainService } from "vs/platform/userDataProfile/electron-main/userDataProfile";
    57  import {
    58  	DEFAULT_CUSTOM_TITLEBAR_HEIGHT,

   793  		@IThemeMainService private readonly themeMainService: IThemeMainService,
   794  		@IWorkspacesManagementMainService
   795  		private readonly workspacesManagementMainService: IWorkspacesManagementMainService,
   796  		@IBackupMainService
   797  		private readonly backupMainService: IBackupMainService,
   798: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
   799  		@IDialogMainService
   800  		private readonly dialogMainService: IDialogMainService,
   801  		@ILifecycleMainService
   802  		private readonly lifecycleMainService: ILifecycleMainService,
   803  		@IProductService private readonly productService: IProductService,

  1046  				this.productService,
  1047  				this.environmentMainService,
  1048  				this.configurationService,
  1049  				this.fileService,
  1050  				this.applicationStorageMainService,
  1051: 				this.telemetryService,
  1052  			);
  1053  		}
  1054
  1055  		return this.marketplaceHeadersPromise;
  1056  	}

  1107  		type WindowErrorEvent = {
  1108  			type: WindowError;
  1109  			reason: string | undefined;
  1110  			code: number | undefined;
  1111  		};
  1112: 		this.telemetryService.publicLog2<
  1113  			WindowErrorEvent,
  1114  			WindowErrorClassification
  1115  		>("windowerror", {
  1116  			type,
  1117  			reason: details?.reason,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\server\node\remoteExtensionHostAgentCli.ts:

```sh
61 import { NullPolicyService } from "vs/platform/policy/common/policy"
62 import product from "vs/platform/product/common/product"
63 import { IProductService } from "vs/platform/product/common/productService"
64 import { IRequestService } from "vs/platform/request/common/request"
65 import { RequestService } from "vs/platform/request/node/requestService"
66: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry"
67: import { NullTelemetryService } from "vs/platform/telemetry/common/telemetryUtils"
68 import { IUriIdentityService } from "vs/platform/uriIdentity/common/uriIdentity"
69 import { UriIdentityService } from "vs/platform/uriIdentity/common/uriIdentityService"
70 import { IUserDataProfilesService } from "vs/platform/userDataProfile/common/userDataProfile"
71 import { ServerUserDataProfilesService } from "vs/platform/userDataProfile/node/userDataProfile"
72 import { ExtensionsScannerService } from "vs/server/node/extensionsScannerService"
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\server\node\remoteExtensionHostAgentServer.ts:

```sh
    54  	IRemoteExtensionHostStartParams,
    55  	ITunnelConnectionStartParams,
    56  	SignRequest,
    57  } from "vs/platform/remote/common/remoteAgentConnection";
    58  import { RemoteAgentConnectionContext } from "vs/platform/remote/common/remoteAgentEnvironment";
    59: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
    60  import { ExtensionHostConnection } from "vs/server/node/extensionHostConnection";
    61  import { ManagementConnection } from "vs/server/node/remoteExtensionManagement";
    62  import {
    63  	determineServerConnectionToken,
    64  	requestHasValidConnectionToken as httpRequestHasValidConnectionToken,

   988  		REMOTE_DATA_FOLDER,
   989  		disposables,
   990  	);
   991
   992  	// Set the unexpected error handler after the services have been initialized, to avoid having
   993: 	// the telemetry service overwrite our handler
   994  	instantiationService.invokeFunction((accessor) => {
   995  		const logService = accessor.get(ILogService);
   996  		unloggedErrors.forEach((error) => logService.error(error));
   997  		unloggedErrors.length = 0;
   998

  1113  	const vscodeServerListenTime: number = (<any>global).vscodeServerListenTime;
  1114  	const vscodeServerCodeLoadedTime: number = (<any>global)
  1115  		.vscodeServerCodeLoadedTime;
  1116
  1117  	instantiationService.invokeFunction(async (accessor) => {
  1118: 		const telemetryService = accessor.get(ITelemetryService);
  1119
  1120  		type ServerStartClassification = {
  1121  			owner: "alexdima";
  1122  			comment: "The server has started up";
  1123  			startTime: {

  1145  			startTime: number;
  1146  			startedTime: number;
  1147  			codeLoadedTime: number;
  1148  			readyTime: number;
  1149  		};
  1150: 		telemetryService.publicLog2<
  1151  			ServerStartEvent,
  1152  			ServerStartClassification
  1153  		>("serverStart", {
  1154  			startTime: vscodeServerStartTime,
  1155  			startedTime: vscodeServerListenTime,

  1185  				type ServerPlatformInfoEvent = {
  1186  					platformId: string;
  1187  					platformVersionId: string | undefined;
  1188  					platformIdLike: string | undefined;
  1189  				};
  1190: 				telemetryService.publicLog2<
  1191  					ServerPlatformInfoEvent,
  1192  					ServerPlatformInfoClassification
  1193  				>("serverPlatformInfo", {
  1194  					platformId: releaseInfo.id,
  1195  					platformVersionId: releaseInfo.version_id,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\server\node\server.cli.ts:

```sh
54 case "export-default-configuration":
55 case "install-source":
56 case "enable-smoke-test-driver":
57 case "extensions-download-dir":
58 case "builtin-extensions-dir":
59: case "telemetry":
60 return false
61 default:
62 return true
63 }
64 }
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\server\node\serverEnvironmentService.ts:

```sh
   98  		description: nls.localize(
   99  			"serverDataDir",
  100  			"Specifies the directory that server data is kept in.",
  101  		),
  102  	},
  103: 	"telemetry-level": {
  104  		type: "string",
  105  		cat: "o",
  106  		args: "level",
  107  		description: nls.localize(
  108: 			"telemetry-level",
  109: 			"Sets the initial telemetry level. Valid levels are: 'off', 'crash', 'error' and 'all'. If not specified, the server will send telemetry until a client connects, it will then use the clients telemetry setting. Setting this to 'off' is equivalent to --disable-telemetry",
  110  		),
  111  	},
  112
  113  	/* ----- vs code options ---	-- */
  114
  115  	"user-data-dir": OPTIONS["user-data-dir"],
  116  	"enable-smoke-test-driver": OPTIONS["enable-smoke-test-driver"],
  117: 	"disable-telemetry": OPTIONS["disable-telemetry"],
  118  	"disable-workspace-trust": OPTIONS["disable-workspace-trust"],
  119  	"file-watcher-polling": {
  120  		type: "string",
  121  		deprecates: ["fileWatcherPolling"],
  122  	},

  251
  252  	"accept-server-license-terms": boolean;
  253
  254  	"server-data-dir"?: string;
  255
  256: 	"telemetry-level"?: string;
  257
  258  	"disable-workspace-trust"?: boolean;
  259
  260  	/* ----- vs code options ----- */
  261
  262  	"user-data-dir"?: string;
  263
  264  	"enable-smoke-test-driver"?: boolean;
  265
  266: 	"disable-telemetry"?: boolean;
  267  	"file-watcher-polling"?: string;
  268
  269  	"log"?: string[];
  270  	"logsPath"?: string;
  271
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\server\node\serverServices.ts:

```sh
   75  import { RemoteAgentConnectionContext } from "vs/platform/remote/common/remoteAgentEnvironment";
   76  import { RemoteExtensionsScannerChannelName } from "vs/platform/remote/common/remoteExtensionsScanner";
   77  import { IRequestService } from "vs/platform/request/common/request";
   78  import { RequestChannel } from "vs/platform/request/common/requestIpc";
   79  import { RequestService } from "vs/platform/request/node/requestService";
   80: import { resolveCommonProperties } from "vs/platform/telemetry/common/commonProperties";
   81: import { ServerTelemetryChannel } from "vs/platform/telemetry/common/remoteTelemetryChannel";
   82  import {
   83  	IServerTelemetryService,
   84  	ServerNullTelemetryService,
   85  	ServerTelemetryService,
   86: } from "vs/platform/telemetry/common/serverTelemetryService";
   87  import {
   88  	ITelemetryService,
   89  	TelemetryLevel,
   90: } from "vs/platform/telemetry/common/telemetry";
   91: import { ITelemetryServiceConfig } from "vs/platform/telemetry/common/telemetryService";
   92  import {
   93  	getPiiPathsFromEnvironment,
   94  	isInternalTelemetry,
   95  	isLoggingOnly,
   96  	ITelemetryAppender,
   97  	NullAppender,
   98  	supportsTelemetry,
   99: } from "vs/platform/telemetry/common/telemetryUtils";
  100: import { OneDataSystemAppender } from "vs/platform/telemetry/node/1dsAppender";
  101: import ErrorTelemetry from "vs/platform/telemetry/node/errorTelemetry";
  102  import {
  103  	IPtyService,
  104  	TerminalSettingId,
  105  } from "vs/platform/terminal/common/terminal";
  106  import { NodePtyHostStarter } from "vs/platform/terminal/node/nodePtyHostStarter";

  307  				"remoteAgent",
  308  			),
  309  			piiPaths: getPiiPathsFromEnvironment(environmentService),
  310  		};
  311  		const initialTelemetryLevelArg =
  312: 			environmentService.args["telemetry-level"];
  313  		let injectedTelemetryLevel: TelemetryLevel = TelemetryLevel.USAGE;
  314: 		// Convert the passed in CLI argument into a telemetry level for the telemetry service
  315  		if (initialTelemetryLevelArg === "all") {
  316  			injectedTelemetryLevel = TelemetryLevel.USAGE;
  317  		} else if (initialTelemetryLevelArg === "error") {
  318  			injectedTelemetryLevel = TelemetryLevel.ERROR;
  319  		} else if (initialTelemetryLevelArg === "crash") {

  409  		socketServer.registerChannel(
  410  			"remoteextensionsenvironment",
  411  			remoteExtensionEnvironmentChannel,
  412  		);
  413
  414: 		const telemetryChannel = new ServerTelemetryChannel(
  415  			accessor.get(IServerTelemetryService),
  416  			oneDsAppender,
  417  		);
  418: 		socketServer.registerChannel("telemetry", telemetryChannel);
  419
  420  		socketServer.registerChannel(
  421  			REMOTE_TERMINAL_CHANNEL_NAME,
  422  			new RemoteTerminalChannel(
  423  				environmentService,

  479  			.then(() => extensionManagementService.cleanUp());
  480
  481  		disposables.add(new ErrorTelemetry(accessor.get(ITelemetryService)));
  482
  483  		return {
  484: 			telemetryService: accessor.get(ITelemetryService),
  485  		};
  486  	});
  487
  488  	return { socketServer, instantiationService };
  489  }
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\workbench.common.main.ts:

```sh
156 //#endregion
157
158 //#region --- workbench contributions
159
160 // Telemetry
161: import "vs/workbench/contrib/telemetry/browser/telemetry.contribution"
162 // Preferences
163 import "vs/workbench/contrib/preferences/browser/preferences.contribution"
164 import "vs/workbench/contrib/preferences/browser/keybindingsEditorContribution"
165 import "vs/workbench/contrib/preferences/browser/preferencesSearch"
166 // Performance
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\workbench.desktop.main.ts:

```sh
47 import "vs/workbench/services/themes/electron-sandbox/nativeHostColorSchemeService"
48 import "vs/workbench/services/extensionManagement/electron-sandbox/extensionManagementService"
49 import "vs/workbench/services/encryption/electron-sandbox/encryptionService"
50 import "vs/workbench/services/secrets/electron-sandbox/secretStorageService"
51 import "vs/workbench/services/localization/electron-sandbox/languagePackService"
52: import "vs/workbench/services/telemetry/electron-sandbox/telemetryService"
53 import "vs/workbench/services/extensions/electron-sandbox/extensionHostStarter"
54 import "vs/platform/extensionResourceLoader/common/extensionResourceLoaderService"
55 import "vs/workbench/services/localization/electron-sandbox/localeService"
56 import "vs/workbench/services/extensions/electron-sandbox/extensionsScannerService"
57 import "vs/workbench/services/extensionManagement/electron-sandbox/extensionManagementServerService"

65 import "vs/workbench/services/checksum/electron-sandbox/checksumService"
66 import "vs/platform/remote/electron-sandbox/sharedProcessTunnelService"
67 import "vs/workbench/services/tunnel/electron-sandbox/tunnelService"
68 import "vs/platform/diagnostics/electron-sandbox/diagnosticsService"
69 import "vs/platform/profiling/electron-sandbox/profilingService"
70: import "vs/platform/telemetry/electron-sandbox/customEndpointTelemetryService"
71 import "vs/platform/remoteTunnel/electron-sandbox/remoteTunnelService"
72 import "vs/workbench/services/files/electron-sandbox/elevatedFileService"
73 import "vs/workbench/services/search/electron-sandbox/searchService"
74 import "vs/workbench/services/workingCopy/electron-sandbox/workingCopyHistoryService"
75 import "vs/workbench/services/userDataSync/browser/userDataSyncEnablementService"
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\workbench.web.main.ts:

```sh
33 import "vs/workbench/services/extensions/browser/extensionService"
34 import "vs/workbench/services/extensionManagement/browser/extensionsProfileScannerService"
35 import "vs/workbench/services/extensions/browser/extensionsScannerService"
36 import "vs/workbench/services/extensionManagement/browser/webExtensionsScannerService"
37 import "vs/workbench/services/extensionManagement/common/extensionManagementServerService"
38: import "vs/workbench/services/telemetry/browser/telemetryService"
39 import "vs/workbench/services/url/browser/urlService"
40 import "vs/workbench/services/update/browser/updateService"
41 import "vs/workbench/services/workspaces/browser/workspacesService"
42 import "vs/workbench/services/workspaces/browser/workspaceEditingService"
43 import "vs/workbench/services/dialogs/browser/fileDialogService"

74 registerSingleton,
75 } from "vs/platform/instantiation/common/extensions"
76 import { WebLanguagePacksService } from "vs/platform/languagePacks/browser/languagePacks"
77 import { ILanguagePackService } from "vs/platform/languagePacks/common/languagePacks"
78 import { LogLevel } from "vs/platform/log/common/log"
79: import { ICustomEndpointTelemetryService } from "vs/platform/telemetry/common/telemetry"
80: import { NullEndpointTelemetryService } from "vs/platform/telemetry/common/telemetryUtils"
81 import { UserDataAutoSyncService } from "vs/platform/userDataSync/common/userDataAutoSyncService"
82 import {
83 IUserDataAutoSyncService,
84 IUserDataSyncLocalStoreService,
85 IUserDataSyncResourceProviderService,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\api\browser\mainThreadAuthentication.ts:

```sh
   13  	IDialogService,
   14  	IPromptButton,
   15  } from "vs/platform/dialogs/common/dialogs";
   16  import { INotificationService } from "vs/platform/notification/common/notification";
   17  import { IOpenerService } from "vs/platform/opener/common/opener";
   18: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   19  import { IAuthenticationAccessService } from "vs/workbench/services/authentication/browser/authenticationAccessService";
   20  import { getAuthenticationProviderActivationEvent } from "vs/workbench/services/authentication/browser/authenticationService";
   21  import { IAuthenticationUsageService } from "vs/workbench/services/authentication/browser/authenticationUsageService";
   22  import {
   23  	AuthenticationSession,

  123  		private readonly authenticationUsageService: IAuthenticationUsageService,
  124  		@IDialogService private readonly dialogService: IDialogService,
  125  		@INotificationService
  126  		private readonly notificationService: INotificationService,
  127  		@IExtensionService private readonly extensionService: IExtensionService,
  128: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
  129  		@IOpenerService private readonly openerService: IOpenerService,
  130  	) {
  131  		super();
  132  		this._proxy = extHostContext.getProxy(
  133  			ExtHostContext.ExtHostAuthentication,

  548  				classification: "SystemMetaData";
  549  				purpose: "FeatureInsight";
  550  				comment: "The provider id.";
  551  			};
  552  		};
  553: 		this.telemetryService.publicLog2<
  554  			{ extensionId: string; providerId: string },
  555  			AuthProviderUsageClassification
  556  		>("authentication.providerUsage", { providerId, extensionId });
  557  	}
  558  }
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\api\browser\mainThreadSearch.ts:

```sh
   11  } from "vs/base/common/lifecycle";
   12  import { revive } from "vs/base/common/marshalling";
   13  import { URI, UriComponents } from "vs/base/common/uri";
   14  import { IConfigurationService } from "vs/platform/configuration/common/configuration";
   15  import { IContextKeyService } from "vs/platform/contextkey/common/contextkey";
   16: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   17  import * as Constants from "vs/workbench/contrib/search/common/constants";
   18  import {
   19  	extHostNamedCustomer,
   20  	IExtHostContext,
   21  } from "vs/workbench/services/extensions/common/extHostCustomers";

   48
   49  	constructor(
   50  		extHostContext: IExtHostContext,
   51  		@ISearchService private readonly _searchService: ISearchService,
   52  		@ITelemetryService
   53: 		private readonly _telemetryService: ITelemetryService,
   54  		@IConfigurationService _configurationService: IConfigurationService,
   55  		@IContextKeyService protected contextKeyService: IContextKeyService,
   56  	) {
   57  		this._proxy = extHostContext.getProxy(ExtHostContext.ExtHostSearch);
   58  		this._proxy.$enableExtensionHostSearch();

  134  		}
  135
  136  		provider.handleFindMatch(session, data);
  137  	}
  138  	$handleTelemetry(eventName: string, data: any): void {
  139: 		this._telemetryService.publicLog(eventName, data);
  140  	}
  141  }
  142
  143  class SearchOperation {
  144  	private static _idPool = 0;
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\api\browser\mainThreadTelemetry.ts:

```sh
  10  import {
  11  	ClassifiedEvent,
  12  	IGDPRProperty,
  13  	OmitMetadata,
  14  	StrictPropertyCheck,
  15: } from "vs/platform/telemetry/common/gdprTypings";
  16  import {
  17  	ITelemetryService,
  18  	TELEMETRY_OLD_SETTING_ID,
  19  	TELEMETRY_SETTING_ID,
  20  	TelemetryLevel,
  21: } from "vs/platform/telemetry/common/telemetry";
  22: import { supportsTelemetry } from "vs/platform/telemetry/common/telemetryUtils";
  23  import {
  24  	extHostNamedCustomer,
  25  	IExtHostContext,
  26  } from "vs/workbench/services/extensions/common/extHostCustomers";
  27

  42  	private static readonly _name = "pluginHostTelemetry";
  43
  44  	constructor(
  45  		extHostContext: IExtHostContext,
  46  		@ITelemetryService
  47: 		private readonly _telemetryService: ITelemetryService,
  48  		@IConfigurationService
  49  		private readonly _configurationService: IConfigurationService,
  50  		@IEnvironmentService
  51  		private readonly _environmentService: IEnvironmentService,
  52  		@IProductService private readonly _productService: IProductService,

  61  					if (
  62  						e.affectsConfiguration(TELEMETRY_SETTING_ID) ||
  63  						e.affectsConfiguration(TELEMETRY_OLD_SETTING_ID)
  64  					) {
  65  						this._proxy.$onDidChangeTelemetryLevel(
  66: 							this.telemetryLevel,
  67  						);
  68  					}
  69  				}),
  70  			);
  71  		}
  72  		this._proxy.$initializeTelemetryLevel(
  73: 			this.telemetryLevel,
  74  			supportsTelemetry(this._productService, this._environmentService),
  75  			this._productService.enabledTelemetryLevels,
  76  		);
  77  	}
  78
  79: 	private get telemetryLevel(): TelemetryLevel {
  80  		if (
  81  			!supportsTelemetry(this._productService, this._environmentService)
  82  		) {
  83  			return TelemetryLevel.NONE;
  84  		}
  85
  86: 		return this._telemetryService.telemetryLevel;
  87  	}
  88
  89  	$publicLog(eventName: string, data: any = Object.create(null)): void {
  90  		// __GDPR__COMMON__ "pluginHostTelemetry" : { "classification": "SystemMetaData", "purpose": "FeatureInsight", "isMeasurement": true }
  91  		data[MainThreadTelemetry._name] = true;
  92: 		this._telemetryService.publicLog(eventName, data);
  93  	}
  94
  95  	$publicLog2<
  96  		E extends ClassifiedEvent<OmitMetadata<T>> = never,
  97  		T extends IGDPRProperty = never,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\api\browser\mainThreadWebviewPanels.ts:

```sh
    8  import { Disposable, DisposableMap } from "vs/base/common/lifecycle";
    9  import { URI } from "vs/base/common/uri";
   10  import { generateUuid } from "vs/base/common/uuid";
   11  import { IConfigurationService } from "vs/platform/configuration/common/configuration";
   12  import { IStorageService } from "vs/platform/storage/common/storage";
   13: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   14  import {
   15  	MainThreadWebviews,
   16  	reviveWebviewContentOptions,
   17  	reviveWebviewExtension,
   18  } from "vs/workbench/api/browser/mainThreadWebviews";

  122  		private readonly _editorGroupService: IEditorGroupsService,
  123  		@IEditorService private readonly _editorService: IEditorService,
  124  		@IExtensionService extensionService: IExtensionService,
  125  		@IStorageService storageService: IStorageService,
  126  		@ITelemetryService
  127: 		private readonly _telemetryService: ITelemetryService,
  128  		@IWebviewWorkbenchService
  129  		private readonly _webviewWorkbenchService: IWebviewWorkbenchService,
  130  	) {
  131  		super();
  132

  258  			};
  259  			owner: "mjbvz";
  260  			comment: "Triggered when a webview is created. Records the type of webview and the extension which created it";
  261  		};
  262
  263: 		this._telemetryService.publicLog2<typeof payload, Classification>(
  264  			"webviews:createWebviewPanel",
  265  			payload,
  266  		);
  267  	}
  268
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\api\browser\mainThreadWebviewViews.ts:

```sh
    5
    6  import { CancellationToken } from "vs/base/common/cancellation";
    7  import { onUnexpectedError } from "vs/base/common/errors";
    8  import { Disposable, DisposableMap } from "vs/base/common/lifecycle";
    9  import { generateUuid } from "vs/base/common/uuid";
   10: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   11  import {
   12  	MainThreadWebviews,
   13  	reviveWebviewExtension,
   14  } from "vs/workbench/api/browser/mainThreadWebviews";
   15  import * as extHostProtocol from "vs/workbench/api/common/extHost.protocol";

   35
   36  	constructor(
   37  		context: IExtHostContext,
   38  		private readonly mainThreadWebviews: MainThreadWebviews,
   39  		@ITelemetryService
   40: 		private readonly _telemetryService: ITelemetryService,
   41  		@IWebviewViewService
   42  		private readonly _webviewViewService: IWebviewViewService,
   43  	) {
   44  		super();
   45

  158  						comment: "Id of the view";
  159  					};
  160  					owner: "digitarald";
  161  					comment: "Helps to gain insights on what extension contributed views are most popular";
  162  				};
  163: 				this._telemetryService.publicLog2<
  164  					CreateWebviewViewTelemetry,
  165  					Classification
  166  				>("webviews:createWebviewView", {
  167  					extensionId: extension.id.value,
  168  					id: viewType,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\api\common\extHost.api.impl.ts:

```sh
   24  	ILoggerService,
   25  	ILogService,
   26  	LogLevel,
   27  } from "vs/platform/log/common/log";
   28  import { getRemoteName } from "vs/platform/remote/common/remoteHosts";
   29: import { TelemetryTrustedValue } from "vs/platform/telemetry/common/telemetryUtils";
   30  import { EditSessionIdentityMatch } from "vs/platform/workspace/common/editSessions";
   31  import {
   32  	CandidatePortSource,
   33  	ExtHostContext,
   34  	ExtHostLogLevelServiceShape,

  541  	return function (
  542  		extension: IExtensionDescription,
  543  		extensionInfo: IExtensionRegistries,
  544  		configProvider: ExtHostConfigProvider,
  545  	): typeof vscode {
  546: 		// Wraps an event with error handling and telemetry so that we know what extension fails
  547: 		// handling events. This will prevent us from reporting this as "our" error-telemetry and
  548  		// allows for better blaming
  549  		function _asExtensionEvent<T>(
  550  			actual: vscode.Event<T>,
  551  		): vscode.Event<T> {
  552  			return (listener, thisArgs, disposables) => {

  773  		};
  774
  775  		// namespace: env
  776  		const env: typeof vscode.env = {
  777  			get machineId() {
  778: 				return initData.telemetryInfo.machineId;
  779  			},
  780  			get sessionId() {
  781: 				return initData.telemetryInfo.sessionId;
  782  			},
  783  			get language() {
  784  				return initData.environment.appLanguage;
  785  			},
  786  			get appName() {

  812  			get onDidChangeTelemetryEnabled(): vscode.Event<boolean> {
  813  				return _asExtensionEvent(
  814  					extHostTelemetry.onDidChangeTelemetryEnabled,
  815  				);
  816  			},
  817: 			get telemetryConfiguration(): vscode.TelemetryConfiguration {
  818: 				checkProposedApiEnabled(extension, "telemetry");
  819  				return extHostTelemetry.getTelemetryDetails();
  820  			},
  821  			get onDidChangeTelemetryConfiguration(): vscode.Event<vscode.TelemetryConfiguration> {
  822: 				checkProposedApiEnabled(extension, "telemetry");
  823  				return _asExtensionEvent(
  824  					extHostTelemetry.onDidChangeTelemetryConfiguration,
  825  				);
  826  			},
  827  			get isNewAppInstall() {
  828: 				return isNewAppInstall(initData.telemetryInfo.firstSessionDate);
  829  			},
  830  			createTelemetryLogger(
  831  				sender: vscode.TelemetrySender,
  832  				options?: vscode.TelemetryLoggerOptions,
  833  			): vscode.TelemetryLogger {
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\api\common\extHost.protocol.ts:

```sh
68 import {
69 ClassifiedEvent,
70 IGDPRProperty,
71 OmitMetadata,
72 StrictPropertyCheck,
73: } from "vs/platform/telemetry/common/gdprTypings"
74: import { TelemetryLevel } from "vs/platform/telemetry/common/telemetry"
75 import {
76 ISerializableEnvironmentDescriptionMap,
77 ISerializableEnvironmentVariableCollection,
78 } from "vs/platform/terminal/common/environmentVariable"
79 import {
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\api\common\extHostApiDeprecationService.ts:

```sh
  28  	implements IExtHostApiDeprecationService
  29  {
  30  	declare readonly _serviceBrand: undefined;
  31
  32  	private readonly _reportedUsages = new Set<string>();
  33: 	private readonly _telemetryShape: extHostProtocol.MainThreadTelemetryShape;
  34
  35  	constructor(
  36  		@IExtHostRpcService rpc: IExtHostRpcService,
  37  		@ILogService private readonly _extHostLogService: ILogService,
  38  	) {
  39: 		this._telemetryShape = rpc.getProxy(
  40  			extHostProtocol.MainContext.MainThreadTelemetry,
  41  		);
  42  	}
  43
  44  	public report(

  74  				comment: "The id of the deprecated API";
  75  			};
  76  			owner: "mjbvz";
  77  			comment: "Helps us gain insights on extensions using deprecated API so we can assist in migration to new API";
  78  		};
  79: 		this._telemetryShape.$publicLog2<
  80  			DeprecationTelemetry,
  81  			DeprecationTelemetryMeta
  82  		>("extHostDeprecatedApiUsage", {
  83  			extensionId: extension.identifier.value,
  84  			apiId: apiId,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\api\common\extHostCommands.ts:

```sh
   24  	ExtensionIdentifier,
   25  	IExtensionDescription,
   26  } from "vs/platform/extensions/common/extensions";
   27  import { createDecorator } from "vs/platform/instantiation/common/instantiation";
   28  import { ILogService } from "vs/platform/log/common/log";
   29: import { TelemetryTrustedValue } from "vs/platform/telemetry/common/telemetryUtils";
   30  import { IExtHostRpcService } from "vs/workbench/api/common/extHostRpcService";
   31  import { IExtHostTelemetry } from "vs/workbench/api/common/extHostTelemetry";
   32  import { TestItemImpl } from "vs/workbench/api/common/extHostTestItem";
   33  import * as extHostTypeConverter from "vs/workbench/api/common/extHostTypeConverters";
   34  import * as extHostTypes from "vs/workbench/api/common/extHostTypes";

   63
   64  	#proxy: MainThreadCommandsShape;
   65
   66  	private readonly _commands = new Map<string, CommandHandler>();
   67  	private readonly _apiCommands = new Map<string, ApiCommand>();
   68: 	#telemetry: MainThreadTelemetryShape;
   69
   70  	private readonly _logService: ILogService;
   71  	readonly #extHostTelemetry: IExtHostTelemetry;
   72  	private readonly _argumentProcessors: ArgumentProcessor[];
   73

   79  		@IExtHostTelemetry extHostTelemetry: IExtHostTelemetry,
   80  	) {
   81  		this.#proxy = extHostRpc.getProxy(MainContext.MainThreadCommands);
   82  		this._logService = logService;
   83  		this.#extHostTelemetry = extHostTelemetry;
   84: 		this.#telemetry = extHostRpc.getProxy(MainContext.MainThreadTelemetry);
   85  		this.converter = new CommandsConverter(
   86  			this,
   87  			(id) => {
   88  				// API commands that have no return type (void) can be
   89  				// converted to their internal command and don't need

  370  				comment: "The duration of the command execution, to detect performance issues";
  371  			};
  372  			owner: "digitarald";
  373  			comment: "Used to gain insight on the most popular commands used from extensions";
  374  		};
  375: 		this.#telemetry.$publicLog2<
  376  			ExtensionActionTelemetry,
  377  			ExtensionActionTelemetryMeta
  378  		>("Extension:ActionExecuted", {
  379  			extensionId: command.extension.identifier.value,
  380  			id: new TelemetryTrustedValue(id),
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\api\common\extHostConsoleForwarder.ts:

```sh
  40  	 * native logging is turned on, the original console message will be written
  41  	 * as well. This is needed since the console methods are "magic" in V8 and
  42  	 * are the only methods that allow later introspection of logged variables.
  43  	 *
  44  	 * The wrapped property is not defined with `writable: false` to avoid
  45: 	 * throwing errors, but rather a no-op setting. See https://github.com/microsoft/vscode-extension-telemetry/issues/88
  46  	 */
  47  	private _wrapConsoleMethod(
  48  		method: "log" | "info" | "warn" | "error" | "debug",
  49  		severity: "log" | "warn" | "error" | "debug",
  50  	) {
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\api\common\extHostSCM.ts:

```sh
  1082
  1083  export class ExtHostSCM implements ExtHostSCMShape {
  1084  	private static _handlePool: number = 0;
  1085
  1086  	private _proxy: MainThreadSCMShape;
  1087: 	private readonly _telemetry: MainThreadTelemetryShape;
  1088  	private _sourceControls: Map<ProviderHandle, ExtHostSourceControl> =
  1089  		new Map<ProviderHandle, ExtHostSourceControl>();
  1090  	private _sourceControlsByExtension: ExtensionIdentifierMap<
  1091  		ExtHostSourceControl[]
  1092  	> = new ExtensionIdentifierMap<ExtHostSourceControl[]>();

  1104  		private _commands: ExtHostCommands,
  1105  		private _extHostDocuments: ExtHostDocuments,
  1106  		@ILogService private readonly logService: ILogService,
  1107  	) {
  1108  		this._proxy = mainContext.getProxy(MainContext.MainThreadSCM);
  1109: 		this._telemetry = mainContext.getProxy(MainContext.MainThreadTelemetry);
  1110
  1111  		_commands.registerArgumentProcessor({
  1112  			processArgument: (arg) => {
  1113  				if (arg && arg.$mid === MarshalledId.ScmResource) {
  1114  					const sourceControl = this._sourceControls.get(

  1175  				purpose: "FeatureInsight";
  1176  				comment: "The ID of the extension contributing to the Source Control API.";
  1177  			};
  1178  			comment: "This is used to know what extensions contribute to the Source Control API.";
  1179  		};
  1180: 		this._telemetry.$publicLog2<TEvent, TMeta>(
  1181  			"api/scm/createSourceControl",
  1182  			{
  1183  				extensionId: extension.identifier.value,
  1184  			},
  1185  		);
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\api\common\extHostTelemetry.ts:

```sh
   21  } from "vs/platform/log/common/log";
   22  import { getRemoteName } from "vs/platform/remote/common/remoteHosts";
   23  import {
   24  	ICommonProperties,
   25  	TelemetryLevel,
   26: } from "vs/platform/telemetry/common/telemetry";
   27  import {
   28  	cleanData,
   29  	cleanRemoteAuthority,
   30  	extensionTelemetryLogChannelId,
   31: } from "vs/platform/telemetry/common/telemetryUtils";
   32  import { ExtHostTelemetryShape } from "vs/workbench/api/common/extHost.protocol";
   33  import { IExtHostInitDataService } from "vs/workbench/api/common/extHostInitDataService";
   34  import { UIKind } from "vs/workbench/services/extensions/common/extensionHostProtocol";
   35  import type * as vscode from "vscode";
   36

   55  	private _productConfig: { usage: boolean; error: boolean } = {
   56  		usage: true,
   57  		error: true,
   58  	};
   59  	private _level: TelemetryLevel = TelemetryLevel.NONE;
   60: 	// This holds whether or not we're running with --disable-telemetry, etc. Usings supportsTelemtry() from the main thread
   61: 	private _telemetryIsSupported: boolean = false;
   62  	private _oldTelemetryEnablement: boolean | undefined;
   63  	private readonly _inLoggingOnlyMode: boolean = false;
   64  	private readonly extHostTelemetryLogFile: URI;
   65  	private readonly _outputLogger: ILogger;
   66: 	private readonly _telemetryLoggers = new Map<
   67  		string,
   68  		ExtHostTelemetryLogger[]
   69  	>();
   70
   71  	constructor(

   98  					this.updateLoggerVisibility();
   99  				}
  100  			}),
  101  		);
  102  		this._outputLogger.info(
  103: 			"Below are logs for extension telemetry events sent to the telemetry output channel API once the log level is set to trace.",
  104  		);
  105  		this._outputLogger.info(
  106  			"===========================================================",
  107  		);
  108  	}
  109
  110  	private updateLoggerVisibility(): void {
  111  		this.loggerService.setVisibility(
  112  			this.extHostTelemetryLogFile,
  113: 			this._telemetryIsSupported &&
  114  				this.loggerService.getLogLevel() === LogLevel.Trace,
  115  		);
  116  	}
  117
  118  	getTelemetryConfiguration(): boolean {

  134  	instantiateLogger(
  135  		extension: IExtensionDescription,
  136  		sender: vscode.TelemetrySender,
  137  		options?: vscode.TelemetryLoggerOptions,
  138  	) {
  139: 		const telemetryDetails = this.getTelemetryDetails();
  140  		const logger = new ExtHostTelemetryLogger(
  141  			sender,
  142  			options,
  143  			extension,
  144  			this._outputLogger,
  145  			this._inLoggingOnlyMode,
  146  			this.getBuiltInCommonProperties(extension),
  147  			{
  148: 				isUsageEnabled: telemetryDetails.isUsageEnabled,
  149: 				isErrorsEnabled: telemetryDetails.isErrorsEnabled,
  150  			},
  151  		);
  152  		const loggers =
  153: 			this._telemetryLoggers.get(extension.identifier.value) ?? [];
  154: 		this._telemetryLoggers.set(extension.identifier.value, [
  155  			...loggers,
  156  			logger,
  157  		]);
  158  		return logger.apiTelemetryLogger;
  159  	}

  162  		level: TelemetryLevel,
  163  		supportsTelemetry: boolean,
  164  		productConfig?: { usage: boolean; error: boolean },
  165  	): void {
  166  		this._level = level;
  167: 		this._telemetryIsSupported = supportsTelemetry;
  168  		this._productConfig = productConfig ?? { usage: true, error: true };
  169  		this.updateLoggerVisibility();
  170  	}
  171
  172  	getBuiltInCommonProperties(

  177  		// Or will first party extensions just mix this in
  178  		commonProperties["common.extname"] =
  179  			`${extension.publisher}.${extension.name}`;
  180  		commonProperties["common.extversion"] = extension.version;
  181  		commonProperties["common.vscodemachineid"] =
  182: 			this.initData.telemetryInfo.machineId;
  183  		commonProperties["common.vscodesessionid"] =
  184: 			this.initData.telemetryInfo.sessionId;
  185: 		commonProperties["common.sqmid"] = this.initData.telemetryInfo.sqmId;
  186  		commonProperties["common.devDeviceId"] =
  187: 			this.initData.telemetryInfo.devDeviceId;
  188  		commonProperties["common.vscodeversion"] = this.initData.version;
  189  		commonProperties["common.isnewappinstall"] = isNewAppInstall(
  190: 			this.initData.telemetryInfo.firstSessionDate,
  191  		);
  192  		commonProperties["common.product"] = this.initData.environment.appHost;
  193
  194  		switch (this.initData.uiKind) {
  195  			case UIKind.Web:

  210  	}
  211
  212  	$onDidChangeTelemetryLevel(level: TelemetryLevel): void {
  213  		this._oldTelemetryEnablement = this.getTelemetryConfiguration();
  214  		this._level = level;
  215: 		const telemetryDetails = this.getTelemetryDetails();
  216  		// Remove all disposed loggers
  217: 		this._telemetryLoggers.forEach((loggers, key) => {
  218  			const newLoggers = loggers.filter((l) => !l.isDisposed);
  219  			if (newLoggers.length === 0) {
  220: 				this._telemetryLoggers.delete(key);
  221  			} else {
  222: 				this._telemetryLoggers.set(key, newLoggers);
  223  			}
  224  		});
  225  		// Loop through all loggers and update their level
  226: 		this._telemetryLoggers.forEach((loggers) => {
  227  			for (const logger of loggers) {
  228  				logger.updateTelemetryEnablements(
  229: 					telemetryDetails.isUsageEnabled,
  230: 					telemetryDetails.isErrorsEnabled,
  231  				);
  232  			}
  233  		});
  234
  235  		if (this._oldTelemetryEnablement !== this.getTelemetryConfiguration()) {

  242  		);
  243  		this.updateLoggerVisibility();
  244  	}
  245
  246  	onExtensionError(extension: ExtensionIdentifier, error: Error): boolean {
  247: 		const loggers = this._telemetryLoggers.get(extension.value);
  248  		const nonDisposedLoggers = loggers?.filter((l) => !l.isDisposed);
  249  		if (!nonDisposedLoggers) {
  250: 			this._telemetryLoggers.delete(extension.value);
  251  			return false;
  252  		}
  253  		let errorEmitted = false;
  254  		for (const logger of nonDisposedLoggers) {
  255  			if (logger.ignoreUnhandledExtHostErrors) {

  293  	private readonly _additionalCommonProperties:
  294  		| Record<string, any>
  295  		| undefined;
  296  	public readonly ignoreUnhandledExtHostErrors: boolean;
  297
  298: 	private _telemetryEnablements: {
  299  		isUsageEnabled: boolean;
  300  		isErrorsEnabled: boolean;
  301  	};
  302  	private _apiObject: vscode.TelemetryLogger | undefined;
  303  	private _sender: vscode.TelemetrySender | undefined;

  307  		options: vscode.TelemetryLoggerOptions | undefined,
  308  		private readonly _extension: IExtensionDescription,
  309  		private readonly _logger: ILogger,
  310  		private readonly _inLoggingOnlyMode: boolean,
  311  		private readonly _commonProperties: Record<string, any>,
  312: 		telemetryEnablements: {
  313  			isUsageEnabled: boolean;
  314  			isErrorsEnabled: boolean;
  315  		},
  316  	) {
  317  		this.ignoreUnhandledExtHostErrors =
  318  			options?.ignoreUnhandledErrors ?? false;
  319  		this._ignoreBuiltinCommonProperties =
  320  			options?.ignoreBuiltInCommonProperties ?? false;
  321  		this._additionalCommonProperties = options?.additionalCommonProperties;
  322  		this._sender = sender;
  323: 		this._telemetryEnablements = {
  324: 			isUsageEnabled: telemetryEnablements.isUsageEnabled,
  325: 			isErrorsEnabled: telemetryEnablements.isErrorsEnabled,
  326  		};
  327  	}
  328
  329  	updateTelemetryEnablements(
  330  		isUsageEnabled: boolean,
  331  		isErrorsEnabled: boolean,
  332  	): void {
  333  		if (this._apiObject) {
  334: 			this._telemetryEnablements = { isUsageEnabled, isErrorsEnabled };
  335  			this._onDidChangeEnableStates.fire(this._apiObject);
  336  		}
  337  	}
  338
  339  	mixInCommonPropsAndCleanData(
  340  		data: Record<string, any>,
  341  	): Record<string, any> {
  342: 		// Some telemetry modules prefer to break properties and measurmements up
  343  		// We mix common properties into the properties tab.
  344  		let updatedData = "properties" in data ? (data.properties ?? {}) : data;
  345
  346  		// We don't clean measurements since they are just numbers
  347  		updatedData = cleanData(updatedData, []);

  380  		}
  381  		this._logger.trace(eventName, data);
  382  	}
  383
  384  	logUsage(eventName: string, data?: Record<string, any>): void {
  385: 		if (!this._telemetryEnablements.isUsageEnabled) {
  386  			return;
  387  		}
  388  		this.logEvent(eventName, data);
  389  	}
  390
  391  	logError(
  392  		eventNameOrException: Error | string,
  393  		data?: Record<string, any>,
  394  	): void {
  395: 		if (!this._telemetryEnablements.isErrorsEnabled || !this._sender) {
  396  			return;
  397  		}
  398  		if (typeof eventNameOrException === "string") {
  399  			this.logEvent(eventNameOrException, data);
  400  		} else {

  423  		if (!this._apiObject) {
  424  			const that = this;
  425  			const obj: vscode.TelemetryLogger = {
  426  				logUsage: that.logUsage.bind(that),
  427  				get isUsageEnabled() {
  428: 					return that._telemetryEnablements.isUsageEnabled;
  429  				},
  430  				get isErrorsEnabled() {
  431: 					return that._telemetryEnablements.isErrorsEnabled;
  432  				},
  433  				logError: that.logError.bind(that),
  434  				dispose: that.dispose.bind(that),
  435  				onDidChangeEnableStates:
  436  					that._onDidChangeEnableStates.event.bind(that),
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\api\node\proxyResolver.ts:

```sh
  393  type ProxyAuthenticationEvent = {
  394  	authenticationType: string;
  395  	extensionHostType: string;
  396  };
  397
  398: let telemetrySent = false;
  399
  400  function sendTelemetry(
  401  	mainThreadTelemetry: MainThreadTelemetryShape,
  402  	authenticate: string[],
  403  	isRemote: boolean,
  404  ) {
  405: 	if (telemetrySent || !authenticate.length) {
  406  		return;
  407  	}
  408: 	telemetrySent = true;
  409
  410  	mainThreadTelemetry.$publicLog2<
  411  		ProxyAuthenticationEvent,
  412  		ProxyAuthenticationClassification
  413  	>("proxyAuthenticationRequest", {
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\browser\composite.ts:

```sh
   15  import {
   16  	IConstructorSignature,
   17  	IInstantiationService,
   18  } from "vs/platform/instantiation/common/instantiation";
   19  import { IStorageService } from "vs/platform/storage/common/storage";
   20: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   21  import { IThemeService } from "vs/platform/theme/common/themeService";
   22  import { Component } from "vs/workbench/common/component";
   23  import { IComposite, ICompositeControl } from "vs/workbench/common/composite";
   24
   25  /**

   98  	private visible = false;
   99  	private parent: HTMLElement | undefined;
  100
  101  	constructor(
  102  		id: string,
  103: 		protected readonly telemetryService: ITelemetryService,
  104  		themeService: IThemeService,
  105  		storageService: IStorageService,
  106  	) {
  107  		super(id, themeService, storageService);
  108  	}
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\browser\layout.ts:

```sh
    73  import {
    74  	IStorageService,
    75  	StorageScope,
    76  	StorageTarget,
    77  } from "vs/platform/storage/common/storage";
    78: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
    79  import { IThemeService } from "vs/platform/theme/common/themeService";
    80  import {
    81  	CustomTitleBarVisibility,
    82  	getMenuBarVisibility,
    83  	hasCustomTitlebar,

   425  	private workingCopyBackupService!: IWorkingCopyBackupService;
   426  	private notificationService!: INotificationService;
   427  	private themeService!: IThemeService;
   428  	private statusBarService!: IStatusbarService;
   429  	private logService!: ILogService;
   430: 	private telemetryService!: ITelemetryService;
   431  	private auxiliaryWindowService!: IAuxiliaryWindowService;
   432
   433  	private state!: ILayoutState;
   434  	private stateModel!: LayoutStateModel;
   435

   450  		this.storageService = accessor.get(IStorageService);
   451  		this.workingCopyBackupService = accessor.get(IWorkingCopyBackupService);
   452  		this.themeService = accessor.get(IThemeService);
   453  		this.extensionService = accessor.get(IExtensionService);
   454  		this.logService = accessor.get(ILogService);
   455: 		this.telemetryService = accessor.get(ITelemetryService);
   456  		this.auxiliaryWindowService = accessor.get(IAuxiliaryWindowService);
   457
   458  		// Parts
   459  		this.editorService = accessor.get(IEditorService);
   460  		this.mainPartEditorService = this.editorService.createScoped(

  3810  			panelPosition: positionToString(
  3811  				this.stateModel.getRuntimeValue(LayoutStateKeys.PANEL_POSITION),
  3812  			),
  3813  		};
  3814
  3815: 		this.telemetryService.publicLog2<
  3816  			StartupLayoutEvent,
  3817  			StartupLayoutEventClassification
  3818  		>("startupLayout", layoutDescriptor);
  3819
  3820  		return result;
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\browser\panecomposite.ts:

```sh
  16  	IConstructorSignature,
  17  	IInstantiationService,
  18  } from "vs/platform/instantiation/common/instantiation";
  19  import { Registry } from "vs/platform/registry/common/platform";
  20  import { IStorageService } from "vs/platform/storage/common/storage";
  21: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
  22  import { IThemeService } from "vs/platform/theme/common/themeService";
  23  import { IWorkspaceContextService } from "vs/platform/workspace/common/workspace";
  24  import {
  25  	Composite,
  26  	CompositeDescriptor,

  41  {
  42  	private viewPaneContainer?: ViewPaneContainer;
  43
  44  	constructor(
  45  		id: string,
  46: 		@ITelemetryService telemetryService: ITelemetryService,
  47  		@IStorageService protected storageService: IStorageService,
  48  		@IInstantiationService
  49  		protected instantiationService: IInstantiationService,
  50  		@IThemeService themeService: IThemeService,
  51  		@IContextMenuService protected contextMenuService: IContextMenuService,
  52  		@IExtensionService protected extensionService: IExtensionService,
  53  		@IWorkspaceContextService
  54  		protected contextService: IWorkspaceContextService,
  55  	) {
  56: 		super(id, telemetryService, themeService, storageService);
  57  	}
  58
  59  	override create(parent: HTMLElement): void {
  60  		super.create(parent);
  61  		this.viewPaneContainer = this._register(
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\browser\web.api.ts:

```sh
289 * Support for URL callbacks.
290 */
291 readonly urlCallbackProvider?: IURLCallbackProvider
292
293 /**
294: * Support adding additional properties to telemetry.
295 */
296 readonly resolveCommonTelemetryProperties?: ICommonTelemetryPropertiesResolver
297
298 /**
299 * A set of optional commands that should be registered with the commands
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\browser\web.main.ts:

```sh
   86  import { IRequestService } from "vs/platform/request/common/request";
   87  import { ISecretStorageService } from "vs/platform/secrets/common/secrets";
   88  import { SignService } from "vs/platform/sign/browser/signService";
   89  import { ISignService } from "vs/platform/sign/common/sign";
   90  import { IStorageService } from "vs/platform/storage/common/storage";
   91: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   92  import {
   93  	DisposableTunnel,
   94  	TunnelProtocol,
   95  } from "vs/platform/tunnel/common/tunnel";
   96  import { IUriIdentityService } from "vs/platform/uriIdentity/common/uriIdentity";

  218  			"workbench#open with configuration",
  219  			safeStringify(this.configuration),
  220  		);
  221
  222  		instantiationService.invokeFunction((accessor) => {
  223: 			const telemetryService = accessor.get(ITelemetryService);
  224  			for (const indexedDbFileSystemProvider of this
  225  				.indexedDBFileSystemProviders) {
  226  				this._register(
  227  					indexedDbFileSystemProvider.onReportError((e) =>
  228: 						telemetryService.publicLog2<
  229  							IndexedDBFileSystemProviderErrorData,
  230  							IndexedDBFileSystemProviderErrorDataClassification
  231  						>("indexedDBFileSystemProviderError", e),
  232  					),
  233  				);
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\browser\actions\helpActions.ts:

```sh
   16  import { ServicesAccessor } from "vs/platform/instantiation/common/instantiation";
   17  import { KeybindingWeight } from "vs/platform/keybinding/common/keybindingsRegistry";
   18  import { IOpenerService } from "vs/platform/opener/common/opener";
   19  import product from "vs/platform/product/common/product";
   20  import { IProductService } from "vs/platform/product/common/productService";
   21: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   22
   23  class KeybindingsReferenceAction extends Action2 {
   24  	static readonly ID = "workbench.action.keybindingsReference";
   25  	static readonly AVAILABLE = !!(isLinux
   26  		? product.keyboardShortcutsUrlLinux

  210  	}
  211
  212  	run(accessor: ServicesAccessor) {
  213  		const productService = accessor.get(IProductService);
  214  		const openerService = accessor.get(IOpenerService);
  215: 		const telemetryService = accessor.get(ITelemetryService);
  216  		openerService.open(
  217  			URI.parse(
  218: 				`${productService.newsletterSignupUrl}?machineId=${encodeURIComponent(telemetryService.machineId)}`,
  219  			),
  220  		);
  221  	}
  222  }
  223
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\browser\actions\workspaceActions.ts:

```sh
   17  import { ContextKeyExpr } from "vs/platform/contextkey/common/contextkey";
   18  import { IsMacNativeContext } from "vs/platform/contextkey/common/contextkeys";
   19  import { IFileDialogService } from "vs/platform/dialogs/common/dialogs";
   20  import { ServicesAccessor } from "vs/platform/instantiation/common/instantiation";
   21  import { KeybindingWeight } from "vs/platform/keybinding/common/keybindingsRegistry";
   22: import { ITelemetryData } from "vs/platform/telemetry/common/telemetry";
   23  import {
   24  	hasWorkspaceFileExtension,
   25  	IWorkspaceContextService,
   26  	IWorkspaceFolder,
   27  	WorkbenchState,

   73  	): Promise<void> {
   74  		const fileDialogService = accessor.get(IFileDialogService);
   75
   76  		return fileDialogService.pickFileAndOpen({
   77  			forceNewWindow: false,
   78: 			telemetryExtraData: data,
   79  		});
   80  	}
   81  }
   82
   83  export class OpenFolderAction extends Action2 {

  115  	): Promise<void> {
  116  		const fileDialogService = accessor.get(IFileDialogService);
  117
  118  		return fileDialogService.pickFolderAndOpen({
  119  			forceNewWindow: false,
  120: 			telemetryExtraData: data,
  121  		});
  122  	}
  123  }
  124
  125  export class OpenFolderViaWorkspaceAction extends Action2 {

  184  	): Promise<void> {
  185  		const fileDialogService = accessor.get(IFileDialogService);
  186
  187  		return fileDialogService.pickFileFolderAndOpen({
  188  			forceNewWindow: false,
  189: 			telemetryExtraData: data,
  190  		});
  191  	}
  192  }
  193
  194  class OpenWorkspaceAction extends Action2 {

  212  		data?: ITelemetryData,
  213  	): Promise<void> {
  214  		const fileDialogService = accessor.get(IFileDialogService);
  215
  216  		return fileDialogService.pickWorkspaceAndOpen({
  217: 			telemetryExtraData: data,
  218  		});
  219  	}
  220  }
  221
  222  class CloseWorkspaceAction extends Action2 {
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\browser\parts\compositePart.ts:

```sh
  534  						this.getTitleAreaDropDownAnchorAlignment(),
  535  					toggleMenuTitle: localize(
  536  						"viewsAndMoreActions",
  537  						"Views and More Actions...",
  538  					),
  539: 					telemetrySource: this.nameForTelemetry,
  540  					hoverDelegate: this.toolbarHoverDelegate,
  541  				},
  542  			),
  543  		);
  544
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\browser\parts\paneCompositeBar.ts:

```sh
    34  	IProfileStorageValueChangeEvent,
    35  	IStorageService,
    36  	StorageScope,
    37  	StorageTarget,
    38  } from "vs/platform/storage/common/storage";
    39: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
    40  import { IColorTheme } from "vs/platform/theme/common/themeService";
    41  import { Before2D, ICompositeDragAndDrop } from "vs/workbench/browser/dnd";
    42  import {
    43  	CompositeBar,
    44  	CompositeDragAndDrop,

  1174  		compositeBarActionItem: ICompositeBarActionItem,
  1175  		private readonly part: Parts,
  1176  		private readonly paneCompositePart: IPaneCompositePart,
  1177  		@IWorkbenchLayoutService
  1178  		private readonly layoutService: IWorkbenchLayoutService,
  1179: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
  1180  		@IConfigurationService
  1181  		private readonly configurationService: IConfigurationService,
  1182  		@IActivityService private readonly activityService: IActivityService,
  1183  	) {
  1184  		super(compositeBarActionItem);

  1291  				classification: "SystemMetaData";
  1292  				purpose: "FeatureInsight";
  1293  				comment: 'The action that was performed. e.g. "hide", "show", or "refocus"';
  1294  			};
  1295  		};
  1296: 		this.telemetryService.publicLog2<
  1297  			{ viewletId: String; action: String },
  1298  			ActivityBarActionClassification
  1299  		>("activityBarAction", {
  1300  			viewletId: this.compositeBarActionItem.id,
  1301  			action,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\browser\parts\editor\binaryDiffEditor.ts:

```sh
   6  import { ITextResourceConfigurationService } from "vs/editor/common/services/textResourceConfiguration";
   7  import { localize } from "vs/nls";
   8  import { IConfigurationService } from "vs/platform/configuration/common/configuration";
   9  import { IInstantiationService } from "vs/platform/instantiation/common/instantiation";
  10  import { IStorageService } from "vs/platform/storage/common/storage";
  11: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
  12  import { IThemeService } from "vs/platform/theme/common/themeService";
  13  import { BaseBinaryResourceEditor } from "vs/workbench/browser/parts/editor/binaryEditor";
  14  import { SideBySideEditor } from "vs/workbench/browser/parts/editor/sideBySideEditor";
  15  import { BINARY_DIFF_EDITOR_ID } from "vs/workbench/common/editor";
  16  import {

  25  export class BinaryResourceDiffEditor extends SideBySideEditor {
  26  	static override readonly ID = BINARY_DIFF_EDITOR_ID;
  27
  28  	constructor(
  29  		group: IEditorGroup,
  30: 		@ITelemetryService telemetryService: ITelemetryService,
  31  		@IInstantiationService instantiationService: IInstantiationService,
  32  		@IThemeService themeService: IThemeService,
  33  		@IStorageService storageService: IStorageService,
  34  		@IConfigurationService configurationService: IConfigurationService,
  35  		@ITextResourceConfigurationService

  37  		@IEditorService editorService: IEditorService,
  38  		@IEditorGroupsService editorGroupService: IEditorGroupsService,
  39  	) {
  40  		super(
  41  			group,
  42: 			telemetryService,
  43  			instantiationService,
  44  			themeService,
  45  			storageService,
  46  			configurationService,
  47  			textResourceConfigurationService,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\browser\parts\editor\binaryEditor.ts:

```sh
   6  import { Emitter } from "vs/base/common/event";
   7  import { localize } from "vs/nls";
   8  import { IEditorOptions } from "vs/platform/editor/common/editor";
   9  import { ByteSize } from "vs/platform/files/common/files";
  10  import { IStorageService } from "vs/platform/storage/common/storage";
  11: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
  12  import { IThemeService } from "vs/platform/theme/common/themeService";
  13  import {
  14  	EditorPlaceholder,
  15  	IEditorPlaceholderContents,
  16  } from "vs/workbench/browser/parts/editor/editorPlaceholder";

  39
  40  	constructor(
  41  		id: string,
  42  		group: IEditorGroup,
  43  		private readonly callbacks: IOpenCallbacks,
  44: 		telemetryService: ITelemetryService,
  45  		themeService: IThemeService,
  46  		@IStorageService storageService: IStorageService,
  47  	) {
  48: 		super(id, group, telemetryService, themeService, storageService);
  49  	}
  50
  51  	override getTitle(): string {
  52  		return this.input
  53  			? this.input.getName()
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\browser\parts\editor\editorCommands.ts:

```sh
    41  	KeybindingWeight,
    42  } from "vs/platform/keybinding/common/keybindingsRegistry";
    43  import { IListService, IOpenEvent } from "vs/platform/list/browser/listService";
    44  import { IOpenerService } from "vs/platform/opener/common/opener";
    45  import { IQuickInputService } from "vs/platform/quickinput/common/quickInput";
    46: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
    47  import {
    48  	IResolvedEditorCommandsContext,
    49  	resolveCommandsContext,
    50  } from "vs/workbench/browser/parts/editor/editorCommandsContext";
    51  import { ActiveGroupEditorsByMostRecentlyUsedQuickAccess } from "vs/workbench/browser/parts/editor/editorQuickAccess";

  1310  		when: undefined,
  1311  		primary: undefined,
  1312  		handler: async (accessor, ...args: unknown[]) => {
  1313  			const editorService = accessor.get(IEditorService);
  1314  			const editorResolverService = accessor.get(IEditorResolverService);
  1315: 			const telemetryService = accessor.get(ITelemetryService);
  1316
  1317  			const resolvedContext = resolveCommandsContext(
  1318  				args,
  1319  				editorService,
  1320  				accessor.get(IEditorGroupsService),

  1394  						ext: string;
  1395  						from: string;
  1396  						to: string;
  1397  					};
  1398
  1399: 					telemetryService.publicLog2<
  1400  						WorkbenchEditorReopenEvent,
  1401  						WorkbenchEditorReopenClassification
  1402  					>("workbenchEditorReopen", {
  1403  						scheme: editor.resource?.scheme ?? "",
  1404  						ext: editor.resource ? extname(editor.resource) : "",
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\browser\parts\editor\editorGroupView.ts:

```sh
    68  import { IInstantiationService } from "vs/platform/instantiation/common/instantiation";
    69  import { ServiceCollection } from "vs/platform/instantiation/common/serviceCollection";
    70  import { IKeybindingService } from "vs/platform/keybinding/common/keybinding";
    71  import { ILogService } from "vs/platform/log/common/log";
    72  import { IEditorProgressService } from "vs/platform/progress/common/progress";
    73: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
    74: import { TelemetryTrustedValue } from "vs/platform/telemetry/common/telemetryUtils";
    75  import { defaultProgressBarStyles } from "vs/platform/theme/browser/defaultStyles";
    76  import {
    77  	contrastBorder,
    78  	editorBackground,
    79  } from "vs/platform/theme/common/colorRegistry";

   339  		@IInstantiationService
   340  		private readonly instantiationService: IInstantiationService,
   341  		@IContextKeyService
   342  		private readonly contextKeyService: IContextKeyService,
   343  		@IThemeService themeService: IThemeService,
   344: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
   345  		@IKeybindingService
   346  		private readonly keybindingService: IKeybindingService,
   347  		@IMenuService private readonly menuService: IMenuService,
   348  		@IContextMenuService
   349  		private readonly contextMenuService: IContextMenuService,

  1167  				"${include}": [
  1168  					"${EditorTelemetryDescriptor}"
  1169  				]
  1170  			}
  1171  		*/
  1172: 		this.telemetryService.publicLog(
  1173  			"editorOpened",
  1174  			this.toEditorTelemetryDescriptor(editor),
  1175  		);
  1176
  1177  		// Update container

  1217  				"${include}": [
  1218  					"${EditorTelemetryDescriptor}"
  1219  				]
  1220  			}
  1221  		*/
  1222: 		this.telemetryService.publicLog(
  1223  			"editorClosed",
  1224  			this.toEditorTelemetryDescriptor(editor),
  1225  		);
  1226
  1227  		// Update container
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\browser\parts\editor\editorPane.ts:

```sh
   22  import {
   23  	IStorageService,
   24  	StorageScope,
   25  	StorageTarget,
   26  } from "vs/platform/storage/common/storage";
   27: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   28  import { IThemeService } from "vs/platform/theme/common/themeService";
   29  import { Composite } from "vs/workbench/browser/composite";
   30  import {
   31  	DEFAULT_EDITOR_MAX_DIMENSIONS,
   32  	DEFAULT_EDITOR_MIN_DIMENSIONS,

  118  	}
  119
  120  	constructor(
  121  		id: string,
  122  		readonly group: IEditorGroup,
  123: 		telemetryService: ITelemetryService,
  124  		themeService: IThemeService,
  125  		storageService: IStorageService,
  126  	) {
  127: 		super(id, telemetryService, themeService, storageService);
  128  	}
  129
  130  	override create(parent: HTMLElement): void {
  131  		super.create(parent);
  132
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\browser\parts\editor\editorPlaceholder.ts:

```sh
   38  	FileOperationError,
   39  	FileOperationResult,
   40  	IFileService,
   41  } from "vs/platform/files/common/files";
   42  import { IStorageService } from "vs/platform/storage/common/storage";
   43: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   44  import { defaultButtonStyles } from "vs/platform/theme/browser/defaultStyles";
   45  import { IThemeService } from "vs/platform/theme/common/themeService";
   46  import {
   47  	isSingleFolderWorkspaceIdentifier,
   48  	IWorkspaceContextService,

   83  	private readonly inputDisposable = this._register(new MutableDisposable());
   84
   85  	constructor(
   86  		id: string,
   87  		group: IEditorGroup,
   88: 		@ITelemetryService telemetryService: ITelemetryService,
   89  		@IThemeService themeService: IThemeService,
   90  		@IStorageService storageService: IStorageService,
   91  	) {
   92: 		super(id, group, telemetryService, themeService, storageService);
   93  	}
   94
   95  	protected createEditor(parent: HTMLElement): void {
   96  		// Container
   97  		this.container = document.createElement("div");

  263  		this.LABEL,
  264  	);
  265
  266  	constructor(
  267  		group: IEditorGroup,
  268: 		@ITelemetryService telemetryService: ITelemetryService,
  269  		@IThemeService themeService: IThemeService,
  270  		@ICommandService private readonly commandService: ICommandService,
  271  		@IWorkspaceContextService
  272  		private readonly workspaceService: IWorkspaceContextService,
  273  		@IStorageService storageService: IStorageService,
  274  	) {
  275  		super(
  276  			WorkspaceTrustRequiredPlaceholderEditor.ID,
  277  			group,
  278: 			telemetryService,
  279  			themeService,
  280  			storageService,
  281  		);
  282  	}
  283

  322  		this.LABEL,
  323  	);
  324
  325  	constructor(
  326  		group: IEditorGroup,
  327: 		@ITelemetryService telemetryService: ITelemetryService,
  328  		@IThemeService themeService: IThemeService,
  329  		@IStorageService storageService: IStorageService,
  330  		@IFileService private readonly fileService: IFileService,
  331  		@IDialogService private readonly dialogService: IDialogService,
  332  	) {
  333  		super(
  334  			ErrorPlaceholderEditor.ID,
  335  			group,
  336: 			telemetryService,
  337  			themeService,
  338  			storageService,
  339  		);
  340  	}
  341
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\browser\parts\editor\editorStatus.ts:

```sh
    78  import {
    79  	IQuickInputService,
    80  	IQuickPickItem,
    81  	QuickPickInput,
    82  } from "vs/platform/quickinput/common/quickInput";
    83: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
    84  import { BinaryResourceDiffEditor } from "vs/workbench/browser/parts/editor/binaryDiffEditor";
    85  import { BaseBinaryResourceEditor } from "vs/workbench/browser/parts/editor/binaryEditor";
    86  import { IWorkbenchContribution } from "vs/workbench/common/contributions";
    87  import {
    88  	EditorResourceAccessor,

  1591  		);
  1592  		const textFileService = accessor.get(ITextFileService);
  1593  		const preferencesService = accessor.get(IPreferencesService);
  1594  		const instantiationService = accessor.get(IInstantiationService);
  1595  		const configurationService = accessor.get(IConfigurationService);
  1596: 		const telemetryService = accessor.get(ITelemetryService);
  1597
  1598  		const activeTextEditorControl = getCodeEditor(
  1599  			editorService.activeTextEditorControl,
  1600  		);
  1601  		if (!activeTextEditorControl) {

  1803  								if (
  1804  									detectedLanguageId === currentLanguageId &&
  1805  									currentLanguageId !== chosenLanguageId
  1806  								) {
  1807  									// If they didn't choose the detected language (which should also be the active language if automatic detection is enabled)
  1808: 									// then the automatic language detection was likely wrong and the user is correcting it. In this case, we want telemetry.
  1809  									// Keep track of what model was preferred and length of input to help track down potential differences between the result quality across models and content size.
  1810  									const modelPreference =
  1811  										configurationService.getValue<boolean>(
  1812  											"workbench.editor.preferHistoryBasedLanguageDetection",
  1813  										)
  1814  											? "history"
  1815  											: "classic";
  1816: 									telemetryService.publicLog2<
  1817  										IAutomaticLanguageDetectionLikelyWrongData,
  1818  										AutomaticLanguageDetectionLikelyWrongClassification
  1819  									>(AutomaticLanguageDetectionLikelyWrongId, {
  1820  										currentLanguageId:
  1821  											currentLanguageName ?? "unknown",

  1868  							configurationService.getValue<boolean>(
  1869  								"workbench.editor.preferHistoryBasedLanguageDetection",
  1870  							)
  1871  								? "history"
  1872  								: "classic";
  1873: 						telemetryService.publicLog2<
  1874  							SetUntitledDocumentLanguageEvent,
  1875  							SetUntitledDocumentLanguageClassification
  1876  						>("setUntitledDocumentLanguage", {
  1877  							to: languageSelection.languageId,
  1878  							from: currentLanguageId ?? "none",
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\browser\parts\editor\editorTabsControl.ts:

```sh
  336  						new EditorCommandsContextActionRunner(context),
  337  					),
  338  					anchorAlignmentProvider: () => AnchorAlignment.RIGHT,
  339  					renderDropdownAsChildElement:
  340  						this.renderDropdownAsChildElement,
  341: 					telemetrySource: "editorPart",
  342  					resetMenu: MenuId.EditorTitle,
  343  					overflowBehavior: {
  344  						maxItems: 9,
  345  						exempted: EDITOR_CORE_NAVIGATION_COMMANDS,
  346  					},
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\browser\parts\editor\editorWithViewState.ts:

```sh
   8  import { IExtUri } from "vs/base/common/resources";
   9  import { URI } from "vs/base/common/uri";
  10  import { ITextResourceConfigurationService } from "vs/editor/common/services/textResourceConfiguration";
  11  import { IInstantiationService } from "vs/platform/instantiation/common/instantiation";
  12  import { IStorageService } from "vs/platform/storage/common/storage";
  13: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
  14  import { IThemeService } from "vs/platform/theme/common/themeService";
  15  import { EditorPane } from "vs/workbench/browser/parts/editor/editorPane";
  16  import {
  17  	EditorResourceAccessor,
  18  	IEditorCloseEvent,

  43
  44  	constructor(
  45  		id: string,
  46  		group: IEditorGroup,
  47  		viewStateStorageKey: string,
  48: 		@ITelemetryService telemetryService: ITelemetryService,
  49  		@IInstantiationService
  50  		protected readonly instantiationService: IInstantiationService,
  51  		@IStorageService storageService: IStorageService,
  52  		@ITextResourceConfigurationService
  53  		protected readonly textResourceConfigurationService: ITextResourceConfigurationService,
  54  		@IThemeService themeService: IThemeService,
  55  		@IEditorService protected readonly editorService: IEditorService,
  56  		@IEditorGroupsService
  57  		protected readonly editorGroupService: IEditorGroupsService,
  58  	) {
  59: 		super(id, group, telemetryService, themeService, storageService);
  60
  61  		this.viewState = this.getEditorMemento<T>(
  62  			editorGroupService,
  63  			textResourceConfigurationService,
  64  			viewStateStorageKey,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\browser\parts\editor\sideBySideEditor.ts:

```sh
   31  } from "vs/platform/configuration/common/configuration";
   32  import { IEditorOptions } from "vs/platform/editor/common/editor";
   33  import { IInstantiationService } from "vs/platform/instantiation/common/instantiation";
   34  import { Registry } from "vs/platform/registry/common/platform";
   35  import { IStorageService } from "vs/platform/storage/common/storage";
   36: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   37  import { IThemeService } from "vs/platform/theme/common/themeService";
   38  import { IEditorPaneRegistry } from "vs/workbench/browser/editor";
   39  import { DEFAULT_EDITOR_MIN_DIMENSIONS } from "vs/workbench/browser/parts/editor/editor";
   40  import { EditorPane } from "vs/workbench/browser/parts/editor/editorPane";
   41  import { AbstractEditorWithViewState } from "vs/workbench/browser/parts/editor/editorWithViewState";

  222  	private lastFocusedSide: Side.PRIMARY | Side.SECONDARY | undefined =
  223  		undefined;
  224
  225  	constructor(
  226  		group: IEditorGroup,
  227: 		@ITelemetryService telemetryService: ITelemetryService,
  228  		@IInstantiationService instantiationService: IInstantiationService,
  229  		@IThemeService themeService: IThemeService,
  230  		@IStorageService storageService: IStorageService,
  231  		@IConfigurationService
  232  		private readonly configurationService: IConfigurationService,

  237  	) {
  238  		super(
  239  			SideBySideEditor.ID,
  240  			group,
  241  			SideBySideEditor.VIEW_STATE_PREFERENCE_KEY,
  242: 			telemetryService,
  243  			instantiationService,
  244  			storageService,
  245  			textResourceConfigurationService,
  246  			themeService,
  247  			editorService,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\browser\parts\editor\textDiffEditor.ts:

```sh
   41  	TooLargeFileOperationError,
   42  } from "vs/platform/files/common/files";
   43  import { IInstantiationService } from "vs/platform/instantiation/common/instantiation";
   44  import { Registry } from "vs/platform/registry/common/platform";
   45  import { IStorageService } from "vs/platform/storage/common/storage";
   46: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   47  import { IThemeService } from "vs/platform/theme/common/themeService";
   48  import {
   49  	AbstractTextEditor,
   50  	IEditorConfiguration,
   51  } from "vs/workbench/browser/parts/editor/textEditor";

  100  		).invokeWithinContext((accessor) => accessor.get(IContextKeyService));
  101  	}
  102
  103  	constructor(
  104  		group: IEditorGroup,
  105: 		@ITelemetryService telemetryService: ITelemetryService,
  106  		@IInstantiationService instantiationService: IInstantiationService,
  107  		@IStorageService storageService: IStorageService,
  108  		@ITextResourceConfigurationService
  109  		configurationService: ITextResourceConfigurationService,
  110  		@IEditorService editorService: IEditorService,

  115  		private readonly preferencesService: IPreferencesService,
  116  	) {
  117  		super(
  118  			TextDiffEditor.ID,
  119  			group,
  120: 			telemetryService,
  121  			instantiationService,
  122  			storageService,
  123  			configurationService,
  124  			themeService,
  125  			editorService,

  472  			this._previousViewModel = null;
  473  		}
  474
  475  		super.clearInput();
  476
  477: 		// Log input lifecycle telemetry
  478  		const inputLifecycleElapsed = this.inputLifecycleStopWatch?.elapsed();
  479  		this.inputLifecycleStopWatch = undefined;
  480  		if (typeof inputLifecycleElapsed === "number") {
  481  			this.logInputLifecycleTelemetry(
  482  				inputLifecycleElapsed,

  495  		let collapseUnchangedRegions = false;
  496  		if (this.diffEditorControl instanceof DiffEditorWidget) {
  497  			collapseUnchangedRegions =
  498  				this.diffEditorControl.collapseUnchangedRegions;
  499  		}
  500: 		this.telemetryService.publicLog2<
  501  			{
  502  				editorVisibleTimeMs: number;
  503  				languageId: string;
  504  				collapseUnchangedRegions: boolean;
  505  			},
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\browser\parts\editor\textEditor.ts:

```sh
   27  	TextEditorSelectionSource,
   28  } from "vs/platform/editor/common/editor";
   29  import { IFileService } from "vs/platform/files/common/files";
   30  import { IInstantiationService } from "vs/platform/instantiation/common/instantiation";
   31  import { IStorageService } from "vs/platform/storage/common/storage";
   32: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   33  import { IThemeService } from "vs/platform/theme/common/themeService";
   34  import { computeEditorAriaLabel } from "vs/workbench/browser/editor";
   35  import { AbstractEditorWithViewState } from "vs/workbench/browser/parts/editor/editorWithViewState";
   36  import {
   37  	EditorPaneSelectionChangeReason,

   88  	private readonly inputListener = this._register(new MutableDisposable());
   89
   90  	constructor(
   91  		id: string,
   92  		group: IEditorGroup,
   93: 		@ITelemetryService telemetryService: ITelemetryService,
   94  		@IInstantiationService instantiationService: IInstantiationService,
   95  		@IStorageService storageService: IStorageService,
   96  		@ITextResourceConfigurationService
   97  		textResourceConfigurationService: ITextResourceConfigurationService,
   98  		@IThemeService themeService: IThemeService,

  102  	) {
  103  		super(
  104  			id,
  105  			group,
  106  			AbstractTextEditor.VIEW_STATE_PREFERENCE_KEY,
  107: 			telemetryService,
  108  			instantiationService,
  109  			storageService,
  110  			textResourceConfigurationService,
  111  			themeService,
  112  			editorService,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\browser\parts\editor\textResourceEditor.ts:

```sh
   21  import { ITextResourceConfigurationService } from "vs/editor/common/services/textResourceConfiguration";
   22  import { ITextEditorOptions } from "vs/platform/editor/common/editor";
   23  import { IFileService } from "vs/platform/files/common/files";
   24  import { IInstantiationService } from "vs/platform/instantiation/common/instantiation";
   25  import { IStorageService } from "vs/platform/storage/common/storage";
   26: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   27  import { IThemeService } from "vs/platform/theme/common/themeService";
   28  import { AbstractTextCodeEditor } from "vs/workbench/browser/parts/editor/textCodeEditor";
   29  import {
   30  	IEditorOpenContext,
   31  	isTextEditorViewState,

   50   */
   51  export abstract class AbstractTextResourceEditor extends AbstractTextCodeEditor<ICodeEditorViewState> {
   52  	constructor(
   53  		id: string,
   54  		group: IEditorGroup,
   55: 		@ITelemetryService telemetryService: ITelemetryService,
   56  		@IInstantiationService instantiationService: IInstantiationService,
   57  		@IStorageService storageService: IStorageService,
   58  		@ITextResourceConfigurationService
   59  		textResourceConfigurationService: ITextResourceConfigurationService,
   60  		@IThemeService themeService: IThemeService,

   63  		@IFileService fileService: IFileService,
   64  	) {
   65  		super(
   66  			id,
   67  			group,
   68: 			telemetryService,
   69  			instantiationService,
   70  			storageService,
   71  			textResourceConfigurationService,
   72  			themeService,
   73  			editorService,

  170  export class TextResourceEditor extends AbstractTextResourceEditor {
  171  	static readonly ID = "workbench.editors.textResourceEditor";
  172
  173  	constructor(
  174  		group: IEditorGroup,
  175: 		@ITelemetryService telemetryService: ITelemetryService,
  176  		@IInstantiationService instantiationService: IInstantiationService,
  177  		@IStorageService storageService: IStorageService,
  178  		@ITextResourceConfigurationService
  179  		textResourceConfigurationService: ITextResourceConfigurationService,
  180  		@IThemeService themeService: IThemeService,

  185  		@IFileService fileService: IFileService,
  186  	) {
  187  		super(
  188  			TextResourceEditor.ID,
  189  			group,
  190: 			telemetryService,
  191  			instantiationService,
  192  			storageService,
  193  			textResourceConfigurationService,
  194  			themeService,
  195  			editorGroupService,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\browser\parts\notifications\notificationsCommands.ts:

```sh
   38  } from "vs/platform/notification/common/notification";
   39  import {
   40  	IQuickInputService,
   41  	IQuickPickItem,
   42  } from "vs/platform/quickinput/common/quickInput";
   43: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   44  import {
   45  	NotificationMetrics,
   46  	NotificationMetricsClassification,
   47  	notificationToMetrics,
   48  } from "vs/workbench/browser/parts/notifications/notificationsTelemetry";

  155  		id: HIDE_NOTIFICATIONS_CENTER,
  156  		weight: KeybindingWeight.WorkbenchContrib + 50,
  157  		when: NotificationsCenterVisibleContext,
  158  		primary: KeyCode.Escape,
  159  		handler: (accessor) => {
  160: 			const telemetryService = accessor.get(ITelemetryService);
  161  			for (const notification of model.notifications) {
  162  				if (notification.visible) {
  163: 					telemetryService.publicLog2<
  164  						NotificationMetrics,
  165  						NotificationMetricsClassification
  166  					>(
  167  						"notification:hide",
  168  						notificationToMetrics(

  290  		},
  291  	});
  292
  293  	// Hide Toasts
  294  	CommandsRegistry.registerCommand(HIDE_NOTIFICATION_TOAST, (accessor) => {
  295: 		const telemetryService = accessor.get(ITelemetryService);
  296  		for (const notification of model.notifications) {
  297  			if (notification.visible) {
  298: 				telemetryService.publicLog2<
  299  					NotificationMetrics,
  300  					NotificationMetricsClassification
  301  				>(
  302  					"notification:hide",
  303  					notificationToMetrics(

  565  	comment: "Tracks when actions are fired from notifcations and how they were fired.";
  566  };
  567
  568  export class NotificationActionRunner extends ActionRunner {
  569  	constructor(
  570: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
  571  		@INotificationService
  572  		private readonly notificationService: INotificationService,
  573  	) {
  574  		super();
  575  	}
  576
  577  	protected override async runAction(
  578  		action: IAction,
  579  		context: unknown,
  580  	): Promise<void> {
  581: 		this.telemetryService.publicLog2<
  582  			WorkbenchActionExecutedEvent,
  583  			WorkbenchActionExecutedClassification
  584  		>("workbenchActionExecuted", { id: action.id, from: "message" });
  585
  586  		if (isNotificationViewItem(context)) {
  587: 			// Log some additional telemetry specifically for actions
  588  			// that are triggered from within notifications.
  589: 			this.telemetryService.publicLog2<
  590  				NotificationActionMetrics,
  591  				NotificationActionMetricsClassification
  592  			>("notification:actionExecuted", {
  593  				id: hash(context.message.original.toString()).toString(),
  594  				actionLabel: action.label,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\browser\parts\notifications\notificationsTelemetry.ts:

```sh
   8  import {
   9  	INotificationService,
  10  	NotificationMessage,
  11  	NotificationPriority,
  12  } from "vs/platform/notification/common/notification";
  13: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
  14  import { IWorkbenchContribution } from "vs/workbench/common/contributions";
  15
  16  export interface NotificationMetrics {
  17  	readonly id: string;
  18  	readonly silent: boolean;

  54  export class NotificationsTelemetry
  55  	extends Disposable
  56  	implements IWorkbenchContribution
  57  {
  58  	constructor(
  59: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
  60  		@INotificationService
  61  		private readonly notificationService: INotificationService,
  62  	) {
  63  		super();
  64  		this.registerListeners();

  70  				const source =
  71  					notification.source &&
  72  					typeof notification.source !== "string"
  73  						? notification.source.id
  74  						: notification.source;
  75: 				this.telemetryService.publicLog2<
  76  					NotificationMetrics,
  77  					NotificationMetricsClassification
  78  				>(
  79  					"notification:show",
  80  					notificationToMetrics(

  91  				const source =
  92  					notification.source &&
  93  					typeof notification.source !== "string"
  94  						? notification.source.id
  95  						: notification.source;
  96: 				this.telemetryService.publicLog2<
  97  					NotificationMetrics,
  98  					NotificationMetricsClassification
  99  				>(
  100  					"notification:close",
  101  					notificationToMetrics(
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\browser\parts\statusbar\statusbarItem.ts:

```sh
   36  import { isThemeColor } from "vs/editor/common/editorCommon";
   37  import { Command } from "vs/editor/common/languages";
   38  import { ICommandService } from "vs/platform/commands/common/commands";
   39  import { IHoverService } from "vs/platform/hover/browser/hover";
   40  import { INotificationService } from "vs/platform/notification/common/notification";
   41: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   42  import {
   43  	spinningLoading,
   44  	syncing,
   45  } from "vs/platform/theme/common/iconRegistry";
   46  import { IThemeService } from "vs/platform/theme/common/themeService";

   93  		private readonly hoverDelegate: IHoverDelegate,
   94  		@ICommandService private readonly commandService: ICommandService,
   95  		@IHoverService private readonly hoverService: IHoverService,
   96  		@INotificationService
   97  		private readonly notificationService: INotificationService,
   98: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
   99  		@IThemeService private readonly themeService: IThemeService,
  100  	) {
  101  		super();
  102
  103  		// Label Container

  323  		else {
  324  			const id = typeof command === "string" ? command : command.id;
  325  			const args =
  326  				typeof command === "string" ? [] : (command.arguments ?? []);
  327
  328: 			this.telemetryService.publicLog2<
  329  				WorkbenchActionExecutedEvent,
  330  				WorkbenchActionExecutedClassification
  331  			>("workbenchActionExecuted", { id, from: "status bar" });
  332  			try {
  333  				await this.commandService.executeCommand(id, ...args);
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\browser\parts\titlebar\commandCenterControl.ts:

```sh
   59  				contextMenu: MenuId.TitleBarContext,
   60  				hiddenItemStrategy: HiddenItemStrategy.NoHide,
   61  				toolbarOptions: {
   62  					primaryGroup: () => true,
   63  				},
   64: 				telemetrySource: "commandCenter",
   65  				actionViewItemProvider: (action, options) => {
   66  					if (
   67  						action instanceof SubmenuItemAction &&
   68  						action.item.submenu === MenuId.CommandCenterCenter
   69  					) {

  176  			const toolbar = this._instaService.createInstance(
  177  				WorkbenchToolBar,
  178  				container,
  179  				{
  180  					hiddenItemStrategy: HiddenItemStrategy.NoHide,
  181: 					telemetrySource: "commandCenterCenter",
  182  					actionViewItemProvider: (action, options) => {
  183  						options = {
  184  							...options,
  185  							hoverDelegate: this._hoverDelegate,
  186  						};
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\browser\parts\titlebar\menubarControl.ts:

```sh
   71  import {
   72  	IStorageService,
   73  	StorageScope,
   74  	StorageTarget,
   75  } from "vs/platform/storage/common/storage";
   76: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   77  import { defaultMenuStyles } from "vs/platform/theme/browser/defaultStyles";
   78  import { IUpdateService, StateType } from "vs/platform/update/common/update";
   79  import {
   80  	getMenuBarVisibility,
   81  	hasNativeTitlebar,

  575  		@INotificationService notificationService: INotificationService,
  576  		@IPreferencesService preferencesService: IPreferencesService,
  577  		@IWorkbenchEnvironmentService
  578  		environmentService: IWorkbenchEnvironmentService,
  579  		@IAccessibilityService accessibilityService: IAccessibilityService,
  580: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
  581  		@IHostService hostService: IHostService,
  582  		@ICommandService commandService: ICommandService,
  583  	) {
  584  		super(
  585  			menuService,

  601  		this._onVisibilityChange = this._register(new Emitter<boolean>());
  602  		this._onFocusStateChange = this._register(new Emitter<boolean>());
  603
  604  		this.actionRunner = this._register(new ActionRunner());
  605  		this.actionRunner.onDidRun((e) => {
  606: 			this.telemetryService.publicLog2<
  607  				WorkbenchActionExecutedEvent,
  608  				WorkbenchActionExecutedClassification
  609  			>("workbenchActionExecuted", { id: e.action.id, from: "menu" });
  610  		});
  611
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\browser\parts\titlebar\titlebarPart.ts:

```sh
  902  							GLOBAL_ACTIVITY_ID,
  903  							...EDITOR_CORE_NAVIGATION_COMMANDS,
  904  						],
  905  					},
  906  					anchorAlignmentProvider: () => AnchorAlignment.RIGHT,
  907: 					telemetrySource: "titlePart",
  908  					highlightToggledItems: this.editorActionsEnabled, // Only show toggled state for editor actions (Layout actions are not shown as toggled)
  909  					actionViewItemProvider: (action, options) =>
  910  						this.actionViewItemProvider(action, options),
  911  					hoverDelegate: this.hoverDelegate,
  912  				},
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\browser\parts\views\treeView.ts:

```sh
   119  import { ILogService } from "vs/platform/log/common/log";
   120  import { INotificationService } from "vs/platform/notification/common/notification";
   121  import { IOpenerService } from "vs/platform/opener/common/opener";
   122  import { IProgressService } from "vs/platform/progress/common/progress";
   123  import { Registry } from "vs/platform/registry/common/platform";
   124: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   125: import { TelemetryTrustedValue } from "vs/platform/telemetry/common/telemetryUtils";
   126  import { defaultButtonStyles } from "vs/platform/theme/browser/defaultStyles";
   127  import { ColorScheme } from "vs/platform/theme/common/theme";
   128  import {
   129  	FileThemeIcon,
   130  	FolderThemeIcon,

   185  		@IContextKeyService contextKeyService: IContextKeyService,
   186  		@IViewDescriptorService viewDescriptorService: IViewDescriptorService,
   187  		@IInstantiationService instantiationService: IInstantiationService,
   188  		@IOpenerService openerService: IOpenerService,
   189  		@IThemeService themeService: IThemeService,
   190: 		@ITelemetryService telemetryService: ITelemetryService,
   191  		@INotificationService notificationService: INotificationService,
   192  		@IHoverService hoverService: IHoverService,
   193  		@IAccessibleViewInformationService
   194  		accessibleViewService: IAccessibleViewInformationService,
   195  	) {

   205  			contextKeyService,
   206  			viewDescriptorService,
   207  			instantiationService,
   208  			openerService,
   209  			themeService,
   210: 			telemetryService,
   211  			hoverService,
   212  			accessibleViewService,
   213  		);
   214  		const { treeView } = <ITreeViewDescriptor>(
   215  			Registry.as<IViewsRegistry>(Extensions.ViewsRegistry).getView(

  2474  		@IViewDescriptorService viewDescriptorService: IViewDescriptorService,
  2475  		@IContextKeyService contextKeyService: IContextKeyService,
  2476  		@IHoverService hoverService: IHoverService,
  2477  		@IExtensionService private readonly extensionService: IExtensionService,
  2478  		@IActivityService activityService: IActivityService,
  2479: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
  2480  		@ILogService logService: ILogService,
  2481  		@IOpenerService openerService: IOpenerService,
  2482  	) {
  2483  		super(
  2484  			id,

  2518  					comment: "Id of the view";
  2519  				};
  2520  				owner: "digitarald";
  2521  				comment: "Helps to gain insights on what extension contributed views are most popular";
  2522  			};
  2523: 			this.telemetryService.publicLog2<
  2524  				ExtensionViewTelemetry,
  2525  				ExtensionViewTelemetryMeta
  2526  			>("Extension:ViewActivate", {
  2527  				extensionId: new TelemetryTrustedValue(this.extensionId),
  2528  				id: this.id,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\browser\parts\views\viewPane.ts:

```sh
    67  import { IKeybindingService } from "vs/platform/keybinding/common/keybinding";
    68  import { Link } from "vs/platform/opener/browser/link";
    69  import { IOpenerService } from "vs/platform/opener/common/opener";
    70  import { IProgressIndicator } from "vs/platform/progress/common/progress";
    71  import { Registry } from "vs/platform/registry/common/platform";
    72: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
    73  import {
    74  	defaultButtonStyles,
    75  	defaultProgressBarStyles,
    76  } from "vs/platform/theme/browser/defaultStyles";
    77  import {

   209  		private readonly container: HTMLElement,
   210  		private readonly delegate: IViewWelcomeDelegate,
   211  		@IInstantiationService
   212  		private instantiationService: IInstantiationService,
   213  		@IOpenerService protected openerService: IOpenerService,
   214: 		@ITelemetryService protected telemetryService: ITelemetryService,
   215  		@IContextKeyService private contextKeyService: IContextKeyService,
   216  		@ILifecycleService lifecycleService: ILifecycleService,
   217  	) {
   218  		this.disposables.add(
   219  			Event.runAndSubscribe(

   377  						...defaultButtonStyles,
   378  					});
   379  					button.label = node.label;
   380  					button.onDidClick(
   381  						(_) => {
   382: 							this.telemetryService.publicLog2<
   383  								{ viewId: string; uri: string },
   384  								WelcomeActionClassification
   385  							>("views.welcomeAction", {
   386  								viewId: this.delegate.id,
   387  								uri: node.href,

   549  		protected viewDescriptorService: IViewDescriptorService,
   550  		@IInstantiationService
   551  		protected instantiationService: IInstantiationService,
   552  		@IOpenerService protected openerService: IOpenerService,
   553  		@IThemeService protected themeService: IThemeService,
   554: 		@ITelemetryService protected telemetryService: ITelemetryService,
   555  		@IHoverService protected readonly hoverService: IHoverService,
   556  		protected readonly accessibleViewInformationService?: IAccessibleViewInformationService,
   557  	) {
   558  		super({
   559  			...options,

  1113  		@IContextKeyService contextKeyService: IContextKeyService,
  1114  		@IViewDescriptorService viewDescriptorService: IViewDescriptorService,
  1115  		@IInstantiationService instantiationService: IInstantiationService,
  1116  		@IOpenerService openerService: IOpenerService,
  1117  		@IThemeService themeService: IThemeService,
  1118: 		@ITelemetryService telemetryService: ITelemetryService,
  1119  		@IHoverService hoverService: IHoverService,
  1120  		accessibleViewService?: IAccessibleViewInformationService,
  1121  	) {
  1122  		super(
  1123  			options,

  1127  			contextKeyService,
  1128  			viewDescriptorService,
  1129  			instantiationService,
  1130  			openerService,
  1131  			themeService,
  1132: 			telemetryService,
  1133  			hoverService,
  1134  			accessibleViewService,
  1135  		);
  1136  		const childInstantiationService = this._register(
  1137  			instantiationService.createChild(
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\browser\parts\views\viewPaneContainer.ts:

```sh
56 import {
57 IStorageService,
58 StorageScope,
59 StorageTarget,
60 } from "vs/platform/storage/common/storage"
61: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry"
62 import {
63 activeContrastBorder,
64 asCssVariable,
65 } from "vs/platform/theme/common/colorRegistry"
66 import { IThemeService, Themable } from "vs/platform/theme/common/themeService"

524 @IConfigurationService
525 protected configurationService: IConfigurationService,
526 @IWorkbenchLayoutService
527 protected layoutService: IWorkbenchLayoutService,
528 @IContextMenuService protected contextMenuService: IContextMenuService,
529: @ITelemetryService protected telemetryService: ITelemetryService,
530 @IExtensionService protected extensionService: IExtensionService,
531 @IThemeService themeService: IThemeService,
532 @IStorageService protected storageService: IStorageService,
533 @IWorkspaceContextService
534 protected contextService: IWorkspaceContextService,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\browser\parts\views\viewsViewlet.ts:

```sh
   7  import { IConfigurationService } from "vs/platform/configuration/common/configuration";
   8  import { IContextMenuService } from "vs/platform/contextview/browser/contextView";
   9  import { ExtensionIdentifier } from "vs/platform/extensions/common/extensions";
  10  import { IInstantiationService } from "vs/platform/instantiation/common/instantiation";
  11  import { IStorageService } from "vs/platform/storage/common/storage";
  12: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
  13  import { IThemeService } from "vs/platform/theme/common/themeService";
  14  import { IWorkspaceContextService } from "vs/platform/workspace/common/workspace";
  15  import {
  16  	IViewPaneOptions,
  17  	ViewPane,

  38  	constructor(
  39  		viewletId: string,
  40  		onDidChangeFilterValue: Event<string[]>,
  41  		@IConfigurationService configurationService: IConfigurationService,
  42  		@IWorkbenchLayoutService layoutService: IWorkbenchLayoutService,
  43: 		@ITelemetryService telemetryService: ITelemetryService,
  44  		@IStorageService storageService: IStorageService,
  45  		@IInstantiationService instantiationService: IInstantiationService,
  46  		@IThemeService themeService: IThemeService,
  47  		@IContextMenuService contextMenuService: IContextMenuService,
  48  		@IExtensionService extensionService: IExtensionService,

  54  			{ mergeViewWithContainerWhenSingleView: false },
  55  			instantiationService,
  56  			configurationService,
  57  			layoutService,
  58  			contextMenuService,
  59: 			telemetryService,
  60  			extensionService,
  61  			themeService,
  62  			storageService,
  63  			contextService,
  64  			viewDescriptorService,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\common\editor\editorInput.ts:

```sh
  200  	getIcon(): ThemeIcon | undefined {
  201  		return undefined;
  202  	}
  203
  204  	/**
  205: 	 * Returns a descriptor suitable for telemetry events.
  206  	 *
  207  	 * Subclasses should extend if they can contribute.
  208  	 */
  209  	getTelemetryDescriptor(): { [key: string]: unknown } {
  210  		/* __GDPR__FRAGMENT__
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\accountEntitlements\browser\accountsEntitlements.contribution.ts:

````sh
   34  import {
   35  	IStorageService,
   36  	StorageScope,
   37  	StorageTarget,
   38  } from "vs/platform/storage/common/storage";
   39: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   40  import { applicationConfigurationNodeBase } from "vs/workbench/common/configuration";
   41  import {
   42  	IWorkbenchContribution,
   43  	registerWorkbenchContribution2,
   44  	WorkbenchPhase,

   89  		new MutableDisposable(),
   90  	);
   91
   92  	constructor(
   93  		@IContextKeyService private readonly contextService: IContextKeyService,
   94: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
   95  		@IAuthenticationService
   96  		private readonly authenticationService: IAuthenticationService,
   97  		@IProductService private readonly productService: IProductService,
   98  		@IStorageService private readonly storageService: IStorageService,
   99  		@IExtensionManagementService

  230  				this.productService.gitHubEntitlement!.enablementKey in
  231  				parsedResult
  232  			) ||
  233  			!parsedResult[this.productService.gitHubEntitlement!.enablementKey]
  234  		) {
  235: 			this.telemetryService.publicLog2<
  236  				{ enabled: boolean },
  237  				EntitlementEnablementClassification
  238  			>("entitlements.enabled", { enabled: false });
  239  			return [false, ""];
  240  		}
  241: 		this.telemetryService.publicLog2<
  242  			{ enabled: boolean },
  243  			EntitlementEnablementClassification
  244  		>("entitlements.enabled", { enabled: true });
  245  		this.isInitialized = true;
  246  		const orgs: { login: string; name: string }[] = parsedResult[

  269
  270  		const [enabled, org] = await this.getEntitlementsInfo(session);
  271  		if (enabled && showAccountsBadge) {
  272  			this.createAccountsBadge(org);
  273  			this.showAccountsBadgeContextKey.set(showAccountsBadge);
  274: 			this.telemetryService.publicLog2<
  275  				{ enabled: boolean },
  276  				EntitlementEnablementClassification
  277  			>(accountsBadgeConfigKey, { enabled: true });
  278  		}
  279  	}

  338  						const commandService = accessor.get(ICommandService);
  339  						const contextKeyService =
  340  							accessor.get(IContextKeyService);
  341  						const storageService = accessor.get(IStorageService);
  342  						const dialogService = accessor.get(IDialogService);
  343: 						const telemetryService =
  344  							accessor.get(ITelemetryService);
  345
  346  						const confirmation = await dialogService.confirm({
  347  							type: "question",
  348  							message:

  357  							commandService.executeCommand(
  358  								productService.gitHubEntitlement!.command
  359  									.action,
  360  								productService.gitHubEntitlement!.extensionId!,
  361  							);
  362: 							telemetryService.publicLog2<
  363  								{ command: string },
  364  								EntitlementActionClassification
  365  							>("accountsEntitlements.action", {
  366  								command:
  367  									productService.gitHubEntitlement!.command
  368  										.action,
  369  							});
  370  						} else {
  371: 							telemetryService.publicLog2<
  372  								{ command: string },
  373  								EntitlementActionClassification
  374  							>("accountsEntitlements.action", {
  375  								command:
  376  									productService.gitHubEntitlement!.command

```# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\bracketPairColorizer2Telemetry\browser\bracketPairColorizer2Telemetry.contribution.ts:

```sh
   4   *--------------------------------------------------------------------------------------------*/
   5
   6  import { onUnexpectedError } from "vs/base/common/errors";
   7  import { IConfigurationService } from "vs/platform/configuration/common/configuration";
   8  import { Registry } from "vs/platform/registry/common/platform";
   9: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
  10  import {
  11  	IWorkbenchContributionsRegistry,
  12  	Extensions as WorkbenchExtensions,
  13  } from "vs/workbench/common/contributions";
  14  import { IExtensionsWorkbenchService } from "vs/workbench/contrib/extensions/common/extensions";

  19  	constructor(
  20  		@IConfigurationService
  21  		private readonly configurationService: IConfigurationService,
  22  		@IExtensionsWorkbenchService
  23  		private readonly extensionsWorkbenchService: IExtensionsWorkbenchService,
  24: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
  25  	) {
  26  		this.init().catch(onUnexpectedError);
  27  	}
  28
  29  	private async init(): Promise<void> {

  57  			comment: "We use this to understand how many users have the bracket pair colorizer extension installed (and how many of them have native bracket pair colorization enabled), as the extension does not do anything if native bracket pair colorization is enabled.";
  58  		};
  59  		type BracketPairColorizer2Event = {
  60  			nativeColorizationEnabled: boolean;
  61  		};
  62: 		this.telemetryService.publicLog2<
  63  			BracketPairColorizer2Event,
  64  			BracketPairColorizer2InstalledClassification
  65  		>("bracketPairColorizerTwoUsage", {
  66  			nativeColorizationEnabled,
  67  		});
````

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\bulkEdit\browser\preview\bulkEditPane.ts:

```sh
   44  import {
   45  	IStorageService,
   46  	StorageScope,
   47  	StorageTarget,
   48  } from "vs/platform/storage/common/storage";
   49: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   50  import { defaultButtonStyles } from "vs/platform/theme/browser/defaultStyles";
   51  import { IThemeService } from "vs/platform/theme/common/themeService";
   52  import { ResourceLabels } from "vs/workbench/browser/labels";
   53  import { ViewPane } from "vs/workbench/browser/parts/views/viewPane";
   54  import { IViewletViewOptions } from "vs/workbench/browser/parts/views/viewsViewlet";

  145  		@IKeybindingService keybindingService: IKeybindingService,
  146  		@IContextMenuService contextMenuService: IContextMenuService,
  147  		@IConfigurationService configurationService: IConfigurationService,
  148  		@IOpenerService openerService: IOpenerService,
  149  		@IThemeService themeService: IThemeService,
  150: 		@ITelemetryService telemetryService: ITelemetryService,
  151  		@IHoverService hoverService: IHoverService,
  152  	) {
  153  		super(
  154  			{ ...options, titleMenuId: MenuId.BulkEditTitle },
  155  			keybindingService,

  158  			contextKeyService,
  159  			viewDescriptorService,
  160  			_instaService,
  161  			openerService,
  162  			themeService,
  163: 			telemetryService,
  164  			hoverService,
  165  		);
  166
  167  		this.element.classList.add("bulk-edit-panel", "show-file-icons");
  168  		this._ctxHasCategories =
  169  			BulkEditPane.ctxHasCategories.bindTo(contextKeyService);
  170  		this._ctxGroupByFile =
  171  			BulkEditPane.ctxGroupByFile.bindTo(contextKeyService);
  172  		this._ctxHasCheckedChanges =
  173  			BulkEditPane.ctxHasCheckedChanges.bindTo(contextKeyService);
  174: 		// telemetry
  175  		type BulkEditPaneOpened = {
  176  			owner: "aiday-mar";
  177  			comment: "Report when the bulk edit pane has been opened";
  178  		};
  179: 		this.telemetryService.publicLog2<{}, BulkEditPaneOpened>(
  180  			"views.bulkEditPane",
  181  		);
  182  	}
  183
  184  	override dispose(): void {
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\chat\browser\chat.ts:

```sh
139 /**
140 * The menu that next to the input editor, use for close, config etc
141 */
142 inputSideToolbar?: MenuId
143 /**
144: * The telemetry source for all commands of this widget
145 */
146: telemetrySource?: string
147 }
148 defaultElementHeight?: number
149 editorOverflowWidgetsDomNode?: HTMLElement
150 }
151
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\chat\browser\chatEditor.ts:

```sh
  15  import {
  16  	IStorageService,
  17  	StorageScope,
  18  	StorageTarget,
  19  } from "vs/platform/storage/common/storage";
  20: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
  21  import {
  22  	editorBackground,
  23  	editorForeground,
  24  	inputBackground,
  25  } from "vs/platform/theme/common/colorRegistry";

  59  	private _memento: Memento | undefined;
  60  	private _viewState: IChatViewState | undefined;
  61
  62  	constructor(
  63  		group: IEditorGroup,
  64: 		@ITelemetryService telemetryService: ITelemetryService,
  65  		@IThemeService themeService: IThemeService,
  66  		@IInstantiationService
  67  		private readonly instantiationService: IInstantiationService,
  68  		@IStorageService private readonly storageService: IStorageService,
  69  		@IContextKeyService
  70  		private readonly contextKeyService: IContextKeyService,
  71  	) {
  72  		super(
  73  			ChatEditorInput.EditorID,
  74  			group,
  75: 			telemetryService,
  76  			themeService,
  77  			storageService,
  78  		);
  79  	}
  80
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\chat\browser\chatInputPart.ts:

```sh
   97  	renderFollowups: boolean;
   98  	renderStyle?: "default" | "compact";
   99  	menus: {
  100  		executeToolbar: MenuId;
  101  		inputSideToolbar?: MenuId;
  102: 		telemetrySource?: string;
  103  	};
  104  	editorOverflowWidgetsDomNode?: HTMLElement;
  105  }
  106
  107  export class ChatInputPart

  664  			this.instantiationService.createInstance(
  665  				MenuWorkbenchToolBar,
  666  				inputContainer,
  667  				this.options.menus.executeToolbar,
  668  				{
  669: 					telemetrySource: this.options.menus.telemetrySource,
  670  					menuOptions: {
  671  						shouldForwardArgs: true,
  672  					},
  673  					hiddenItemStrategy: HiddenItemStrategy.Ignore, // keep it lean when hiding items and avoid a "..." overflow menu
  674  					actionViewItemProvider: (action, options) => {

  729  				this.instantiationService.createInstance(
  730  					MenuWorkbenchToolBar,
  731  					inputAndSideToolbar,
  732  					this.options.menus.inputSideToolbar,
  733  					{
  734: 						telemetrySource: this.options.menus.telemetrySource,
  735  						menuOptions: {
  736  							shouldForwardArgs: true,
  737  						},
  738  					},
  739  				),
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\chat\browser\chatViewPane.ts:

```sh
  17  import {
  18  	IStorageService,
  19  	StorageScope,
  20  	StorageTarget,
  21  } from "vs/platform/storage/common/storage";
  22: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
  23  import { editorBackground } from "vs/platform/theme/common/colorRegistry";
  24  import { IThemeService } from "vs/platform/theme/common/themeService";
  25  import {
  26  	IViewPaneOptions,
  27  	ViewPane,

  70  		@IContextKeyService contextKeyService: IContextKeyService,
  71  		@IViewDescriptorService viewDescriptorService: IViewDescriptorService,
  72  		@IInstantiationService instantiationService: IInstantiationService,
  73  		@IOpenerService openerService: IOpenerService,
  74  		@IThemeService themeService: IThemeService,
  75: 		@ITelemetryService telemetryService: ITelemetryService,
  76  		@IHoverService hoverService: IHoverService,
  77  		@IStorageService private readonly storageService: IStorageService,
  78  		@IChatService private readonly chatService: IChatService,
  79  		@IChatAgentService private readonly chatAgentService: IChatAgentService,
  80  		@ILogService private readonly logService: ILogService,

  87  			contextKeyService,
  88  			viewDescriptorService,
  89  			instantiationService,
  90  			openerService,
  91  			themeService,
  92: 			telemetryService,
  93  			hoverService,
  94  		);
  95
  96  		// View state for the ViewPane is currently global per-provider basically, but some other strictly per-model state will require a separate memento.
  97  		this.memento = new Memento(
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\chat\browser\chatWidget.ts:

```sh
  929  				msg += e.followup.message;
  930  				this.acceptInput(msg);
  931
  932  				if (!e.response) {
  933  					// Followups can be shown by the welcome message, then there is no response associated.
  934: 					// At some point we probably want telemetry for these too.
  935  					return;
  936  				}
  937
  938  				this.chatService.notifyUserAction({
  939  					sessionId: this.viewModel.sessionId,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\chat\browser\chatContentParts\chatCodeCitationContentPart.ts:

```sh
   5
   6  import * as dom from "vs/base/browser/dom";
   7  import { Button } from "vs/base/browser/ui/button/button";
   8  import { Disposable } from "vs/base/common/lifecycle";
   9  import { localize } from "vs/nls";
  10: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
  11  import { ChatTreeItem } from "vs/workbench/contrib/chat/browser/chat";
  12  import {
  13  	IChatContentPart,
  14  	IChatContentPartRenderContext,
  15  } from "vs/workbench/contrib/chat/browser/chatContentParts/chatContentParts";

  33
  34  	constructor(
  35  		citations: IChatCodeCitations,
  36  		context: IChatContentPartRenderContext,
  37  		@IEditorService private readonly editorService: IEditorService,
  38: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
  39  	) {
  40  		super();
  41
  42  		const label = getCodeCitationsMessage(citations.citations);
  43  		const elements = dom.h(".chat-code-citation-message@root", [

  71  				this.editorService.openEditor({
  72  					resource: undefined,
  73  					contents: citationText,
  74  					languageId: "markdown",
  75  				});
  76: 				this.telemetryService.publicLog2<
  77  					{},
  78  					ChatCodeCitationOpenedClassification
  79  				>("openedChatCodeCitations");
  80  			}),
  81  		);
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\chat\browser\chatContentParts\chatCommandContentPart.ts:

```sh
  49  			}),
  50  		);
  51  		button.label = commandButton.command.title;
  52  		button.enabled = enabled;
  53
  54: 		// TODO still need telemetry for command buttons
  55  		this._register(
  56  			button.onDidClick(() =>
  57  				this.commandService.executeCommand(
  58  					commandButton.command.id,
  59  					...(commandButton.command.arguments ?? []),
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\chat\common\chatServiceImpl.ts:

```sh
    30  import {
    31  	IStorageService,
    32  	StorageScope,
    33  	StorageTarget,
    34  } from "vs/platform/storage/common/storage";
    35: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
    36  import { IWorkspaceContextService } from "vs/platform/workspace/common/workspace";
    37  import {
    38  	ChatAgentLocation,
    39  	IChatAgent,
    40  	IChatAgentCommand,

   245  		@IStorageService private readonly storageService: IStorageService,
   246  		@ILogService private readonly logService: ILogService,
   247  		@IExtensionService private readonly extensionService: IExtensionService,
   248  		@IInstantiationService
   249  		private readonly instantiationService: IInstantiationService,
   250: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
   251  		@IWorkspaceContextService
   252  		private readonly workspaceContextService: IWorkspaceContextService,
   253  		@IChatSlashCommandService
   254  		private readonly chatSlashCommandService: IChatSlashCommandService,
   255  		@IChatVariablesService

   959  			const listener = token.onCancellationRequested(() => {
   960  				this.trace(
   961  					"sendRequest",
   962  					`Request for session ${model.sessionId} was cancelled`,
   963  				);
   964: 				this.telemetryService.publicLog2<
   965  					ChatProviderInvokedEvent,
   966  					ChatProviderInvokedClassification
   967  				>("interactiveSessionProviderInvoked", {
   968  					timeToFirstProgress: undefined,
   969  					// Normally timings happen inside the EH around the actual provider. For cancellation we can measure how long the user waited before cancelling

  1242  								? "error"
  1243  								: "success";
  1244  					const commandForTelemetry = agentSlashCommandPart
  1245  						? agentSlashCommandPart.command.name
  1246  						: commandPart?.slashCommand.command;
  1247: 					this.telemetryService.publicLog2<
  1248  						ChatProviderInvokedEvent,
  1249  						ChatProviderInvokedClassification
  1250  					>("interactiveSessionProviderInvoked", {
  1251  						timeToFirstProgress: rawResult.timings?.firstProgress,
  1252  						totalTime: rawResult.timings?.totalElapsed,

  1288  						}
  1289  					});
  1290  				}
  1291  			} catch (err) {
  1292  				const result = "error";
  1293: 				this.telemetryService.publicLog2<
  1294  					ChatProviderInvokedEvent,
  1295  					ChatProviderInvokedClassification
  1296  				>("interactiveSessionProviderInvoked", {
  1297  					timeToFirstProgress: undefined,
  1298  					totalTime: undefined,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\chat\common\chatServiceTelemetry.ts:

```sh
    2   *  Copyright (c) Microsoft Corporation. All rights reserved.
    3   *  Licensed under the MIT License. See License.txt in the project root for license information.
    4   *--------------------------------------------------------------------------------------------*/
    5
    6  import { CommandsRegistry } from "vs/platform/commands/common/commands";
    7: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
    8  import {
    9  	ChatAgentVoteDirection,
   10  	ChatCopyKind,
   11  	IChatUserActionEvent,
   12  } from "vs/workbench/contrib/chat/common/chatService";

  199  	comment: "Provides insight into the usage of Chat features.";
  200  };
  201
  202  export class ChatServiceTelemetry {
  203  	constructor(
  204: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
  205  	) {}
  206
  207  	notifyUserAction(action: IChatUserActionEvent): void {
  208  		if (action.action.kind === "vote") {
  209: 			this.telemetryService.publicLog2<
  210  				ChatVoteEvent,
  211  				ChatVoteClassification
  212  			>("interactiveSessionVote", {
  213  				direction:
  214  					action.action.direction === ChatAgentVoteDirection.Up

  216  						: "down",
  217  				agentId: action.agentId ?? "",
  218  				command: action.command,
  219  			});
  220  		} else if (action.action.kind === "copy") {
  221: 			this.telemetryService.publicLog2<
  222  				ChatCopyEvent,
  223  				ChatCopyClassification
  224  			>("interactiveSessionCopy", {
  225  				copyKind:
  226  					action.action.copyKind === ChatCopyKind.Action

  228  						: "toolbar",
  229  				agentId: action.agentId ?? "",
  230  				command: action.command,
  231  			});
  232  		} else if (action.action.kind === "insert") {
  233: 			this.telemetryService.publicLog2<
  234  				ChatInsertEvent,
  235  				ChatInsertClassification
  236  			>("interactiveSessionInsert", {
  237  				newFile: !!action.action.newFile,
  238  				userAction: action.action.userAction,

  246  				action.action.commandButton.command.id,
  247  			);
  248  			const commandId = command
  249  				? action.action.commandButton.command.id
  250  				: "INVALID";
  251: 			this.telemetryService.publicLog2<
  252  				ChatCommandEvent,
  253  				ChatCommandClassification
  254  			>("interactiveSessionCommand", {
  255  				commandId,
  256  				agentId: action.agentId ?? "",
  257  				command: action.command,
  258  			});
  259  		} else if (action.action.kind === "runInTerminal") {
  260: 			this.telemetryService.publicLog2<
  261  				ChatTerminalEvent,
  262  				ChatTerminalClassification
  263  			>("interactiveSessionRunInTerminal", {
  264  				languageId: action.action.languageId ?? "",
  265  				agentId: action.agentId ?? "",
  266  				command: action.command,
  267  			});
  268  		} else if (action.action.kind === "followUp") {
  269: 			this.telemetryService.publicLog2<
  270  				ChatFollowupEvent,
  271  				ChatFollowupClassification
  272  			>("chatFollowupClicked", {
  273  				agentId: action.agentId ?? "",
  274  				command: action.command,

  279  	retrievedFollowups(
  280  		agentId: string,
  281  		command: string | undefined,
  282  		numFollowups: number,
  283  	): void {
  284: 		this.telemetryService.publicLog2<
  285  			ChatFollowupsRetrievedEvent,
  286  			ChatFollowupsRetrievedClassification
  287  		>("chatFollowupsRetrieved", {
  288  			agentId,
  289  			command,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\codeEditor\browser\saveParticipants.ts:

```sh
   50  	IProgress,
   51  	IProgressStep,
   52  	Progress,
   53  } from "vs/platform/progress/common/progress";
   54  import { Registry } from "vs/platform/registry/common/platform";
   55: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   56  import {
   57  	IWorkbenchContribution,
   58  	IWorkbenchContributionsRegistry,
   59  	Extensions as WorkbenchContributionsExtensions,
   60  } from "vs/workbench/common/contributions";

  460  		private readonly languageFeaturesService: ILanguageFeaturesService,
  461  		@IHostService private readonly hostService: IHostService,
  462  		@IEditorService private readonly editorService: IEditorService,
  463  		@ICodeEditorService
  464  		private readonly codeEditorService: ICodeEditorService,
  465: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
  466  	) {
  467  		super();
  468
  469  		this._register(
  470  			this.hostService.onDidChangeFocus(() => {

  699  					purpose: "FeatureInsight";
  700  					comment: "Duration it took for TS to return the action to run for each kind. ";
  701  				};
  702  			};
  703
  704: 			this.telemetryService.publicLog2<
  705  				CodeActionOnSave,
  706  				CodeActionOnSaveClassification
  707  			>("codeAction.appliedOnSave", {
  708  				codeAction: codeActionKind.value,
  709  				duration: sw.elapsed(),
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\codeEditor\browser\emptyTextEditorHint\emptyTextEditorHint.ts:

```sh
   47  import { IConfigurationService } from "vs/platform/configuration/common/configuration";
   48  import { IContextMenuService } from "vs/platform/contextview/browser/contextView";
   49  import { IHoverService } from "vs/platform/hover/browser/hover";
   50  import { IKeybindingService } from "vs/platform/keybinding/common/keybinding";
   51  import { IProductService } from "vs/platform/product/common/productService";
   52: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   53  import { ChangeLanguageAction } from "vs/workbench/browser/parts/editor/editorStatus";
   54  import { AccessibilityVerbositySettingId } from "vs/workbench/contrib/accessibility/browser/accessibilityConfiguration";
   55  import {
   56  	ChatAgentLocation,
   57  	IChatAgent,

   90  		@IKeybindingService
   91  		private readonly keybindingService: IKeybindingService,
   92  		@IInlineChatSessionService
   93  		private readonly inlineChatSessionService: IInlineChatSessionService,
   94  		@IChatAgentService private readonly chatAgentService: IChatAgentService,
   95: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
   96  		@IProductService protected readonly productService: IProductService,
   97  		@IContextMenuService
   98  		private readonly contextMenuService: IContextMenuService,
   99  	) {
  100  		this.toDispose = [];

  212  				this.commandService,
  213  				this.configurationService,
  214  				this.hoverService,
  215  				this.keybindingService,
  216  				this.chatAgentService,
  217: 				this.telemetryService,
  218  				this.productService,
  219  				this.contextMenuService,
  220  			);
  221  		} else if (!shouldRenderHint && this.textHintContentWidget) {
  222  			this.textHintContentWidget.dispose();

  245  		private readonly commandService: ICommandService,
  246  		private readonly configurationService: IConfigurationService,
  247  		private readonly hoverService: IHoverService,
  248  		private readonly keybindingService: IKeybindingService,
  249  		private readonly chatAgentService: IChatAgentService,
  250: 		private readonly telemetryService: ITelemetryService,
  251  		private readonly productService: IProductService,
  252  		private readonly contextMenuService: IContextMenuService,
  253  	) {
  254  		this.toDispose = new DisposableStore();
  255  		this.toDispose.add(

  336
  337  		const inlineChatId = "inlineChat.start";
  338  		let ariaLabel = `Ask ${providerName} something or start typing to dismiss.`;
  339
  340  		const handleClick = () => {
  341: 			this.telemetryService.publicLog2<
  342  				WorkbenchActionExecutedEvent,
  343  				WorkbenchActionExecutedClassification
  344  			>("workbenchActionExecuted", {
  345  				id: "inlineChat.hintAction",
  346  				from: "hint",

  485  		// the actual command handlers...
  486  		const languageOnClickOrTap = async (e: UIEvent) => {
  487  			e.stopPropagation();
  488  			// Need to focus editor before so current editor becomes active and the command is properly executed
  489  			this.editor.focus();
  490: 			this.telemetryService.publicLog2<
  491  				WorkbenchActionExecutedEvent,
  492  				WorkbenchActionExecutedClassification
  493  			>("workbenchActionExecuted", {
  494  				id: ChangeLanguageAction.ID,
  495  				from: "hint",

  499  		};
  500
  501  		const snippetOnClickOrTap = async (e: UIEvent) => {
  502  			e.stopPropagation();
  503
  504: 			this.telemetryService.publicLog2<
  505  				WorkbenchActionExecutedEvent,
  506  				WorkbenchActionExecutedClassification
  507  			>("workbenchActionExecuted", {
  508  				id: ApplyFileSnippetAction.Id,
  509  				from: "hint",

  514  		const chooseEditorOnClickOrTap = async (e: UIEvent) => {
  515  			e.stopPropagation();
  516
  517  			const activeEditorInput =
  518  				this.editorGroupsService.activeGroup.activeEditor;
  519: 			this.telemetryService.publicLog2<
  520  				WorkbenchActionExecutedEvent,
  521  				WorkbenchActionExecutedClassification
  522  			>("workbenchActionExecuted", {
  523  				id: "welcome.showNewFileEntries",
  524  				from: "hint",
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\comments\browser\commentsView.ts:

```sh
   27  import {
   28  	IStorageService,
   29  	StorageScope,
   30  	StorageTarget,
   31  } from "vs/platform/storage/common/storage";
   32: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   33  import { IThemeService } from "vs/platform/theme/common/themeService";
   34  import { IUriIdentityService } from "vs/platform/uriIdentity/common/uriIdentity";
   35  import { registerNavigableContainer } from "vs/workbench/browser/actions/widgetNavigationCommands";
   36  import { ResourceLabels } from "vs/workbench/browser/labels";
   37  import {

  195  		@IContextMenuService contextMenuService: IContextMenuService,
  196  		@IKeybindingService keybindingService: IKeybindingService,
  197  		@IOpenerService openerService: IOpenerService,
  198  		@IThemeService themeService: IThemeService,
  199  		@ICommentService private readonly commentService: ICommentService,
  200: 		@ITelemetryService telemetryService: ITelemetryService,
  201  		@IHoverService hoverService: IHoverService,
  202  		@IUriIdentityService
  203  		private readonly uriIdentityService: IUriIdentityService,
  204  		@IStorageService storageService: IStorageService,
  205  		@IPathService private readonly pathService: IPathService,

  232  			contextKeyService,
  233  			viewDescriptorService,
  234  			instantiationService,
  235  			openerService,
  236  			themeService,
  237: 			telemetryService,
  238  			hoverService,
  239  		);
  240  		this.hasCommentsContextKey =
  241  			CONTEXT_KEY_HAS_COMMENTS.bindTo(contextKeyService);
  242  		this.someCommentsExpandedContextKey =
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\debug\browser\breakpointsView.ts:

```sh
   64  import { ILabelService } from "vs/platform/label/common/label";
   65  import { WorkbenchList } from "vs/platform/list/browser/listService";
   66  import { INotificationService } from "vs/platform/notification/common/notification";
   67  import { IOpenerService } from "vs/platform/opener/common/opener";
   68  import { IQuickInputService } from "vs/platform/quickinput/common/quickInput";
   69: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   70  import { defaultInputBoxStyles } from "vs/platform/theme/browser/defaultStyles";
   71  import { IThemeService } from "vs/platform/theme/common/themeService";
   72  import {
   73  	ViewAction,
   74  	ViewPane,

  190  		private readonly contextViewService: IContextViewService,
  191  		@IConfigurationService configurationService: IConfigurationService,
  192  		@IViewDescriptorService viewDescriptorService: IViewDescriptorService,
  193  		@IContextKeyService contextKeyService: IContextKeyService,
  194  		@IOpenerService openerService: IOpenerService,
  195: 		@ITelemetryService telemetryService: ITelemetryService,
  196  		@ILabelService private readonly labelService: ILabelService,
  197  		@IMenuService menuService: IMenuService,
  198  		@IHoverService hoverService: IHoverService,
  199  		@ILanguageService private readonly languageService: ILanguageService,
  200  	) {

  206  			contextKeyService,
  207  			viewDescriptorService,
  208  			instantiationService,
  209  			openerService,
  210  			themeService,
  211: 			telemetryService,
  212  			hoverService,
  213  		);
  214
  215  		this.menu = menuService.createMenu(
  216  			MenuId.DebugBreakpointsContext,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\debug\browser\callStackView.ts:

```sh
   63  import { IKeybindingService } from "vs/platform/keybinding/common/keybinding";
   64  import { ILabelService } from "vs/platform/label/common/label";
   65  import { WorkbenchCompressibleAsyncDataTree } from "vs/platform/list/browser/listService";
   66  import { INotificationService } from "vs/platform/notification/common/notification";
   67  import { IOpenerService } from "vs/platform/opener/common/opener";
   68: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   69  import {
   70  	asCssVariable,
   71  	textLinkForeground,
   72  } from "vs/platform/theme/common/colorRegistry";
   73  import { IThemeService } from "vs/platform/theme/common/themeService";

  266  		@IViewDescriptorService viewDescriptorService: IViewDescriptorService,
  267  		@IConfigurationService configurationService: IConfigurationService,
  268  		@IContextKeyService contextKeyService: IContextKeyService,
  269  		@IOpenerService openerService: IOpenerService,
  270  		@IThemeService themeService: IThemeService,
  271: 		@ITelemetryService telemetryService: ITelemetryService,
  272  		@IHoverService hoverService: IHoverService,
  273  		@IMenuService private readonly menuService: IMenuService,
  274  	) {
  275  		super(
  276  			options,

  280  			contextKeyService,
  281  			viewDescriptorService,
  282  			instantiationService,
  283  			openerService,
  284  			themeService,
  285: 			telemetryService,
  286  			hoverService,
  287  		);
  288
  289  		// Create scheduler to prevent unnecessary flashing of tree when reacting to changes
  290  		this.onCallStackChangeScheduler = this._register(
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\debug\browser\debugService.ts:

```sh
   145  	}>;
   146  	private readonly restartingSessions = new Set<IDebugSession>();
   147  	private debugStorage: DebugStorage;
   148  	private model: DebugModel;
   149  	private viewModel: ViewModel;
   150: 	private telemetry: DebugTelemetry;
   151  	private taskRunner: DebugTaskRunner;
   152  	private configurationManager: ConfigurationManager;
   153  	private adapterManager: AdapterManager;
   154  	private readonly disposables = new DisposableStore();
   155  	private debugType!: IContextKey<string>;

   231
   232  		this.model = this.instantiationService.createInstance(
   233  			DebugModel,
   234  			this.debugStorage,
   235  		);
   236: 		this.telemetry = this.instantiationService.createInstance(
   237  			DebugTelemetry,
   238  			this.model,
   239  		);
   240
   241  		this.viewModel = new ViewModel(contextKeyService);

   978
   979  		return false;
   980  	}
   981
   982  	/**
   983: 	 * instantiates the new session, initializes the session, registers session listeners and reports telemetry
   984  	 */
   985  	private async doCreateSession(
   986  		sessionId: string,
   987  		root: IWorkspaceFolder | undefined,
   988  		configuration: { resolved: IConfig; unresolved: IConfig | undefined },

  1120  			const launchJsonExists =
  1121  				!!session.root &&
  1122  				!!this.configurationService.getValue<IGlobalConfig>("launch", {
  1123  					resource: session.root.uri,
  1124  				});
  1125: 			await this.telemetry.logDebugSessionStart(dbgr!, launchJsonExists);
  1126
  1127  			if (
  1128  				forceFocus ||
  1129  				!this.viewModel.focusedSession ||
  1130  				(session.parentSession === this.viewModel.focusedSession &&

  1191  								adapterExitEvent.error.message ||
  1192  									adapterExitEvent.error.toString(),
  1193  							),
  1194  						);
  1195  					}
  1196: 					this.telemetry.logDebugSessionStop(
  1197  						session,
  1198  						adapterExitEvent,
  1199  					);
  1200  				}
  1201
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\debug\browser\debugSession.ts:

```sh
    40  import { IProductService } from "vs/platform/product/common/productService";
    41  import {
    42  	ICustomEndpointTelemetryService,
    43  	ITelemetryService,
    44  	TelemetryLevel,
    45: } from "vs/platform/telemetry/common/telemetry";
    46  import { IUriIdentityService } from "vs/platform/uriIdentity/common/uriIdentity";
    47  import {
    48  	IWorkspaceContextService,
    49  	IWorkspaceFolder,
    50  } from "vs/platform/workspace/common/workspace";

   165  		},
   166  		public root: IWorkspaceFolder | undefined,
   167  		private model: DebugModel,
   168  		options: IDebugSessionOptions | undefined,
   169  		@IDebugService private readonly debugService: IDebugService,
   170: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
   171  		@IHostService private readonly hostService: IHostService,
   172  		@IConfigurationService
   173  		private readonly configurationService: IConfigurationService,
   174  		@IPaneCompositePartService
   175  		private readonly paneCompositeService: IPaneCompositePartService,

  1868  				outputQueue.queue(async () => {
  1869  					if (!event.body || !this.raw) {
  1870  						return;
  1871  					}
  1872
  1873: 					if (event.body.category === "telemetry") {
  1874: 						// only log telemetry events from debug adapter if the debug extension provided the telemetry key
  1875: 						// and the user opted in telemetry
  1876: 						const telemetryEndpoint =
  1877  							this.raw.dbgr.getCustomTelemetryEndpoint();
  1878  						if (
  1879: 							telemetryEndpoint &&
  1880: 							this.telemetryService.telemetryLevel !==
  1881  								TelemetryLevel.NONE
  1882  						) {
  1883  							// __GDPR__TODO__ We're sending events in the name of the debug extension and we can not ensure that those are declared correctly.
  1884  							let data = event.body.data;
  1885  							if (
  1886: 								!telemetryEndpoint.sendErrorTelemetry &&
  1887  								event.body.data
  1888  							) {
  1889  								data = filterExceptionsFromTelemetry(
  1890  									event.body.data,
  1891  								);
  1892  							}
  1893
  1894  							this.customEndpointTelemetryService.publicLog(
  1895: 								telemetryEndpoint,
  1896  								event.body.output,
  1897  								data,
  1898  							);
  1899  						}
  1900
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\debug\browser\debugToolBar.ts:

```sh
   70  import {
   71  	IStorageService,
   72  	StorageScope,
   73  	StorageTarget,
   74  } from "vs/platform/storage/common/storage";
   75: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   76  import {
   77  	widgetBorder,
   78  	widgetShadow,
   79  } from "vs/platform/theme/common/colorRegistry";
   80  import { IThemeService, Themable } from "vs/platform/theme/common/themeService";

  158  	);
  159
  160  	constructor(
  161  		@INotificationService
  162  		private readonly notificationService: INotificationService,
  163: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
  164  		@IDebugService private readonly debugService: IDebugService,
  165  		@IWorkbenchLayoutService
  166  		private readonly layoutService: IWorkbenchLayoutService,
  167  		@IStorageService private readonly storageService: IStorageService,
  168  		@IConfigurationService

  317  				// check for error
  318  				if (e.error && !errors.isCancellationError(e.error)) {
  319  					this.notificationService.warn(e.error);
  320  				}
  321
  322: 				// log in telemetry
  323: 				this.telemetryService.publicLog2<
  324  					WorkbenchActionExecutedEvent,
  325  					WorkbenchActionExecutedClassification
  326  				>("workbenchActionExecuted", {
  327  					id: e.action.id,
  328  					from: "debugActionsWidget",
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\debug\browser\debugViewlet.ts:

```sh
   37  	ServicesAccessor,
   38  } from "vs/platform/instantiation/common/instantiation";
   39  import { IProgressService } from "vs/platform/progress/common/progress";
   40  import { IQuickInputService } from "vs/platform/quickinput/common/quickInput";
   41  import { IStorageService } from "vs/platform/storage/common/storage";
   42: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   43  import { IThemeService } from "vs/platform/theme/common/themeService";
   44  import { IWorkspaceContextService } from "vs/platform/workspace/common/workspace";
   45  import { ViewPane } from "vs/workbench/browser/parts/views/viewPane";
   46  import {
   47  	ViewPaneContainer,

   93  		new DisposableStore(),
   94  	);
   95
   96  	constructor(
   97  		@IWorkbenchLayoutService layoutService: IWorkbenchLayoutService,
   98: 		@ITelemetryService telemetryService: ITelemetryService,
   99  		@IProgressService private readonly progressService: IProgressService,
  100  		@IDebugService private readonly debugService: IDebugService,
  101  		@IInstantiationService instantiationService: IInstantiationService,
  102  		@IWorkspaceContextService contextService: IWorkspaceContextService,
  103  		@IStorageService storageService: IStorageService,

  116  			{ mergeViewWithContainerWhenSingleView: true },
  117  			instantiationService,
  118  			configurationService,
  119  			layoutService,
  120  			contextMenuService,
  121: 			telemetryService,
  122  			extensionService,
  123  			themeService,
  124  			storageService,
  125  			contextService,
  126  			viewDescriptorService,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\debug\browser\disassemblyView.ts:

```sh
   38  import { TextEditorSelectionRevealType } from "vs/platform/editor/common/editor";
   39  import { IInstantiationService } from "vs/platform/instantiation/common/instantiation";
   40  import { WorkbenchTable } from "vs/platform/list/browser/listService";
   41  import { ILogService } from "vs/platform/log/common/log";
   42  import { IStorageService } from "vs/platform/storage/common/storage";
   43: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   44  import { editorBackground } from "vs/platform/theme/common/colorRegistry";
   45  import { IThemeService } from "vs/platform/theme/common/themeService";
   46  import { IUriIdentityService } from "vs/platform/uriIdentity/common/uriIdentity";
   47  import { EditorPane } from "vs/workbench/browser/parts/editor/editorPane";
   48  import { IWorkbenchContribution } from "vs/workbench/common/contributions";

  120  	private _loadingLock: boolean = false;
  121  	private readonly _referenceToMemoryAddress = new Map<string, bigint>();
  122
  123  	constructor(
  124  		group: IEditorGroup,
  125: 		@ITelemetryService telemetryService: ITelemetryService,
  126  		@IThemeService themeService: IThemeService,
  127  		@IStorageService storageService: IStorageService,
  128  		@IConfigurationService
  129  		private readonly _configurationService: IConfigurationService,
  130  		@IInstantiationService

  132  		@IDebugService private readonly _debugService: IDebugService,
  133  	) {
  134  		super(
  135  			DISASSEMBLY_VIEW_ID,
  136  			group,
  137: 			telemetryService,
  138  			themeService,
  139  			storageService,
  140  		);
  141
  142  		this._disassembledInstructions = undefined;
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\debug\browser\loadedScriptsView.ts:

```sh
   41  } from "vs/platform/instantiation/common/instantiation";
   42  import { IKeybindingService } from "vs/platform/keybinding/common/keybinding";
   43  import { ILabelService } from "vs/platform/label/common/label";
   44  import { WorkbenchCompressibleObjectTree } from "vs/platform/list/browser/listService";
   45  import { IOpenerService } from "vs/platform/opener/common/opener";
   46: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   47  import { IThemeService } from "vs/platform/theme/common/themeService";
   48  import {
   49  	IWorkspaceContextService,
   50  	IWorkspaceFolder,
   51  } from "vs/platform/workspace/common/workspace";

  524  		@IDebugService private readonly debugService: IDebugService,
  525  		@ILabelService private readonly labelService: ILabelService,
  526  		@IPathService private readonly pathService: IPathService,
  527  		@IOpenerService openerService: IOpenerService,
  528  		@IThemeService themeService: IThemeService,
  529: 		@ITelemetryService telemetryService: ITelemetryService,
  530  		@IHoverService hoverService: IHoverService,
  531  	) {
  532  		super(
  533  			options,
  534  			keybindingService,

  537  			contextKeyService,
  538  			viewDescriptorService,
  539  			instantiationService,
  540  			openerService,
  541  			themeService,
  542: 			telemetryService,
  543  			hoverService,
  544  		);
  545  		this.loadedScriptsItemType =
  546  			CONTEXT_LOADED_SCRIPTS_ITEM_TYPE.bindTo(contextKeyService);
  547  	}
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\debug\browser\rawDebugSession.ts:

```sh
   59  	private debugAdapterStopped = false;
   60  	private inShutdown = false;
   61  	private terminated = false;
   62  	private firedAdapterExitEvent = false;
   63
   64: 	// telemetry
   65  	private startTime = 0;
   66  	private didReceiveStoppedEvent = false;
   67
   68  	// DAP events
   69  	private readonly _onDidInitialize =

  151  						)).body.capabilities;
  152  						this.mergeCapabilities(capabilities);
  153  					}
  154  					break;
  155  				case "stopped":
  156: 					this.didReceiveStoppedEvent = true; // telemetry: remember that debugger stopped successfully
  157  					this.stoppedSinceLastStep = true;
  158  					this._onDidStop.fire(<DebugProtocol.StoppedEvent>event);
  159  					break;
  160  				case "continued":
  161  					this.allThreadsContinued =

  314  	}
  315
  316  	//---- DebugAdapter lifecycle
  317
  318  	/**
  319: 	 * Starts the underlying debug adapter and tracks the session time for telemetry.
  320  	 */
  321  	async start(): Promise<void> {
  322  		if (!this.debugAdapter) {
  323  			return Promise.reject(
  324  				new Error(
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\debug\browser\repl.ts:

```sh
   93  import {
   94  	IStorageService,
   95  	StorageScope,
   96  	StorageTarget,
   97  } from "vs/platform/storage/common/storage";
   98: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   99  import {
  100  	editorForeground,
  101  	resolveColorValue,
  102  } from "vs/platform/theme/common/colorRegistry";
  103  import { IThemeService } from "vs/platform/theme/common/themeService";

  224  		private readonly textResourcePropertiesService: ITextResourcePropertiesService,
  225  		@IEditorService private readonly editorService: IEditorService,
  226  		@IKeybindingService
  227  		protected override readonly keybindingService: IKeybindingService,
  228  		@IOpenerService openerService: IOpenerService,
  229: 		@ITelemetryService telemetryService: ITelemetryService,
  230  		@IHoverService hoverService: IHoverService,
  231  		@IMenuService menuService: IMenuService,
  232  		@ILanguageFeaturesService
  233  		private readonly languageFeaturesService: ILanguageFeaturesService,
  234  		@ILogService private readonly logService: ILogService,

  267  			contextKeyService,
  268  			viewDescriptorService,
  269  			instantiationService,
  270  			openerService,
  271  			themeService,
  272: 			telemetryService,
  273  			hoverService,
  274  		);
  275
  276  		this.menu = menuService.createMenu(
  277  			MenuId.DebugConsoleContext,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\debug\browser\variablesView.ts:

```sh
    61  import { IKeybindingService } from "vs/platform/keybinding/common/keybinding";
    62  import { WorkbenchAsyncDataTree } from "vs/platform/list/browser/listService";
    63  import { INotificationService } from "vs/platform/notification/common/notification";
    64  import { IOpenerService } from "vs/platform/opener/common/opener";
    65  import { ProgressLocation } from "vs/platform/progress/common/progress";
    66: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
    67  import { IThemeService } from "vs/platform/theme/common/themeService";
    68  import {
    69  	ViewAction,
    70  	ViewPane,
    71  } from "vs/workbench/browser/parts/views/viewPane";

   161  		@IInstantiationService instantiationService: IInstantiationService,
   162  		@IViewDescriptorService viewDescriptorService: IViewDescriptorService,
   163  		@IContextKeyService contextKeyService: IContextKeyService,
   164  		@IOpenerService openerService: IOpenerService,
   165  		@IThemeService themeService: IThemeService,
   166: 		@ITelemetryService telemetryService: ITelemetryService,
   167  		@IHoverService hoverService: IHoverService,
   168  		@IMenuService private readonly menuService: IMenuService,
   169  	) {
   170  		super(
   171  			options,

   175  			contextKeyService,
   176  			viewDescriptorService,
   177  			instantiationService,
   178  			openerService,
   179  			themeService,
   180: 			telemetryService,
   181  			hoverService,
   182  		);
   183
   184  		// Use scheduler to prevent unnecessary flashing
   185  		this.updateTreeScheduler = new RunOnceScheduler(async () => {

  1140  			IExtensionsWorkbenchService,
  1141  		);
  1142  		const editorService = accessor.get(IEditorService);
  1143  		const notificationService = accessor.get(INotificationService);
  1144  		const extensionService = accessor.get(IExtensionService);
  1145: 		const telemetryService = accessor.get(ITelemetryService);
  1146
  1147  		const ext = await extensionService.getExtension(
  1148  			HEX_EDITOR_EXTENSION_ID,
  1149  		);
  1150  		if (

  1158  				"debug/didViewMemory" : {
  1159  					"owner": "connor4312",
  1160  					"debugType" : { "classification": "SystemMetaData", "purpose": "FeatureInsight" }
  1161  				}
  1162  			*/
  1163: 			telemetryService.publicLog("debug/didViewMemory", {
  1164  				debugType: debugService.getModel().getSession(sessionId)
  1165  					?.configuration.type,
  1166  			});
  1167
  1168  			await editorService.openEditor(
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\debug\browser\watchExpressionsView.ts:

```sh
   52  	ServicesAccessor,
   53  } from "vs/platform/instantiation/common/instantiation";
   54  import { IKeybindingService } from "vs/platform/keybinding/common/keybinding";
   55  import { WorkbenchAsyncDataTree } from "vs/platform/list/browser/listService";
   56  import { IOpenerService } from "vs/platform/opener/common/opener";
   57: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   58  import { IThemeService } from "vs/platform/theme/common/themeService";
   59  import {
   60  	ViewAction,
   61  	ViewPane,
   62  } from "vs/workbench/browser/parts/views/viewPane";

  122  		@IViewDescriptorService viewDescriptorService: IViewDescriptorService,
  123  		@IConfigurationService configurationService: IConfigurationService,
  124  		@IContextKeyService contextKeyService: IContextKeyService,
  125  		@IOpenerService openerService: IOpenerService,
  126  		@IThemeService themeService: IThemeService,
  127: 		@ITelemetryService telemetryService: ITelemetryService,
  128  		@IHoverService hoverService: IHoverService,
  129  		@IMenuService menuService: IMenuService,
  130  	) {
  131  		super(
  132  			options,

  136  			contextKeyService,
  137  			viewDescriptorService,
  138  			instantiationService,
  139  			openerService,
  140  			themeService,
  141: 			telemetryService,
  142  			hoverService,
  143  		);
  144
  145  		this.menu = menuService.createMenu(
  146  			MenuId.DebugWatchContext,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\debug\browser\welcomeView.ts:

```sh
   24  import {
   25  	IStorageService,
   26  	StorageScope,
   27  	StorageTarget,
   28  } from "vs/platform/storage/common/storage";
   29: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   30  import { IThemeService } from "vs/platform/theme/common/themeService";
   31  import {
   32  	OpenFileAction,
   33  	OpenFileFolderAction,
   34  	OpenFolderAction,

   82  		@IEditorService private readonly editorService: IEditorService,
   83  		@IInstantiationService instantiationService: IInstantiationService,
   84  		@IViewDescriptorService viewDescriptorService: IViewDescriptorService,
   85  		@IOpenerService openerService: IOpenerService,
   86  		@IStorageService storageSevice: IStorageService,
   87: 		@ITelemetryService telemetryService: ITelemetryService,
   88  		@IHoverService hoverService: IHoverService,
   89  	) {
   90  		super(
   91  			options,
   92  			keybindingService,

   95  			contextKeyService,
   96  			viewDescriptorService,
   97  			instantiationService,
   98  			openerService,
   99  			themeService,
  100: 			telemetryService,
  101  			hoverService,
  102  		);
  103
  104  		this.debugStartLanguageContext =
  105  			CONTEXT_DEBUG_START_LANGUAGE.bindTo(contextKeyService);
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\debug\common\debug.ts:

```sh
18 import { ITextModel as EditorIModel } from "vs/editor/common/model"
19 import * as nls from "vs/nls"
20 import { ConfigurationTarget } from "vs/platform/configuration/common/configuration"
21 import { RawContextKey } from "vs/platform/contextkey/common/contextkey"
22 import { createDecorator } from "vs/platform/instantiation/common/instantiation"
23: import { ITelemetryEndpoint } from "vs/platform/telemetry/common/telemetry"
24 import { IWorkspaceFolder } from "vs/platform/workspace/common/workspace"
25 import { IEditorPane } from "vs/workbench/common/editor"
26 import { DebugCompoundRoot } from "vs/workbench/contrib/debug/common/debugCompoundRoot"
27 import {
28 IDataBreakpointOptions,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\debug\common\debugger.ts:

```sh
19 ContextKeyExpr,
20 ContextKeyExpression,
21 IContextKeyService,
22 } from "vs/platform/contextkey/common/contextkey"
23 import { IExtensionDescription } from "vs/platform/extensions/common/extensions"
24: import { ITelemetryEndpoint } from "vs/platform/telemetry/common/telemetry"
25: import { cleanRemoteAuthority } from "vs/platform/telemetry/common/telemetryUtils"
26 import { IWorkspaceFolder } from "vs/platform/workspace/common/workspace"
27 import {
28 DebugConfigurationProviderTriggerKind,
29 debuggerDisabledMessage,
30 IAdapterManager,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\debug\common\debugProtocol.d.ts:

```sh
   223  				Values:
   224  				'console': Show the output in the client's default message UI, e.g. a 'debug console'. This category should only be used for informational output from the debugger (as opposed to the debuggee).
   225  				'important': A hint for the client to show the output in the client's UI for important and highly visible information, e.g. as a popup notification. This category should only be used for important messages from the debugger (as opposed to the debuggee). Since this category value is a hint, clients might ignore the hint and assume the `console` category.
   226  				'stdout': Show the output as normal program output from the debuggee.
   227  				'stderr': Show the output as error program output from the debuggee.
   228: 				'telemetry': Send the output to telemetry instead of showing it to the user.
   229  				etc.
   230  			*/
   231  			category?:
   232  				| "console"
   233  				| "important"
   234  				| "stdout"
   235  				| "stderr"
   236: 				| "telemetry"
   237  				| string;
   238  			/** The output to report. */
   239  			output: string;
   240  			/** Support for keeping an output log organized by grouping related messages.
   241  				'start': Start a new group in expanded mode. Subsequent output events are members of the group and should be shown indented.

   252  			source?: Source;
   253  			/** The source location's line where the output was produced. */
   254  			line?: number;
   255  			/** The position in `line` where the output was produced. It is measured in UTF-16 code units and the client capability `columnsStartAt1` determines whether it is 0- or 1-based. */
   256  			column?: number;
   257: 			/** Additional data to report. For the `telemetry` category the data is sent to telemetry, for the other categories the data is shown in JSON format. */
   258  			data?: any;
   259  			/** A reference that allows the client to request the location where the new value is declared. For example, if the logged value is function pointer, the adapter may be able to look up the function's location. This should be present only if the adapter is likely to be able to resolve the location.
   260
   261  				This reference shares the same lifetime as the `variablesReference`. See 'Lifetime of Object References' in the Overview section for details.
   262  			*/

  1863  	/** A structured message object. Used to return errors from requests. */
  1864  	interface Message {
  1865  		/** Unique (within a debug adapter implementation) identifier for the message. The purpose of these error IDs is to help extension authors that have the requirement that every user visible error message needs a corresponding error number, so that users or customer support can find information about the specific error more easily. */
  1866  		id: number;
  1867  		/** A format string for the message. Embedded variables have the form `{name}`.
  1868: 			If variable name starts with an underscore character, the variable does not contain user data (PII) and can be safely used for telemetry purposes.
  1869  		*/
  1870  		format: string;
  1871  		/** An object used as a dictionary for looking up the variables in the format string. */
  1872  		variables?: { [key: string]: string };
  1873: 		/** If true send to telemetry. */
  1874  		sendTelemetry?: boolean;
  1875  		/** If true show user. */
  1876  		showUser?: boolean;
  1877  		/** A url where additional information about this message can be found. */
  1878  		url?: string;
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\debug\common\debugTelemetry.ts:

```sh
   1  /*---------------------------------------------------------------------------------------------
   2   *  Copyright (c) Microsoft Corporation. All rights reserved.
   3   *  Licensed under the MIT License. See License.txt in the project root for license information.
   4   *--------------------------------------------------------------------------------------------*/
   5
   6: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   7  import {
   8  	AdapterEndEvent,
   9  	IDebugModel,
  10  	IDebugSession,
  11  } from "vs/workbench/contrib/debug/common/debug";
  12  import { Debugger } from "vs/workbench/contrib/debug/common/debugger";
  13
  14  export class DebugTelemetry {
  15  	constructor(
  16  		private readonly model: IDebugModel,
  17: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
  18  	) {}
  19
  20  	logDebugSessionStart(dbgr: Debugger, launchJsonExists: boolean) {
  21  		const extension = dbgr.getMainExtensionDescriptor();
  22  		/* __GDPR__

  29  				"extensionName": { "classification": "PublicNonPersonalData", "purpose": "FeatureInsight" },
  30  				"isBuiltin": { "classification": "SystemMetaData", "purpose": "FeatureInsight", "isMeasurement": true},
  31  				"launchJsonExists": { "classification": "SystemMetaData", "purpose": "FeatureInsight", "isMeasurement": true }
  32  			}
  33  		*/
  34: 		this.telemetryService.publicLog("debugSessionStart", {
  35  			type: dbgr.type,
  36  			breakpointCount: this.model.getBreakpoints().length,
  37  			exceptionBreakpoints: this.model.getExceptionBreakpoints(),
  38  			watchExpressionsCount: this.model.getWatchExpressions().length,
  39  			extensionName: extension.identifier.value,

  56  				"sessionLengthInSeconds": { "classification": "SystemMetaData", "purpose": "FeatureInsight", "isMeasurement": true },
  57  				"breakpointCount": { "classification": "SystemMetaData", "purpose": "FeatureInsight", "isMeasurement": true },
  58  				"watchExpressionsCount": { "classification": "SystemMetaData", "purpose": "FeatureInsight", "isMeasurement": true }
  59  			}
  60  		*/
  61: 		this.telemetryService.publicLog("debugSessionStop", {
  62  			type: session && session.configuration.type,
  63  			success:
  64  				adapterExitEvent.emittedStopped || breakpoints.length === 0,
  65  			sessionLengthInSeconds: adapterExitEvent.sessionLengthInSeconds,
  66  			breakpointCount: breakpoints.length,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\debug\node\telemetryApp.ts:

```sh
   2   *  Copyright (c) Microsoft Corporation. All rights reserved.
   3   *  Licensed under the MIT License. See License.txt in the project root for license information.
   4   *--------------------------------------------------------------------------------------------*/
   5
   6  import { Server } from "vs/base/parts/ipc/node/ipc.cp";
   7: import { TelemetryAppenderChannel } from "vs/platform/telemetry/common/telemetryIpc";
   8: import { OneDataSystemAppender } from "vs/platform/telemetry/node/1dsAppender";
   9
  10  const appender = new OneDataSystemAppender(
  11  	undefined,
  12  	false,
  13  	process.argv[2],

  15  	process.argv[4],
  16  );
  17  process.once("exit", () => appender.flush());
  18
  19  const channel = new TelemetryAppenderChannel([appender]);
  20: const server = new Server("telemetry");
  21: server.registerChannel("telemetryAppender", channel);
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\editSessions\browser\editSessions.contribution.ts:

```sh
    81  import {
    82  	IStorageService,
    83  	StorageScope,
    84  	StorageTarget,
    85  } from "vs/platform/storage/common/storage";
    86: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
    87  import { IUriIdentityService } from "vs/platform/uriIdentity/common/uriIdentity";
    88  import { IUserDataProfilesService } from "vs/platform/userDataProfile/common/userDataProfile";
    89  import {
    90  	IUserDataSynchroniser,
    91  	UserDataSyncErrorCode,

   268  		@IEditSessionsStorageService
   269  		private readonly editSessionsStorageService: IEditSessionsStorageService,
   270  		@IFileService private readonly fileService: IFileService,
   271  		@IProgressService private readonly progressService: IProgressService,
   272  		@IOpenerService private readonly openerService: IOpenerService,
   273: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
   274  		@ISCMService private readonly scmService: ISCMService,
   275  		@INotificationService
   276  		private readonly notificationService: INotificationService,
   277  		@IDialogService private readonly dialogService: IDialogService,
   278  		@IEditSessionsLogService

   340  			undefined,
   341  			this.editSessionsStorageClient,
   342  			this.logService,
   343  			this.fileService,
   344  			this.environmentService,
   345: 			this.telemetryService,
   346  			this.configurationService,
   347  			this.storageService,
   348  			this.uriIdentityService,
   349  			this.workspaceIdentityService,
   350  			this.editSessionsStorageService,

   684  							workspaceUri;
   685  						if (!destination && !uri) {
   686  							destination =
   687  								await that.pickContinueEditSessionDestination();
   688  							if (!destination) {
   689: 								that.telemetryService.publicLog2<
   690  									ContinueOnEventOutcome,
   691  									ContinueOnClassificationOutcome
   692  								>("continueOn.editSessions.pick.outcome", {
   693  									outcome: "noSelection",
   694  								});

   706  							type ContinueWithEditSessionEvent = {};
   707  							type ContinueWithEditSessionClassification = {
   708  								owner: "joyceerhl";
   709  								comment: "Reporting when storing an edit session as part of the Continue On flow.";
   710  							};
   711: 							that.telemetryService.publicLog2<
   712  								ContinueWithEditSessionEvent,
   713  								ContinueWithEditSessionClassification
   714  							>("continueOn.editSessions.store");
   715
   716  							const cancellationTokenSource =

   730  										const ref = await that.storeEditSession(
   731  											false,
   732  											cancellationTokenSource.token,
   733  										);
   734  										if (ref !== undefined) {
   735: 											that.telemetryService.publicLog2<
   736  												ContinueOnEventOutcome,
   737  												ContinueOnClassificationOutcome
   738  											>(
   739  												"continueOn.editSessions.store.outcome",
   740  												{

   744  															ref,
   745  														),
   746  												},
   747  											);
   748  										} else {
   749: 											that.telemetryService.publicLog2<
   750  												ContinueOnEventOutcome,
   751  												ContinueOnClassificationOutcome
   752  											>(
   753  												"continueOn.editSessions.store.outcome",
   754  												{ outcome: "storeSkipped" },

   757  										return ref;
   758  									},
   759  									() => {
   760  										cancellationTokenSource.cancel();
   761  										cancellationTokenSource.dispose();
   762: 										that.telemetryService.publicLog2<
   763  											ContinueOnEventOutcome,
   764  											ContinueOnClassificationOutcome
   765  										>(
   766  											"continueOn.editSessions.store.outcome",
   767  											{ outcome: "storeCancelledByUser" },
   768  										);
   769  									},
   770  								);
   771  							} catch (ex) {
   772: 								that.telemetryService.publicLog2<
   773  									ContinueOnEventOutcome,
   774  									ContinueOnClassificationOutcome
   775  								>("continueOn.editSessions.store.outcome", {
   776  									outcome: "storeFailed",
   777  								});

   944  								type StoreEvent = {};
   945  								type StoreClassification = {
   946  									owner: "joyceerhl";
   947  									comment: "Reporting when the store edit session action is invoked.";
   948  								};
   949: 								that.telemetryService.publicLog2<
   950  									StoreEvent,
   951  									StoreClassification
   952  								>("editSessions.store");
   953
   954  								await that.storeEditSession(

  1010  				classification: "SystemMetaData";
  1011  				purpose: "FeatureInsight";
  1012  				comment: "The hash of the stored edit session id, for correlating success of stores and resumes.";
  1013  			};
  1014  		};
  1015: 		this.telemetryService.publicLog2<ResumeEvent, ResumeClassification>(
  1016  			"editSessions.resume",
  1017  		);
  1018
  1019  		performance.mark("code/willResumeEditSessionFromIdentifier");
  1020

  1062  					"client too old",
  1063  					"Please upgrade to a newer version of {0} to resume your working changes from the cloud.",
  1064  					this.productService.nameLong,
  1065  				),
  1066  			);
  1067: 			this.telemetryService.publicLog2<ResumeEvent, ResumeClassification>(
  1068  				"editSessions.resume.outcome",
  1069  				{
  1070  					hashedId: hashedEditSessionId(ref),
  1071  					outcome: "clientUpdateNeeded",
  1072  				},

  1139  				`Deleting edit session with ref ${ref} after successfully applying it to current workspace...`,
  1140  			);
  1141  			await this.editSessionsStorageService.delete("editSessions", ref);
  1142  			this.logService.info(`Deleted edit session with ref ${ref}.`);
  1143
  1144: 			this.telemetryService.publicLog2<ResumeEvent, ResumeClassification>(
  1145  				"editSessions.resume.outcome",
  1146  				{
  1147  					hashedId: hashedEditSessionId(ref),
  1148  					outcome: "resumeSucceeded",
  1149  				},

  1501
  1502  			if (ex instanceof UserDataSyncStoreError) {
  1503  				switch (ex.code) {
  1504  					case UserDataSyncErrorCode.TooLarge:
  1505  						// Uploading a payload can fail due to server size limits
  1506: 						this.telemetryService.publicLog2<
  1507  							UploadFailedEvent,
  1508  							UploadFailedClassification
  1509  						>("editSessions.upload.failed", { reason: "TooLarge" });
  1510  						this.notificationService.error(
  1511  							localize(

  1513  								"Your working changes exceed the size limit and cannot be stored.",
  1514  							),
  1515  						);
  1516  						break;
  1517  					default:
  1518: 						this.telemetryService.publicLog2<
  1519  							UploadFailedEvent,
  1520  							UploadFailedClassification
  1521  						>("editSessions.upload.failed", { reason: "unknown" });
  1522  						this.notificationService.error(
  1523  							localize(

  1575  		if (
  1576  			this.configurationService.getValue(
  1577  				useEditSessionsWithContinueOn,
  1578  			) === "off"
  1579  		) {
  1580: 			this.telemetryService.publicLog2<
  1581  				EditSessionsAuthCheckEvent,
  1582  				EditSessionsAuthCheckClassification
  1583  			>("continueOn.editSessions.canStore.outcome", {
  1584  				outcome: "disabledEditSessionsViaSetting",
  1585  			});

  1631  					quickpick.show();
  1632  				},
  1633  			);
  1634
  1635  			if (!continueWithCloudChanges) {
  1636: 				this.telemetryService.publicLog2<
  1637  					EditSessionsAuthCheckEvent,
  1638  					EditSessionsAuthCheckClassification
  1639  				>("continueOn.editSessions.canStore.outcome", {
  1640  					outcome: "didNotEnableEditSessionsWhenPrompted",
  1641  				});

  1643  			}
  1644
  1645  			const initialized =
  1646  				await this.editSessionsStorageService.initialize("write");
  1647  			if (!initialized) {
  1648: 				this.telemetryService.publicLog2<
  1649  					EditSessionsAuthCheckEvent,
  1650  					EditSessionsAuthCheckClassification
  1651  				>("continueOn.editSessions.canStore.outcome", {
  1652  					outcome: "didNotEnableEditSessionsWhenPrompted",
  1653  				});

  1930
  1931  			// Some continue on commands do not return a URI
  1932  			// to support extensions which want to be in control
  1933  			// of how the destination is opened
  1934  			if (uri === undefined) {
  1935: 				this.telemetryService.publicLog2<
  1936  					EvaluateContinueOnDestinationEvent,
  1937  					EvaluateContinueOnDestinationClassification
  1938  				>("continueOn.openDestination.outcome", {
  1939  					selection: command,
  1940  					outcome: "noDestinationUri",
  1941  				});
  1942  				return "noDestinationUri";
  1943  			}
  1944
  1945  			if (URI.isUri(uri)) {
  1946: 				this.telemetryService.publicLog2<
  1947  					EvaluateContinueOnDestinationEvent,
  1948  					EvaluateContinueOnDestinationClassification
  1949  				>("continueOn.openDestination.outcome", {
  1950  					selection: command,
  1951  					outcome: "resolvedUri",
  1952  				});
  1953  				return uri;
  1954  			}
  1955
  1956: 			this.telemetryService.publicLog2<
  1957  				EvaluateContinueOnDestinationEvent,
  1958  				EvaluateContinueOnDestinationClassification
  1959  			>("continueOn.openDestination.outcome", {
  1960  				selection: command,
  1961  				outcome: "invalidDestination",
  1962  			});
  1963  			return undefined;
  1964  		} catch (ex) {
  1965  			if (ex instanceof CancellationError) {
  1966: 				this.telemetryService.publicLog2<
  1967  					EvaluateContinueOnDestinationEvent,
  1968  					EvaluateContinueOnDestinationClassification
  1969  				>("continueOn.openDestination.outcome", {
  1970  					selection: command,
  1971  					outcome: "cancelled",
  1972  				});
  1973  			} else {
  1974: 				this.telemetryService.publicLog2<
  1975  					EvaluateContinueOnDestinationEvent,
  1976  					EvaluateContinueOnDestinationClassification
  1977  				>("continueOn.openDestination.outcome", {
  1978  					selection: command,
  1979  					outcome: "unknownError",
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\editSessions\common\workspaceStateSync.ts:

```sh
   18  	IStorageEntry,
   19  	IStorageService,
   20  	StorageScope,
   21  	StorageTarget,
   22  } from "vs/platform/storage/common/storage";
   23: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   24  import { IUriIdentityService } from "vs/platform/uriIdentity/common/uriIdentity";
   25  import { IUserDataProfile } from "vs/platform/userDataProfile/common/userDataProfile";
   26  import {
   27  	AbstractSynchroniser,
   28  	IAcceptResult,

  101  		collection: string | undefined,
  102  		userDataSyncStoreService: IUserDataSyncStoreService,
  103  		logService: IUserDataSyncLogService,
  104  		@IFileService fileService: IFileService,
  105  		@IEnvironmentService environmentService: IEnvironmentService,
  106: 		@ITelemetryService telemetryService: ITelemetryService,
  107  		@IConfigurationService configurationService: IConfigurationService,
  108  		@IStorageService storageService: IStorageService,
  109  		@IUriIdentityService uriIdentityService: IUriIdentityService,
  110  		@IWorkspaceIdentityService
  111  		private readonly workspaceIdentityService: IWorkspaceIdentityService,

  121  			environmentService,
  122  			storageService,
  123  			userDataSyncStoreService,
  124  			userDataSyncLocalStoreService,
  125  			userDataSyncEnablementService,
  126: 			telemetryService,
  127  			logService,
  128  			configurationService,
  129  			uriIdentityService,
  130  		);
  131  	}
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\extensions\browser\abstractRuntimeExtensionsEditor.ts:

```sh
   53  	INotificationService,
   54  	Severity,
   55  } from "vs/platform/notification/common/notification";
   56  import { Registry } from "vs/platform/registry/common/platform";
   57  import { IStorageService } from "vs/platform/storage/common/storage";
   58: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   59  import { editorBackground } from "vs/platform/theme/common/colorRegistry";
   60  import { IThemeService } from "vs/platform/theme/common/themeService";
   61  import { EditorPane } from "vs/workbench/browser/parts/editor/editorPane";
   62  import {
   63  	errorIcon,

  117  	private _elements: IRuntimeExtension[] | null;
  118  	private _updateSoon: RunOnceScheduler;
  119
  120  	constructor(
  121  		group: IEditorGroup,
  122: 		@ITelemetryService telemetryService: ITelemetryService,
  123  		@IThemeService themeService: IThemeService,
  124  		@IContextKeyService contextKeyService: IContextKeyService,
  125  		@IExtensionsWorkbenchService
  126  		private readonly _extensionsWorkbenchService: IExtensionsWorkbenchService,
  127  		@IExtensionService

  143  		@IHoverService private readonly _hoverService: IHoverService,
  144  	) {
  145  		super(
  146  			AbstractRuntimeExtensionsEditor.ID,
  147  			group,
  148: 			telemetryService,
  149  			themeService,
  150  			storageService,
  151  		);
  152
  153  		this._list = null;
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\extensions\browser\extensionEditor.ts:

```sh
    70  } from "vs/platform/instantiation/common/instantiation";
    71  import { KeybindingWeight } from "vs/platform/keybinding/common/keybindingsRegistry";
    72  import { INotificationService } from "vs/platform/notification/common/notification";
    73  import { IOpenerService } from "vs/platform/opener/common/opener";
    74  import { IStorageService } from "vs/platform/storage/common/storage";
    75: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
    76  import { defaultCheckboxStyles } from "vs/platform/theme/browser/defaultStyles";
    77  import {
    78  	buttonForeground,
    79  	buttonHoverBackground,
    80  	editorBackground,

   337
   338  	private showPreReleaseVersionContextKey: IContextKey<boolean> | undefined;
   339
   340  	constructor(
   341  		group: IEditorGroup,
   342: 		@ITelemetryService telemetryService: ITelemetryService,
   343  		@IInstantiationService
   344  		private readonly instantiationService: IInstantiationService,
   345  		@IPaneCompositePartService
   346  		private readonly paneCompositeService: IPaneCompositePartService,
   347  		@IExtensionsWorkbenchService

   371  		@IHoverService private readonly hoverService: IHoverService,
   372  	) {
   373  		super(
   374  			ExtensionEditor.ID,
   375  			group,
   376: 			telemetryService,
   377  			themeService,
   378  			storageService,
   379  		);
   380  		this.extensionReadme = null;
   381  		this.extensionChangelog = null;

  1009  			template.manifest = manifest;
  1010  		}
  1011
  1012  		this.renderNavbar(extension, manifest, template, preserveFocus);
  1013
  1014: 		// report telemetry
  1015  		const extRecommendations =
  1016  			this.extensionRecommendationsService.getAllRecommendationsWithReason();
  1017  		let recommendationsData = {};
  1018  		if (extRecommendations[extension.identifier.id.toLowerCase()]) {
  1019  			recommendationsData = {

  1029  			"${include}": [
  1030  				"${GalleryExtensionTelemetryData}"
  1031  			]
  1032  		}
  1033  		*/
  1034: 		this.telemetryService.publicLog("extensionGallery:openExtension", {
  1035: 			...extension.telemetryData,
  1036  			...recommendationsData,
  1037  		});
  1038  	}
  1039
  1040  	private renderNavbar(
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\extensions\browser\extensionRecommendationNotificationService.ts:

```sh
   48  import {
   49  	IStorageService,
   50  	StorageScope,
   51  	StorageTarget,
   52  } from "vs/platform/storage/common/storage";
   53: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   54  import { IUriIdentityService } from "vs/platform/uriIdentity/common/uriIdentity";
   55  import {
   56  	IUserDataSyncEnablementService,
   57  	SyncResource,
   58  } from "vs/platform/userDataSync/common/userDataSync";

  245  		@IConfigurationService
  246  		private readonly configurationService: IConfigurationService,
  247  		@IStorageService private readonly storageService: IStorageService,
  248  		@INotificationService
  249  		private readonly notificationService: INotificationService,
  250: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
  251  		@IInstantiationService
  252  		private readonly instantiationService: IInstantiationService,
  253  		@IExtensionsWorkbenchService
  254  		private readonly extensionsWorkbenchService: IExtensionsWorkbenchService,
  255  		@IWorkbenchExtensionManagementService

  297  		return this.promptRecommendationsNotification(
  298  			{ ...extensionRecommendations, extensions },
  299  			{
  300  				onDidInstallRecommendedExtensions: (extensions: IExtension[]) =>
  301  					extensions.forEach((extension) =>
  302: 						this.telemetryService.publicLog2<
  303  							{
  304  								userReaction: string;
  305  								extensionId: string;
  306  								source: string;
  307  							},

  314  							),
  315  						}),
  316  					),
  317  				onDidShowRecommendedExtensions: (extensions: IExtension[]) =>
  318  					extensions.forEach((extension) =>
  319: 						this.telemetryService.publicLog2<
  320  							{
  321  								userReaction: string;
  322  								extensionId: string;
  323  								source: string;
  324  							},

  331  							),
  332  						}),
  333  					),
  334  				onDidCancelRecommendedExtensions: (extensions: IExtension[]) =>
  335  					extensions.forEach((extension) =>
  336: 						this.telemetryService.publicLog2<
  337  							{
  338  								userReaction: string;
  339  								extensionId: string;
  340  								source: string;
  341  							},

  353  				) => {
  354  					for (const extension of extensions) {
  355  						this.addToImportantRecommendationsIgnore(
  356  							extension.identifier.id,
  357  						);
  358: 						this.telemetryService.publicLog2<
  359  							{
  360  								userReaction: string;
  361  								extensionId: string;
  362  								source: string;
  363  							},

  444  					"this repository",
  445  				),
  446  			},
  447  			{
  448  				onDidInstallRecommendedExtensions: () =>
  449: 					this.telemetryService.publicLog2<
  450  						{ userReaction: string },
  451  						ExtensionWorkspaceRecommendationsNotificationClassification
  452  					>("extensionWorkspaceRecommendations:popup", {
  453  						userReaction: "install",
  454  					}),
  455  				onDidShowRecommendedExtensions: () =>
  456: 					this.telemetryService.publicLog2<
  457  						{ userReaction: string },
  458  						ExtensionWorkspaceRecommendationsNotificationClassification
  459  					>("extensionWorkspaceRecommendations:popup", {
  460  						userReaction: "show",
  461  					}),
  462  				onDidCancelRecommendedExtensions: () =>
  463: 					this.telemetryService.publicLog2<
  464  						{ userReaction: string },
  465  						ExtensionWorkspaceRecommendationsNotificationClassification
  466  					>("extensionWorkspaceRecommendations:popup", {
  467  						userReaction: "cancelled",
  468  					}),
  469  				onDidNeverShowRecommendedExtensionsAgain: () => {
  470: 					this.telemetryService.publicLog2<
  471  						{ userReaction: string },
  472  						ExtensionWorkspaceRecommendationsNotificationClassification
  473  					>("extensionWorkspaceRecommendations:popup", {
  474  						userReaction: "neverShowAgain",
  475  					});
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\extensions\browser\extensionRecommendationsService.ts:

```sh
   18  } from "vs/platform/extensionManagement/common/extensionManagement";
   19  import { areSameExtensions } from "vs/platform/extensionManagement/common/extensionManagementUtil";
   20  import { IExtensionRecommendationNotificationService } from "vs/platform/extensionRecommendations/common/extensionRecommendations";
   21  import { IInstantiationService } from "vs/platform/instantiation/common/instantiation";
   22  import { IRemoteExtensionsScannerService } from "vs/platform/remote/common/remoteExtensionsScanner";
   23: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   24  import { ConfigBasedRecommendations } from "vs/workbench/contrib/extensions/browser/configBasedRecommendations";
   25  import { ExeBasedRecommendations } from "vs/workbench/contrib/extensions/browser/exeBasedRecommendations";
   26  import { ExtensionRecommendation } from "vs/workbench/contrib/extensions/browser/extensionRecommendations";
   27  import { FileBasedRecommendations } from "vs/workbench/contrib/extensions/browser/fileBasedRecommendations";
   28  import { KeymapRecommendations } from "vs/workbench/contrib/extensions/browser/keymapRecommendations";

   83  	constructor(
   84  		@IInstantiationService instantiationService: IInstantiationService,
   85  		@ILifecycleService private readonly lifecycleService: ILifecycleService,
   86  		@IExtensionGalleryService
   87  		private readonly galleryService: IExtensionGalleryService,
   88: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
   89  		@IEnvironmentService
   90  		private readonly environmentService: IEnvironmentService,
   91  		@IExtensionManagementService
   92  		private readonly extensionManagementService: IExtensionManagementService,
   93  		@IExtensionIgnoredRecommendationsService

  181  				({ extensionId, isRecommended }) => {
  182  					if (!isRecommended) {
  183  						const reason =
  184  							this.getAllRecommendationsWithReason()[extensionId];
  185  						if (reason && reason.reasonId) {
  186: 							this.telemetryService.publicLog2<
  187  								{
  188  									extensionId: string;
  189  									recommendationReason: ExtensionRecommendationReason;
  190  								},
  191  								IgnoreRecommendationClassification

  381  							"${include}": [
  382  								"${GalleryExtensionTelemetryData}"
  383  							]
  384  						}
  385  					*/
  386: 					this.telemetryService.publicLog(
  387  						"extensionGallery:install:recommendations",
  388  						{
  389: 							...e.source.telemetryData,
  390  							recommendationReason: recommendationReason.reasonId,
  391  						},
  392  					);
  393  				}
  394  			}
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\extensions\browser\extensionsActions.ts:

```sh
   105  	IQuickInputService,
   106  	IQuickPickItem,
   107  	QuickPickItem,
   108  } from "vs/platform/quickinput/common/quickInput";
   109  import { Registry } from "vs/platform/registry/common/platform";
   110: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   111  import {
   112  	buttonBackground,
   113  	buttonForeground,
   114  	buttonHoverBackground,
   115  	buttonSeparator,

   661  		private readonly workbenchThemeService: IWorkbenchThemeService,
   662  		@ILabelService private readonly labelService: ILabelService,
   663  		@IDialogService private readonly dialogService: IDialogService,
   664  		@IPreferencesService
   665  		private readonly preferencesService: IPreferencesService,
   666: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
   667  		@IWorkspaceContextService
   668  		private readonly contextService: IWorkspaceContextService,
   669  	) {
   670  		super(
   671  			"extensions.install",

   859  				"${include}": [
   860  					"${GalleryExtensionTelemetryData}"
   861  				]
   862  			}
   863  		*/
   864: 		this.telemetryService.publicLog("extensions:action:install", {
   865: 			...this.extension.telemetryData,
   866  			actionId: this.id,
   867  		});
   868
   869  		const extension = await this.install(this.extension);
   870

  2791  		@IExtensionsWorkbenchService
  2792  		private readonly extensionsWorkbenchService: IExtensionsWorkbenchService,
  2793  		@IUpdateService private readonly updateService: IUpdateService,
  2794  		@IExtensionService private readonly extensionService: IExtensionService,
  2795  		@IProductService private readonly productService: IProductService,
  2796: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
  2797  	) {
  2798  		super(
  2799  			"extensions.runtimeState",
  2800  			"",
  2801  			ExtensionRuntimeStateAction.DisabledClass,

  2879  			};
  2880  		};
  2881  		type ExtensionRuntimeStateActionEvent = {
  2882  			action: string;
  2883  		};
  2884: 		this.telemetryService.publicLog2<
  2885  			ExtensionRuntimeStateActionEvent,
  2886  			ExtensionRuntimeStateActionClassification
  2887  		>("extensions:runtimestate:action", {
  2888  			action: runtimeState.action,
  2889  		});
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\extensions\browser\extensionsViewlet.ts:

```sh
   68  import {
   69  	IStorageService,
   70  	StorageScope,
   71  	StorageTarget,
   72  } from "vs/platform/storage/common/storage";
   73: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   74  import { IThemeService } from "vs/platform/theme/common/themeService";
   75  import { IWorkspaceContextService } from "vs/platform/workspace/common/workspace";
   76  import { registerNavigableContainer } from "vs/workbench/browser/actions/widgetNavigationCommands";
   77  import { ViewPane } from "vs/workbench/browser/parts/views/viewPane";
   78  import { ViewPaneContainer } from "vs/workbench/browser/parts/views/viewPaneContainer";

  839  	private searchBox: SuggestEnabledInput | undefined;
  840  	private readonly searchViewletState: MementoObject;
  841
  842  	constructor(
  843  		@IWorkbenchLayoutService layoutService: IWorkbenchLayoutService,
  844: 		@ITelemetryService telemetryService: ITelemetryService,
  845  		@IProgressService private readonly progressService: IProgressService,
  846  		@IInstantiationService instantiationService: IInstantiationService,
  847  		@IEditorGroupsService
  848  		private readonly editorGroupService: IEditorGroupsService,
  849  		@IExtensionsWorkbenchService

  872  			{ mergeViewWithContainerWhenSingleView: true },
  873  			instantiationService,
  874  			configurationService,
  875  			layoutService,
  876  			contextMenuService,
  877: 			telemetryService,
  878  			extensionService,
  879  			themeService,
  880  			storageService,
  881  			contextService,
  882  			viewDescriptorService,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\extensions\browser\extensionsViews.ts:

```sh
    78  import {
    79  	IStorageService,
    80  	StorageScope,
    81  	StorageTarget,
    82  } from "vs/platform/storage/common/storage";
    83: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
    84  import { defaultCountBadgeStyles } from "vs/platform/theme/browser/defaultStyles";
    85  import { IThemeService } from "vs/platform/theme/common/themeService";
    86  import { IUriIdentityService } from "vs/platform/uriIdentity/common/uriIdentity";
    87  import { isVirtualWorkspace } from "vs/platform/workspace/common/virtualWorkspace";
    88  import { IWorkspaceContextService } from "vs/platform/workspace/common/workspace";

   227  		@IExtensionService private readonly extensionService: IExtensionService,
   228  		@IExtensionsWorkbenchService
   229  		protected extensionsWorkbenchService: IExtensionsWorkbenchService,
   230  		@IExtensionRecommendationsService
   231  		protected extensionRecommendationsService: IExtensionRecommendationsService,
   232: 		@ITelemetryService telemetryService: ITelemetryService,
   233  		@IHoverService hoverService: IHoverService,
   234  		@IConfigurationService configurationService: IConfigurationService,
   235  		@IWorkspaceContextService
   236  		protected contextService: IWorkspaceContextService,
   237  		@IExtensionManagementServerService

   281  			contextKeyService,
   282  			viewDescriptorService,
   283  			instantiationService,
   284  			openerService,
   285  			themeService,
   286: 			telemetryService,
   287  			hoverService,
   288  		);
   289  		if (this.options.onDidChangeTitle) {
   290  			this._register(
   291  				this.options.onDidChangeTitle((title) =>

  2327  		@IExtensionService extensionService: IExtensionService,
  2328  		@IExtensionsWorkbenchService
  2329  		extensionsWorkbenchService: IExtensionsWorkbenchService,
  2330  		@IExtensionRecommendationsService
  2331  		extensionRecommendationsService: IExtensionRecommendationsService,
  2332: 		@ITelemetryService telemetryService: ITelemetryService,
  2333  		@IHoverService hoverService: IHoverService,
  2334  		@IConfigurationService configurationService: IConfigurationService,
  2335  		@IWorkspaceContextService contextService: IWorkspaceContextService,
  2336  		@IExtensionManagementServerService
  2337  		extensionManagementServerService: IExtensionManagementServerService,

  2365  			instantiationService,
  2366  			themeService,
  2367  			extensionService,
  2368  			extensionsWorkbenchService,
  2369  			extensionRecommendationsService,
  2370: 			telemetryService,
  2371  			hoverService,
  2372  			configurationService,
  2373  			contextService,
  2374  			extensionManagementServerService,
  2375  			extensionManifestPropertiesService,

  2480  		return queryPromise;
  2481  	}
  2482
  2483  	private async reportSearchFinished(): Promise<void> {
  2484  		await this.searchWaitPromise;
  2485: 		this.telemetryService.publicLog2(
  2486  			"extensionsView:MarketplaceSearchFinished",
  2487  		);
  2488  	}
  2489  }
  2490
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\extensions\browser\extensionsWidgets.ts:

```sh
   42  import { areSameExtensions } from "vs/platform/extensionManagement/common/extensionManagementUtil";
   43  import { IHoverService } from "vs/platform/hover/browser/hover";
   44  import { IInstantiationService } from "vs/platform/instantiation/common/instantiation";
   45  import { ILabelService } from "vs/platform/label/common/label";
   46  import { IOpenerService } from "vs/platform/opener/common/opener";
   47: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   48  import { defaultCountBadgeStyles } from "vs/platform/theme/browser/defaultStyles";
   49  import {
   50  	registerColor,
   51  	textLinkForeground,
   52  } from "vs/platform/theme/common/colorRegistry";

  367
  368  	constructor(
  369  		private container: HTMLElement,
  370  		@IHoverService private readonly hoverService: IHoverService,
  371  		@IOpenerService private readonly openerService: IOpenerService,
  372: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
  373  	) {
  374  		super();
  375  		this.render();
  376  	}
  377

  409  					};
  410  				};
  411  				type SponsorExtensionEvent = {
  412  					"extensionId": string;
  413  				};
  414: 				this.telemetryService.publicLog2<
  415  					SponsorExtensionEvent,
  416  					SponsorExtensionClassification
  417  				>("extensionsAction.sponsorExtension", {
  418  					extensionId: this.extension!.identifier.id,
  419  				});
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\extensions\browser\extensionsWorkbenchService.ts:

```sh
   104  import {
   105  	IStorageService,
   106  	StorageScope,
   107  	StorageTarget,
   108  } from "vs/platform/storage/common/storage";
   109: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   110: import { TelemetryTrustedValue } from "vs/platform/telemetry/common/telemetryUtils";
   111  import { IUpdateService, StateType } from "vs/platform/update/common/update";
   112  import { IUriIdentityService } from "vs/platform/uriIdentity/common/uriIdentity";
   113  import {
   114  	IOpenURLOptions,
   115  	IURLHandler,

   212  					isWorkspaceScoped: boolean;
   213  			  }
   214  			| undefined,
   215  		@IExtensionGalleryService
   216  		private readonly galleryService: IExtensionGalleryService,
   217: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
   218  		@ILogService private readonly logService: ILogService,
   219  		@IFileService private readonly fileService: IFileService,
   220  		@IProductService private readonly productService: IProductService,
   221  	) {}
   222

   522
   523  	get runtimeState(): ExtensionRuntimeState | undefined {
   524  		return this.runtimeStateProvider(this);
   525  	}
   526
   527: 	get telemetryData(): any {
   528  		const { local, gallery } = this;
   529
   530  		if (gallery) {
   531  			return getGalleryExtensionTelemetryData(gallery);
   532  		} else if (local) {

   643
   644  		if (this.gallery) {
   645  			if (this.gallery.assets.readme) {
   646  				return this.galleryService.getReadme(this.gallery, token);
   647  			}
   648: 			this.telemetryService.publicLog(
   649  				"extensions:NotFoundReadMe",
   650: 				this.telemetryData,
   651  			);
   652  		}
   653
   654  		if (this.type === ExtensionType.System) {
   655  			return Promise.resolve(`# ${this.displayName || this.name}

   814  		private readonly extensionEnablementService: IWorkbenchExtensionEnablementService,
   815  		@IWorkbenchExtensionManagementService
   816  		private readonly workbenchExtensionManagementService: IWorkbenchExtensionManagementService,
   817  		@IUserDataProfileService
   818  		private readonly userDataProfileService: IUserDataProfileService,
   819: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
   820  		@IInstantiationService
   821  		private readonly instantiationService: IInstantiationService,
   822  	) {
   823  		super();
   824  		this._register(

  1048  		if (localExtension.manifest.version !== gallery.version) {
  1049  			type GalleryServiceMatchInstalledExtensionClassification = {
  1050  				owner: "sandy081";
  1051  				comment: "Report when a request is made to update metadata of an installed extension";
  1052  			};
  1053: 			this.telemetryService.publicLog2<
  1054  				{},
  1055  				GalleryServiceMatchInstalledExtensionClassification
  1056  			>("galleryService:updateMetadata");
  1057  			const galleryWithLocalVersion: IGalleryExtension | undefined = (
  1058  				await this.galleryService.getExtensions(

  1278  		}
  1279  		type GalleryServiceMatchInstalledExtensionClassification = {
  1280  			owner: "sandy081";
  1281  			comment: "Report when a request is made to match installed extension with gallery";
  1282  		};
  1283: 		this.telemetryService.publicLog2<
  1284  			{},
  1285  			GalleryServiceMatchInstalledExtensionClassification
  1286  		>("galleryService:matchInstalledExtension");
  1287  		const [compatible] = await this.galleryService.getExtensions(
  1288  			[

  1450  		private readonly extensionManagementService: IWorkbenchExtensionManagementService,
  1451  		@IExtensionGalleryService
  1452  		private readonly galleryService: IExtensionGalleryService,
  1453  		@IConfigurationService
  1454  		private readonly configurationService: IConfigurationService,
  1455: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
  1456  		@INotificationService
  1457  		private readonly notificationService: INotificationService,
  1458  		@IURLService urlService: IURLService,
  1459  		@IWorkbenchExtensionEnablementService
  1460  		private readonly extensionEnablementService: IWorkbenchExtensionEnablementService,

  1696  				if (
  1697  					(e.type === StateType.CheckingForUpdates && e.explicit) ||
  1698  					e.type === StateType.AvailableForDownload ||
  1699  					e.type === StateType.Downloaded
  1700  				) {
  1701: 					this.telemetryService.publicLog2<
  1702  						{},
  1703  						{
  1704  							owner: "sandy081";
  1705  							comment: "Report when update check is triggered on product update";
  1706  						}

  1822  							EnablementState.EnabledGlobally),
  1823  			)
  1824  			.map((extension) =>
  1825  				ExtensionIdentifier.toKey(extension.identifier.id),
  1826  			);
  1827: 		this.telemetryService.publicLog2<
  1828  			InstalledExtensionsEvent,
  1829  			ExtensionsLoadClassification
  1830  		>("installedExtensions", {
  1831  			extensionIds: new TelemetryTrustedValue(extensionIds.join(";")),
  1832  			count: extensionIds.length,

  2350  				};
  2351  				type ExtensionsAutoRestartEvent = {
  2352  					count: number;
  2353  					auto: boolean;
  2354  				};
  2355: 				this.telemetryService.publicLog2<
  2356  					ExtensionsAutoRestartEvent,
  2357  					ExtensionsAutoRestartClassification
  2358  				>("extensions:autorestart", {
  2359  					count: toAdd.length + toRemove.length,
  2360  					auto,

  2927  				};
  2928  			};
  2929  			type GalleryServiceUpdatesCheckEvent = {
  2930  				count: number;
  2931  			};
  2932: 			this.telemetryService.publicLog2<
  2933  				GalleryServiceUpdatesCheckEvent,
  2934  				GalleryServiceUpdatesCheckClassification
  2935  			>("galleryService:checkingForUpdates", {
  2936  				count: infos.length,
  2937  			});

  4632  					"${include}": [
  4633  						"${GalleryExtensionTelemetryData}"
  4634  					]
  4635  				}
  4636  				*/
  4637: 				this.telemetryService.publicLog(
  4638  					enablementState === EnablementState.EnabledGlobally ||
  4639  						enablementState === EnablementState.EnabledWorkspace
  4640  						? "extension:enable"
  4641  						: "extension:disable",
  4642: 					extensions[i].telemetryData,
  4643  				);
  4644  			}
  4645  		}
  4646  		return changed;
  4647  	}
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\extensions\common\extensions.ts:

```sh
  105  	readonly enablementState: EnablementState;
  106  	readonly tags: readonly string[];
  107  	readonly categories: readonly string[];
  108  	readonly dependencies: string[];
  109  	readonly extensionPack: string[];
  110: 	readonly telemetryData: any;
  111  	readonly preview: boolean;
  112  	getManifest(token: CancellationToken): Promise<IExtensionManifest | null>;
  113  	hasReadme(): boolean;
  114  	getReadme(token: CancellationToken): Promise<string>;
  115  	hasChangelog(): boolean;
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\extensions\electron-sandbox\extensionsAutoProfiler.ts:

```sh
   27  	INotificationService,
   28  	NotificationPriority,
   29  	Severity,
   30  } from "vs/platform/notification/common/notification";
   31  import { IProfileAnalysisWorkerService } from "vs/platform/profiling/electron-sandbox/profileAnalysisWorkerService";
   32: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   33  import { IWorkbenchContribution } from "vs/workbench/common/contributions";
   34  import { RuntimeExtensionsInput } from "vs/workbench/contrib/extensions/common/runtimeExtensionsInput";
   35  import { createSlowExtensionAction } from "vs/workbench/contrib/extensions/electron-sandbox/extensionsSlowActions";
   36  import { IExtensionHostProfileService } from "vs/workbench/contrib/extensions/electron-sandbox/runtimeExtensionsEditor";
   37  import { IEditorService } from "vs/workbench/services/editor/common/editorService";

   57  		@IExtensionService
   58  		private readonly _extensionService: IExtensionService,
   59  		@IExtensionHostProfileService
   60  		private readonly _extensionProfileService: IExtensionHostProfileService,
   61  		@ITelemetryService
   62: 		private readonly _telemetryService: ITelemetryService,
   63  		@ILogService private readonly _logService: ILogService,
   64  		@INotificationService
   65  		private readonly _notificationService: INotificationService,
   66  		@IEditorService private readonly _editorService: IEditorService,
   67  		@IInstantiationService

  263  				classification: "SystemMetaData";
  264  				purpose: "PerformanceAndHealth";
  265  				comment: "Top extensions id that took most of the duration";
  266  			};
  267  		};
  268: 		this._telemetryService.publicLog2<
  269  			UnresponsiveData,
  270  			UnresponsiveDataClassification
  271  		>("exthostunresponsive", {
  272  			sessionId,
  273  			duration: overall,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\extensions\electron-sandbox\runtimeExtensionsEditor.ts:

```sh
   27  } from "vs/platform/instantiation/common/instantiation";
   28  import { ILabelService } from "vs/platform/label/common/label";
   29  import { INotificationService } from "vs/platform/notification/common/notification";
   30  import { IV8Profile, Utils } from "vs/platform/profiling/common/profiling";
   31  import { IStorageService } from "vs/platform/storage/common/storage";
   32: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   33  import { IThemeService } from "vs/platform/theme/common/themeService";
   34  import {
   35  	AbstractRuntimeExtensionsEditor,
   36  	IRuntimeExtension,
   37  } from "vs/workbench/contrib/extensions/browser/abstractRuntimeExtensionsEditor";

   90  	private _extensionsHostRecorded: IContextKey<boolean>;
   91  	private _profileSessionState: IContextKey<string>;
   92
   93  	constructor(
   94  		group: IEditorGroup,
   95: 		@ITelemetryService telemetryService: ITelemetryService,
   96  		@IThemeService themeService: IThemeService,
   97  		@IContextKeyService contextKeyService: IContextKeyService,
   98  		@IExtensionsWorkbenchService
   99  		extensionsWorkbenchService: IExtensionsWorkbenchService,
  100  		@IExtensionService extensionService: IExtensionService,

  112  		extensionFeaturesManagementService: IExtensionFeaturesManagementService,
  113  		@IHoverService hoverService: IHoverService,
  114  	) {
  115  		super(
  116  			group,
  117: 			telemetryService,
  118  			themeService,
  119  			contextKeyService,
  120  			extensionsWorkbenchService,
  121  			extensionService,
  122  			notificationService,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\files\browser\explorerService.ts:

```sh
   31  	IProgressCompositeOptions,
   32  	IProgressOptions,
   33  	IProgressService,
   34  	ProgressLocation,
   35  } from "vs/platform/progress/common/progress";
   36: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   37  import { UndoRedoSource } from "vs/platform/undoRedo/common/undoRedo";
   38  import { IUriIdentityService } from "vs/platform/uriIdentity/common/uriIdentity";
   39  import { IWorkspaceContextService } from "vs/platform/workspace/common/workspace";
   40  import { ResourceGlobMatcher } from "vs/workbench/common/resources";
   41  import { IEditableData } from "vs/workbench/common/views";

   87  		@IBulkEditService private readonly bulkEditService: IBulkEditService,
   88  		@IProgressService private readonly progressService: IProgressService,
   89  		@IHostService hostService: IHostService,
   90  		@IFilesConfigurationService
   91  		private readonly filesConfigurationService: IFilesConfigurationService,
   92: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
   93  	) {
   94  		this.config = this.configurationService.getValue("explorer");
   95
   96  		this.model = new ExplorerModel(
   97  			this.contextService,

  432  				parentIsRoot: parent?.isRoot,
  433  				isRoot: stat.isRoot,
  434  				parentHasNests: parent?.hasNests,
  435  				hasNests: stat.hasNests,
  436  			};
  437: 			this.telemetryService.publicLogError2<
  438  				ExplorerViewEditableErrorData,
  439  				ExplorerViewEditableErrorClassification
  440  			>("explorerView.setEditableError", errorData);
  441  			return;
  442  		}
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\files\browser\explorerViewlet.ts:

```sh
   26  	IProgressService,
   27  	ProgressLocation,
   28  } from "vs/platform/progress/common/progress";
   29  import { Registry } from "vs/platform/registry/common/platform";
   30  import { IStorageService } from "vs/platform/storage/common/storage";
   31: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   32  import { registerIcon } from "vs/platform/theme/common/iconRegistry";
   33  import { IThemeService } from "vs/platform/theme/common/themeService";
   34  import {
   35  	IWorkspaceContextService,
   36  	WorkbenchState,

  236  export class ExplorerViewPaneContainer extends ViewPaneContainer {
  237  	private viewletVisibleContextKey: IContextKey<boolean>;
  238
  239  	constructor(
  240  		@IWorkbenchLayoutService layoutService: IWorkbenchLayoutService,
  241: 		@ITelemetryService telemetryService: ITelemetryService,
  242  		@IWorkspaceContextService contextService: IWorkspaceContextService,
  243  		@IStorageService storageService: IStorageService,
  244  		@IConfigurationService configurationService: IConfigurationService,
  245  		@IInstantiationService instantiationService: IInstantiationService,
  246  		@IContextKeyService contextKeyService: IContextKeyService,

  254  			{ mergeViewWithContainerWhenSingleView: true },
  255  			instantiationService,
  256  			configurationService,
  257  			layoutService,
  258  			contextMenuService,
  259: 			telemetryService,
  260  			extensionService,
  261  			themeService,
  262  			storageService,
  263  			contextService,
  264  			viewDescriptorService,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\files\browser\workspaceWatcher.ts:

```sh
   26  	NeverShowAgainScope,
   27  	NotificationPriority,
   28  	Severity,
   29  } from "vs/platform/notification/common/notification";
   30  import { IOpenerService } from "vs/platform/opener/common/opener";
   31: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   32  import { IUriIdentityService } from "vs/platform/uriIdentity/common/uriIdentity";
   33  import {
   34  	IWorkspaceContextService,
   35  	IWorkspaceFolder,
   36  	IWorkspaceFoldersChangeEvent,

   54  		private readonly notificationService: INotificationService,
   55  		@IOpenerService private readonly openerService: IOpenerService,
   56  		@IUriIdentityService
   57  		private readonly uriIdentityService: IUriIdentityService,
   58  		@IHostService private readonly hostService: IHostService,
   59: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
   60  	) {
   61  		super();
   62
   63  		this.registerListeners();
   64

  175  		// Detect unexpected termination
  176  		else if (msg.indexOf("ETERM") >= 0) {
  177  			reason = "ETERM";
  178  		}
  179
  180: 		// Log telemetry if we gathered a reason (logging it from the renderer
  181  		// allows us to investigate this situation in context of experiments)
  182  		if (reason) {
  183  			type WatchErrorClassification = {
  184  				owner: "bpasero";
  185  				comment: "An event that fires when a watcher errors";

  190  				};
  191  			};
  192  			type WatchErrorEvent = {
  193  				reason: string;
  194  			};
  195: 			this.telemetryService.publicLog2<
  196  				WatchErrorEvent,
  197  				WatchErrorClassification
  198  			>("fileWatcherError", { reason });
  199  		}
  200  	}
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\files\browser\editors\binaryFileEditor.ts:

```sh
   7  import {
   8  	EditorResolution,
   9  	IEditorOptions,
  10  } from "vs/platform/editor/common/editor";
  11  import { IStorageService } from "vs/platform/storage/common/storage";
  12: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
  13  import { IThemeService } from "vs/platform/theme/common/themeService";
  14  import { BaseBinaryResourceEditor } from "vs/workbench/browser/parts/editor/binaryEditor";
  15  import { isEditorInputWithOptions } from "vs/workbench/common/editor";
  16  import { DiffEditorInput } from "vs/workbench/common/editor/diffEditorInput";
  17  import { EditorInput } from "vs/workbench/common/editor/editorInput";

  33  export class BinaryFileEditor extends BaseBinaryResourceEditor {
  34  	static readonly ID = BINARY_FILE_EDITOR_ID;
  35
  36  	constructor(
  37  		group: IEditorGroup,
  38: 		@ITelemetryService telemetryService: ITelemetryService,
  39  		@IThemeService themeService: IThemeService,
  40  		@IEditorResolverService
  41  		private readonly editorResolverService: IEditorResolverService,
  42  		@IStorageService storageService: IStorageService,
  43  	) {

  46  			group,
  47  			{
  48  				openInternal: (input, options) =>
  49  					this.openInternal(input, options),
  50  			},
  51: 			telemetryService,
  52  			themeService,
  53  			storageService,
  54  		);
  55  	}
  56
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\files\browser\editors\textFileEditor.ts:

```sh
   29  	IFileService,
   30  	TooLargeFileOperationError,
   31  } from "vs/platform/files/common/files";
   32  import { IInstantiationService } from "vs/platform/instantiation/common/instantiation";
   33  import { IStorageService } from "vs/platform/storage/common/storage";
   34: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   35  import { IThemeService } from "vs/platform/theme/common/themeService";
   36  import { IUriIdentityService } from "vs/platform/uriIdentity/common/uriIdentity";
   37  import { IWorkspaceContextService } from "vs/platform/workspace/common/workspace";
   38  import { AbstractTextCodeEditor } from "vs/workbench/browser/parts/editor/textCodeEditor";
   39  import {

   77  export class TextFileEditor extends AbstractTextCodeEditor<ICodeEditorViewState> {
   78  	static readonly ID = TEXT_FILE_EDITOR_ID;
   79
   80  	constructor(
   81  		group: IEditorGroup,
   82: 		@ITelemetryService telemetryService: ITelemetryService,
   83  		@IFileService fileService: IFileService,
   84  		@IPaneCompositePartService
   85  		private readonly paneCompositeService: IPaneCompositePartService,
   86  		@IInstantiationService instantiationService: IInstantiationService,
   87  		@IWorkspaceContextService

  106  		private readonly filesConfigurationService: IFilesConfigurationService,
  107  	) {
  108  		super(
  109  			TextFileEditor.ID,
  110  			group,
  111: 			telemetryService,
  112  			instantiationService,
  113  			storageService,
  114  			textResourceConfigurationService,
  115  			themeService,
  116  			editorService,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\files\browser\views\emptyView.ts:

```sh
  13  import { IHoverService } from "vs/platform/hover/browser/hover";
  14  import { IInstantiationService } from "vs/platform/instantiation/common/instantiation";
  15  import { IKeybindingService } from "vs/platform/keybinding/common/keybinding";
  16  import { ILabelService } from "vs/platform/label/common/label";
  17  import { IOpenerService } from "vs/platform/opener/common/opener";
  18: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
  19  import { listDropOverBackground } from "vs/platform/theme/common/colorRegistry";
  20  import { IThemeService } from "vs/platform/theme/common/themeService";
  21  import {
  22  	isTemporaryWorkspace,
  23  	IWorkspaceContextService,

  47  		private readonly contextService: IWorkspaceContextService,
  48  		@IConfigurationService configurationService: IConfigurationService,
  49  		@ILabelService private labelService: ILabelService,
  50  		@IContextKeyService contextKeyService: IContextKeyService,
  51  		@IOpenerService openerService: IOpenerService,
  52: 		@ITelemetryService telemetryService: ITelemetryService,
  53  		@IHoverService hoverService: IHoverService,
  54  	) {
  55  		super(
  56  			options,
  57  			keybindingService,

  60  			contextKeyService,
  61  			viewDescriptorService,
  62  			instantiationService,
  63  			openerService,
  64  			themeService,
  65: 			telemetryService,
  66  			hoverService,
  67  		);
  68
  69  		this._register(
  70  			this.contextService.onDidChangeWorkbenchState(() =>
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\files\browser\views\explorerView.ts:

```sh
   63  import {
   64  	IStorageService,
   65  	StorageScope,
   66  	StorageTarget,
   67  } from "vs/platform/storage/common/storage";
   68: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   69  import {
   70  	IFileIconTheme,
   71  	IThemeService,
   72  } from "vs/platform/theme/common/themeService";
   73  import { IUriIdentityService } from "vs/platform/uriIdentity/common/uriIdentity";

  332  		@IConfigurationService configurationService: IConfigurationService,
  333  		@IDecorationsService
  334  		private readonly decorationService: IDecorationsService,
  335  		@ILabelService private readonly labelService: ILabelService,
  336  		@IThemeService themeService: IWorkbenchThemeService,
  337: 		@ITelemetryService telemetryService: ITelemetryService,
  338  		@IHoverService hoverService: IHoverService,
  339  		@IExplorerService private readonly explorerService: IExplorerService,
  340  		@IStorageService private readonly storageService: IStorageService,
  341  		@IClipboardService private clipboardService: IClipboardService,
  342  		@IFileService private readonly fileService: IFileService,

  353  			contextKeyService,
  354  			viewDescriptorService,
  355  			instantiationService,
  356  			openerService,
  357  			themeService,
  358: 			telemetryService,
  359  			hoverService,
  360  		);
  361
  362  		this.delegate = options.delegate;
  363  		this.resourceContext =

  793  					) {
  794  						// Do not react if user is clicking on explorer items while some are being edited #70276
  795  						// Do not react if clicking on directories
  796  						return;
  797  					}
  798: 					this.telemetryService.publicLog2<
  799  						WorkbenchActionExecutedEvent,
  800  						WorkbenchActionExecutedClassification
  801  					>("workbenchActionExecuted", {
  802  						id: "workbench.files.openFile",
  803  						from: "explorer",
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\files\browser\views\openEditorsView.ts:

```sh
   69  } from "vs/platform/instantiation/common/instantiation";
   70  import { IKeybindingService } from "vs/platform/keybinding/common/keybinding";
   71  import { KeybindingWeight } from "vs/platform/keybinding/common/keybindingsRegistry";
   72  import { WorkbenchList } from "vs/platform/list/browser/listService";
   73  import { IOpenerService } from "vs/platform/opener/common/opener";
   74: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   75  import {
   76  	asCssVariable,
   77  	badgeBackground,
   78  	badgeForeground,
   79  	contrastBorder,

  170  		private readonly editorGroupService: IEditorGroupsService,
  171  		@IConfigurationService configurationService: IConfigurationService,
  172  		@IKeybindingService keybindingService: IKeybindingService,
  173  		@IContextKeyService contextKeyService: IContextKeyService,
  174  		@IThemeService themeService: IThemeService,
  175: 		@ITelemetryService telemetryService: ITelemetryService,
  176  		@IHoverService hoverService: IHoverService,
  177  		@IWorkingCopyService
  178  		private readonly workingCopyService: IWorkingCopyService,
  179  		@IFilesConfigurationService
  180  		private readonly filesConfigurationService: IFilesConfigurationService,

  189  			contextKeyService,
  190  			viewDescriptorService,
  191  			instantiationService,
  192  			openerService,
  193  			themeService,
  194: 			telemetryService,
  195  			hoverService,
  196  		);
  197
  198  		this.structuralRefreshDelay = 0;
  199  		this.sortOrder = configurationService.getValue(

  658  			pinned?: boolean;
  659  			sideBySide?: boolean;
  660  		},
  661  	): void {
  662  		if (element) {
  663: 			this.telemetryService.publicLog2<
  664  				WorkbenchActionExecutedEvent,
  665  				WorkbenchActionExecutedClassification
  666  			>("workbenchActionExecuted", {
  667  				id: "workbench.files.openFile",
  668  				from: "openEditors",
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\format\browser\formatActionsMultiple.ts:

```sh
   58  import {
   59  	IQuickInputService,
   60  	IQuickPickItem,
   61  } from "vs/platform/quickinput/common/quickInput";
   62  import { Registry } from "vs/platform/registry/common/platform";
   63: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   64  import {
   65  	IWorkbenchContribution,
   66  	IWorkbenchContributionsRegistry,
   67  	Extensions as WorkbenchExtensions,
   68  } from "vs/workbench/common/contributions";

  466  interface IIndexedPick extends IQuickPickItem {
  467  	index: number;
  468  }
  469
  470  function logFormatterTelemetry<T extends { extensionId?: ExtensionIdentifier }>(
  471: 	telemetryService: ITelemetryService,
  472  	mode: "document" | "range",
  473  	options: T[],
  474  	pick?: T,
  475  ) {
  476  	type FormatterPicks = {

  500  	function extKey(obj: T): string {
  501  		return obj.extensionId
  502  			? ExtensionIdentifier.toKey(obj.extensionId)
  503  			: "unknown";
  504  	}
  505: 	telemetryService.publicLog2<FormatterPicks, FormatterPicksClassification>(
  506  		"formatterpick",
  507  		{
  508  			mode,
  509  			extensions: options.map(extKey),
  510  			pick: pick ? extKey(pick) : "none",

  624  		): Promise<void> {
  625  			if (!editor.hasModel()) {
  626  				return;
  627  			}
  628  			const instaService = accessor.get(IInstantiationService);
  629: 			const telemetryService = accessor.get(ITelemetryService);
  630  			const languageFeaturesService = accessor.get(
  631  				ILanguageFeaturesService,
  632  			);
  633  			const model = editor.getModel();
  634  			const provider = getRealAndSyntheticDocumentFormattersOrdered(

  649  					FormattingMode.Explicit,
  650  					CancellationToken.None,
  651  				);
  652  			}
  653  			logFormatterTelemetry(
  654: 				telemetryService,
  655  				"document",
  656  				provider,
  657  				(typeof pick === "number" && provider[pick]) || undefined,
  658  			);
  659  		}

  693  			}
  694  			const instaService = accessor.get(IInstantiationService);
  695  			const languageFeaturesService = accessor.get(
  696  				ILanguageFeaturesService,
  697  			);
  698: 			const telemetryService = accessor.get(ITelemetryService);
  699
  700  			const model = editor.getModel();
  701  			let range: Range = editor.getSelection();
  702  			if (range.isEmpty()) {
  703  				range = new Range(

  727  					true,
  728  				);
  729  			}
  730
  731  			logFormatterTelemetry(
  732: 				telemetryService,
  733  				"range",
  734  				provider,
  735  				(typeof pick === "number" && provider[pick]) || undefined,
  736  			);
  737  		}
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\inlineChat\browser\inlineChatContentWidget.ts:

```sh
  102  				supportsFileReferences:
  103  					configurationService.getValue(
  104  						`chat.experimental.variables.${location.location}`,
  105  					) === true,
  106  				menus: {
  107: 					telemetrySource: "inlineChat-content",
  108  					executeToolbar: MenuId.ChatExecute,
  109  				},
  110  				filter: (_item) => false,
  111  			},
  112  			{
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\inlineChat\browser\inlineChatSessionServiceImpl.ts:

```sh
   29  	IContextKey,
   30  	IContextKeyService,
   31  } from "vs/platform/contextkey/common/contextkey";
   32  import { IInstantiationService } from "vs/platform/instantiation/common/instantiation";
   33  import { ILogService } from "vs/platform/log/common/log";
   34: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   35  import { DEFAULT_EDITOR_ASSOCIATION } from "vs/workbench/common/editor";
   36  import {
   37  	ChatAgentLocation,
   38  	IChatAgentService,
   39  } from "vs/workbench/contrib/chat/common/chatAgents";

  107  	private readonly _sessions = new Map<string, SessionData>();
  108  	private readonly _keyComputers = new Map<string, ISessionKeyComputer>();
  109
  110  	constructor(
  111  		@ITelemetryService
  112: 		private readonly _telemetryService: ITelemetryService,
  113  		@IModelService private readonly _modelService: IModelService,
  114  		@ITextModelService
  115  		private readonly _textModelService: ITextModelService,
  116  		@IEditorWorkerService
  117  		private readonly _editorWorkerService: IEditorWorkerService,

  385  		if (!tuple) {
  386  			// double remove
  387  			return;
  388  		}
  389
  390: 		this._telemetryService.publicLog2<
  391  			TelemetryData,
  392  			TelemetryDataClassification
  393  		>("interactiveEditor/session", session.asTelemetryData());
  394
  395  		const [key, value] = tuple;
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\inlineChat\browser\inlineChatStrategies.ts:

```sh
  908  					MenuWorkbenchButtonBar,
  909  					this._domNode,
  910  					MENU_INLINE_CHAT_ZONE,
  911  					{
  912  						menuOptions: { arg: _hunkInfo },
  913: 						telemetrySource: "inlineChat-changesZone",
  914  						buttonConfigProvider: (_action, idx) => {
  915  							return {
  916  								isSecondary: idx > 0,
  917  								showIcon: true,
  918  								showLabel: false,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\inlineChat\browser\inlineChatWidget.ts:

```sh
  323  			MenuWorkbenchButtonBar,
  324  			this._elements.toolbar2,
  325  			statusMenuId,
  326  			{
  327  				toolbarOptions: { primaryGroup: "0_main" },
  328: 				telemetrySource:
  329: 					options.chatWidgetViewOptions?.menus?.telemetrySource,
  330  				menuOptions: { renderShortTitle: true },
  331  				...statusMenuOptions,
  332  			},
  333  		);
  334  		this._store.add(
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\inlineChat\browser\inlineChatZoneWidget.ts:

```sh
  103  					},
  104  				},
  105  				chatWidgetViewOptions: {
  106  					menus: {
  107  						executeToolbar: MenuId.ChatExecute,
  108: 						telemetrySource: "interactiveEditorWidget-toolbar",
  109  					},
  110  					rendererOptions: {
  111  						renderTextEditsAsSummary: (uri) => {
  112  							// render edits as summary only when using Live mode and when
  113  							// dealing with the current file in the editor
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\interactive\browser\interactiveEditor.ts:

```sh
   38  	TextEditorSelectionSource,
   39  } from "vs/platform/editor/common/editor";
   40  import { IInstantiationService } from "vs/platform/instantiation/common/instantiation";
   41  import { IKeybindingService } from "vs/platform/keybinding/common/keybinding";
   42  import { IStorageService } from "vs/platform/storage/common/storage";
   43: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   44  import { IThemeService } from "vs/platform/theme/common/themeService";
   45  import { EditorPane } from "vs/workbench/browser/parts/editor/editorPane";
   46  import {
   47  	EditorPaneSelectionChangeReason,
   48  	IEditorMemento,

  170  	private _onDidChangeScroll = this._register(new Emitter<void>());
  171  	readonly onDidChangeScroll = this._onDidChangeScroll.event;
  172
  173  	constructor(
  174  		group: IEditorGroup,
  175: 		@ITelemetryService telemetryService: ITelemetryService,
  176  		@IThemeService themeService: IThemeService,
  177  		@IStorageService storageService: IStorageService,
  178  		@IInstantiationService instantiationService: IInstantiationService,
  179  		@INotebookEditorService notebookWidgetService: INotebookEditorService,
  180  		@IContextKeyService contextKeyService: IContextKeyService,

  193  		@IExtensionService extensionService: IExtensionService,
  194  	) {
  195  		super(
  196  			INTERACTIVE_WINDOW_EDITOR_ID,
  197  			group,
  198: 			telemetryService,
  199  			themeService,
  200  			storageService,
  201  		);
  202  		this._notebookWidgetService = notebookWidgetService;
  203  		this._configurationService = configurationService;
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\localization\electron-sandbox\localization.contribution.ts:

```sh
   24  import {
   25  	IStorageService,
   26  	StorageScope,
   27  	StorageTarget,
   28  } from "vs/platform/storage/common/storage";
   29: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   30  import {
   31  	IWorkbenchContributionsRegistry,
   32  	Extensions as WorkbenchExtensions,
   33  } from "vs/workbench/common/contributions";
   34  import { ViewContainerLocation } from "vs/workbench/common/views";

   56  		private readonly extensionManagementService: IExtensionManagementService,
   57  		@IExtensionGalleryService
   58  		private readonly galleryService: IExtensionGalleryService,
   59  		@IPaneCompositePartService
   60  		private readonly paneCompositeService: IPaneCompositePartService,
   61: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
   62  	) {
   63  		super();
   64
   65  		this.checkAndInstall();
   66  		this._register(

  255  					"owner": "TylerLeonhardt",
  256  					"userReaction" : { "classification": "SystemMetaData", "purpose": "FeatureInsight" },
  257  					"language": { "classification": "SystemMetaData", "purpose": "FeatureInsight" }
  258  				}
  259  			*/
  260: 			this.telemetryService.publicLog("languagePackSuggestion:popup", {
  261  				userReaction,
  262  				language: locale,
  263  			});
  264  		};
  265
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\logs\common\logsActions.ts:

```sh
   23  	IQuickPickItem,
   24  	IQuickPickSeparator,
   25  } from "vs/platform/quickinput/common/quickInput";
   26  import {
   27  	extensionTelemetryLogChannelId,
   28: 	telemetryLogId,
   29: } from "vs/platform/telemetry/common/telemetryUtils";
   30  import { IDefaultLogLevelsService } from "vs/workbench/contrib/logs/common/defaultLogLevels";
   31  import { IEditorService } from "vs/workbench/services/editor/common/editorService";
   32  import { IWorkbenchEnvironmentService } from "vs/workbench/services/environment/common/environmentService";
   33  import {
   34  	IOutputChannelDescriptor,

  166
  167  	static isLevelSettable(channel: IOutputChannelDescriptor): boolean {
  168  		return (
  169  			channel.log &&
  170  			channel.file !== undefined &&
  171: 			channel.id !== telemetryLogId &&
  172  			channel.id !== extensionTelemetryLogChannelId
  173  		);
  174  	}
  175
  176  	private async setLogLevelForChannel(
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\markdown\browser\markdownSettingRenderer.ts:

```sh
   13  import {
   14  	ConfigurationTarget,
   15  	IConfigurationService,
   16  } from "vs/platform/configuration/common/configuration";
   17  import { IContextMenuService } from "vs/platform/contextview/browser/contextView";
   18: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   19  import { settingKeyToDisplayFormat } from "vs/workbench/contrib/preferences/browser/settingsTreeModels";
   20  import {
   21  	IPreferencesService,
   22  	ISetting,
   23  } from "vs/workbench/services/preferences/common/preferences";

   35  		@IContextMenuService
   36  		private readonly _contextMenuService: IContextMenuService,
   37  		@IPreferencesService
   38  		private readonly _preferencesService: IPreferencesService,
   39  		@ITelemetryService
   40: 		private readonly _telemetryService: ITelemetryService,
   41  		@IClipboardService
   42  		private readonly _clipboardService: IClipboardService,
   43  	) {
   44  		this.codeSettingRegex = new RegExp(
   45  			`^<a (href)=".*code.*://settings/([^\\s"]+)"(?:\\s*codesetting="([^"]+)")?>`,

  384  				};
  385  			};
  386  			type ReleaseNotesSettingUsed = {
  387  				settingId: string;
  388  			};
  389: 			this._telemetryService.publicLog2<
  390  				ReleaseNotesSettingUsed,
  391  				ReleaseNotesSettingUsedClassification
  392  			>("releaseNotesSettingAction", {
  393  				settingId: uri.authority,
  394  			});
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\markers\browser\markersView.ts:

```sh
   70  import {
   71  	IStorageService,
   72  	StorageScope,
   73  	StorageTarget,
   74  } from "vs/platform/storage/common/storage";
   75: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   76  import { IThemeService } from "vs/platform/theme/common/themeService";
   77  import { IUriIdentityService } from "vs/platform/uriIdentity/common/uriIdentity";
   78  import { IWorkspaceContextService } from "vs/platform/workspace/common/workspace";
   79  import { registerNavigableContainer } from "vs/workbench/browser/actions/widgetNavigationCommands";
   80  import { RangeHighlightDecorations } from "vs/workbench/browser/codeeditor";

  225  		options: IViewPaneOptions,
  226  		@IInstantiationService instantiationService: IInstantiationService,
  227  		@IViewDescriptorService viewDescriptorService: IViewDescriptorService,
  228  		@IEditorService private readonly editorService: IEditorService,
  229  		@IConfigurationService configurationService: IConfigurationService,
  230: 		@ITelemetryService telemetryService: ITelemetryService,
  231  		@IMarkerService private readonly markerService: IMarkerService,
  232  		@IContextKeyService contextKeyService: IContextKeyService,
  233  		@IWorkspaceContextService
  234  		private readonly workspaceContextService: IWorkspaceContextService,
  235  		@IContextMenuService contextMenuService: IContextMenuService,

  267  			contextKeyService,
  268  			viewDescriptorService,
  269  			instantiationService,
  270  			openerService,
  271  			themeService,
  272: 			telemetryService,
  273  			hoverService,
  274  		);
  275  		this.memento = memento;
  276  		this.panelState = panelState;
  277
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\mergeEditor\browser\mergeEditorInput.ts:

```sh
30 import {
31 IMergeEditorInputModel,
32 TempFileMergeEditorModeFactory,
33 WorkspaceMergeEditorModeFactory,
34 } from "vs/workbench/contrib/mergeEditor/browser/mergeEditorInputModel"
35: import { MergeEditorTelemetry } from "vs/workbench/contrib/mergeEditor/browser/telemetry"
36 import { ICustomEditorLabelService } from "vs/workbench/services/editor/common/customEditorLabelService"
37 import { IEditorService } from "vs/workbench/services/editor/common/editorService"
38 import { IFilesConfigurationService } from "vs/workbench/services/filesConfiguration/common/filesConfigurationService"
39 import {
40 ILanguageSupport,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\mergeEditor\browser\mergeEditorInputModel.ts:

```sh
   40  import { MergeDiffComputer } from "vs/workbench/contrib/mergeEditor/browser/model/diffComputer";
   41  import {
   42  	InputData,
   43  	MergeEditorModel,
   44  } from "vs/workbench/contrib/mergeEditor/browser/model/mergeEditorModel";
   45: import { MergeEditorTelemetry } from "vs/workbench/contrib/mergeEditor/browser/telemetry";
   46  import { StorageCloseWithConflicts } from "vs/workbench/contrib/mergeEditor/common/mergeEditor";
   47  import { IEditorService } from "vs/workbench/services/editor/common/editorService";
   48  import {
   49  	ITextFileEditorModel,
   50  	ITextFileSaveOptions,

  470
  471  	constructor(
  472  		public readonly model: MergeEditorModel,
  473  		private readonly disposableStore: DisposableStore,
  474  		private readonly resultTextFileModel: ITextFileEditorModel,
  475: 		private readonly telemetry: MergeEditorTelemetry,
  476  		@IDialogService private readonly _dialogService: IDialogService,
  477  		@IStorageService private readonly _storageService: IStorageService,
  478  	) {
  479  		super();
  480  	}

  490  		if (!this.reported) {
  491  			const remainingConflictCount =
  492  				this.model.unhandledConflictsCount.get();
  493  			const durationOpenedMs =
  494  				new Date().getTime() - this.dateTimeOpened.getTime();
  495: 			this.telemetry.reportMergeEditorClosed({
  496  				durationOpenedSecs: durationOpenedMs / 1000,
  497  				remainingConflictCount,
  498  				accepted,
  499
  500  				conflictCount: this.model.conflictCount,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\mergeEditor\browser\telemetry.ts:

```sh
    1  /*---------------------------------------------------------------------------------------------
    2   *  Copyright (c) Microsoft Corporation. All rights reserved.
    3   *  Licensed under the MIT License. See License.txt in the project root for license information.
    4   *--------------------------------------------------------------------------------------------*/
    5
    6: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
    7  import { InputNumber } from "vs/workbench/contrib/mergeEditor/browser/model/modifiedBaseRange";
    8
    9  export class MergeEditorTelemetry {
   10  	constructor(
   11: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
   12  	) {}
   13
   14  	reportMergeEditorOpened(args: {
   15  		conflictCount: number;
   16  		combinableConflictCount: number;
   17
   18  		baseVisible: boolean;
   19  		isColumnView: boolean;
   20  		baseTop: boolean;
   21  	}): void {
   22: 		this.telemetryService.publicLog2<
   23  			{
   24  				conflictCount: number;
   25  				combinableConflictCount: number;
   26
   27  				baseVisible: boolean;

   73  	reportLayoutChange(args: {
   74  		baseVisible: boolean;
   75  		isColumnView: boolean;
   76  		baseTop: boolean;
   77  	}): void {
   78: 		this.telemetryService.publicLog2<
   79  			{
   80  				baseVisible: boolean;
   81  				isColumnView: boolean;
   82  				baseTop: boolean;
   83  			},

  131  		manuallySolvedConflictCountThatEqualNoneAndStartedWithInput1: number;
  132  		manuallySolvedConflictCountThatEqualNoneAndStartedWithInput2: number;
  133  		manuallySolvedConflictCountThatEqualNoneAndStartedWithBothNonSmart: number;
  134  		manuallySolvedConflictCountThatEqualNoneAndStartedWithBothSmart: number;
  135  	}): void {
  136: 		this.telemetryService.publicLog2<
  137  			{
  138  				conflictCount: number;
  139  				combinableConflictCount: number;
  140
  141  				durationOpenedSecs: number;

  296
  297  	reportAcceptInvoked(
  298  		inputNumber: InputNumber,
  299  		otherAccepted: boolean,
  300  	): void {
  301: 		this.telemetryService.publicLog2<
  302  			{
  303  				otherAccepted: boolean;
  304  				isInput1: boolean;
  305  			},
  306  			{

  322  			isInput1: inputNumber === 1,
  323  		});
  324  	}
  325
  326  	reportSmartCombinationInvoked(otherAccepted: boolean): void {
  327: 		this.telemetryService.publicLog2<
  328  			{
  329  				otherAccepted: boolean;
  330  			},
  331  			{
  332  				owner: "hediet";

  344
  345  	reportRemoveInvoked(
  346  		inputNumber: InputNumber,
  347  		otherAccepted: boolean,
  348  	): void {
  349: 		this.telemetryService.publicLog2<
  350  			{
  351  				otherAccepted: boolean;
  352  				isInput1: boolean;
  353  			},
  354  			{

  370  			isInput1: inputNumber === 1,
  371  		});
  372  	}
  373
  374  	reportResetToBaseInvoked(): void {
  375: 		this.telemetryService.publicLog2<
  376  			{},
  377  			{
  378  				owner: "hediet";
  379  				comment: 'This event tracks when the user invokes "Reset To Base".';
  380  			}
  381  		>("mergeEditor.action.resetToBase", {});
  382  	}
  383
  384  	reportNavigationToNextConflict(): void {
  385: 		this.telemetryService.publicLog2<
  386  			{},
  387  			{
  388  				owner: "hediet";
  389  				comment: 'This event tracks when the user navigates to the next conflict".';
  390  			}
  391  		>("mergeEditor.action.goToNextConflict", {});
  392  	}
  393
  394  	reportNavigationToPreviousConflict(): void {
  395: 		this.telemetryService.publicLog2<
  396  			{},
  397  			{
  398  				owner: "hediet";
  399  				comment: 'This event tracks when the user navigates to the previous conflict".';
  400  			}
  401  		>("mergeEditor.action.goToPreviousConflict", {});
  402  	}
  403
  404  	reportConflictCounterClicked(): void {
  405: 		this.telemetryService.publicLog2<
  406  			{},
  407  			{
  408  				owner: "hediet";
  409  				comment: "This event tracks when the user clicks on the conflict counter to navigate to the next conflict.";
  410  			}
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\mergeEditor\browser\commands\commands.ts:

```sh
  454  			precondition: ctxIsMergeEditor,
  455  		});
  456  	}
  457
  458  	override runWithViewModel(viewModel: MergeEditorViewModel): void {
  459: 		viewModel.model.telemetry.reportNavigationToNextConflict();
  460  		viewModel.goToNextModifiedBaseRange(
  461  			(r) => !viewModel.model.isHandled(r).get(),
  462  		);
  463  	}
  464  }

  485  			precondition: ctxIsMergeEditor,
  486  		});
  487  	}
  488
  489  	override runWithViewModel(viewModel: MergeEditorViewModel): void {
  490: 		viewModel.model.telemetry.reportNavigationToPreviousConflict();
  491  		viewModel.goToPreviousModifiedBaseRange(
  492  			(r) => !viewModel.model.isHandled(r).get(),
  493  		);
  494  	}
  495  }
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\mergeEditor\browser\model\mergeEditorModel.ts:

```sh
   40  import {
   41  	TextModelDiffChangeReason,
   42  	TextModelDiffs,
   43  	TextModelDiffState,
   44  } from "vs/workbench/contrib/mergeEditor/browser/model/textModelDiffs";
   45: import { MergeEditorTelemetry } from "vs/workbench/contrib/mergeEditor/browser/telemetry";
   46  import { leftJoin } from "vs/workbench/contrib/mergeEditor/browser/utils";
   47
   48  import {
   49  	InputNumber,
   50  	ModifiedBaseRange,

  102  		readonly input1: InputData,
  103  		readonly input2: InputData,
  104  		readonly resultTextModel: ITextModel,
  105  		private readonly diffComputer: IMergeDiffComputer,
  106  		private readonly options: { resetResult: boolean },
  107: 		public readonly telemetry: MergeEditorTelemetry,
  108  		@ILanguageService private readonly languageService: ILanguageService,
  109  		@IUndoRedoService private readonly undoRedoService: IUndoRedoService,
  110  	) {
  111  		super();
  112
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\mergeEditor\browser\view\conflictActions.ts:

```sh
  200  											false,
  201  										),
  202  										inputNumber,
  203  										tx,
  204  									);
  205: 									model.telemetry.reportAcceptInvoked(
  206  										inputNumber,
  207  										state.includesInput(otherInputNumber),
  208  									);
  209  								});
  210  							},

  243  													true,
  244  												),
  245  											true,
  246  											tx,
  247  										);
  248: 										model.telemetry.reportSmartCombinationInvoked(
  249  											state.includesInput(
  250  												otherInputNumber,
  251  											),
  252  										);
  253  									});

  273  											false,
  274  										),
  275  										inputNumber,
  276  										tx,
  277  									);
  278: 									model.telemetry.reportAcceptInvoked(
  279  										inputNumber,
  280  										state.includesInput(otherInputNumber),
  281  									);
  282  								});
  283  							},

  307  												true,
  308  											),
  309  											inputNumber,
  310  											tx,
  311  										);
  312: 										model.telemetry.reportSmartCombinationInvoked(
  313  											state.includesInput(
  314  												otherInputNumber,
  315  											),
  316  										);
  317  									});

  413  								modifiedBaseRange,
  414  								state.withInputValue(1, false),
  415  								true,
  416  								tx,
  417  							);
  418: 							model.telemetry.reportRemoveInvoked(
  419  								1,
  420  								state.includesInput(2),
  421  							);
  422  						});
  423  					},

  439  								modifiedBaseRange,
  440  								state.withInputValue(2, false),
  441  								true,
  442  								tx,
  443  							);
  444: 							model.telemetry.reportRemoveInvoked(
  445  								2,
  446  								state.includesInput(1),
  447  							);
  448  						});
  449  					},

  473  								modifiedBaseRange,
  474  								ModifiedBaseRangeState.base,
  475  								true,
  476  								tx,
  477  							);
  478: 							model.telemetry.reportResetToBaseInvoked();
  479  						});
  480  					},
  481  					localize(
  482  						"resetToBaseTooltip",
  483  						"Reset this conflict to the common ancestor of both the right and left changes.",
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\mergeEditor\browser\view\mergeEditor.ts:

```sh
   65  import {
   66  	IStorageService,
   67  	StorageScope,
   68  	StorageTarget,
   69  } from "vs/platform/storage/common/storage";
   70: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   71  import { IThemeService } from "vs/platform/theme/common/themeService";
   72  import { AbstractTextEditor } from "vs/workbench/browser/parts/editor/textEditor";
   73  import {
   74  	DEFAULT_EDITOR_ASSOCIATION,
   75  	EditorInputWithOptions,

  230  	constructor(
  231  		group: IEditorGroup,
  232  		@IInstantiationService instantiation: IInstantiationService,
  233  		@IContextKeyService
  234  		private readonly contextKeyService: IContextKeyService,
  235: 		@ITelemetryService telemetryService: ITelemetryService,
  236  		@IStorageService storageService: IStorageService,
  237  		@IThemeService themeService: IThemeService,
  238  		@ITextResourceConfigurationService
  239  		textResourceConfigurationService: ITextResourceConfigurationService,
  240  		@IConfigurationService

  248  		private readonly configurationService: IConfigurationService,
  249  	) {
  250  		super(
  251  			MergeEditor.ID,
  252  			group,
  253: 			telemetryService,
  254  			instantiation,
  255  			storageService,
  256  			textResourceConfigurationService,
  257  			themeService,
  258  			editorService,

  364  			this.inputResultView,
  365  			this.baseView,
  366  			this.showNonConflictingChanges,
  367  		);
  368
  369: 		model.telemetry.reportMergeEditorOpened({
  370  			combinableConflictCount: model.combinableConflictCount,
  371  			conflictCount: model.conflictCount,
  372
  373  			baseTop: this._layoutModeObs.get().showBaseAtTop,
  374  			baseVisible: this._layoutModeObs.get().showBase,

  791  	public setLayout(newLayout: IMergeEditorLayout): void {
  792  		const value = this._layoutMode.value;
  793  		if (JSON.stringify(value) === JSON.stringify(newLayout)) {
  794  			return;
  795  		}
  796: 		this.model?.telemetry.reportLayoutChange({
  797  			baseTop: newLayout.showBaseAtTop,
  798  			baseVisible: newLayout.showBase,
  799  			isColumnView: newLayout.kind === "columns",
  800  		});
  801  		this.applyLayout(newLayout);
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\mergeEditor\browser\view\editors\resultCodeEditorView.ts:

```sh
  148  					class: undefined,
  149  					enabled: count > 0,
  150  					id: "nextConflict",
  151  					label: text,
  152  					run() {
  153: 						vm.model.telemetry.reportConflictCounterClicked();
  154  						vm.goToNextModifiedBaseRange(
  155  							(m) => !model.isHandled(m).get(),
  156  						);
  157  					},
  158  					tooltip:
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\multiDiffEditor\browser\multiDiffEditor.ts:

```sh
  21  import { IDiffEditor } from "vs/editor/common/editorCommon";
  22  import { ITextResourceConfigurationService } from "vs/editor/common/services/textResourceConfiguration";
  23  import { IInstantiationService } from "vs/platform/instantiation/common/instantiation";
  24  import { InstantiationService } from "vs/platform/instantiation/common/instantiationService";
  25  import { IStorageService } from "vs/platform/storage/common/storage";
  26: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
  27  import { IThemeService } from "vs/platform/theme/common/themeService";
  28  import { ResourceLabel } from "vs/workbench/browser/labels";
  29  import { AbstractEditorWithViewState } from "vs/workbench/browser/parts/editor/editorWithViewState";
  30  import { ICompositeControl } from "vs/workbench/common/composite";
  31  import { IEditorOpenContext } from "vs/workbench/common/editor";

  53  	}
  54
  55  	constructor(
  56  		group: IEditorGroup,
  57  		@IInstantiationService instantiationService: InstantiationService,
  58: 		@ITelemetryService telemetryService: ITelemetryService,
  59  		@IThemeService themeService: IThemeService,
  60  		@IStorageService storageService: IStorageService,
  61  		@IEditorService editorService: IEditorService,
  62  		@IEditorGroupsService editorGroupService: IEditorGroupsService,
  63  		@ITextResourceConfigurationService

  65  	) {
  66  		super(
  67  			MultiDiffEditor.ID,
  68  			group,
  69  			"multiDiffEditor",
  70: 			telemetryService,
  71  			instantiationService,
  72  			storageService,
  73  			textResourceConfigurationService,
  74  			themeService,
  75  			editorService,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\notebook\browser\notebookEditor.ts:

```sh
   30  } from "vs/platform/files/common/files";
   31  import { IInstantiationService } from "vs/platform/instantiation/common/instantiation";
   32  import { ILogService } from "vs/platform/log/common/log";
   33  import { IEditorProgressService } from "vs/platform/progress/common/progress";
   34  import { IStorageService } from "vs/platform/storage/common/storage";
   35: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   36  import { IThemeService } from "vs/platform/theme/common/themeService";
   37  import { EditorPane } from "vs/workbench/browser/parts/editor/editorPane";
   38  import {
   39  	createEditorOpenError,
   40  	createTooLargeFileError,

  128  	protected readonly _onDidChangeScroll = this._register(new Emitter<void>());
  129  	readonly onDidChangeScroll = this._onDidChangeScroll.event;
  130
  131  	constructor(
  132  		group: IEditorGroup,
  133: 		@ITelemetryService telemetryService: ITelemetryService,
  134  		@IThemeService themeService: IThemeService,
  135  		@IInstantiationService
  136  		private readonly _instantiationService: IInstantiationService,
  137  		@IStorageService storageService: IStorageService,
  138  		@IEditorService private readonly _editorService: IEditorService,

  159  		private readonly _preferencesService: IPreferencesService,
  160  	) {
  161  		super(
  162  			NotebookEditor.ID,
  163  			group,
  164: 			telemetryService,
  165  			themeService,
  166  			storageService,
  167  		);
  168  		this._editorMemento = this.getEditorMemento<INotebookEditorViewState>(
  169  			_editorGroupService,

  749  				comment: "Length of text in all markdown cells";
  750  			};
  751  			notebookStatsLoaded: {
  752  				classification: "SystemMetaData";
  753  				purpose: "FeatureInsight";
  754: 				comment: "Time for generating the notebook level information for telemetry";
  755  			};
  756  		};
  757
  758  		type WorkbenchNotebookOpenEvent = {
  759  			scheme: string;

  844
  845  		this.logService.trace(
  846  			`[NotebookEditor] open notebook perf ${notebook?.uri.toString() ?? ""} - extensionActivation: ${extensionActivationTimespan}, inputLoad: ${inputLoadingTimespan}, webviewComm: ${webviewCommLoadingTimespan}, customMarkdown: ${customMarkdownLoadingTimespan}, editorLoad: ${editorLoadingTimespan}`,
  847  		);
  848
  849: 		this.telemetryService.publicLog2<
  850  			WorkbenchNotebookOpenEvent,
  851  			WorkbenchNotebookOpenClassification
  852  		>("notebook/editorOpenPerf", {
  853  			scheme: input.resource.scheme,
  854  			ext: extname(input.resource),

  885
  886  				type WorkbenchNotebookShouldPromptRecommendationEvent = {
  887  					shouldPrompt: boolean;
  888  				};
  889
  890: 				this.telemetryService.publicLog2<
  891  					WorkbenchNotebookShouldPromptRecommendationEvent,
  892  					WorkbenchNotebookShouldPromptRecommendationClassification
  893  				>("notebook/shouldPromptRecommendation", {
  894  					shouldPrompt: shouldPrompt,
  895  				});
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\notebook\browser\notebookEditorWidget.ts:

```sh
    74  } from "vs/platform/layout/browser/zIndexRegistry";
    75  import {
    76  	IEditorProgressService,
    77  	IProgressRunner,
    78  } from "vs/platform/progress/common/progress";
    79: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
    80  import {
    81  	contrastBorder,
    82  	errorForeground,
    83  	focusBorder,
    84  	foreground,

   485  		private readonly configurationService: IConfigurationService,
   486  		@IContextKeyService contextKeyService: IContextKeyService,
   487  		@ILayoutService private readonly layoutService: ILayoutService,
   488  		@IContextMenuService
   489  		private readonly contextMenuService: IContextMenuService,
   490: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
   491  		@INotebookExecutionService
   492  		private readonly notebookExecutionService: INotebookExecutionService,
   493  		@INotebookExecutionStateService
   494  		private readonly notebookExecutionStateService: INotebookExecutionStateService,
   495  		@IEditorProgressService

  1672  				scheme: string;
  1673  				ext: string;
  1674  				viewType: string;
  1675  			};
  1676
  1677: 			this.telemetryService.publicLog2<
  1678  				WorkbenchNotebookOpenEvent,
  1679  				WorkbenchNotebookOpenClassification
  1680  			>("notebook/editorOpened", {
  1681  				scheme: textModel.uri.scheme,
  1682  				ext: extname(textModel.uri),
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\notebook\browser\contrib\editorHint\emptyCellEditorHint.ts:

```sh
  13  import { IConfigurationService } from "vs/platform/configuration/common/configuration";
  14  import { IContextMenuService } from "vs/platform/contextview/browser/contextView";
  15  import { IHoverService } from "vs/platform/hover/browser/hover";
  16  import { IKeybindingService } from "vs/platform/keybinding/common/keybinding";
  17  import { IProductService } from "vs/platform/product/common/productService";
  18: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
  19  import { IChatAgentService } from "vs/workbench/contrib/chat/common/chatAgents";
  20  import {
  21  	EmptyTextEditorHintContribution,
  22  	IEmptyTextEditorHintOptions,
  23  } from "vs/workbench/contrib/codeEditor/browser/emptyTextEditorHint/emptyTextEditorHint";

  38  		@IHoverService hoverService: IHoverService,
  39  		@IKeybindingService keybindingService: IKeybindingService,
  40  		@IInlineChatSessionService
  41  		inlineChatSessionService: IInlineChatSessionService,
  42  		@IChatAgentService chatAgentService: IChatAgentService,
  43: 		@ITelemetryService telemetryService: ITelemetryService,
  44  		@IProductService productService: IProductService,
  45  		@IContextMenuService contextMenuService: IContextMenuService,
  46  	) {
  47  		super(
  48  			editor,

  51  			configurationService,
  52  			hoverService,
  53  			keybindingService,
  54  			inlineChatSessionService,
  55  			chatAgentService,
  56: 			telemetryService,
  57  			productService,
  58  			contextMenuService,
  59  		);
  60
  61  		const activeEditor = getNotebookEditorFromEditorPane(
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\notebook\browser\contrib\notebookVariables\notebookVariablesView.ts:

```sh
   19  import { IInstantiationService } from "vs/platform/instantiation/common/instantiation";
   20  import { IKeybindingService } from "vs/platform/keybinding/common/keybinding";
   21  import { WorkbenchAsyncDataTree } from "vs/platform/list/browser/listService";
   22  import { IOpenerService } from "vs/platform/opener/common/opener";
   23  import { IQuickInputService } from "vs/platform/quickinput/common/quickInput";
   24: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   25  import { IThemeService } from "vs/platform/theme/common/themeService";
   26  import {
   27  	IViewPaneOptions,
   28  	ViewPane,
   29  } from "vs/workbench/browser/parts/views/viewPane";

   96  		@IViewDescriptorService viewDescriptorService: IViewDescriptorService,
   97  		@IOpenerService openerService: IOpenerService,
   98  		@IQuickInputService protected quickInputService: IQuickInputService,
   99  		@ICommandService protected commandService: ICommandService,
  100  		@IThemeService themeService: IThemeService,
  101: 		@ITelemetryService telemetryService: ITelemetryService,
  102  		@IHoverService hoverService: IHoverService,
  103  		@IMenuService private readonly menuService: IMenuService,
  104  	) {
  105  		super(
  106  			options,

  110  			contextKeyService,
  111  			viewDescriptorService,
  112  			instantiationService,
  113  			openerService,
  114  			themeService,
  115: 			telemetryService,
  116  			hoverService,
  117  		);
  118
  119  		this._register(
  120  			this.editorService.onDidActiveEditorChange(
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\notebook\browser\controller\coreActions.ts:

```sh
   21  	MenuRegistry,
   22  } from "vs/platform/actions/common/actions";
   23  import { ContextKeyExpr } from "vs/platform/contextkey/common/contextkey";
   24  import { ServicesAccessor } from "vs/platform/instantiation/common/instantiation";
   25  import { KeybindingWeight } from "vs/platform/keybinding/common/keybindingsRegistry";
   26: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   27  import { isEditorCommandsContext } from "vs/workbench/common/editor";
   28  import {
   29  	cellRangeToViewCells,
   30  	getNotebookEditorFromEditorPane,
   31  	IActiveNotebookEditor,

  220  				return;
  221  			}
  222  		}
  223
  224  		if (from !== undefined) {
  225: 			const telemetryService = accessor.get(ITelemetryService);
  226: 			telemetryService.publicLog2<
  227  				WorkbenchActionExecutedEvent,
  228  				WorkbenchActionExecutedClassification
  229  			>("workbenchActionExecuted", { id: this.desc.id, from: from });
  230  		}
  231

  316  		const from = isFromCellToolbar
  317  			? "cellToolbar"
  318  			: isFromEditorToolbar
  319  				? "editorToolbar"
  320  				: "other";
  321: 		const telemetryService = accessor.get(ITelemetryService);
  322
  323  		if (isFromCellToolbar) {
  324: 			telemetryService.publicLog2<
  325  				WorkbenchActionExecutedEvent,
  326  				WorkbenchActionExecutedClassification
  327  			>("workbenchActionExecuted", { id: this.desc.id, from: from });
  328  			return this.runWithContext(accessor, context);
  329  		}
  330
  331  		// handle parsed args
  332
  333  		const parsedArgs = this.parseArgs(accessor, ...additionalArgs);
  334  		if (parsedArgs) {
  335: 			telemetryService.publicLog2<
  336  				WorkbenchActionExecutedEvent,
  337  				WorkbenchActionExecutedClassification
  338  			>("workbenchActionExecuted", { id: this.desc.id, from: from });
  339  			return this.runWithContext(accessor, parsedArgs);
  340  		}

  345  			const selectedCellRange: ICellRange[] =
  346  				editor.getSelections().length === 0
  347  					? [editor.getFocus()]
  348  					: editor.getSelections();
  349
  350: 			telemetryService.publicLog2<
  351  				WorkbenchActionExecutedEvent,
  352  				WorkbenchActionExecutedClassification
  353  			>("workbenchActionExecuted", { id: this.desc.id, from: from });
  354
  355  			return this.runWithContext(accessor, {

  386  		accessor: ServicesAccessor,
  387  		context?: INotebookCellActionContext,
  388  		...additionalArgs: any[]
  389  	): Promise<void> {
  390  		if (this.isCellActionContext(context)) {
  391: 			const telemetryService = accessor.get(ITelemetryService);
  392: 			telemetryService.publicLog2<
  393  				WorkbenchActionExecutedEvent,
  394  				WorkbenchActionExecutedClassification
  395  			>("workbenchActionExecuted", {
  396  				id: this.desc.id,
  397  				from: "cellToolbar",
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\notebook\browser\controller\chat\notebookChatController.ts:

```sh
  613  									)
  614  								);
  615  							},
  616  						},
  617  						menus: {
  618: 							telemetrySource: "notebook-generate-cell",
  619  						},
  620  					},
  621  				},
  622  			),
  623  		);
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\notebook\browser\diff\diffComponents.ts:

```sh
   45  } from "vs/platform/contextkey/common/contextkey";
   46  import { IContextMenuService } from "vs/platform/contextview/browser/contextView";
   47  import { IInstantiationService } from "vs/platform/instantiation/common/instantiation";
   48  import { IKeybindingService } from "vs/platform/keybinding/common/keybinding";
   49  import { INotificationService } from "vs/platform/notification/common/notification";
   50: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   51  import { IThemeService } from "vs/platform/theme/common/themeService";
   52  import { AccessibilityVerbositySettingId } from "vs/workbench/contrib/accessibility/browser/accessibilityConfiguration";
   53  import { MenuPreventer } from "vs/workbench/contrib/codeEditor/browser/menuPreventer";
   54  import { SelectionClipboardContributionID } from "vs/workbench/contrib/codeEditor/browser/selectionClipboard";
   55  import {

  192  		private readonly notificationService: INotificationService,
  193  		@IMenuService private readonly menuService: IMenuService,
  194  		@IContextKeyService
  195  		private readonly contextKeyService: IContextKeyService,
  196  		@IThemeService private readonly themeService: IThemeService,
  197: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
  198  		@IAccessibilityService
  199  		private readonly accessibilityService: IAccessibilityService,
  200  	) {
  201  		super();
  202  	}

  261  			this.menuService,
  262  			this.contextKeyService,
  263  			this.contextMenuService,
  264  			this.keybindingService,
  265  			this.commandService,
  266: 			this.telemetryService,
  267  		);
  268  		this._register(this._toolbar);
  269  		this._toolbar.context = {
  270  			cell: this.cell,
  271  		};
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\notebook\browser\diff\notebookDiffEditor.ts:

```sh
   34  import {
   35  	registerZIndex,
   36  	ZIndex,
   37  } from "vs/platform/layout/browser/zIndexRegistry";
   38  import { IStorageService } from "vs/platform/storage/common/storage";
   39: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   40  import {
   41  	diffDiagonalFill,
   42  	editorBackground,
   43  	focusBorder,
   44  	foreground,

  237  		private readonly contextKeyService: IContextKeyService,
  238  		@INotebookEditorWorkerService
  239  		private readonly notebookEditorWorkerService: INotebookEditorWorkerService,
  240  		@IConfigurationService
  241  		private readonly configurationService: IConfigurationService,
  242: 		@ITelemetryService telemetryService: ITelemetryService,
  243  		@IStorageService storageService: IStorageService,
  244  		@INotebookService private readonly notebookService: INotebookService,
  245  	) {
  246  		super(
  247  			NotebookTextDiffEditor.ID,
  248  			group,
  249: 			telemetryService,
  250  			themeService,
  251  			storageService,
  252  		);
  253  		this._notebookOptions = instantiationService.createInstance(
  254  			NotebookOptions,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\notebook\browser\diff\notebookMultiDiffEditor.ts:

```sh
   30  import { localize } from "vs/nls";
   31  import { IConfigurationService } from "vs/platform/configuration/common/configuration";
   32  import { IContextKeyService } from "vs/platform/contextkey/common/contextkey";
   33  import { IInstantiationService } from "vs/platform/instantiation/common/instantiation";
   34  import { IStorageService } from "vs/platform/storage/common/storage";
   35: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   36  import { IThemeService } from "vs/platform/theme/common/themeService";
   37  import { ResourceLabel } from "vs/workbench/browser/labels";
   38  import { EditorPane } from "vs/workbench/browser/parts/editor/editorPane";
   39  import { IEditorOpenContext } from "vs/workbench/common/editor";
   40  import { type IDiffElementViewModelBase } from "vs/workbench/contrib/notebook/browser/diff/diffElementViewModel";

  103  		private readonly _parentContextKeyService: IContextKeyService,
  104  		@INotebookEditorWorkerService
  105  		private readonly notebookEditorWorkerService: INotebookEditorWorkerService,
  106  		@IConfigurationService
  107  		private readonly configurationService: IConfigurationService,
  108: 		@ITelemetryService telemetryService: ITelemetryService,
  109  		@IStorageService storageService: IStorageService,
  110  		@INotebookService private readonly notebookService: INotebookService,
  111  	) {
  112  		super(
  113  			NotebookMultiTextDiffEditor.ID,
  114  			group,
  115: 			telemetryService,
  116  			themeService,
  117  			storageService,
  118  		);
  119  		this._notebookOptions = instantiationService.createInstance(
  120  			NotebookOptions,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\notebook\browser\view\cellParts\cellStatusPart.ts:

```sh
   28  import { ICommandService } from "vs/platform/commands/common/commands";
   29  import { IConfigurationService } from "vs/platform/configuration/common/configuration";
   30  import { IHoverService } from "vs/platform/hover/browser/hover";
   31  import { IInstantiationService } from "vs/platform/instantiation/common/instantiation";
   32  import { INotificationService } from "vs/platform/notification/common/notification";
   33: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   34  import { IThemeService } from "vs/platform/theme/common/themeService";
   35  import { INotebookCellActionContext } from "vs/workbench/contrib/notebook/browser/controller/coreActions";
   36  import {
   37  	CellFocusMode,
   38  	ICellViewModel,

  410  		private readonly _hoverDelegate: IHoverDelegate,
  411  		private readonly _editor: ICodeEditor | undefined,
  412  		itemModel: INotebookCellStatusBarItem,
  413  		maxWidth: number | undefined,
  414  		@ITelemetryService
  415: 		private readonly _telemetryService: ITelemetryService,
  416  		@ICommandService private readonly _commandService: ICommandService,
  417  		@INotificationService
  418  		private readonly _notificationService: INotificationService,
  419  		@IThemeService private readonly _themeService: IThemeService,
  420  		@IHoverService private readonly _hoverService: IHoverService,

  541  			command.arguments.length === 0
  542  		) {
  543  			args.unshift(this._context);
  544  		}
  545
  546: 		this._telemetryService.publicLog2<
  547  			WorkbenchActionExecutedEvent,
  548  			WorkbenchActionExecutedClassification
  549  		>("workbenchActionExecuted", { id, from: "cell status bar" });
  550  		try {
  551  			this._editor?.focus();
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\notebook\browser\view\renderers\backLayerWebView.ts:

```sh
    43  	ITextEditorSelection,
    44  } from "vs/platform/editor/common/editor";
    45  import { IFileService } from "vs/platform/files/common/files";
    46  import { IOpenerService } from "vs/platform/opener/common/opener";
    47  import { IStorageService } from "vs/platform/storage/common/storage";
    48: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
    49  import {
    50  	editorFindMatch,
    51  	editorFindMatchHighlight,
    52  } from "vs/platform/theme/common/colorRegistry";
    53  import { IThemeService, Themable } from "vs/platform/theme/common/themeService";

   306  		@IStorageService private readonly storageService: IStorageService,
   307  		@IPathService private readonly pathService: IPathService,
   308  		@INotebookLoggingService
   309  		private readonly notebookLogService: INotebookLoggingService,
   310  		@IThemeService themeService: IThemeService,
   311: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
   312  	) {
   313  		super(themeService);
   314
   315  		this._logRendererDebugMessage(
   316  			"Creating backlayer webview for notebook",

  1050  								const outputId = uri.query;
  1051  								const cell =
  1052  									this.reversedInsetMapping.get(outputId);
  1053
  1054  								if (cell) {
  1055: 									this.telemetryService.publicLog2<
  1056  										WorkbenchActionExecutedEvent,
  1057  										WorkbenchActionExecutedClassification
  1058  									>("workbenchActionExecuted", {
  1059  										id: "notebook.cell.toggleOutputScrolling",
  1060  										from: "inlineLink",

  1369  			mimeType: string;
  1370  			outputSize: number;
  1371  			renderTime: number;
  1372  		};
  1373
  1374: 		const telemetryData = {
  1375  			mimeType,
  1376  			outputSize,
  1377  			renderTime,
  1378  		};
  1379
  1380: 		this.telemetryService.publicLog2<
  1381  			NotebookOutputRenderEvent,
  1382  			NotebookOutputRenderClassification
  1383: 		>("NotebookCellOutputRender", telemetryData);
  1384  	}
  1385
  1386  	private _handleNotebookCellResource(uri: URI) {
  1387  		const notebookResource = uri.path.length > 0 ? uri : this.documentUri;
  1388
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\notebook\common\notebookEditorModel.ts:

```sh
   20  import { IConfigurationService } from "vs/platform/configuration/common/configuration";
   21  import {
   22  	IFileStatWithMetadata,
   23  	IWriteFileOptions,
   24  } from "vs/platform/files/common/files";
   25: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   26  import {
   27  	IRevertOptions,
   28  	ISaveOptions,
   29  	IUntypedEditorInput,
   30  } from "vs/workbench/common/editor";

  318
  319  	constructor(
  320  		private readonly _notebookModel: NotebookTextModel,
  321  		private readonly _notebookService: INotebookService,
  322  		private readonly _configurationService: IConfigurationService,
  323: 		private readonly _telemetryService: ITelemetryService,
  324  		private readonly _notebookLogService: INotebookLoggingService,
  325  	) {
  326  		super();
  327
  328  		this.onWillDispose = _notebookModel.onWillDispose.bind(_notebookModel);

  416  							classification: "SystemMetaData";
  417  							purpose: "PerformanceAndHealth";
  418  							comment: "Info about the error that occurred";
  419  						};
  420  					};
  421: 					this._telemetryService.publicLogError2<
  422  						notebookSaveErrorData,
  423  						notebookSaveErrorClassification
  424  					>("notebook/SaveError", {
  425  						isRemote:
  426  							this._notebookModel.uri.scheme ===

  555  		private readonly _viewType: string,
  556  		@INotebookService private readonly _notebookService: INotebookService,
  557  		@IConfigurationService
  558  		private readonly _configurationService: IConfigurationService,
  559  		@ITelemetryService
  560: 		private readonly _telemetryService: ITelemetryService,
  561  		@INotebookLoggingService
  562  		private readonly _notebookLogService: INotebookLoggingService,
  563  	) {}
  564
  565  	async createModel(

  577
  578  		return new NotebookFileWorkingCopyModel(
  579  			notebookModel,
  580  			this._notebookService,
  581  			this._configurationService,
  582: 			this._telemetryService,
  583  			this._notebookLogService,
  584  		);
  585  	}
  586  }
  587
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\notebook\common\notebookEditorModelResolverServiceImpl.ts:

```sh
   19  import { assertIsDefined } from "vs/base/common/types";
   20  import { URI } from "vs/base/common/uri";
   21  import { IConfigurationService } from "vs/platform/configuration/common/configuration";
   22  import { IFileReadLimits } from "vs/platform/files/common/files";
   23  import { IInstantiationService } from "vs/platform/instantiation/common/instantiation";
   24: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   25  import { IUriIdentityService } from "vs/platform/uriIdentity/common/uriIdentity";
   26  import {
   27  	CellUri,
   28  	IResolvedNotebookEditorModel,
   29  	NotebookEditorModelCreationOptions,

   81  		private readonly _instantiationService: IInstantiationService,
   82  		@INotebookService private readonly _notebookService: INotebookService,
   83  		@IConfigurationService
   84  		private readonly _configurationService: IConfigurationService,
   85  		@ITelemetryService
   86: 		private readonly _telemetryService: ITelemetryService,
   87  		@INotebookLoggingService
   88  		private readonly _notebookLoggingService: INotebookLoggingService,
   89  	) {
   90  		super();
   91  	}

  121  		if (!workingCopyManager) {
  122  			const factory = new NotebookFileWorkingCopyModelFactory(
  123  				viewType,
  124  				this._notebookService,
  125  				this._configurationService,
  126: 				this._telemetryService,
  127  				this._notebookLoggingService,
  128  			);
  129  			workingCopyManager = <
  130  				IFileWorkingCopyManager<
  131  					NotebookFileWorkingCopyModel,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\outline\browser\outlinePane.ts:

```sh
   37  import { IInstantiationService } from "vs/platform/instantiation/common/instantiation";
   38  import { IKeybindingService } from "vs/platform/keybinding/common/keybinding";
   39  import { WorkbenchDataTree } from "vs/platform/list/browser/listService";
   40  import { IOpenerService } from "vs/platform/opener/common/opener";
   41  import { IStorageService } from "vs/platform/storage/common/storage";
   42: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   43  import { defaultProgressBarStyles } from "vs/platform/theme/browser/defaultStyles";
   44  import { IThemeService } from "vs/platform/theme/common/themeService";
   45  import { ViewPane } from "vs/workbench/browser/parts/views/viewPane";
   46  import { IViewletViewOptions } from "vs/workbench/browser/parts/views/viewsViewlet";
   47  import {

  124  		@IKeybindingService keybindingService: IKeybindingService,
  125  		@IContextKeyService contextKeyService: IContextKeyService,
  126  		@IContextMenuService contextMenuService: IContextMenuService,
  127  		@IOpenerService openerService: IOpenerService,
  128  		@IThemeService themeService: IThemeService,
  129: 		@ITelemetryService telemetryService: ITelemetryService,
  130  		@IHoverService hoverService: IHoverService,
  131  	) {
  132  		super(
  133  			options,
  134  			keybindingService,

  137  			contextKeyService,
  138  			viewDescriptorService,
  139  			_instantiationService,
  140  			openerService,
  141  			themeService,
  142: 			telemetryService,
  143  			hoverService,
  144  		);
  145  		this._outlineViewState.restore(this._storageService);
  146  		this._disposables.add(this._outlineViewState);
  147
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\output\browser\outputView.ts:

```sh
   27  import { IInstantiationService } from "vs/platform/instantiation/common/instantiation";
   28  import { ServiceCollection } from "vs/platform/instantiation/common/serviceCollection";
   29  import { IKeybindingService } from "vs/platform/keybinding/common/keybinding";
   30  import { IOpenerService } from "vs/platform/opener/common/opener";
   31  import { IStorageService } from "vs/platform/storage/common/storage";
   32: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   33  import { IThemeService } from "vs/platform/theme/common/themeService";
   34  import { computeEditorAriaLabel } from "vs/workbench/browser/editor";
   35  import { IEditorConfiguration } from "vs/workbench/browser/parts/editor/textEditor";
   36  import { AbstractTextResourceEditor } from "vs/workbench/browser/parts/editor/textResourceEditor";
   37  import {

   72  		@IContextKeyService contextKeyService: IContextKeyService,
   73  		@IViewDescriptorService viewDescriptorService: IViewDescriptorService,
   74  		@IInstantiationService instantiationService: IInstantiationService,
   75  		@IOpenerService openerService: IOpenerService,
   76  		@IThemeService themeService: IThemeService,
   77: 		@ITelemetryService telemetryService: ITelemetryService,
   78  		@IHoverService hoverService: IHoverService,
   79  	) {
   80  		super(
   81  			options,
   82  			keybindingService,

   85  			contextKeyService,
   86  			viewDescriptorService,
   87  			instantiationService,
   88  			openerService,
   89  			themeService,
   90: 			telemetryService,
   91  			hoverService,
   92  		);
   93  		this.scrollLockContextKey = CONTEXT_OUTPUT_SCROLL_LOCK.bindTo(
   94  			this.contextKeyService,
   95  		);

  223
  224  class OutputEditor extends AbstractTextResourceEditor {
  225  	private readonly resourceContext: ResourceContextKey;
  226
  227  	constructor(
  228: 		@ITelemetryService telemetryService: ITelemetryService,
  229  		@IInstantiationService instantiationService: IInstantiationService,
  230  		@IStorageService storageService: IStorageService,
  231  		@IConfigurationService
  232  		private readonly configurationService: IConfigurationService,
  233  		@ITextResourceConfigurationService

  238  		@IFileService fileService: IFileService,
  239  	) {
  240  		super(
  241  			OUTPUT_VIEW_ID,
  242  			editorGroupService.activeGroup /* TODO@bpasero this is wrong */,
  243: 			telemetryService,
  244  			instantiationService,
  245  			storageService,
  246  			textResourceConfigurationService,
  247  			themeService,
  248  			editorGroupService,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\performance\browser\inputLatencyContrib.ts:

```sh
   5
   6  import { inputLatency } from "vs/base/browser/performance";
   7  import { RunOnceScheduler } from "vs/base/common/async";
   8  import { Event } from "vs/base/common/event";
   9  import { Disposable, MutableDisposable } from "vs/base/common/lifecycle";
  10: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
  11  import { IWorkbenchContribution } from "vs/workbench/common/contributions";
  12  import { IEditorService } from "vs/workbench/services/editor/common/editorService";
  13
  14  export class InputLatencyContrib
  15  	extends Disposable

  19  	private readonly _scheduler: RunOnceScheduler;
  20
  21  	constructor(
  22  		@IEditorService private readonly _editorService: IEditorService,
  23  		@ITelemetryService
  24: 		private readonly _telemetryService: ITelemetryService,
  25  	) {
  26  		super();
  27
  28  		// The current sampling strategy is when the active editor changes, start sampling and
  29  		// report the results after 60 seconds. It's done this way as we don't want to sample

  89  		};
  90
  91  		type PerformanceInputLatencyEvent =
  92  			inputLatency.IInputLatencyMeasurements;
  93
  94: 		this._telemetryService.publicLog2<
  95  			PerformanceInputLatencyEvent,
  96  			PerformanceInputLatencyClassification
  97  		>("performance.inputLatency", {
  98  			keydown: measurements.keydown,
  99  			input: measurements.input,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\performance\browser\startupTimings.ts:

```sh
    6  import { hash } from "vs/base/common/hash";
    7  import { posix } from "vs/base/common/path";
    8  import { isCodeEditor } from "vs/editor/browser/editorBrowser";
    9  import { ILogService } from "vs/platform/log/common/log";
   10  import { IProductService } from "vs/platform/product/common/productService";
   11: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   12  import { IUpdateService } from "vs/platform/update/common/update";
   13  import { IWorkspaceTrustManagementService } from "vs/platform/workspace/common/workspaceTrust";
   14  import { IWorkbenchContribution } from "vs/workbench/common/contributions";
   15  import { ViewContainerLocation } from "vs/workbench/common/views";
   16  import * as files from "vs/workbench/contrib/files/common/files";

   91  		workspaceTrustService: IWorkspaceTrustManagementService,
   92  		@ITimerService private readonly timerService: ITimerService,
   93  		@ILogService private readonly logService: ILogService,
   94  		@IBrowserWorkbenchEnvironmentService
   95  		private readonly environmentService: IBrowserWorkbenchEnvironmentService,
   96: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
   97  		@IProductService private readonly productService: IProductService,
   98  	) {
   99  		super(
  100  			editorService,
  101  			paneCompositeService,

  115  		await this.timerService.whenReady();
  116
  117  		const standardStartupError = await this._isStandardStartup();
  118  		const perfBaseline = await this.timerService.perfBaseline;
  119  		const [from, to] = this.environmentService.profDurationMarkers;
  120: 		const content = `${this.timerService.getDuration(from, to)}\t${this.productService.nameShort}\t${(this.productService.commit || "").slice(0, 10) || "0000000000"}\t${this.telemetryService.sessionId}\t${standardStartupError === undefined ? "standard_start" : "NO_standard_start : " + standardStartupError}\t${String(perfBaseline).padStart(4, "0")}ms\n`;
  121
  122  		this.logService.info(`[prof-timers] ${content}`);
  123  	}
  124  }
  125
  126  export class BrowserResourcePerformanceMarks {
  127: 	constructor(@ITelemetryService telemetryService: ITelemetryService) {
  128  		type Entry = {
  129  			hosthash: string;
  130  			name: string;
  131  			duration: number;
  132  		};

  152  		for (const item of performance.getEntriesByType("resource")) {
  153  			try {
  154  				const url = new URL(item.name);
  155  				const name = posix.basename(url.pathname);
  156
  157: 				telemetryService.publicLog2<Entry, EntryClassifify>(
  158  					"startup.resource.perf",
  159  					{
  160  						hosthash: `H${hash(url.host).toString(16)}`,
  161  						name,
  162  						duration: item.duration,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\performance\electron-sandbox\startupTimings.ts:

```sh
    9  import { onUnexpectedError } from "vs/base/common/errors";
   10  import { URI } from "vs/base/common/uri";
   11  import { IFileService } from "vs/platform/files/common/files";
   12  import { INativeHostService } from "vs/platform/native/common/native";
   13  import { IProductService } from "vs/platform/product/common/productService";
   14: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   15  import { IUpdateService } from "vs/platform/update/common/update";
   16  import { IWorkspaceTrustManagementService } from "vs/platform/workspace/common/workspaceTrust";
   17  import { IWorkbenchContribution } from "vs/workbench/common/contributions";
   18  import { StartupTimings } from "vs/workbench/contrib/performance/browser/startupTimings";
   19  import { IEditorService } from "vs/workbench/services/editor/common/editorService";

   51  		private readonly _nativeHostService: INativeHostService,
   52  		@IEditorService editorService: IEditorService,
   53  		@IPaneCompositePartService
   54  		paneCompositeService: IPaneCompositePartService,
   55  		@ITelemetryService
   56: 		private readonly _telemetryService: ITelemetryService,
   57  		@ILifecycleService lifecycleService: ILifecycleService,
   58  		@IUpdateService updateService: IUpdateService,
   59  		@INativeWorkbenchEnvironmentService
   60  		private readonly _environmentService: INativeWorkbenchEnvironmentService,
   61  		@IProductService private readonly _productService: IProductService,

   92  		}
   93
   94  		try {
   95  			await Promise.all([
   96  				this._timerService.whenReady(),
   97: 				timeout(15000), // wait: cached data creation, telemetry sending
   98  			]);
   99
  100  			const perfBaseline = await this._timerService.perfBaseline;
  101  			const heapStatistics = await this._resolveStartupHeapStatistics();
  102  			if (heapStatistics) {
  103: 				this._telemetryLogHeapStatistics(heapStatistics);
  104  			}
  105
  106  			if (appendTo) {
  107  				const content =
  108  					coalesce([
  109  						this._timerService.startupMetrics.ellapsed,
  110  						this._productService.nameShort,
  111  						(this._productService.commit || "").slice(0, 10) ||
  112  							"0000000000",
  113: 						this._telemetryService.sessionId,
  114  						standardStartupError === undefined
  115  							? "standard_start"
  116  							: `NO_standard_start : ${standardStartupError}`,
  117  						`${String(perfBaseline).padStart(4, "0")}ms`,
  118  						heapStatistics

  255  		}
  256
  257  		return undefined;
  258  	}
  259
  260: 	private _telemetryLogHeapStatistics({
  261  		used,
  262  		garbage,
  263  		majorGCs,
  264  		minorGCs,
  265  		duration,

  298  			heapGarbage: number;
  299  			majorGCs: number;
  300  			minorGCs: number;
  301  			gcsDuration: number;
  302  		};
  303: 		this._telemetryService.publicLog2<
  304  			StartupHeapStatisticsEvent,
  305  			StartupHeapStatisticsClassification
  306  		>("startupHeapStatistics", {
  307  			heapUsed: used,
  308  			heapGarbage: garbage,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\preferences\browser\keybindingsEditor.ts:

```sh
   64  import {
   65  	IStorageService,
   66  	StorageScope,
   67  	StorageTarget,
   68  } from "vs/platform/storage/common/storage";
   69: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   70  import {
   71  	defaultKeybindingLabelStyles,
   72  	defaultToggleStyles,
   73  	getInputBoxStyle,
   74  } from "vs/platform/theme/browser/defaultStyles";

  201  	private ariaLabelElement!: HTMLElement;
  202  	readonly overflowWidgetsDomNode: HTMLElement;
  203
  204  	constructor(
  205  		group: IEditorGroup,
  206: 		@ITelemetryService telemetryService: ITelemetryService,
  207  		@IThemeService themeService: IThemeService,
  208  		@IKeybindingService
  209  		private readonly keybindingsService: IKeybindingService,
  210  		@IContextMenuService
  211  		private readonly contextMenuService: IContextMenuService,

  226  		private readonly accessibilityService: IAccessibilityService,
  227  	) {
  228  		super(
  229  			KeybindingsEditor.ID,
  230  			group,
  231: 			telemetryService,
  232  			themeService,
  233  			storageService,
  234  		);
  235  		this.delayedFiltering = new Delayer<void>(300);
  236  		this._register(
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\preferences\browser\preferences.contribution.ts:

```sh
  842  					}
  843  					run(accessor: ServicesAccessor) {
  844  						const editorPane =
  845  							accessor.get(IEditorService).activeEditorPane;
  846  						if (editorPane instanceof SettingsEditor2) {
  847: 							editorPane.focusSearch(`@tag:telemetry`);
  848  						} else {
  849  							accessor.get(IPreferencesService).openSettings({
  850  								jsonEditor: false,
  851: 								query: "@tag:telemetry",
  852  							});
  853  						}
  854  					}
  855  				},
  856  			),
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\preferences\browser\settingsEditor2.ts:

```sh
    71  import {
    72  	IStorageService,
    73  	StorageScope,
    74  	StorageTarget,
    75  } from "vs/platform/storage/common/storage";
    76: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
    77  import { defaultButtonStyles } from "vs/platform/theme/browser/defaultStyles";
    78  import {
    79  	asCssVariable,
    80  	badgeBackground,
    81  	badgeForeground,

   240  		"@tag:notebookOutputLayout",
   241  		`@tag:${REQUIRE_TRUSTED_WORKSPACE_SETTING_TAG}`,
   242  		`@tag:${WORKSPACE_TRUST_SETTING_TAG}`,
   243  		"@tag:sync",
   244  		"@tag:usesOnlineServices",
   245: 		"@tag:telemetry",
   246  		"@tag:accessibility",
   247  		`@${ID_SETTING_TAG}`,
   248  		`@${EXTENSION_SETTING_TAG}`,
   249  		`@${FEATURE_SETTING_TAG}scm`,
   250  		`@${FEATURE_SETTING_TAG}explorer`,

   357
   358  	private readonly inputChangeListener: MutableDisposable<IDisposable>;
   359
   360  	constructor(
   361  		group: IEditorGroup,
   362: 		@ITelemetryService telemetryService: ITelemetryService,
   363  		@IWorkbenchConfigurationService
   364  		private readonly configurationService: IWorkbenchConfigurationService,
   365  		@ITextResourceConfigurationService
   366  		textResourceConfigurationService: ITextResourceConfigurationService,
   367  		@IThemeService themeService: IThemeService,

   395  		userDataProfileService: IUserDataProfileService,
   396  	) {
   397  		super(
   398  			SettingsEditor2.ID,
   399  			group,
   400: 			telemetryService,
   401  			themeService,
   402  			storageService,
   403  		);
   404  		this.delayedFilterLogging = new Delayer<void>(1000);
   405  		this.searchDelayer = new Delayer(300);

  1899  			showConfiguredOnly: props.showConfiguredOnly,
  1900  			isReset: props.isReset,
  1901  			target: reportedTarget,
  1902  		};
  1903
  1904: 		this.telemetryService.publicLog2<
  1905  			SettingsEditorModifiedSettingEvent,
  1906  			SettingsEditorModifiedSettingClassification
  1907  		>("settingsEditor.settingModified", data);
  1908  	}
  1909

  2533  		const data = {
  2534  			"counts.nlpResult": counts["nlpResult"],
  2535  			"counts.filterResult": counts["filterResult"],
  2536  			"counts.uniqueResultsCount": uniqueResults?.filterMatches.length,
  2537  		};
  2538: 		this.telemetryService.publicLog2<
  2539  			SettingsEditorFilterEvent,
  2540  			SettingsEditorFilterClassification
  2541  		>("settingsEditor.filter", data);
  2542  	}
  2543

  2719  					// };
  2720
  2721  					// const message = getErrorMessage(err).trim();
  2722  					// if (message && message !== 'Error') {
  2723  					// 	// "Error" = any generic network error
  2724: 					// 	this.telemetryService.publicLogError2<SettingsSearchErrorEvent, SettingsSearchErrorClassification>('settingsEditor.searchError', { message });
  2725  					// 	this.logService.info('Setting search error: ' + message);
  2726  					// }
  2727  					return null;
  2728  				}
  2729  			},

  2809  		@ICommandService private readonly commandService: ICommandService,
  2810  		@IUserDataSyncService
  2811  		private readonly userDataSyncService: IUserDataSyncService,
  2812  		@IUserDataSyncEnablementService
  2813  		private readonly userDataSyncEnablementService: IUserDataSyncEnablementService,
  2814: 		@ITelemetryService telemetryService: ITelemetryService,
  2815  	) {
  2816  		super();
  2817
  2818  		const headerRightControlsContainer = DOM.append(
  2819  			container,

  2842  		);
  2843  		DOM.hide(this.turnOnSyncButton.element);
  2844
  2845  		this._register(
  2846  			this.turnOnSyncButton.onDidClick(async () => {
  2847: 				telemetryService.publicLog2<
  2848  					{},
  2849  					{
  2850  						owner: "sandy081";
  2851  						comment: "This event tracks whenever settings sync is turned on from settings editor.";
  2852  					}
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\preferences\browser\settingsLayout.ts:

```sh
  279  					id: "application/update",
  280  					label: localize("update", "Update"),
  281  					settings: ["update.*"],
  282  				},
  283  				{
  284: 					id: "application/telemetry",
  285: 					label: localize("telemetry", "Telemetry"),
  286: 					settings: ["telemetry.*"],
  287  				},
  288  				{
  289  					id: "application/settingsSync",
  290  					label: localize("settingsSync", "Settings Sync"),
  291  					settings: ["settingsSync.*"],
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\preferences\browser\settingsTree.ts:

```sh
    78  	WorkbenchObjectTree,
    79  } from "vs/platform/list/browser/listService";
    80  import { ILogService } from "vs/platform/log/common/log";
    81  import { IOpenerService } from "vs/platform/opener/common/opener";
    82  import { IProductService } from "vs/platform/product/common/productService";
    83: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
    84  import {
    85  	defaultButtonStyles,
    86  	getInputBoxStyle,
    87  	getListStyles,
    88  	getSelectBoxStyles,

  1130  		protected readonly _extensionsService: IExtensionService,
  1131  		@IExtensionsWorkbenchService
  1132  		protected readonly _extensionsWorkbenchService: IExtensionsWorkbenchService,
  1133  		@IProductService protected readonly _productService: IProductService,
  1134  		@ITelemetryService
  1135: 		protected readonly _telemetryService: ITelemetryService,
  1136  		@IHoverService protected readonly _hoverService: IHoverService,
  1137  	) {
  1138  		super();
  1139
  1140  		this.markdownRenderer = this._register(

  3063  		template.elementDisposables.clear();
  3064
  3065  		const extensionId = dataElement.setting.displayExtensionId!;
  3066  		template.elementDisposables.add(
  3067  			template.actionButton.onDidClick(async () => {
  3068: 				this._telemetryService.publicLog2<
  3069  					{ extensionId: String },
  3070  					ManageExtensionClickTelemetryClassification
  3071  				>("ManageExtensionClick", { extensionId });
  3072  				this._commandService.executeCommand(
  3073  					"extension.open",

  3076  			}),
  3077  		);
  3078
  3079  		template.elementDisposables.add(
  3080  			template.dismissButton.onDidClick(async () => {
  3081: 				this._telemetryService.publicLog2<
  3082  					{ extensionId: String },
  3083  					ManageExtensionClickTelemetryClassification
  3084  				>("DismissExtensionClick", { extensionId });
  3085  				this._onDidDismissExtensionSetting.fire(extensionId);
  3086  			}),
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\quickaccess\browser\commandsQuickAccess.ts:

```sh
   44  import {
   45  	IQuickInputService,
   46  	IQuickPickSeparator,
   47  } from "vs/platform/quickinput/common/quickInput";
   48  import { IStorageService } from "vs/platform/storage/common/storage";
   49: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   50  import { IWorkbenchQuickAccessConfiguration } from "vs/workbench/browser/quickaccess";
   51  import { CHAT_OPEN_ACTION_ID } from "vs/workbench/contrib/chat/browser/actions/chatActions";
   52  import { ASK_QUICK_QUESTION_ACTION_ID } from "vs/workbench/contrib/chat/browser/actions/chatQuickInputActions";
   53  import {
   54  	ChatAgentLocation,

   98  		@IMenuService private readonly menuService: IMenuService,
   99  		@IExtensionService private readonly extensionService: IExtensionService,
  100  		@IInstantiationService instantiationService: IInstantiationService,
  101  		@IKeybindingService keybindingService: IKeybindingService,
  102  		@ICommandService commandService: ICommandService,
  103: 		@ITelemetryService telemetryService: ITelemetryService,
  104  		@IDialogService dialogService: IDialogService,
  105  		@IConfigurationService
  106  		private readonly configurationService: IConfigurationService,
  107  		@IEditorGroupsService
  108  		private readonly editorGroupService: IEditorGroupsService,

  122  				}),
  123  			},
  124  			instantiationService,
  125  			keybindingService,
  126  			commandService,
  127: 			telemetryService,
  128  			dialogService,
  129  		);
  130
  131  		this._register(
  132  			configurationService.onDidChangeConfiguration((e) =>
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\remote\browser\remote.ts:

```sh
    46  	PersistentConnectionEventType,
    47  	ReconnectionWaitEvent,
    48  } from "vs/platform/remote/common/remoteAgentConnection";
    49  import { getRemoteName } from "vs/platform/remote/common/remoteHosts";
    50  import { IStorageService } from "vs/platform/storage/common/storage";
    51: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
    52  import { IThemeService } from "vs/platform/theme/common/themeService";
    53  import { getVirtualWorkspaceLocation } from "vs/platform/workspace/common/virtualWorkspace";
    54  import { IWorkspaceContextService } from "vs/platform/workspace/common/workspace";
    55  import { ReloadWindowAction } from "vs/workbench/browser/actions/windowActions";
    56  import {

   654  		@IRemoteExplorerService
   655  		protected readonly remoteExplorerService: IRemoteExplorerService,
   656  		@IWorkbenchEnvironmentService
   657  		protected readonly environmentService: IWorkbenchEnvironmentService,
   658  		@IThemeService themeService: IThemeService,
   659: 		@ITelemetryService telemetryService: ITelemetryService,
   660  		@IHoverService hoverService: IHoverService,
   661  		@IWorkspaceContextService
   662  		private readonly workspaceContextService: IWorkspaceContextService,
   663  		@IWalkthroughsService
   664  		private readonly walkthroughsService: IWalkthroughsService,

   671  			contextKeyService,
   672  			viewDescriptorService,
   673  			instantiationService,
   674  			openerService,
   675  			themeService,
   676: 			telemetryService,
   677  			hoverService,
   678  		);
   679  	}
   680
   681  	protected override renderBody(container: HTMLElement): void {

   763  	private hasRegisteredHelpView: boolean = false;
   764  	private remoteSwitcher: SwitchRemoteViewItem | undefined;
   765
   766  	constructor(
   767  		@IWorkbenchLayoutService layoutService: IWorkbenchLayoutService,
   768: 		@ITelemetryService telemetryService: ITelemetryService,
   769  		@IWorkspaceContextService contextService: IWorkspaceContextService,
   770  		@IStorageService storageService: IStorageService,
   771  		@IConfigurationService configurationService: IConfigurationService,
   772  		@IInstantiationService instantiationService: IInstantiationService,
   773  		@IThemeService themeService: IThemeService,

   780  		super(
   781  			VIEWLET_ID,
   782  			remoteExplorerService.onDidChangeTargetType,
   783  			configurationService,
   784  			layoutService,
   785: 			telemetryService,
   786  			storageService,
   787  			instantiationService,
   788  			themeService,
   789  			contextMenuService,
   790  			extensionService,

  1110  		@ICommandService commandService: ICommandService,
  1111  		@IQuickInputService quickInputService: IQuickInputService,
  1112  		@ILogService logService: ILogService,
  1113  		@IWorkbenchEnvironmentService
  1114  		environmentService: IWorkbenchEnvironmentService,
  1115: 		@ITelemetryService telemetryService: ITelemetryService,
  1116  	) {
  1117  		super();
  1118  		const connection = remoteAgentService.getConnection();
  1119  		if (connection) {
  1120  			let quickInputVisible = false;

  1221  						remoteName: string | undefined;
  1222  						reconnectionToken: string;
  1223  						millisSinceLastIncomingData: number;
  1224  						attempt: number;
  1225  					};
  1226: 					telemetryService.publicLog2<
  1227  						ReconnectReloadEvent,
  1228  						ReconnectReloadClassification
  1229  					>("remoteReconnectionReload", {
  1230  						remoteName: getRemoteName(
  1231  							environmentService.remoteAuthority,

  1276  						};
  1277  						type RemoteConnectionLostEvent = {
  1278  							remoteName: string | undefined;
  1279  							reconnectionToken: string;
  1280  						};
  1281: 						telemetryService.publicLog2<
  1282  							RemoteConnectionLostEvent,
  1283  							RemoteConnectionLostClassification
  1284  						>("remoteConnectionLost", {
  1285  							remoteName: getRemoteName(
  1286  								environmentService.remoteAuthority,

  1355  							remoteName: string | undefined;
  1356  							reconnectionToken: string;
  1357  							millisSinceLastIncomingData: number;
  1358  							attempt: number;
  1359  						};
  1360: 						telemetryService.publicLog2<
  1361  							RemoteReconnectionRunningEvent,
  1362  							RemoteReconnectionRunningClassification
  1363  						>("remoteReconnectionRunning", {
  1364  							remoteName: getRemoteName(
  1365  								environmentService.remoteAuthority,

  1447  							reconnectionToken: string;
  1448  							millisSinceLastIncomingData: number;
  1449  							attempt: number;
  1450  							handled: boolean;
  1451  						};
  1452: 						telemetryService.publicLog2<
  1453  							RemoteReconnectionPermanentFailureEvent,
  1454  							RemoteReconnectionPermanentFailureClassification
  1455  						>("remoteReconnectionPermanentFailure", {
  1456  							remoteName: getRemoteName(
  1457  								environmentService.remoteAuthority,

  1533  							remoteName: string | undefined;
  1534  							reconnectionToken: string;
  1535  							millisSinceLastIncomingData: number;
  1536  							attempt: number;
  1537  						};
  1538: 						telemetryService.publicLog2<
  1539  							RemoteConnectionGainEvent,
  1540  							RemoteConnectionGainClassification
  1541  						>("remoteConnectionGain", {
  1542  							remoteName: getRemoteName(
  1543  								environmentService.remoteAuthority,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\remote\browser\remoteConnectionHealth.ts:

```sh
   14  import {
   15  	IStorageService,
   16  	StorageScope,
   17  	StorageTarget,
   18  } from "vs/platform/storage/common/storage";
   19: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   20  import { IWorkbenchContribution } from "vs/workbench/common/contributions";
   21  import { IBannerService } from "vs/workbench/services/banner/browser/bannerService";
   22  import { IWorkbenchEnvironmentService } from "vs/workbench/services/environment/common/environmentService";
   23  import { IHostService } from "vs/workbench/services/host/browser/host";
   24  import {

   38  		@IRemoteAgentService
   39  		private readonly _remoteAgentService: IRemoteAgentService,
   40  		@IWorkbenchEnvironmentService
   41  		private readonly _environmentService: IWorkbenchEnvironmentService,
   42  		@ITelemetryService
   43: 		private readonly _telemetryService: ITelemetryService,
   44  		@IBannerService private readonly bannerService: IBannerService,
   45  		@IDialogService private readonly dialogService: IDialogService,
   46  		@IOpenerService private readonly openerService: IOpenerService,
   47  		@IHostService private readonly hostService: IHostService,
   48  		@IStorageService private readonly storageService: IStorageService,

  210  			type RemoteConnectionSuccessEvent = {
  211  				web: boolean;
  212  				connectionTimeMs: number | undefined;
  213  				remoteName: string | undefined;
  214  			};
  215: 			this._telemetryService.publicLog2<
  216  				RemoteConnectionSuccessEvent,
  217  				RemoteConnectionSuccessClassification
  218  			>("remoteConnectionSuccess", {
  219  				web: isWeb,
  220  				connectionTimeMs: await this._remoteAgentService

  255  				web: boolean;
  256  				remoteName: string | undefined;
  257  				connectionTimeMs: number | undefined;
  258  				message: string;
  259  			};
  260: 			this._telemetryService.publicLog2<
  261  				RemoteConnectionFailureEvent,
  262  				RemoteConnectionFailureClassification
  263  			>("remoteConnectionFailure", {
  264  				web: isWeb,
  265  				connectionTimeMs: await this._remoteAgentService

  304  			web: boolean;
  305  			remoteName: string | undefined;
  306  			latencyMs: number;
  307  		};
  308
  309: 		this._telemetryService.publicLog2<
  310  			RemoteConnectionLatencyEvent,
  311  			RemoteConnectionLatencyClassification
  312  		>("remoteConnectionLatency", {
  313  			web: isWeb,
  314  			remoteName: getRemoteName(this._environmentService.remoteAuthority),
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\remote\browser\remoteIndicator.ts:

```sh
    66  } from "vs/platform/quickinput/common/quickInput";
    67  import { Registry } from "vs/platform/registry/common/platform";
    68  import { PersistentConnectionEventType } from "vs/platform/remote/common/remoteAgentConnection";
    69  import { IRemoteAuthorityResolverService } from "vs/platform/remote/common/remoteAuthorityResolver";
    70  import { getRemoteName } from "vs/platform/remote/common/remoteHosts";
    71: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
    72  import { getVirtualWorkspaceLocation } from "vs/platform/workspace/common/virtualWorkspace";
    73  import { IWorkspaceContextService } from "vs/platform/workspace/common/workspace";
    74  import { ReloadWindowAction } from "vs/workbench/browser/actions/windowActions";
    75  import { workbenchConfigurationNodeBase } from "vs/workbench/common/configuration";
    76  import {

   236  		@IWorkspaceContextService
   237  		private readonly workspaceContextService: IWorkspaceContextService,
   238  		@ILogService private readonly logService: ILogService,
   239  		@IExtensionGalleryService
   240  		private readonly extensionGalleryService: IExtensionGalleryService,
   241: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
   242  		@IProductService private readonly productService: IProductService,
   243  		@IExtensionManagementService
   244  		private readonly extensionManagementService: IExtensionManagementService,
   245  		@IOpenerService private readonly openerService: IOpenerService,
   246  		@IConfigurationService

   681  		type RemoteConnectionHealthEvent = {
   682  			remoteName: string | undefined;
   683  			reconnectionToken: string;
   684  			connectionHealth: "good" | "poor";
   685  		};
   686: 		this.telemetryService.publicLog2<
   687  			RemoteConnectionHealthEvent,
   688  			RemoteConnectionHealthClassification
   689  		>("remoteConnectionHealth", {
   690  			remoteName: getRemoteName(this.remoteAuthority),
   691  			reconnectionToken: connectionToken,

  1022  			300,
  1023  			10,
  1024  		);
  1025
  1026  		this.commandService.executeCommand(startCommand);
  1027: 		this.telemetryService.publicLog2<
  1028  			WorkbenchActionExecutedEvent,
  1029  			WorkbenchActionExecutedClassification
  1030  		>("workbenchActionExecuted", {
  1031  			id: "remoteInstallAndRun",
  1032  			detail: extensionId,

  1232  						await this.runRemoteStartCommand(
  1233  							remoteExtension.id,
  1234  							remoteExtension.startCommand,
  1235  						);
  1236  					} else {
  1237: 						this.telemetryService.publicLog2<
  1238  							WorkbenchActionExecutedEvent,
  1239  							WorkbenchActionExecutedClassification
  1240  						>("workbenchActionExecuted", {
  1241  							id: commandId,
  1242  							from: "remote indicator",
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\remote\browser\remoteStartEntry.ts:

```sh
   16  	RawContextKey,
   17  } from "vs/platform/contextkey/common/contextkey";
   18  import { IExtensionManagementService } from "vs/platform/extensionManagement/common/extensionManagement";
   19  import { ExtensionIdentifier } from "vs/platform/extensions/common/extensions";
   20  import { IProductService } from "vs/platform/product/common/productService";
   21: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   22  import { IWorkbenchContribution } from "vs/workbench/common/contributions";
   23  import { IWorkbenchExtensionEnablementService } from "vs/workbench/services/extensionManagement/common/extensionManagement";
   24
   25  export const showStartEntryInWeb = new RawContextKey<boolean>(
   26  	"showRemoteStartEntryInWeb",

   41  		@IProductService private readonly productService: IProductService,
   42  		@IExtensionManagementService
   43  		private readonly extensionManagementService: IExtensionManagementService,
   44  		@IWorkbenchExtensionEnablementService
   45  		private readonly extensionEnablementService: IWorkbenchExtensionEnablementService,
   46: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
   47  		@IContextKeyService
   48  		private readonly contextKeyService: IContextKeyService,
   49  	) {
   50  		super();
   51

  133  		}
  134  	}
  135
  136  	private async showWebRemoteStartActions() {
  137  		this.commandService.executeCommand(this.startCommand);
  138: 		this.telemetryService.publicLog2<
  139  			WorkbenchActionExecutedEvent,
  140  			WorkbenchActionExecutedClassification
  141  		>("workbenchActionExecuted", {
  142  			id: this.startCommand,
  143  			from: "remote start entry",
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\remote\browser\tunnelView.ts:

```sh
    88  	IQuickInputService,
    89  	IQuickPickItem,
    90  	QuickPickInput,
    91  } from "vs/platform/quickinput/common/quickInput";
    92  import { TunnelPrivacy } from "vs/platform/remote/common/remoteAuthorityResolver";
    93: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
    94  import {
    95  	defaultButtonStyles,
    96  	defaultInputBoxStyles,
    97  } from "vs/platform/theme/browser/defaultStyles";
    98  import { registerColor } from "vs/platform/theme/common/colorRegistry";

  1157  		@ICommandService protected commandService: ICommandService,
  1158  		@IMenuService private readonly menuService: IMenuService,
  1159  		@IThemeService themeService: IThemeService,
  1160  		@IRemoteExplorerService
  1161  		private readonly remoteExplorerService: IRemoteExplorerService,
  1162: 		@ITelemetryService telemetryService: ITelemetryService,
  1163  		@IHoverService hoverService: IHoverService,
  1164  		@ITunnelService private readonly tunnelService: ITunnelService,
  1165  		@IContextViewService
  1166  		private readonly contextViewService: IContextViewService,
  1167  	) {

  1173  			contextKeyService,
  1174  			viewDescriptorService,
  1175  			instantiationService,
  1176  			openerService,
  1177  			themeService,
  1178: 			telemetryService,
  1179  			hoverService,
  1180  		);
  1181  		this.tunnelTypeContext = TunnelTypeContextKey.bindTo(contextKeyService);
  1182  		this.tunnelCloseableContext =
  1183  			TunnelCloseableContextKey.bindTo(contextKeyService);
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\remote\electron-sandbox\remote.contribution.ts:

```sh
35 import {
36 IStorageService,
37 StorageScope,
38 StorageTarget,
39 } from "vs/platform/storage/common/storage"
40: import { TELEMETRY_SETTING_ID } from "vs/platform/telemetry/common/telemetry"
41: import { getTelemetryLevel } from "vs/platform/telemetry/common/telemetryUtils"
42 import {
43 IWorkspaceContextService,
44 WorkbenchState,
45 } from "vs/platform/workspace/common/workspace"
46 import {
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\replNotebook\browser\replEditor.ts:

```sh
   37  	TextEditorSelectionSource,
   38  } from "vs/platform/editor/common/editor";
   39  import { IInstantiationService } from "vs/platform/instantiation/common/instantiation";
   40  import { IKeybindingService } from "vs/platform/keybinding/common/keybinding";
   41  import { IStorageService } from "vs/platform/storage/common/storage";
   42: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   43  import { IThemeService } from "vs/platform/theme/common/themeService";
   44  import { EditorPane } from "vs/workbench/browser/parts/editor/editorPane";
   45  import {
   46  	EditorPaneSelectionChangeReason,
   47  	IEditorMemento,

  164  	private _onDidChangeScroll = this._register(new Emitter<void>());
  165  	readonly onDidChangeScroll = this._onDidChangeScroll.event;
  166
  167  	constructor(
  168  		group: IEditorGroup,
  169: 		@ITelemetryService telemetryService: ITelemetryService,
  170  		@IThemeService themeService: IThemeService,
  171  		@IStorageService storageService: IStorageService,
  172  		@IInstantiationService instantiationService: IInstantiationService,
  173  		@INotebookEditorService notebookWidgetService: INotebookEditorService,
  174  		@IContextKeyService contextKeyService: IContextKeyService,

  187  		@IExtensionService extensionService: IExtensionService,
  188  	) {
  189  		super(
  190  			REPL_EDITOR_ID,
  191  			group,
  192: 			telemetryService,
  193  			themeService,
  194  			storageService,
  195  		);
  196  		this._notebookWidgetService = notebookWidgetService;
  197  		this._configurationService = configurationService;
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\scm\browser\scmHistoryViewPane.ts:

```sh
    89  	WorkbenchAsyncDataTree,
    90  } from "vs/platform/list/browser/listService";
    91  import { observableConfigValue } from "vs/platform/observable/common/platformObservableUtils";
    92  import { IOpenerService } from "vs/platform/opener/common/opener";
    93  import { IProgressService } from "vs/platform/progress/common/progress";
    94: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
    95  import {
    96  	ColorIdentifier,
    97  	registerColor,
    98  } from "vs/platform/theme/common/colorRegistry";
    99  import { IThemeService } from "vs/platform/theme/common/themeService";

   256  		@IContextKeyService private contextKeyService: IContextKeyService,
   257  		@IContextMenuService private contextMenuService: IContextMenuService,
   258  		@IHoverService private hoverService: IHoverService,
   259  		@IKeybindingService private keybindingService: IKeybindingService,
   260  		@IMenuService private menuService: IMenuService,
   261: 		@ITelemetryService private telemetryService: ITelemetryService,
   262  	) {}
   263
   264  	renderTemplate(container: HTMLElement): RepositoryTemplate {
   265  		// hack
   266  		if (container.classList.contains("monaco-tl-contents")) {

   293  			this.menuService,
   294  			this.contextKeyService,
   295  			this.contextMenuService,
   296  			this.keybindingService,
   297  			this.commandService,
   298: 			this.telemetryService,
   299  		);
   300
   301  		return {
   302  			label,
   303  			labelCustomHover,

  1204  		@IInstantiationService instantiationService: IInstantiationService,
  1205  		@IViewDescriptorService viewDescriptorService: IViewDescriptorService,
  1206  		@IContextKeyService contextKeyService: IContextKeyService,
  1207  		@IOpenerService openerService: IOpenerService,
  1208  		@IThemeService themeService: IThemeService,
  1209: 		@ITelemetryService telemetryService: ITelemetryService,
  1210  		@IHoverService hoverService: IHoverService,
  1211  	) {
  1212  		super(
  1213  			{ ...options, titleMenuId: MenuId.SCMHistoryTitle },
  1214  			keybindingService,

  1217  			contextKeyService,
  1218  			viewDescriptorService,
  1219  			instantiationService,
  1220  			openerService,
  1221  			themeService,
  1222: 			telemetryService,
  1223  			hoverService,
  1224  		);
  1225
  1226  		this._scmHistoryItemGroupHasRemoteContextKey =
  1227  			this.scopedContextKeyService.createKey(
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\scm\browser\scmRepositoriesViewPane.ts:

```sh
  23  import { IHoverService } from "vs/platform/hover/browser/hover";
  24  import { IInstantiationService } from "vs/platform/instantiation/common/instantiation";
  25  import { IKeybindingService } from "vs/platform/keybinding/common/keybinding";
  26  import { WorkbenchList } from "vs/platform/list/browser/listService";
  27  import { IOpenerService } from "vs/platform/opener/common/opener";
  28: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
  29  import { IThemeService } from "vs/platform/theme/common/themeService";
  30  import {
  31  	IViewPaneOptions,
  32  	ViewPane,
  33  } from "vs/workbench/browser/parts/views/viewPane";

  68  		@IViewDescriptorService viewDescriptorService: IViewDescriptorService,
  69  		@IContextKeyService contextKeyService: IContextKeyService,
  70  		@IConfigurationService configurationService: IConfigurationService,
  71  		@IOpenerService openerService: IOpenerService,
  72  		@IThemeService themeService: IThemeService,
  73: 		@ITelemetryService telemetryService: ITelemetryService,
  74  		@IHoverService hoverService: IHoverService,
  75  	) {
  76  		super(
  77  			{ ...options, titleMenuId: MenuId.SCMSourceControlTitle },
  78  			keybindingService,

  81  			contextKeyService,
  82  			viewDescriptorService,
  83  			instantiationService,
  84  			openerService,
  85  			themeService,
  86: 			telemetryService,
  87  			hoverService,
  88  		);
  89  	}
  90
  91  	protected override renderBody(container: HTMLElement): void {
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\scm\browser\scmRepositoryRenderer.ts:

```sh
   30  import { ICommandService } from "vs/platform/commands/common/commands";
   31  import { IContextKeyService } from "vs/platform/contextkey/common/contextkey";
   32  import { IContextMenuService } from "vs/platform/contextview/browser/contextView";
   33  import { IHoverService } from "vs/platform/hover/browser/hover";
   34  import { IKeybindingService } from "vs/platform/keybinding/common/keybinding";
   35: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   36  import { defaultCountBadgeStyles } from "vs/platform/theme/browser/defaultStyles";
   37  import {
   38  	ISCMProvider,
   39  	ISCMRepository,
   40  	ISCMViewService,

  105  		@IContextMenuService private contextMenuService: IContextMenuService,
  106  		@IHoverService private hoverService: IHoverService,
  107  		@IKeybindingService private keybindingService: IKeybindingService,
  108  		@IMenuService private menuService: IMenuService,
  109  		@ISCMViewService private scmViewService: ISCMViewService,
  110: 		@ITelemetryService private telemetryService: ITelemetryService,
  111  	) {}
  112
  113  	renderTemplate(container: HTMLElement): RepositoryTemplate {
  114  		// hack
  115  		if (container.classList.contains("monaco-tl-contents")) {

  140  			this.menuService,
  141  			this.contextKeyService,
  142  			this.contextMenuService,
  143  			this.keybindingService,
  144  			this.commandService,
  145: 			this.telemetryService,
  146  		);
  147  		const countContainer = append(provider, $(".count"));
  148  		const count = new CountBadge(
  149  			countContainer,
  150  			{},
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\scm\browser\scmViewPane.ts:

```sh
   205  import {
   206  	IStorageService,
   207  	StorageScope,
   208  	StorageTarget,
   209  } from "vs/platform/storage/common/storage";
   210: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   211  import {
   212  	defaultButtonStyles,
   213  	defaultCountBadgeStyles,
   214  } from "vs/platform/theme/browser/defaultStyles";
   215  import {

  1306  		@IKeybindingService
  1307  		private readonly keybindingService: IKeybindingService,
  1308  		@ICommandService private readonly commandService: ICommandService,
  1309  		@IMenuService private readonly menuService: IMenuService,
  1310  		@ISCMViewService private readonly scmViewService: ISCMViewService,
  1311: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
  1312  	) {}
  1313
  1314  	renderTemplate(container: HTMLElement) {
  1315  		// hack
  1316  		(

  1334  			this.menuService,
  1335  			this.contextKeyService,
  1336  			this.contextMenuService,
  1337  			this.keybindingService,
  1338  			this.commandService,
  1339: 			this.telemetryService,
  1340  		);
  1341  		templateDisposables.add(toolBar);
  1342
  1343  		const countContainer = append(element, $(".count"));
  1344  		const count = new CountBadge(

  2324  		private readonly contextMenuService: IContextMenuService,
  2325  		@IKeybindingService
  2326  		private readonly keybindingService: IKeybindingService,
  2327  		@ICommandService private readonly commandService: ICommandService,
  2328  		@IMenuService private readonly menuService: IMenuService,
  2329: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
  2330  	) {}
  2331
  2332  	renderTemplate(container: HTMLElement): SeparatorTemplate {
  2333  		// hack
  2334  		(

  2355  			this.menuService,
  2356  			this.contextKeyService,
  2357  			this.contextMenuService,
  2358  			this.keybindingService,
  2359  			this.commandService,
  2360: 			this.telemetryService,
  2361  		);
  2362  		templateDisposables.add(toolBar);
  2363
  2364  		return {
  2365  			label,

  3475  		private readonly contextKeyService: IContextKeyService,
  3476  		@IContextMenuService contextMenuService: IContextMenuService,
  3477  		@ICommandService commandService: ICommandService,
  3478  		@IKeybindingService keybindingService: IKeybindingService,
  3479  		@IStorageService private readonly storageService: IStorageService,
  3480: 		@ITelemetryService telemetryService: ITelemetryService,
  3481  	) {
  3482  		super(
  3483  			container,
  3484  			{ resetMenu: MenuId.SCMInputBox, ...options },
  3485  			menuService,
  3486  			contextKeyService,
  3487  			contextMenuService,
  3488  			keybindingService,
  3489  			commandService,
  3490: 			telemetryService,
  3491  		);
  3492
  3493  		this._dropdownAction = new Action(
  3494  			"scmInputMoreActions",
  3495  			localize("scmInputMoreActions", "More Actions..."),

  4558  		@IInstantiationService instantiationService: IInstantiationService,
  4559  		@IViewDescriptorService viewDescriptorService: IViewDescriptorService,
  4560  		@IConfigurationService configurationService: IConfigurationService,
  4561  		@IContextKeyService contextKeyService: IContextKeyService,
  4562  		@IOpenerService openerService: IOpenerService,
  4563: 		@ITelemetryService telemetryService: ITelemetryService,
  4564  		@IHoverService hoverService: IHoverService,
  4565  	) {
  4566  		super(
  4567  			{ ...options, titleMenuId: MenuId.SCMTitle },
  4568  			keybindingService,

  4571  			contextKeyService,
  4572  			viewDescriptorService,
  4573  			instantiationService,
  4574  			openerService,
  4575  			themeService,
  4576: 			telemetryService,
  4577  			hoverService,
  4578  		);
  4579
  4580  		// View mode and sort key
  4581  		this._viewMode = this.getViewMode();
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\scm\browser\scmViewPaneContainer.ts:

```sh
   8  import { localize } from "vs/nls";
   9  import { IConfigurationService } from "vs/platform/configuration/common/configuration";
  10  import { IContextMenuService } from "vs/platform/contextview/browser/contextView";
  11  import { IInstantiationService } from "vs/platform/instantiation/common/instantiation";
  12  import { IStorageService } from "vs/platform/storage/common/storage";
  13: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
  14  import { IThemeService } from "vs/platform/theme/common/themeService";
  15  import { IWorkspaceContextService } from "vs/platform/workspace/common/workspace";
  16  import { ViewPaneContainer } from "vs/workbench/browser/parts/views/viewPaneContainer";
  17  import { IViewDescriptorService } from "vs/workbench/common/views";
  18  import {

  24
  25  export class SCMViewPaneContainer extends ViewPaneContainer {
  26  	constructor(
  27  		@ISCMViewService private readonly scmViewService: ISCMViewService,
  28  		@IWorkbenchLayoutService layoutService: IWorkbenchLayoutService,
  29: 		@ITelemetryService telemetryService: ITelemetryService,
  30  		@IInstantiationService instantiationService: IInstantiationService,
  31  		@IContextMenuService contextMenuService: IContextMenuService,
  32  		@IThemeService themeService: IThemeService,
  33  		@IStorageService storageService: IStorageService,
  34  		@IConfigurationService configurationService: IConfigurationService,

  41  			{ mergeViewWithContainerWhenSingleView: true },
  42  			instantiationService,
  43  			configurationService,
  44  			layoutService,
  45  			contextMenuService,
  46: 			telemetryService,
  47  			extensionService,
  48  			themeService,
  49  			storageService,
  50  			contextService,
  51  			viewDescriptorService,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\search\browser\anythingQuickAccess.ts:

```sh
  978  		filePattern?: string;
  979  		cacheKey?: string;
  980  		maxResults?: number;
  981  	}): IFileQueryBuilderOptions {
  982  		return {
  983: 			_reason: "openFileHandler", // used for telemetry - do not change
  984  			extraFileResources: this.instantiationService.invokeFunction(
  985  				getOutOfWorkspaceEditorResources,
  986  			),
  987  			filePattern: input.filePattern || "",
  988  			cacheKey: input.cacheKey,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\search\browser\searchModel.ts:

```sh
    54  	IProgress,
    55  	IProgressService,
    56  	IProgressStep,
    57  	ProgressLocation,
    58  } from "vs/platform/progress/common/progress";
    59: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
    60  import {
    61  	minimapFindMatch,
    62  	overviewRulerFindMatchForeground,
    63  } from "vs/platform/theme/common/colorRegistry";
    64  import { themeColorFromId } from "vs/platform/theme/common/themeService";

  2770  	private aiSearchCancelledForNewSearch: boolean = false;
  2771  	public location: SearchModelLocation = SearchModelLocation.PANEL;
  2772
  2773  	constructor(
  2774  		@ISearchService private readonly searchService: ISearchService,
  2775: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
  2776  		@IConfigurationService
  2777  		private readonly configurationService: IConfigurationService,
  2778  		@IInstantiationService
  2779  		private readonly instantiationService: IInstantiationService,
  2780  		@ILogService private readonly logService: ILogService,

  3054  					"owner": "roblourens",
  3055  					"duration" : { "classification": "SystemMetaData", "purpose": "PerformanceAndHealth", "isMeasurement": true }
  3056  				}
  3057  			*/
  3058  			event?.dispose();
  3059: 			this.telemetryService.publicLog("searchResultsFirstRender", {
  3060  				duration: Date.now() - start,
  3061  			});
  3062  		});
  3063
  3064  		try {

  3085  				"searchResultsFinished" : {
  3086  					"owner": "roblourens",
  3087  					"duration" : { "classification": "SystemMetaData", "purpose": "PerformanceAndHealth", "isMeasurement": true }
  3088  				}
  3089  			*/
  3090: 			this.telemetryService.publicLog("searchResultsFinished", {
  3091  				duration: Date.now() - start,
  3092  			});
  3093  		}
  3094  	}
  3095

  3145  				"type" : { "classification": "SystemMetaData", "purpose": "PerformanceAndHealth" },
  3146  				"scheme" : { "classification": "SystemMetaData", "purpose": "PerformanceAndHealth" },
  3147  				"searchOnTypeEnabled" : { "classification": "SystemMetaData", "purpose": "FeatureInsight" }
  3148  			}
  3149  		*/
  3150: 		this.telemetryService.publicLog("searchResultsShown", {
  3151  			count: this._searchResult.count(),
  3152  			fileCount: this._searchResult.fileCount(),
  3153  			options,
  3154  			duration,
  3155  			type: stats && stats.type,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\search\browser\searchView.ts:

```sh
   95  import {
   96  	IStorageService,
   97  	StorageScope,
   98  	StorageTarget,
   99  } from "vs/platform/storage/common/storage";
  100: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
  101  import {
  102  	defaultInputBoxStyles,
  103  	defaultToggleStyles,
  104  } from "vs/platform/theme/browser/defaultStyles";
  105  import {

  317  		@IAccessibilityService
  318  		private readonly accessibilityService: IAccessibilityService,
  319  		@IKeybindingService keybindingService: IKeybindingService,
  320  		@IStorageService private readonly storageService: IStorageService,
  321  		@IOpenerService openerService: IOpenerService,
  322: 		@ITelemetryService telemetryService: ITelemetryService,
  323  		@IHoverService hoverService: IHoverService,
  324  		@INotebookService private readonly notebookService: INotebookService,
  325  		@ILogService private readonly logService: ILogService,
  326  		@IAccessibilitySignalService
  327  		private readonly accessibilitySignalService: IAccessibilitySignalService,

  334  			contextKeyService,
  335  			viewDescriptorService,
  336  			instantiationService,
  337  			openerService,
  338  			themeService,
  339: 			telemetryService,
  340  			hoverService,
  341  		);
  342
  343  		this.container = dom.$(".search-view");
  344
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\searchEditor\browser\searchEditor.ts:

```sh
   50  import {
   51  	IEditorProgressService,
   52  	LongRunningOperation,
   53  } from "vs/platform/progress/common/progress";
   54  import { IStorageService } from "vs/platform/storage/common/storage";
   55: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   56  import {
   57  	defaultToggleStyles,
   58  	getInputBoxStyle,
   59  } from "vs/platform/theme/browser/defaultStyles";
   60  import {

  146  	private ongoingOperations: number = 0;
  147  	private updatingModelForSearch: boolean = false;
  148
  149  	constructor(
  150  		group: IEditorGroup,
  151: 		@ITelemetryService telemetryService: ITelemetryService,
  152  		@IThemeService themeService: IThemeService,
  153  		@IStorageService storageService: IStorageService,
  154  		@IModelService private readonly modelService: IModelService,
  155  		@IWorkspaceContextService
  156  		private readonly contextService: IWorkspaceContextService,

  174  		@IHoverService private readonly hoverService: IHoverService,
  175  	) {
  176  		super(
  177  			SearchEditor.ID,
  178  			group,
  179: 			telemetryService,
  180  			instantiationService,
  181  			storageService,
  182  			textResourceService,
  183  			themeService,
  184  			editorService,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\searchEditor\browser\searchEditorActions.ts:

```sh
   14  import {
   15  	IInstantiationService,
   16  	ServicesAccessor,
   17  } from "vs/platform/instantiation/common/instantiation";
   18  import { ILabelService } from "vs/platform/label/common/label";
   19: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   20  import { IWorkspaceContextService } from "vs/platform/workspace/common/workspace";
   21  import { EditorsOrder } from "vs/workbench/common/editor";
   22  import { getSearchView } from "vs/workbench/contrib/search/browser/searchActionsBase";
   23  import { SearchResult } from "vs/workbench/contrib/search/browser/searchModel";
   24  import { SearchEditor } from "vs/workbench/contrib/searchEditor/browser/searchEditor";

  135  	_args: OpenSearchEditorArgs = {},
  136  	toSide = false,
  137  ) => {
  138  	const editorService = accessor.get(IEditorService);
  139  	const editorGroupsService = accessor.get(IEditorGroupsService);
  140: 	const telemetryService = accessor.get(ITelemetryService);
  141  	const instantiationService = accessor.get(IInstantiationService);
  142  	const configurationService = accessor.get(IConfigurationService);
  143
  144  	const configurationResolverService = accessor.get(
  145  		IConfigurationResolverService,

  191  			const active = editorService.activeEditorPane as SearchEditor;
  192  			selected = active.getSelected();
  193  		}
  194  	}
  195
  196: 	telemetryService.publicLog2<
  197  		{},
  198  		{
  199  			owner: "roblourens";
  200  			comment: "Fired when a search editor is opened";
  201  		}

  281  		);
  282  		return;
  283  	}
  284
  285  	const editorService = accessor.get(IEditorService);
  286: 	const telemetryService = accessor.get(ITelemetryService);
  287  	const instantiationService = accessor.get(IInstantiationService);
  288  	const labelService = accessor.get(ILabelService);
  289  	const configurationService = accessor.get(IConfigurationService);
  290  	const sortOrder =
  291  		configurationService.getValue<ISearchConfigurationProperties>(
  292  			"search",
  293  		).sortOrder;
  294
  295: 	telemetryService.publicLog2<
  296  		{},
  297  		{
  298  			owner: "roblourens";
  299  			comment: "Fired when a search editor is opened from the search view";
  300  		}
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\searchEditor\browser\searchEditorInput.ts:

```sh
   28  import {
   29  	IStorageService,
   30  	StorageScope,
   31  	StorageTarget,
   32  } from "vs/platform/storage/common/storage";
   33: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   34  import { registerIcon } from "vs/platform/theme/common/iconRegistry";
   35  import {
   36  	EditorInputCapabilities,
   37  	EditorResourceAccessor,
   38  	GroupIdentifier,

  162  		private readonly fileDialogService: IFileDialogService,
  163  		@IInstantiationService
  164  		private readonly instantiationService: IInstantiationService,
  165  		@IWorkingCopyService
  166  		private readonly workingCopyService: IWorkingCopyService,
  167: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
  168  		@IPathService private readonly pathService: IPathService,
  169  		@IStorageService storageService: IStorageService,
  170  	) {
  171  		super();
  172

  301  		const path = await this.fileDialogService.pickFileToSave(
  302  			await this.suggestFileName(),
  303  			options?.availableFileSystems,
  304  		);
  305  		if (path) {
  306: 			this.telemetryService.publicLog2<
  307  				{},
  308  				{
  309  					owner: "roblourens";
  310  					comment: "Fired when a search editor is saved";
  311  				}
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\share\browser\shareService.ts:

```sh
   18  import { ILabelService } from "vs/platform/label/common/label";
   19  import {
   20  	IQuickInputService,
   21  	IQuickPickItem,
   22  } from "vs/platform/quickinput/common/quickInput";
   23: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   24  import {
   25  	IShareableItem,
   26  	IShareProvider,
   27  	IShareService,
   28  } from "vs/workbench/contrib/share/common/share";

   56  		@IContextKeyService private contextKeyService: IContextKeyService,
   57  		@ILabelService private readonly labelService: ILabelService,
   58  		@IQuickInputService private quickInputService: IQuickInputService,
   59  		@ICodeEditorService
   60  		private readonly codeEditorService: ICodeEditorService,
   61: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
   62  	) {
   63  		this.providerCount = ShareProviderCountContext.bindTo(
   64  			this.contextKeyService,
   65  		);
   66  	}

  107  		if (providers.length === 0) {
  108  			return undefined;
  109  		}
  110
  111  		if (providers.length === 1) {
  112: 			this.telemetryService.publicLog2<ShareEvent, ShareClassification>(
  113  				"shareService.share",
  114  				{ providerId: providers[0].id },
  115  			);
  116  			return providers[0].provideShare(item, token);
  117  		}

  130  			},
  131  			token,
  132  		);
  133
  134  		if (selected !== undefined) {
  135: 			this.telemetryService.publicLog2<ShareEvent, ShareClassification>(
  136  				"shareService.share",
  137  				{ providerId: selected.provider.id },
  138  			);
  139  			return selected.provider.provideShare(item, token);
  140  		}
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\speech\browser\speechService.ts:

```sh
   18  } from "vs/base/common/lifecycle";
   19  import { localize } from "vs/nls";
   20  import { IConfigurationService } from "vs/platform/configuration/common/configuration";
   21  import { IContextKeyService } from "vs/platform/contextkey/common/contextkey";
   22  import { ILogService } from "vs/platform/log/common/log";
   23: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   24  import {
   25  	HasSpeechProvider,
   26  	ISpeechProvider,
   27  	ISpeechService,
   28  	ISpeechToTextSession,

  105  	constructor(
  106  		@ILogService private readonly logService: ILogService,
  107  		@IContextKeyService
  108  		private readonly contextKeyService: IContextKeyService,
  109  		@IHostService private readonly hostService: IHostService,
  110: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
  111  		@IConfigurationService
  112  		private readonly configurationService: IConfigurationService,
  113  		@IExtensionService private readonly extensionService: IExtensionService,
  114  	) {
  115  		super();

  268  				sessionRecognized: boolean;
  269  				sessionError: boolean;
  270  				sessionContentLength: number;
  271  				sessionLanguage: string;
  272  			};
  273: 			this.telemetryService.publicLog2<
  274  				SpeechToTextSessionEvent,
  275  				SpeechToTextSessionClassification
  276  			>("speechToTextSession", {
  277  				context,
  278  				sessionDuration: Date.now() - sessionStart,

  422  				context: string;
  423  				sessionDuration: number;
  424  				sessionError: boolean;
  425  				sessionLanguage: string;
  426  			};
  427: 			this.telemetryService.publicLog2<
  428  				TextToSpeechSessionEvent,
  429  				TextToSpeechSessionClassification
  430  			>("textToSpeechSession", {
  431  				context,
  432  				sessionDuration: Date.now() - sessionStart,

  573  			};
  574  		};
  575  		type KeywordRecognitionEvent = {
  576  			keywordRecognized: boolean;
  577  		};
  578: 		this.telemetryService.publicLog2<
  579  			KeywordRecognitionEvent,
  580  			KeywordRecognitionClassification
  581  		>("keywordRecognition", {
  582  			keywordRecognized: status === KeywordRecognitionStatus.Recognized,
  583  		});
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\surveys\browser\languageSurveys.contribution.ts:

```sh
   21  import {
   22  	IStorageService,
   23  	StorageScope,
   24  	StorageTarget,
   25  } from "vs/platform/storage/common/storage";
   26: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   27  import {
   28  	IWorkbenchContribution,
   29  	IWorkbenchContributionsRegistry,
   30  	Extensions as WorkbenchExtensions,
   31  } from "vs/workbench/common/contributions";

   39  class LanguageSurvey extends Disposable {
   40  	constructor(
   41  		data: ISurveyData,
   42  		storageService: IStorageService,
   43  		notificationService: INotificationService,
   44: 		telemetryService: ITelemetryService,
   45  		languageService: ILanguageService,
   46  		textFileService: ITextFileService,
   47  		openerService: IOpenerService,
   48  		productService: IProductService,
   49  	) {

  192  			),
  193  			[
  194  				{
  195  					label: localize("takeShortSurvey", "Take Short Survey"),
  196  					run: () => {
  197: 						telemetryService.publicLog(
  198  							`${data.surveyId}.survey/takeShortSurvey`,
  199  						);
  200  						openerService.open(
  201  							URI.parse(
  202: 								`${data.surveyUrl}?o=${encodeURIComponent(platform)}&v=${encodeURIComponent(productService.version)}&m=${encodeURIComponent(telemetryService.machineId)}`,
  203  							),
  204  						);
  205  						storageService.store(
  206  							IS_CANDIDATE_KEY,
  207  							false,

  217  					},
  218  				},
  219  				{
  220  					label: localize("remindLater", "Remind Me Later"),
  221  					run: () => {
  222: 						telemetryService.publicLog(
  223  							`${data.surveyId}.survey/remindMeLater`,
  224  						);
  225  						storageService.store(
  226  							SESSION_COUNT_KEY,
  227  							sessionCount - 3,

  232  				},
  233  				{
  234  					label: localize("neverAgain", "Don't Show Again"),
  235  					isSecondary: true,
  236  					run: () => {
  237: 						telemetryService.publicLog(
  238  							`${data.surveyId}.survey/dontShowAgain`,
  239  						);
  240  						storageService.store(
  241  							IS_CANDIDATE_KEY,
  242  							false,

  260  class LanguageSurveysContribution implements IWorkbenchContribution {
  261  	constructor(
  262  		@IStorageService private readonly storageService: IStorageService,
  263  		@INotificationService
  264  		private readonly notificationService: INotificationService,
  265: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
  266  		@ITextFileService private readonly textFileService: ITextFileService,
  267  		@IOpenerService private readonly openerService: IOpenerService,
  268  		@IProductService private readonly productService: IProductService,
  269  		@ILanguageService private readonly languageService: ILanguageService,
  270  		@IExtensionService private readonly extensionService: IExtensionService,

  296  				(surveyData) =>
  297  					new LanguageSurvey(
  298  						surveyData,
  299  						this.storageService,
  300  						this.notificationService,
  301: 						this.telemetryService,
  302  						this.languageService,
  303  						this.textFileService,
  304  						this.openerService,
  305  						this.productService,
  306  					),
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\surveys\browser\nps.contribution.ts:

```sh
   18  import {
   19  	IStorageService,
   20  	StorageScope,
   21  	StorageTarget,
   22  } from "vs/platform/storage/common/storage";
   23: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   24  import {
   25  	IWorkbenchContribution,
   26  	IWorkbenchContributionsRegistry,
   27  	Extensions as WorkbenchExtensions,
   28  } from "vs/workbench/common/contributions";

   36
   37  class NPSContribution implements IWorkbenchContribution {
   38  	constructor(
   39  		@IStorageService storageService: IStorageService,
   40  		@INotificationService notificationService: INotificationService,
   41: 		@ITelemetryService telemetryService: ITelemetryService,
   42  		@IOpenerService openerService: IOpenerService,
   43  		@IProductService productService: IProductService,
   44  	) {
   45  		if (!productService.npsSurveyUrl) {
   46  			return;

  123  				{
  124  					label: nls.localize("takeSurvey", "Take Survey"),
  125  					run: () => {
  126  						openerService.open(
  127  							URI.parse(
  128: 								`${productService.npsSurveyUrl}?o=${encodeURIComponent(platform)}&v=${encodeURIComponent(productService.version)}&m=${encodeURIComponent(telemetryService.machineId)}`,
  129  							),
  130  						);
  131  						storageService.store(
  132  							IS_CANDIDATE_KEY,
  133  							false,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\tags\electron-sandbox\workspaceTags.ts:

```sh
   20  import { IProductService } from "vs/platform/product/common/productService";
   21  import { IRequestService } from "vs/platform/request/common/request";
   22  import {
   23  	ITelemetryService,
   24  	TelemetryLevel,
   25: } from "vs/platform/telemetry/common/telemetry";
   26  import { IWorkspaceContextService } from "vs/platform/workspace/common/workspace";
   27  import { IWorkbenchContribution } from "vs/workbench/common/contributions";
   28  import {
   29  	getHashedRemotesFromConfig as baseGetHashedRemotesFromConfig,
   30  	IWorkspaceTagsService,

   44  export class WorkspaceTags implements IWorkbenchContribution {
   45  	constructor(
   46  		@IFileService private readonly fileService: IFileService,
   47  		@IWorkspaceContextService
   48  		private readonly contextService: IWorkspaceContextService,
   49: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
   50  		@IRequestService private readonly requestService: IRequestService,
   51  		@ITextFileService private readonly textFileService: ITextFileService,
   52  		@IWorkspaceTagsService
   53  		private readonly workspaceTagsService: IWorkspaceTagsService,
   54  		@IDiagnosticsService
   55  		private readonly diagnosticsService: IDiagnosticsService,
   56  		@IProductService private readonly productService: IProductService,
   57  		@INativeHostService
   58  		private readonly nativeHostService: INativeHostService,
   59  	) {
   60: 		if (this.telemetryService.telemetryLevel === TelemetryLevel.USAGE) {
   61  			this.report();
   62  		}
   63  	}
   64
   65  	private async report(): Promise<void> {

   94  		);
   95  		if (value === undefined) {
   96  			value = "Unknown";
   97  		}
   98
   99: 		this.telemetryService.publicLog2<
  100  			{ edition: string },
  101  			{
  102  				owner: "sbatten";
  103  				comment: "Information about the Windows edition.";
  104  				edition: {

  111  	}
  112
  113  	private async getWorkspaceInformation(): Promise<IWorkspaceInformation> {
  114  		const workspace = this.contextService.getWorkspace();
  115  		const state = this.contextService.getWorkbenchState();
  116: 		const telemetryId =
  117  			await this.workspaceTagsService.getTelemetryWorkspaceId(
  118  				workspace,
  119  				state,
  120  			);
  121
  122  		return {
  123  			id: workspace.id,
  124: 			telemetryId,
  125: 			rendererSessionId: this.telemetryService.sessionId,
  126  			folders: workspace.folders,
  127  			transient: workspace.transient,
  128  			configuration: workspace.configuration,
  129  		};
  130  	}

  136  				"${include}": [
  137  					"${WorkspaceTags}"
  138  				]
  139  			}
  140  		*/
  141: 		this.telemetryService.publicLog("workspce.tags", tags);
  142  	}
  143
  144  	private reportRemoteDomains(workspaceUris: URI[]): void {
  145  		Promise.all<string[]>(
  146  			workspaceUris.map((workspaceUri) => {

  175  				"workspace.remotes" : {
  176  					"owner": "lramos15",
  177  					"domains" : { "classification": "SystemMetaData", "purpose": "FeatureInsight" }
  178  				}
  179  			*/
  180: 			this.telemetryService.publicLog("workspace.remotes", {
  181  				domains: list.sort(),
  182  			});
  183  		}, onUnexpectedError);
  184  	}
  185

  288  						"${include}": [
  289  							"${AzureTags}"
  290  						]
  291  					}
  292  				*/
  293: 					this.telemetryService.publicLog("workspace.azure", tags);
  294  				}
  295  			})
  296  			.then(undefined, onUnexpectedError);
  297  	}
  298
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\tags\electron-sandbox\workspaceTagsService.ts:

```sh
333 "azure-digitaltwins-nspkg",
334 "azure-digitaltwins-core",
335 "azure-cognitiveservices-anomalydetector",
336 "azure-ai-anomalydetector",
337 "azure-applicationinsights",
338: "azure-core-tracing-opentelemetry",
339 "azure-core-tracing-opencensus",
340 "azure-nspkg",
341 "azure-common",
342 "azure-eventgrid",
343 "azure-storage-file-datalake",

888 "workspace.py.azure-digitaltwins-nspkg" : { "classification": "SystemMetaData", "purpose": "FeatureInsight", "isMeasurement": true },
889 "workspace.py.azure-digitaltwins-core" : { "classification": "SystemMetaData", "purpose": "FeatureInsight", "isMeasurement": true },
890 "workspace.py.azure-cognitiveservices-anomalydetector" : { "classification": "SystemMetaData", "purpose": "FeatureInsight", "isMeasurement": true },
891 "workspace.py.azure-ai-anomalydetector" : { "classification": "SystemMetaData", "purpose": "FeatureInsight", "isMeasurement": true },
892 "workspace.py.azure-applicationinsights" : { "classification": "SystemMetaData", "purpose": "FeatureInsight", "isMeasurement": true },
893: "workspace.py.azure-core-tracing-opentelemetry" : { "classification": "SystemMetaData", "purpose": "FeatureInsight", "isMeasurement": true },
894 "workspace.py.azure-core-tracing-opencensus" : { "classification": "SystemMetaData", "purpose": "FeatureInsight", "isMeasurement": true },
895 "workspace.py.azure-nspkg" : { "classification": "SystemMetaData", "purpose": "FeatureInsight", "isMeasurement": true },
896 "workspace.py.azure-common" : { "classification": "SystemMetaData", "purpose": "FeatureInsight", "isMeasurement": true },
897 "workspace.py.azure-eventgrid" : { "classification": "SystemMetaData", "purpose": "FeatureInsight", "isMeasurement": true },
898 "workspace.py.azure-storage-file-datalake" : { "classification": "SystemMetaData", "purpose": "FeatureInsight", "isMeasurement": true },
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\tasks\browser\abstractTaskService.ts:

```sh
    75  import {
    76  	IStorageService,
    77  	StorageScope,
    78  	StorageTarget,
    79  } from "vs/platform/storage/common/storage";
    80: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
    81  import { TerminalExitReason } from "vs/platform/terminal/common/terminal";
    82  import { IThemeService } from "vs/platform/theme/common/themeService";
    83  import {
    84  	IWorkspace,
    85  	IWorkspaceContextService,

   380  		@IEditorService private readonly _editorService: IEditorService,
   381  		@IFileService protected readonly _fileService: IFileService,
   382  		@IWorkspaceContextService
   383  		protected readonly _contextService: IWorkspaceContextService,
   384  		@ITelemetryService
   385: 		protected readonly _telemetryService: ITelemetryService,
   386  		@ITextFileService private readonly _textFileService: ITextFileService,
   387  		@IModelService protected readonly _modelService: IModelService,
   388  		@IExtensionService
   389  		private readonly _extensionService: IExtensionService,
   390  		@IQuickInputService

  3935  		) {
  3936  			const workspaceFolder: IWorkspaceFolder =
  3937  				this._contextService.getWorkspace().folders[0];
  3938  			workspaceFolders.push(workspaceFolder);
  3939  			executionEngine = this._computeExecutionEngine(workspaceFolder);
  3940: 			const telemetryData: { [key: string]: any } = {
  3941  				executionEngineVersion: executionEngine,
  3942  			};
  3943  			/* __GDPR__
  3944  				"taskService.engineVersion" : {
  3945  					"owner": "alexr00",
  3946  					"comment": "The engine version of tasks. Used to determine if a user is using a deprecated version.",
  3947  					"executionEngineVersion" : { "classification": "SystemMetaData", "purpose": "FeatureInsight", "comment": "The engine version of tasks." }
  3948  				}
  3949  			*/
  3950: 			this._telemetryService.publicLog(
  3951  				"taskService.engineVersion",
  3952: 				telemetryData,
  3953  			);
  3954  			schemaVersion = this._computeJsonSchemaVersion(workspaceFolder);
  3955  		} else if (
  3956  			this._contextService.getWorkbenchState() ===
  3957  			WorkbenchState.WORKSPACE
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\tasks\electron-sandbox\taskService.ts:

```sh
27 import { INotificationService } from "vs/platform/notification/common/notification"
28 import { IOpenerService } from "vs/platform/opener/common/opener"
29 import { IProgressService } from "vs/platform/progress/common/progress"
30 import { IQuickInputService } from "vs/platform/quickinput/common/quickInput"
31 import { IStorageService } from "vs/platform/storage/common/storage"
32: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry"
33 import { IThemeService } from "vs/platform/theme/common/themeService"
34 import {
35 IWorkspaceContextService,
36 IWorkspaceFolder,
37 } from "vs/platform/workspace/common/workspace"

84 @IViewsService viewsService: IViewsService,
85 @ICommandService commandService: ICommandService,
86 @IEditorService editorService: IEditorService,
87 @IFileService fileService: IFileService,
88 @IWorkspaceContextService contextService: IWorkspaceContextService,
89: @ITelemetryService telemetryService: ITelemetryService,
90 @ITextFileService textFileService: ITextFileService,
91 @ILifecycleService lifecycleService: ILifecycleService,
92 @IModelService modelService: IModelService,
93 @IExtensionService extensionService: IExtensionService,
94 @IQuickInputService quickInputService: IQuickInputService,

129 viewsService,
130 commandService,
131 editorService,
132 fileService,
133 contextService,
134: telemetryService,
135 textFileService,
136 modelService,
137 extensionService,
138 quickInputService,
139 configurationResolverService,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\telemetry\browser\telemetry.contribution.ts:

```sh
   27  	Extensions as ConfigurationExtensions,
   28  	IConfigurationRegistry,
   29  } from "vs/platform/configuration/common/configurationRegistry";
   30  import { IKeybindingService } from "vs/platform/keybinding/common/keybinding";
   31  import { Registry } from "vs/platform/registry/common/platform";
   32: import ErrorTelemetry from "vs/platform/telemetry/browser/errorTelemetry";
   33: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   34: import { TelemetryTrustedValue } from "vs/platform/telemetry/common/telemetryUtils";
   35  import { IUserDataProfilesService } from "vs/platform/userDataProfile/common/userDataProfile";
   36  import {
   37  	IWorkspaceContextService,
   38  	WorkbenchState,
   39  } from "vs/platform/workspace/common/workspace";

  121  		"tasks.json",
  122  		"launch.json",
  123  	];
  124
  125  	constructor(
  126: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
  127  		@IWorkspaceContextService
  128  		private readonly contextService: IWorkspaceContextService,
  129  		@ILifecycleService lifecycleService: ILifecycleService,
  130  		@IEditorService editorService: IEditorService,
  131  		@IKeybindingService keybindingsService: IKeybindingService,

  250  			restoredViewlet?: string;
  251  			restoredEditors: number;
  252  			startupKind: StartupKind;
  253  		};
  254
  255: 		telemetryService.publicLog2<
  256  			WorkspaceLoadEvent,
  257  			WorkspaceLoadClassification
  258  		>("workspaceLoad", {
  259  			windowSize: {
  260  				innerHeight: mainWindow.innerHeight,

  279  			restoredEditors: editorService.visibleEditors.length,
  280  			startupKind: lifecycleService.startupKind,
  281  		});
  282
  283  		// Error Telemetry
  284: 		this._register(new ErrorTelemetry(telemetryService));
  285
  286  		//  Files Telemetry
  287  		this._register(
  288  			textFileService.files.onDidResolve((e) =>
  289  				this.onTextFileModelResolved(e),

  310  					comment: "The type of the settings file that was read.";
  311  				};
  312  				comment: "Track when a settings file was read, for example from an editor.";
  313  			};
  314
  315: 			this.telemetryService.publicLog2<
  316  				{ settingsType: string },
  317  				SettingsReadClassification
  318  			>("settingsRead", { settingsType }); // Do not log read to user settings.json and .vscode folder as a fileGet event as it ruins our JSON usage data
  319  		} else {
  320  			type FileGetClassification = {
  321  				owner: "bpasero";
  322  				comment: "Track when a file was read, for example from an editor.";
  323  			} & FileTelemetryDataFragment;
  324
  325: 			this.telemetryService.publicLog2<
  326  				TelemetryData,
  327  				FileGetClassification
  328  			>("fileGet", this.getTelemetryData(e.model.resource, e.reason));
  329  		}
  330  	}

  339  					purpose: "FeatureInsight";
  340  					comment: "The type of the settings file that was written to.";
  341  				};
  342  				comment: "Track when a settings file was written to, for example from an editor.";
  343  			};
  344: 			this.telemetryService.publicLog2<
  345  				{ settingsType: string },
  346  				SettingsWrittenClassification
  347  			>("settingsWritten", { settingsType }); // Do not log write to user settings.json and .vscode folder as a filePUT event as it ruins our JSON usage data
  348  		} else {
  349  			type FilePutClassfication = {
  350  				owner: "bpasero";
  351  				comment: "Track when a file was written to, for example from an editor.";
  352  			} & FileTelemetryDataFragment;
  353: 			this.telemetryService.publicLog2<
  354  				TelemetryData,
  355  				FilePutClassfication
  356  			>("filePUT", this.getTelemetryData(e.model.resource, e.reason));
  357  		}
  358  	}

  419  				? ext.substr(0, queryStringLocation)
  420  				: ext;
  421  		const fileName = basename(resource);
  422  		const path =
  423  			resource.scheme === Schemas.file ? resource.fsPath : resource.path;
  424: 		const telemetryData = {
  425  			mimeType: new TelemetryTrustedValue(
  426  				getMimeTypes(resource).join(", "),
  427  			),
  428  			ext,
  429  			path: hash(path),

  433
  434  		if (
  435  			ext === ".json" &&
  436  			TelemetryContribution.ALLOWLIST_JSON.indexOf(fileName) > -1
  437  		) {
  438: 			telemetryData["allowlistedjson"] = fileName;
  439  		}
  440
  441: 		return telemetryData;
  442  	}
  443  }
  444
  445  class ConfigurationTelemetryContribution
  446  	extends Disposable

  454  	constructor(
  455  		@IConfigurationService
  456  		private readonly configurationService: IConfigurationService,
  457  		@IUserDataProfilesService
  458  		private readonly userDataProfilesService: IUserDataProfilesService,
  459: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
  460  	) {
  461  		super();
  462
  463  		// Debounce the event by 1000 ms and merge all affected keys into one event
  464  		const debouncedConfigService = Event.debounce(

  492  					};
  493  					type UpdateConfigurationEvent = {
  494  						configurationSource: string;
  495  						configurationKeys: string[];
  496  					};
  497: 					telemetryService.publicLog2<
  498  						UpdateConfigurationEvent,
  499  						UpdateConfigurationClassification
  500  					>("updateConfiguration", {
  501  						configurationSource: ConfigurationTargetToString(
  502  							event.source,

  565  		};
  566  		const source = ConfigurationTargetToString(target);
  567
  568  		switch (key) {
  569  			case LayoutSettings.ACTIVITY_BAR_LOCATION:
  570: 				this.telemetryService.publicLog2<
  571  					UpdatedSettingEvent,
  572  					{
  573  						owner: "sandy081";
  574  						comment: "This is used to know where activity bar is shown in the workbench.";
  575  						settingValue: {

  588  					source,
  589  				});
  590  				return;
  591
  592  			case AutoUpdateConfigurationKey:
  593: 				this.telemetryService.publicLog2<
  594  					UpdatedSettingEvent,
  595  					{
  596  						owner: "sandy081";
  597  						comment: "This is used to know if extensions are getting auto updated or not";
  598  						settingValue: {

  611  					source,
  612  				});
  613  				return;
  614
  615  			case "files.autoSave":
  616: 				this.telemetryService.publicLog2<
  617  					UpdatedSettingEvent,
  618  					{
  619  						owner: "isidorn";
  620  						comment: "This is used to know if auto save is enabled or not";
  621  						settingValue: {

  634  					source,
  635  				});
  636  				return;
  637
  638  			case "editor.stickyScroll.enabled":
  639: 				this.telemetryService.publicLog2<
  640  					UpdatedSettingEvent,
  641  					{
  642  						owner: "aiday-mar";
  643  						comment: "This is used to know if editor sticky scroll is enabled or not";
  644  						settingValue: {

  657  					source,
  658  				});
  659  				return;
  660
  661  			case KEYWORD_ACTIVIATION_SETTING_ID:
  662: 				this.telemetryService.publicLog2<
  663  					UpdatedSettingEvent,
  664  					{
  665  						owner: "bpasero";
  666  						comment: "This is used to know if voice keyword activation is enabled or not";
  667  						settingValue: {

  680  					source,
  681  				});
  682  				return;
  683
  684  			case "window.zoomLevel":
  685: 				this.telemetryService.publicLog2<
  686  					UpdatedSettingEvent,
  687  					{
  688  						owner: "bpasero";
  689  						comment: "This is used to know if window zoom level is configured or not";
  690  						settingValue: {

  703  					source,
  704  				});
  705  				return;
  706
  707  			case "window.zoomPerWindow":
  708: 				this.telemetryService.publicLog2<
  709  					UpdatedSettingEvent,
  710  					{
  711  						owner: "bpasero";
  712  						comment: "This is used to know if window zoom per window is configured or not";
  713  						settingValue: {

  726  					source,
  727  				});
  728  				return;
  729
  730  			case "window.titleBarStyle":
  731: 				this.telemetryService.publicLog2<
  732  					UpdatedSettingEvent,
  733  					{
  734  						owner: "benibenj";
  735  						comment: "This is used to know if window title bar style is set to custom or not";
  736  						settingValue: {

  749  					source,
  750  				});
  751  				return;
  752
  753  			case "window.customTitleBarVisibility":
  754: 				this.telemetryService.publicLog2<
  755  					UpdatedSettingEvent,
  756  					{
  757  						owner: "benibenj";
  758  						comment: "This is used to know if window custom title bar visibility is configured or not";
  759  						settingValue: {

  772  					source,
  773  				});
  774  				return;
  775
  776  			case "window.nativeTabs":
  777: 				this.telemetryService.publicLog2<
  778  					UpdatedSettingEvent,
  779  					{
  780  						owner: "benibenj";
  781  						comment: "This is used to know if window native tabs are enabled or not";
  782  						settingValue: {

  795  					source,
  796  				});
  797  				return;
  798
  799  			case "extensions.verifySignature":
  800: 				this.telemetryService.publicLog2<
  801  					UpdatedSettingEvent,
  802  					{
  803  						owner: "sandy081";
  804  						comment: "This is used to know if extensions signature verification is enabled or not";
  805  						settingValue: {

  818  					source,
  819  				});
  820  				return;
  821
  822  			case "window.systemColorTheme":
  823: 				this.telemetryService.publicLog2<
  824  					UpdatedSettingEvent,
  825  					{
  826  						owner: "bpasero";
  827  						comment: "This is used to know how system color theme is enforced";
  828  						settingValue: {

  849  						? "null"
  850  						: valueToReport ===
  851  							  this.userDataProfilesService.defaultProfile.name
  852  							? "default"
  853  							: "custom";
  854: 				this.telemetryService.publicLog2<
  855  					UpdatedSettingEvent,
  856  					{
  857  						owner: "sandy081";
  858  						comment: "This is used to know the new window profile that is being used";
  859  						settingValue: {

  870  				>("window.newWindowProfile", { settingValue, source });
  871  				return;
  872  			}
  873
  874  			case AutoRestartConfigurationKey:
  875: 				this.telemetryService.publicLog2<
  876  					UpdatedSettingEvent,
  877  					{
  878  						owner: "sandy081";
  879  						comment: "This is used to know if extensions are getting auto restarted or not";
  880  						settingValue: {
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\terminal\browser\terminalEditor.ts:

```sh
  19  import { IContextKeyService } from "vs/platform/contextkey/common/contextkey";
  20  import { IContextMenuService } from "vs/platform/contextview/browser/contextView";
  21  import { IEditorOptions } from "vs/platform/editor/common/editor";
  22  import { IInstantiationService } from "vs/platform/instantiation/common/instantiation";
  23  import { IStorageService } from "vs/platform/storage/common/storage";
  24: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
  25  import { IThemeService } from "vs/platform/theme/common/themeService";
  26  import { EditorPane } from "vs/workbench/browser/parts/editor/editorPane";
  27  import { IEditorOpenContext } from "vs/workbench/common/editor";
  28  import {
  29  	ITerminalConfigurationService,

  62
  63  	private readonly _disposableStore = this._register(new DisposableStore());
  64
  65  	constructor(
  66  		group: IEditorGroup,
  67: 		@ITelemetryService telemetryService: ITelemetryService,
  68  		@IThemeService themeService: IThemeService,
  69  		@IStorageService storageService: IStorageService,
  70  		@ITerminalEditorService
  71  		private readonly _terminalEditorService: ITerminalEditorService,
  72  		@ITerminalProfileResolverService

  86  		private readonly _workbenchLayoutService: IWorkbenchLayoutService,
  87  	) {
  88  		super(
  89  			terminalEditorId,
  90  			group,
  91: 			telemetryService,
  92  			themeService,
  93  			storageService,
  94  		);
  95  		this._dropdownMenu = this._register(
  96  			menuService.createMenu(
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\terminal\browser\terminalInstance.ts:

```sh
    86  import {
    87  	IStorageService,
    88  	StorageScope,
    89  	StorageTarget,
    90  } from "vs/platform/storage/common/storage";
    91: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
    92  import {
    93  	IMarkProperties,
    94  	ITerminalCommand,
    95  	TerminalCapability,
    96  } from "vs/platform/terminal/common/capabilities/capabilities";

   664  		@IEditorService private readonly _editorService: IEditorService,
   665  		@IWorkspaceTrustRequestService
   666  		private readonly _workspaceTrustRequestService: IWorkspaceTrustRequestService,
   667  		@IHistoryService private readonly _historyService: IHistoryService,
   668  		@ITelemetryService
   669: 		private readonly _telemetryService: ITelemetryService,
   670  		@IOpenerService private readonly _openerService: IOpenerService,
   671  		@ICommandService private readonly _commandService: ICommandService,
   672  		@IAccessibilitySignalService
   673  		private readonly _accessibilitySignalService: IAccessibilitySignalService,
   674  		@IViewDescriptorService

  2582  						);
  2583  					},
  2584  				},
  2585  			],
  2586  		});
  2587: 		this._telemetryService.publicLog2<
  2588  			{},
  2589  			{
  2590  				owner: "meganrogge";
  2591  				comment: "Indicates the process exited when created with shell integration args";
  2592  			}
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\terminal\browser\terminalProcessManager.ts:

```sh
   27  import { IConfigurationService } from "vs/platform/configuration/common/configuration";
   28  import { IInstantiationService } from "vs/platform/instantiation/common/instantiation";
   29  import { INotificationService } from "vs/platform/notification/common/notification";
   30  import { IProductService } from "vs/platform/product/common/productService";
   31  import { getRemoteAuthority } from "vs/platform/remote/common/remoteHosts";
   32: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   33  import {
   34  	ISerializedCommandDetectionCapability,
   35  	TerminalCapability,
   36  } from "vs/platform/terminal/common/capabilities/capabilities";
   37  import { NaiveCwdDetectionCapability } from "vs/platform/terminal/common/capabilities/naiveCwdDetectionCapability";

  258  		@IConfigurationService
  259  		private readonly _configurationService: IConfigurationService,
  260  		@ITerminalInstanceService
  261  		private readonly _terminalInstanceService: ITerminalInstanceService,
  262  		@ITelemetryService
  263: 		private readonly _telemetryService: ITelemetryService,
  264  		@INotificationService
  265  		private readonly _notificationService: INotificationService,
  266  	) {
  267  		super();
  268  		this._cwdWorkspaceFolder = terminalEnvironment.getWorkspaceForTerminal(

  617  				switch (type) {
  618  					case ProcessPropertyType.HasChildProcesses:
  619  						this._hasChildProcesses = value;
  620  						break;
  621  					case ProcessPropertyType.FailedShellIntegrationActivation:
  622: 						this._telemetryService?.publicLog2<
  623  							{},
  624  							{
  625  								owner: "meganrogge";
  626  								comment: "Indicates shell integration was not activated because of custom args";
  627  							}
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\terminal\browser\terminalView.ts:

```sh
   59  	INotificationService,
   60  	IPromptChoice,
   61  	Severity,
   62  } from "vs/platform/notification/common/notification";
   63  import { IOpenerService } from "vs/platform/opener/common/opener";
   64: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   65  import { TerminalCapability } from "vs/platform/terminal/common/capabilities/capabilities";
   66  import {
   67  	ITerminalProfile,
   68  	TerminalLocation,
   69  	TerminalSettingId,

  142  		@ITerminalConfigurationService
  143  		private readonly _terminalConfigurationService: ITerminalConfigurationService,
  144  		@ITerminalGroupService
  145  		private readonly _terminalGroupService: ITerminalGroupService,
  146  		@IThemeService themeService: IThemeService,
  147: 		@ITelemetryService telemetryService: ITelemetryService,
  148  		@IHoverService hoverService: IHoverService,
  149  		@INotificationService
  150  		private readonly _notificationService: INotificationService,
  151  		@IKeybindingService
  152  		private readonly _keybindingService: IKeybindingService,

  168  			_contextKeyService,
  169  			viewDescriptorService,
  170  			_instantiationService,
  171  			openerService,
  172  			themeService,
  173: 			telemetryService,
  174  			hoverService,
  175  		);
  176  		this._register(
  177  			this._terminalService.onDidRegisterProcessSupport(() => {
  178  				this._onDidChangeViewWelcomeState.fire();
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\terminal\browser\media\CodeTabExpansion.psm1:

```sh
  37  		[System.Management.Automation.CompletionResult]::new("--profile", "--profile", 'ParameterName', 'Opens the provided folder or workspace with the given profile and associates the profile with the workspace. If the profile does not exist, a new empty one is created.'),
  38  		[System.Management.Automation.CompletionResult]::new("--reuse-window", "--reuse-window", 'ParameterName', 'Force to open a file or folder in an already opened window.'),
  39  		[System.Management.Automation.CompletionResult]::new("--show-versions", "--show-versions", 'ParameterName', 'Show versions of installed extensions, when using --list-extensions.'),
  40  		[System.Management.Automation.CompletionResult]::new("--status", "--status", 'ParameterName', 'Print process usage and diagnostics information.'),
  41  		[System.Management.Automation.CompletionResult]::new("--sync", "--sync", 'ParameterName', 'Turn sync on or off.'),
  42: 		[System.Management.Automation.CompletionResult]::new("--telemetry", "--telemetry", 'ParameterName', 'Shows all telemetry events which VS code collects.'),
  43  		[System.Management.Automation.CompletionResult]::new("--uninstall-extension", "--uninstall-extension", 'ParameterName', 'Uninstalls an extension.'),
  44  		[System.Management.Automation.CompletionResult]::new("--update-extensions", "--update-extensions", 'ParameterName', 'Update the installed extensions.'),
  45  		[System.Management.Automation.CompletionResult]::new("--user-data-dir", "--user-data-dir", 'ParameterName', 'Specifies the directory that user data is kept in. Can be used to open multiple distinct instances of Code.'),
  46  		[System.Management.Automation.CompletionResult]::new("--verbose", "--verbose", 'ParameterName', 'Print verbose output (implies --wait).'),
  47  		[System.Management.Automation.CompletionResult]::new("--version", "--version", 'ParameterName', 'Print version.'),
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\terminal\browser\xterm\xtermTerminal.ts:

```sh
   46  } from "vs/platform/contextkey/common/contextkey";
   47  import { IInstantiationService } from "vs/platform/instantiation/common/instantiation";
   48  import { ILayoutService } from "vs/platform/layout/browser/layoutService";
   49  import { LogLevel } from "vs/platform/log/common/log";
   50  import { INotificationService } from "vs/platform/notification/common/notification";
   51: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   52  import {
   53  	ITerminalCapabilityStore,
   54  	ITerminalCommand,
   55  	TerminalCapability,
   56  } from "vs/platform/terminal/common/capabilities/capabilities";

  304  		@ITerminalLogService private readonly _logService: ITerminalLogService,
  305  		@INotificationService
  306  		private readonly _notificationService: INotificationService,
  307  		@IThemeService private readonly _themeService: IThemeService,
  308  		@ITelemetryService
  309: 		private readonly _telemetryService: ITelemetryService,
  310  		@ITerminalConfigurationService
  311  		private readonly _terminalConfigurationService: ITerminalConfigurationService,
  312  		@IClipboardService
  313  		private readonly _clipboardService: IClipboardService,
  314  		@IContextKeyService contextKeyService: IContextKeyService,

  450  		);
  451  		this.raw.loadAddon(this._decorationAddon);
  452  		this._shellIntegrationAddon = new ShellIntegrationAddon(
  453  			shellIntegrationNonce,
  454  			disableShellIntegrationReporting,
  455: 			this._telemetryService,
  456  			this._logService,
  457  		);
  458  		this.raw.loadAddon(this._shellIntegrationAddon);
  459  		this._getClipboardAddonConstructor().then((ClipboardAddon) => {
  460  			this._clipboardAddon = this._instantiationService.createInstance(
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\terminalContrib\chat\browser\terminal.initialHint.contribution.ts:

```sh
   29  import { ICommandService } from "vs/platform/commands/common/commands";
   30  import { IConfigurationService } from "vs/platform/configuration/common/configuration";
   31  import { IInstantiationService } from "vs/platform/instantiation/common/instantiation";
   32  import { IKeybindingService } from "vs/platform/keybinding/common/keybinding";
   33  import { IProductService } from "vs/platform/product/common/productService";
   34: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   35  import {
   36  	ITerminalCapabilityStore,
   37  	TerminalCapability,
   38  } from "vs/platform/terminal/common/capabilities/capabilities";
   39  import { AccessibilityVerbositySettingId } from "vs/workbench/contrib/accessibility/browser/accessibilityConfiguration";

  374  		@ICommandService private readonly commandService: ICommandService,
  375  		@IConfigurationService
  376  		private readonly configurationService: IConfigurationService,
  377  		@IKeybindingService
  378  		private readonly keybindingService: IKeybindingService,
  379: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
  380  		@IProductService private readonly productService: IProductService,
  381  		@ITerminalService private readonly terminalService: ITerminalService,
  382  		@IStorageService private readonly _storageService: IStorageService,
  383  		@IContextMenuService
  384  		private readonly contextMenuService: IContextMenuService,

  439  				Constants.InitialHintHideStorageKey,
  440  				true,
  441  				StorageScope.APPLICATION,
  442  				StorageTarget.USER,
  443  			);
  444: 			this.telemetryService.publicLog2<
  445  				WorkbenchActionExecutedEvent,
  446  				WorkbenchActionExecutedClassification
  447  			>("workbenchActionExecuted", {
  448  				id: "terminalInlineChat.hintAction",
  449  				from: "hint",
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\terminalContrib\chat\browser\terminalChatWidget.ts:

```sh
110 },
111 },
112 chatWidgetViewOptions: {
113 rendererOptions: { editableCodeBlock: true },
114 menus: {
115: telemetrySource: "terminal-inline-chat",
116 executeToolbar: MENU_TERMINAL_CHAT_INPUT,
117 inputSideToolbar: MENU_TERMINAL_CHAT_WIDGET,
118 },
119 },
120 },
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\terminalContrib\quickFix\browser\quickFixAddon.ts:

```sh
   32  import { ActionSet } from "vs/platform/actionWidget/common/actionWidget";
   33  import { ICommandService } from "vs/platform/commands/common/commands";
   34  import { IConfigurationService } from "vs/platform/configuration/common/configuration";
   35  import { ILabelService } from "vs/platform/label/common/label";
   36  import { IOpenerService } from "vs/platform/opener/common/opener";
   37: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   38  import {
   39  	ITerminalCapabilityStore,
   40  	ITerminalCommand,
   41  	TerminalCapability,
   42  } from "vs/platform/terminal/common/capabilities/capabilities";

  132  		private readonly _configurationService: IConfigurationService,
  133  		@IAccessibilitySignalService
  134  		private readonly _accessibilitySignalService: IAccessibilitySignalService,
  135  		@IOpenerService private readonly _openerService: IOpenerService,
  136  		@ITelemetryService
  137: 		private readonly _telemetryService: ITelemetryService,
  138  		@IExtensionService
  139  		private readonly _extensionService: IExtensionService,
  140  		@IActionWidgetService
  141  		private readonly _actionWidgetService: IActionWidgetService,
  142  		@ILabelService private readonly _labelService: ILabelService,

  348  				purpose: "FeatureInsight";
  349  				comment: "Whether the quick fix was run";
  350  			};
  351  			comment: "Terminal quick fixes";
  352  		};
  353: 		this._telemetryService?.publicLog2<
  354  			QuickFixResultTelemetryEvent,
  355  			QuickFixClassification
  356  		>("terminal/quick-fix", {
  357  			quickFixId: id,
  358  			ranQuickFix,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\terminalContrib\typeAhead\browser\terminalTypeAheadAddon.ts:

```sh
    15  import { debounce } from "vs/base/common/decorators";
    16  import { Emitter } from "vs/base/common/event";
    17  import { Disposable, toDisposable } from "vs/base/common/lifecycle";
    18  import { escapeRegExpCharacters } from "vs/base/common/strings";
    19  import { IConfigurationService } from "vs/platform/configuration/common/configuration";
    20: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
    21  import {
    22  	IXtermCore,
    23  	XtermAttributes,
    24  } from "vs/workbench/contrib/terminal/browser/xterm-private";
    25  import {

  1474  	constructor(
  1475  		private _processManager: ITerminalProcessManager,
  1476  		@IConfigurationService
  1477  		private readonly _configurationService: IConfigurationService,
  1478  		@ITelemetryService
  1479: 		private readonly _telemetryService: ITelemetryService,
  1480  	) {
  1481  		super();
  1482  		this._register(
  1483  			toDisposable(() => this._clearPredictionDebounce?.dispose()),
  1484  		);

  1663  				"median" : { "classification": "SystemMetaData", "purpose": "PerformanceAndHealth", "isMeasurement": true },
  1664  				"count" : { "classification": "SystemMetaData", "purpose": "PerformanceAndHealth", "isMeasurement": true },
  1665  				"predictionAccuracy" : { "classification": "SystemMetaData", "purpose": "PerformanceAndHealth", "isMeasurement": true }
  1666  			}
  1667  		 */
  1668: 		this._telemetryService.publicLog("terminalLatencyStats", {
  1669  			...stats.latency,
  1670  			predictionAccuracy: stats.accuracy,
  1671  		});
  1672  	}
  1673
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\testing\browser\testCoverageView.ts:

```sh
   66  import {
   67  	IQuickInputService,
   68  	IQuickPickItem,
   69  	QuickPickInput,
   70  } from "vs/platform/quickinput/common/quickInput";
   71: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   72  import { IThemeService } from "vs/platform/theme/common/themeService";
   73  import { IResourceLabel, ResourceLabels } from "vs/workbench/browser/labels";
   74  import {
   75  	IViewPaneOptions,
   76  	ViewAction,

  135  		@IContextKeyService contextKeyService: IContextKeyService,
  136  		@IViewDescriptorService viewDescriptorService: IViewDescriptorService,
  137  		@IInstantiationService instantiationService: IInstantiationService,
  138  		@IOpenerService openerService: IOpenerService,
  139  		@IThemeService themeService: IThemeService,
  140: 		@ITelemetryService telemetryService: ITelemetryService,
  141  		@IHoverService hoverService: IHoverService,
  142  		@ITestCoverageService
  143  		private readonly coverageService: ITestCoverageService,
  144  	) {
  145  		super(

  150  			contextKeyService,
  151  			viewDescriptorService,
  152  			instantiationService,
  153  			openerService,
  154  			themeService,
  155: 			telemetryService,
  156  			hoverService,
  157  		);
  158  	}
  159
  160  	protected override renderBody(container: HTMLElement): void {
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\testing\browser\testingExplorerView.ts:

```sh
   84  	IStorageService,
   85  	StorageScope,
   86  	StorageTarget,
   87  	WillSaveStateReason,
   88  } from "vs/platform/storage/common/storage";
   89: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   90  import { defaultButtonStyles } from "vs/platform/theme/browser/defaultStyles";
   91  import { foreground } from "vs/platform/theme/common/colorRegistry";
   92  import { spinningLoading } from "vs/platform/theme/common/iconRegistry";
   93  import {
   94  	IThemeService,

  215  		@IViewDescriptorService viewDescriptorService: IViewDescriptorService,
  216  		@IContextKeyService contextKeyService: IContextKeyService,
  217  		@IOpenerService openerService: IOpenerService,
  218  		@IThemeService themeService: IThemeService,
  219  		@ITestService private readonly testService: ITestService,
  220: 		@ITelemetryService telemetryService: ITelemetryService,
  221  		@IHoverService hoverService: IHoverService,
  222  		@ITestProfileService
  223  		private readonly testProfileService: ITestProfileService,
  224  		@ICommandService private readonly commandService: ICommandService,
  225  		@IMenuService private readonly menuService: IMenuService,

  232  			contextKeyService,
  233  			viewDescriptorService,
  234  			instantiationService,
  235  			openerService,
  236  			themeService,
  237: 			telemetryService,
  238  			hoverService,
  239  		);
  240
  241  		const relayout = this._register(
  242  			new RunOnceScheduler(() => this.layoutBody(), 1),
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\testing\browser\testingOutputPeek.ts:

```sh
    70  import {
    71  	IStorageService,
    72  	StorageScope,
    73  	StorageTarget,
    74  } from "vs/platform/storage/common/storage";
    75: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
    76  import { editorBackground } from "vs/platform/theme/common/colorRegistry";
    77  import { IThemeService } from "vs/platform/theme/common/themeService";
    78  import { IUriIdentityService } from "vs/platform/uriIdentity/common/uriIdentity";
    79  import {
    80  	IViewPaneOptions,

  1158  		@IContextKeyService contextKeyService: IContextKeyService,
  1159  		@IViewDescriptorService viewDescriptorService: IViewDescriptorService,
  1160  		@IInstantiationService instantiationService: IInstantiationService,
  1161  		@IOpenerService openerService: IOpenerService,
  1162  		@IThemeService themeService: IThemeService,
  1163: 		@ITelemetryService telemetryService: ITelemetryService,
  1164  		@IHoverService hoverService: IHoverService,
  1165  		@ITestResultService private readonly resultService: ITestResultService,
  1166  	) {
  1167  		super(
  1168  			options,

  1172  			contextKeyService,
  1173  			viewDescriptorService,
  1174  			instantiationService,
  1175  			openerService,
  1176  			themeService,
  1177: 			telemetryService,
  1178  			hoverService,
  1179  		);
  1180  	}
  1181
  1182  	public get subject() {
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\testing\browser\testingViewPaneContainer.ts:

```sh
   6  import { localize } from "vs/nls";
   7  import { IConfigurationService } from "vs/platform/configuration/common/configuration";
   8  import { IContextMenuService } from "vs/platform/contextview/browser/contextView";
   9  import { IInstantiationService } from "vs/platform/instantiation/common/instantiation";
  10  import { IStorageService } from "vs/platform/storage/common/storage";
  11: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
  12  import { IThemeService } from "vs/platform/theme/common/themeService";
  13  import { IWorkspaceContextService } from "vs/platform/workspace/common/workspace";
  14  import { ViewPaneContainer } from "vs/workbench/browser/parts/views/viewPaneContainer";
  15  import { IViewDescriptorService } from "vs/workbench/common/views";
  16  import { Testing } from "vs/workbench/contrib/testing/common/constants";

  18  import { IWorkbenchLayoutService } from "vs/workbench/services/layout/browser/layoutService";
  19
  20  export class TestingViewPaneContainer extends ViewPaneContainer {
  21  	constructor(
  22  		@IWorkbenchLayoutService layoutService: IWorkbenchLayoutService,
  23: 		@ITelemetryService telemetryService: ITelemetryService,
  24  		@IInstantiationService instantiationService: IInstantiationService,
  25  		@IContextMenuService contextMenuService: IContextMenuService,
  26  		@IThemeService themeService: IThemeService,
  27  		@IStorageService storageService: IStorageService,
  28  		@IConfigurationService configurationService: IConfigurationService,

  35  			{ mergeViewWithContainerWhenSingleView: true },
  36  			instantiationService,
  37  			configurationService,
  38  			layoutService,
  39  			contextMenuService,
  40: 			telemetryService,
  41  			extensionService,
  42  			themeService,
  43  			storageService,
  44  			contextService,
  45  			viewDescriptorService,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\testing\browser\testResultsView\testResultsTree.ts:

```sh
   40  import { IContextKeyService } from "vs/platform/contextkey/common/contextkey";
   41  import { IContextMenuService } from "vs/platform/contextview/browser/contextView";
   42  import { IInstantiationService } from "vs/platform/instantiation/common/instantiation";
   43  import { WorkbenchCompressibleObjectTree } from "vs/platform/list/browser/listService";
   44  import { IProgressService } from "vs/platform/progress/common/progress";
   45: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   46  import { widgetClose } from "vs/platform/theme/common/iconRegistry";
   47  import { getTestItemContextOverlay } from "vs/workbench/contrib/testing/browser/explorerProjections/testItemContextOverlay";
   48  import * as icons from "vs/workbench/contrib/testing/browser/icons";
   49  import { renderTestMessageAsText } from "vs/workbench/contrib/testing/browser/testMessageColorizer";
   50  import {

  345  		@ITestResultService results: ITestResultService,
  346  		@IInstantiationService instantiationService: IInstantiationService,
  347  		@ITestExplorerFilterState explorerFilter: ITestExplorerFilterState,
  348  		@ITestCoverageService coverageService: ITestCoverageService,
  349  		@IProgressService progressService: IProgressService,
  350: 		@ITelemetryService telemetryService: ITelemetryService,
  351  	) {
  352  		super();
  353
  354  		this.treeActions = instantiationService.createInstance(
  355  			TreeActionsProvider,

  777  			this.tree.onDidChangeCollapseState((e) => {
  778  				if (
  779  					e.node.element instanceof OlderResultsElement &&
  780  					!e.node.collapsed
  781  				) {
  782: 					telemetryService.publicLog2<
  783  						{},
  784  						{
  785  							owner: "connor4312";
  786  							// we're considering removing or depromoting this feature because we don't think it's used:
  787  							comment: "Records that test history was used";
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\testing\common\testResult.ts:

```sh
   10  import { Disposable } from "vs/base/common/lifecycle";
   11  import { IObservable, observableValue } from "vs/base/common/observable";
   12  import { language } from "vs/base/common/platform";
   13  import { WellDefinedPrefixTree } from "vs/base/common/prefixTree";
   14  import { localize } from "vs/nls";
   15: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   16  import { IUriIdentityService } from "vs/platform/uriIdentity/common/uriIdentity";
   17  import {
   18  	IComputedStateAccessor,
   19  	refreshComputedState,
   20  } from "vs/workbench/contrib/testing/common/getComputedState";

  383
  384  	constructor(
  385  		public readonly id: string,
  386  		public readonly persist: boolean,
  387  		public readonly request: ResolvedTestRunRequest,
  388: 		@ITelemetryService private readonly telemetry: ITelemetryService,
  389  	) {
  390  		super();
  391  	}
  392
  393  	/**

  582  		}
  583
  584  		this._completedAt = Date.now();
  585  		this.completeEmitter.fire();
  586
  587: 		this.telemetry.publicLog2<
  588  			{ failures: number; passes: number; controller: string },
  589  			{
  590  				owner: "connor4312";
  591  				comment: "Test outcome metrics. This helps us understand magnitude of feature use and how to build fix suggestions.";
  592  				failures: {
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\testing\common\testResultService.ts:

```sh
   17  import {
   18  	IContextKey,
   19  	IContextKeyService,
   20  } from "vs/platform/contextkey/common/contextkey";
   21  import { createDecorator } from "vs/platform/instantiation/common/instantiation";
   22: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   23  import { TestingContextKeys } from "vs/workbench/contrib/testing/common/testingContextKeys";
   24  import { ITestProfileService } from "vs/workbench/contrib/testing/common/testProfileService";
   25  import {
   26  	ITestResult,
   27  	LiveTestResult,

  149
  150  	constructor(
  151  		@IContextKeyService contextKeyService: IContextKeyService,
  152  		@ITestResultStorage private readonly storage: ITestResultStorage,
  153  		@ITestProfileService private readonly testProfiles: ITestProfileService,
  154: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
  155  	) {
  156  		super();
  157  		this._register(toDisposable(() => dispose(this._resultsDisposables)));
  158  		this.isRunning = TestingContextKeys.isRunning.bindTo(contextKeyService);
  159  		this.hasAnyResults =

  183  		req: ResolvedTestRunRequest | ExtensionRunTestsRequest,
  184  	) {
  185  		if ("targets" in req) {
  186  			const id = generateUuid();
  187  			return this.push(
  188: 				new LiveTestResult(id, true, req, this.telemetryService),
  189  			);
  190  		}
  191
  192  		let profile: ITestRunProfile | undefined;
  193  		if (req.profile) {

  216  		return this.push(
  217  			new LiveTestResult(
  218  				req.id,
  219  				req.persist,
  220  				resolved,
  221: 				this.telemetryService,
  222  			),
  223  		);
  224  	}
  225
  226  	/**
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\themes\browser\themes.contribution.ts:

```sh
    67  import {
    68  	IStorageService,
    69  	StorageScope,
    70  	StorageTarget,
    71  } from "vs/platform/storage/common/storage";
    72: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
    73  import { defaultToggleStyles } from "vs/platform/theme/browser/defaultStyles";
    74  import {
    75  	Extensions as ColorRegistryExtensions,
    76  	IColorRegistry,
    77  } from "vs/platform/theme/common/colorRegistry";

  1416  		@IWorkbenchThemeService
  1417  		private readonly _workbenchThemeService: IWorkbenchThemeService,
  1418  		@IStorageService private readonly _storageService: IStorageService,
  1419  		@ICommandService private readonly _commandService: ICommandService,
  1420  		@ITelemetryService
  1421: 		private readonly _telemetryService: ITelemetryService,
  1422  		@IHostService private readonly _hostService: IHostService,
  1423  	) {
  1424  		if (
  1425  			_storageService.getBoolean(
  1426  				DefaultThemeUpdatedNotificationContribution.STORAGE_KEY,

  1591  		type ThemeUpdatedNoticationEvent = {
  1592  			web: boolean;
  1593  			reaction: DefaultThemeUpdatedNotificationReaction;
  1594  		};
  1595
  1596: 		this._telemetryService.publicLog2<
  1597  			ThemeUpdatedNoticationEvent,
  1598  			ThemeUpdatedNoticationClassification
  1599  		>("themeUpdatedNotication", {
  1600  			web: isWeb,
  1601  			reaction: outcome,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\timeline\browser\timelinePane.ts:

```sh
   87  import {
   88  	IStorageService,
   89  	StorageScope,
   90  	StorageTarget,
   91  } from "vs/platform/storage/common/storage";
   92: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   93  import { registerIcon } from "vs/platform/theme/common/iconRegistry";
   94  import { ColorScheme } from "vs/platform/theme/common/theme";
   95  import { IThemeService } from "vs/platform/theme/common/themeService";
   96  import { IUriIdentityService } from "vs/platform/uriIdentity/common/uriIdentity";
   97  import {

  361  		@ICommandService protected commandService: ICommandService,
  362  		@IProgressService private readonly progressService: IProgressService,
  363  		@ITimelineService protected timelineService: ITimelineService,
  364  		@IOpenerService openerService: IOpenerService,
  365  		@IThemeService themeService: IThemeService,
  366: 		@ITelemetryService telemetryService: ITelemetryService,
  367  		@IHoverService hoverService: IHoverService,
  368  		@ILabelService private readonly labelService: ILabelService,
  369  		@IUriIdentityService
  370  		private readonly uriIdentityService: IUriIdentityService,
  371  		@IExtensionService private readonly extensionService: IExtensionService,

  378  			contextKeyService,
  379  			viewDescriptorService,
  380  			instantiationService,
  381  			openerService,
  382  			themeService,
  383: 			telemetryService,
  384  			hoverService,
  385  		);
  386
  387  		this.commands = this._register(
  388  			this.instantiationService.createInstance(
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\update\browser\releaseNotesEditor.ts:

```sh
31 import { IProductService } from "vs/platform/product/common/productService"
32 import {
33 asTextOrError,
34 IRequestService,
35 } from "vs/platform/request/common/request"
36: import { TelemetryLevel } from "vs/platform/telemetry/common/telemetry"
37 import {
38 getTelemetryLevel,
39 supportsTelemetry,
40: } from "vs/platform/telemetry/common/telemetryUtils"
41 import {
42 DEFAULT_MARKDOWN_STYLES,
43 renderMarkdownDocument,
44 } from "vs/workbench/contrib/markdown/browser/markdownDocumentRenderer"
45 import { SimpleSettingRenderer } from "vs/workbench/contrib/markdown/browser/markdownSettingRenderer"
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\url\browser\trustedDomains.ts:

```sh
  14  import {
  15  	IStorageService,
  16  	StorageScope,
  17  	StorageTarget,
  18  } from "vs/platform/storage/common/storage";
  19: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
  20  import { IEditorService } from "vs/workbench/services/editor/common/editorService";
  21  import { IBrowserWorkbenchEnvironmentService } from "vs/workbench/services/environment/browser/environmentService";
  22
  23  const TRUSTED_DOMAINS_URI = URI.parse("trustedDomains:/Trusted Domains");
  24

  54  	domainToConfigure: string,
  55  	resource: URI,
  56  	quickInputService: IQuickInputService,
  57  	storageService: IStorageService,
  58  	editorService: IEditorService,
  59: 	telemetryService: ITelemetryService,
  60  ) {
  61  	const parsedDomainToConfigure = URI.parse(domainToConfigure);
  62  	const toplevelDomainSegements =
  63  		parsedDomainToConfigure.authority.split(".");
  64  	const domainEnd = toplevelDomainSegements
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\url\browser\trustedDomainsValidator.ts:

```sh
   13  import { IInstantiationService } from "vs/platform/instantiation/common/instantiation";
   14  import { IOpenerService, OpenOptions } from "vs/platform/opener/common/opener";
   15  import { IProductService } from "vs/platform/product/common/productService";
   16  import { IQuickInputService } from "vs/platform/quickinput/common/quickInput";
   17  import { IStorageService } from "vs/platform/storage/common/storage";
   18: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   19  import { IWorkspaceTrustManagementService } from "vs/platform/workspace/common/workspaceTrust";
   20  import { IWorkbenchContribution } from "vs/workbench/common/contributions";
   21  import {
   22  	configureOpenerTrustedDomainsHandler,
   23  	readStaticTrustedDomains,

   38  		private readonly _quickInputService: IQuickInputService,
   39  		@IEditorService private readonly _editorService: IEditorService,
   40  		@IClipboardService
   41  		private readonly _clipboardService: IClipboardService,
   42  		@ITelemetryService
   43: 		private readonly _telemetryService: ITelemetryService,
   44  		@IInstantiationService
   45  		private readonly _instantiationService: IInstantiationService,
   46  		@IConfigurationService
   47  		private readonly _configurationService: IConfigurationService,
   48  		@IWorkspaceTrustManagementService

  164  									domainToOpen,
  165  									resourceUri,
  166  									this._quickInputService,
  167  									this._storageService,
  168  									this._editorService,
  169: 									this._telemetryService,
  170  								);
  171  							// Trust all domains
  172  							if (pickedDomains.indexOf("*") !== -1) {
  173  								return true;
  174  							}
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\userDataProfile\browser\userDataProfile.ts:

```sh
   32  import {
   33  	IQuickInputService,
   34  	IQuickPickItem,
   35  } from "vs/platform/quickinput/common/quickInput";
   36  import { Registry } from "vs/platform/registry/common/platform";
   37: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   38  import { IURLService } from "vs/platform/url/common/url";
   39  import {
   40  	IUserDataProfile,
   41  	IUserDataProfilesService,
   42  } from "vs/platform/userDataProfile/common/userDataProfile";

   93  		private readonly userDataProfileService: IUserDataProfileService,
   94  		@IUserDataProfilesService
   95  		private readonly userDataProfilesService: IUserDataProfilesService,
   96  		@IUserDataProfileManagementService
   97  		private readonly userDataProfileManagementService: IUserDataProfileManagementService,
   98: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
   99  		@IWorkspaceContextService
  100  		private readonly workspaceContextService: IWorkspaceContextService,
  101  		@IWorkspaceTagsService
  102  		private readonly workspaceTagsService: IWorkspaceTagsService,
  103  		@IContextKeyService contextKeyService: IContextKeyService,

  710  		};
  711  		type WorkspaceProfileInfoEvent = {
  712  			workspaceId: string | undefined;
  713  			defaultProfile: boolean;
  714  		};
  715: 		this.telemetryService.publicLog2<
  716  			WorkspaceProfileInfoEvent,
  717  			WorkspaceProfileInfoClassification
  718  		>("workspaceProfileInfo", {
  719  			workspaceId,
  720  			defaultProfile:
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\userDataProfile\browser\userDataProfilesEditor.ts:

```sh
   89  import {
   90  	IQuickInputService,
   91  	IQuickPickItem,
   92  } from "vs/platform/quickinput/common/quickInput";
   93  import { IStorageService } from "vs/platform/storage/common/storage";
   94: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   95  import {
   96  	defaultButtonStyles,
   97  	defaultCheckboxStyles,
   98  	defaultInputBoxStyles,
   99  	defaultSelectBoxStyles,

  194
  195  	private model: UserDataProfilesEditorModel | undefined;
  196
  197  	constructor(
  198  		group: IEditorGroup,
  199: 		@ITelemetryService telemetryService: ITelemetryService,
  200  		@IThemeService themeService: IThemeService,
  201  		@IStorageService storageService: IStorageService,
  202  		@IQuickInputService
  203  		private readonly quickInputService: IQuickInputService,
  204  		@IFileDialogService

  209  		private readonly instantiationService: IInstantiationService,
  210  	) {
  211  		super(
  212  			UserDataProfilesEditor.ID,
  213  			group,
  214: 			telemetryService,
  215  			themeService,
  216  			storageService,
  217  		);
  218  	}
  219
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\userDataProfile\browser\userDataProfilesEditorModel.ts:

```sh
    34  import { IFileService } from "vs/platform/files/common/files";
    35  import { InMemoryFileSystemProvider } from "vs/platform/files/common/inMemoryFilesystemProvider";
    36  import { IInstantiationService } from "vs/platform/instantiation/common/instantiation";
    37  import { IOpenerService } from "vs/platform/opener/common/opener";
    38  import { IProductService } from "vs/platform/product/common/productService";
    39: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
    40  import {
    41  	DidChangeProfilesEvent,
    42  	isUserDataProfile,
    43  	IUserDataProfile,
    44  	IUserDataProfilesService,

   999  		@IUserDataProfileManagementService
  1000  		private readonly userDataProfileManagementService: IUserDataProfileManagementService,
  1001  		@IUserDataProfileImportExportService
  1002  		private readonly userDataProfileImportExportService: IUserDataProfileImportExportService,
  1003  		@IDialogService private readonly dialogService: IDialogService,
  1004: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
  1005  		@IHostService private readonly hostService: IHostService,
  1006  		@IProductService private readonly productService: IProductService,
  1007  		@IOpenerService private readonly openerService: IOpenerService,
  1008  		@IInstantiationService
  1009  		private readonly instantiationService: IInstantiationService,

  1423
  1424  				if (copyFrom instanceof URI) {
  1425  					const template =
  1426  						await this.newProfileElement.resolveTemplate(copyFrom);
  1427  					if (template) {
  1428: 						this.telemetryService.publicLog2<
  1429  							CreateProfileInfoEvent,
  1430  							CreateProfileInfoClassification
  1431  						>(
  1432  							"userDataProfile.createFromTemplate",
  1433  							createProfileTelemetryData,

  1445  								},
  1446  								token ?? CancellationToken.None,
  1447  							);
  1448  					}
  1449  				} else if (isUserDataProfile(copyFrom)) {
  1450: 					this.telemetryService.publicLog2<
  1451  						CreateProfileInfoEvent,
  1452  						CreateProfileInfoClassification
  1453  					>(
  1454  						"userDataProfile.createFromProfile",
  1455  						createProfileTelemetryData,

  1466  								transient,
  1467  							},
  1468  							token ?? CancellationToken.None,
  1469  						);
  1470  				} else {
  1471: 					this.telemetryService.publicLog2<
  1472  						CreateProfileInfoEvent,
  1473  						CreateProfileInfoClassification
  1474  					>(
  1475  						"userDataProfile.createEmptyProfile",
  1476  						createProfileTelemetryData,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\userDataSync\browser\userDataSync.ts:

```sh
   55  import {
   56  	IQuickInputService,
   57  	QuickPickItem,
   58  } from "vs/platform/quickinput/common/quickInput";
   59  import { Registry } from "vs/platform/registry/common/platform";
   60: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   61  import { IUserDataProfilesService } from "vs/platform/userDataProfile/common/userDataProfile";
   62  import {
   63  	IResourcePreview,
   64  	IUserDataAutoSyncService,
   65  	IUserDataSyncEnablementService,

  224  		@IUserDataAutoSyncService
  225  		userDataAutoSyncService: IUserDataAutoSyncService,
  226  		@ITextModelService textModelResolverService: ITextModelService,
  227  		@IPreferencesService
  228  		private readonly preferencesService: IPreferencesService,
  229: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
  230  		@IProductService private readonly productService: IProductService,
  231  		@IOpenerService private readonly openerService: IOpenerService,
  232  		@IAuthenticationService
  233  		private readonly authenticationService: IAuthenticationService,
  234  		@IUserDataSyncStoreManagementService

  369  								label: localize(
  370  									"replace remote",
  371  									"Replace Remote",
  372  								),
  373  								run: () => {
  374: 									this.telemetryService.publicLog2<
  375  										{ source: string; action: string },
  376  										SyncConflictsClassification
  377  									>("sync/handleConflicts", {
  378  										source: conflict.syncResource,
  379  										action: "acceptLocal",

  388  								label: localize(
  389  									"replace local",
  390  									"Replace Local",
  391  								),
  392  								run: () => {
  393: 									this.telemetryService.publicLog2<
  394  										{ source: string; action: string },
  395  										SyncConflictsClassification
  396  									>("sync/handleConflicts", {
  397  										source: conflict.syncResource,
  398  										action: "acceptRemote",

  407  								label: localize(
  408  									"show conflicts",
  409  									"Show Conflicts",
  410  								),
  411  								run: () => {
  412: 									this.telemetryService.publicLog2<
  413  										{ source: string; action?: string },
  414  										SyncConflictsClassification
  415  									>("sync/showConflicts", {
  416  										source: conflict.syncResource,
  417  									});
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\userDataSync\browser\userDataSyncConflictsView.ts:

```sh
   25  	ServicesAccessor,
   26  } from "vs/platform/instantiation/common/instantiation";
   27  import { IKeybindingService } from "vs/platform/keybinding/common/keybinding";
   28  import { INotificationService } from "vs/platform/notification/common/notification";
   29  import { IOpenerService } from "vs/platform/opener/common/opener";
   30: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   31  import { IThemeService } from "vs/platform/theme/common/themeService";
   32  import {
   33  	IUserDataProfile,
   34  	IUserDataProfilesService,
   35  	reviveProfile,

   75  		@IContextKeyService contextKeyService: IContextKeyService,
   76  		@IViewDescriptorService viewDescriptorService: IViewDescriptorService,
   77  		@IInstantiationService instantiationService: IInstantiationService,
   78  		@IOpenerService openerService: IOpenerService,
   79  		@IThemeService themeService: IThemeService,
   80: 		@ITelemetryService telemetryService: ITelemetryService,
   81  		@INotificationService notificationService: INotificationService,
   82  		@IHoverService hoverService: IHoverService,
   83  		@IUserDataSyncService
   84  		private readonly userDataSyncService: IUserDataSyncService,
   85  		@IUserDataSyncWorkbenchService

   99  			contextKeyService,
  100  			viewDescriptorService,
  101  			instantiationService,
  102  			openerService,
  103  			themeService,
  104: 			telemetryService,
  105  			notificationService,
  106  			hoverService,
  107  			accessibleViewVisibilityService,
  108  		);
  109  		this._register(
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\webview\browser\webviewElement.ts:

```sh
   34  import { IFileService } from "vs/platform/files/common/files";
   35  import { IInstantiationService } from "vs/platform/instantiation/common/instantiation";
   36  import { ILogService } from "vs/platform/log/common/log";
   37  import { INotificationService } from "vs/platform/notification/common/notification";
   38  import { IRemoteAuthorityResolverService } from "vs/platform/remote/common/remoteAuthorityResolver";
   39: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   40  import { ITunnelService } from "vs/platform/tunnel/common/tunnel";
   41  import { WebviewPortMappingManager } from "vs/platform/webview/common/webviewPortMapping";
   42  import {
   43  	loadLocalResource,
   44  	WebviewResourceResponse,

  212  		@IFileService private readonly _fileService: IFileService,
  213  		@ILogService private readonly _logService: ILogService,
  214  		@IRemoteAuthorityResolverService
  215  		private readonly _remoteAuthorityResolverService: IRemoteAuthorityResolverService,
  216  		@ITelemetryService
  217: 		private readonly _telemetryService: ITelemetryService,
  218  		@ITunnelService private readonly _tunnelService: ITunnelService,
  219  		@IInstantiationService instantiationService: IInstantiationService,
  220  		@IAccessibilityService
  221  		private readonly _accessibilityService: IAccessibilityService,
  222  	) {

  840  				};
  841  				owner: "mjbz";
  842  				comment: "Helps find which extensions are contributing webviews with invalid CSPs";
  843  			};
  844
  845: 			this._telemetryService.publicLog2<typeof payload, Classification>(
  846  				"webviewMissingCsp",
  847  				payload,
  848  			);
  849  		}
  850  	}
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\webview\electron-sandbox\webviewElement.ts:

```sh
  16  import { IMainProcessService } from "vs/platform/ipc/common/mainProcessService";
  17  import { ILogService } from "vs/platform/log/common/log";
  18  import { INativeHostService } from "vs/platform/native/common/native";
  19  import { INotificationService } from "vs/platform/notification/common/notification";
  20  import { IRemoteAuthorityResolverService } from "vs/platform/remote/common/remoteAuthorityResolver";
  21: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
  22  import { ITunnelService } from "vs/platform/tunnel/common/tunnel";
  23  import {
  24  	FindInFrameOptions,
  25  	IWebviewManagerService,
  26  } from "vs/platform/webview/common/webviewManagerService";

  50  		initInfo: WebviewInitInfo,
  51  		webviewThemeDataProvider: WebviewThemeDataProvider,
  52  		@IContextMenuService contextMenuService: IContextMenuService,
  53  		@ITunnelService tunnelService: ITunnelService,
  54  		@IFileService fileService: IFileService,
  55: 		@ITelemetryService telemetryService: ITelemetryService,
  56  		@IWorkbenchEnvironmentService
  57  		environmentService: IWorkbenchEnvironmentService,
  58  		@IRemoteAuthorityResolverService
  59  		remoteAuthorityResolverService: IRemoteAuthorityResolverService,
  60  		@ILogService logService: ILogService,

  74  			notificationService,
  75  			environmentService,
  76  			fileService,
  77  			logService,
  78  			remoteAuthorityResolverService,
  79: 			telemetryService,
  80  			tunnelService,
  81  			instantiationService,
  82  			accessibilityService,
  83  		);
  84
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\webviewPanel\browser\webviewEditor.ts:

```sh
  19  	IScopedContextKeyService,
  20  	RawContextKey,
  21  } from "vs/platform/contextkey/common/contextkey";
  22  import { IEditorOptions } from "vs/platform/editor/common/editor";
  23  import { IStorageService } from "vs/platform/storage/common/storage";
  24: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
  25  import { IThemeService } from "vs/platform/theme/common/themeService";
  26  import { EditorPane } from "vs/workbench/browser/parts/editor/editorPane";
  27  import { IEditorOpenContext } from "vs/workbench/common/editor";
  28  import { EditorInput } from "vs/workbench/common/editor/editorInput";
  29  import { IOverlayWebview } from "vs/workbench/contrib/webview/browser/webview";

  79  		new MutableDisposable<IScopedContextKeyService>(),
  80  	);
  81
  82  	constructor(
  83  		group: IEditorGroup,
  84: 		@ITelemetryService telemetryService: ITelemetryService,
  85  		@IThemeService themeService: IThemeService,
  86  		@IStorageService storageService: IStorageService,
  87  		@IEditorGroupsService
  88  		private readonly _editorGroupsService: IEditorGroupsService,
  89  		@IEditorService private readonly _editorService: IEditorService,

  94  		private readonly _contextKeyService: IContextKeyService,
  95  	) {
  96  		super(
  97  			WebviewEditor.ID,
  98  			group,
  99: 			telemetryService,
  100  			themeService,
  101  			storageService,
  102  		);
  103
  104  		const part = _editorGroupsService.getPart(group);
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\webviewView\browser\webviewViewPane.ts:

```sh
   31  import {
   32  	IStorageService,
   33  	StorageScope,
   34  	StorageTarget,
   35  } from "vs/platform/storage/common/storage";
   36: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   37  import { IThemeService } from "vs/platform/theme/common/themeService";
   38  import {
   39  	ViewPane,
   40  	ViewPaneShowActions,
   41  } from "vs/workbench/browser/parts/views/viewPane";

  111  		@IContextKeyService contextKeyService: IContextKeyService,
  112  		@IContextMenuService contextMenuService: IContextMenuService,
  113  		@IInstantiationService instantiationService: IInstantiationService,
  114  		@IKeybindingService keybindingService: IKeybindingService,
  115  		@IOpenerService openerService: IOpenerService,
  116: 		@ITelemetryService telemetryService: ITelemetryService,
  117  		@IHoverService hoverService: IHoverService,
  118  		@IThemeService themeService: IThemeService,
  119  		@IViewDescriptorService viewDescriptorService: IViewDescriptorService,
  120  		@IActivityService private readonly activityService: IActivityService,
  121  		@IExtensionService private readonly extensionService: IExtensionService,

  138  			contextKeyService,
  139  			viewDescriptorService,
  140  			instantiationService,
  141  			openerService,
  142  			themeService,
  143: 			telemetryService,
  144  			hoverService,
  145  		);
  146  		this.extensionId = options.fromExtensionId;
  147  		this.defaultTitle = this.title;
  148
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\welcomeDialog\browser\welcomeDialog.contribution.ts:

```sh
   23  import { Registry } from "vs/platform/registry/common/platform";
   24  import {
   25  	IStorageService,
   26  	StorageScope,
   27  } from "vs/platform/storage/common/storage";
   28: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   29  import { applicationConfigurationNodeBase } from "vs/workbench/common/configuration";
   30  import {
   31  	IWorkbenchContribution,
   32  	IWorkbenchContributionsRegistry,
   33  	Extensions as WorkbenchExtensions,

   52  		@IConfigurationService configurationService: IConfigurationService,
   53  		@IContextKeyService contextService: IContextKeyService,
   54  		@ICodeEditorService codeEditorService: ICodeEditorService,
   55  		@IInstantiationService instantiationService: IInstantiationService,
   56  		@ICommandService commandService: ICommandService,
   57: 		@ITelemetryService telemetryService: ITelemetryService,
   58  		@IOpenerService openerService: IOpenerService,
   59  		@IEditorService editorService: IEditorService,
   60  	) {
   61  		super();
   62

  100
  101  								const welcomeWidget = new WelcomeWidget(
  102  									codeEditor,
  103  									instantiationService,
  104  									commandService,
  105: 									telemetryService,
  106  									openerService,
  107  								);
  108
  109  								welcomeWidget.render(
  110  									welcomeDialog.title,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\welcomeDialog\browser\welcomeWidget.ts:

```sh
   32  import { localize } from "vs/nls";
   33  import { ICommandService } from "vs/platform/commands/common/commands";
   34  import { IInstantiationService } from "vs/platform/instantiation/common/instantiation";
   35  import { Link } from "vs/platform/opener/browser/link";
   36  import { IOpenerService } from "vs/platform/opener/common/opener";
   37: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   38  import { defaultButtonStyles } from "vs/platform/theme/browser/defaultStyles";
   39  import {
   40  	contrastBorder,
   41  	editorWidgetBackground,
   42  	editorWidgetForeground,

   54
   55  	constructor(
   56  		private readonly _editor: ICodeEditor,
   57  		private readonly instantiationService: IInstantiationService,
   58  		private readonly commandService: ICommandService,
   59: 		private readonly telemetryService: ITelemetryService,
   60  		private readonly openerService: IOpenerService,
   61  	) {
   62  		super();
   63  		this._rootDomNode = document.createElement("div");
   64  		this._rootDomNode.className = "welcome-widget";

   74  	}
   75
   76  	async executeCommand(commandId: string, ...args: string[]) {
   77  		try {
   78  			await this.commandService.executeCommand(commandId, ...args);
   79: 			this.telemetryService.publicLog2<
   80  				WorkbenchActionExecutedEvent,
   81  				WorkbenchActionExecutedClassification
   82  			>("workbenchActionExecuted", {
   83  				id: commandId,
   84  				from: "welcomeWidget",

   97  		}
   98
   99  		await this.buildWidgetContent(title, message, buttonText, buttonAction);
  100  		this._editor.addOverlayWidget(this);
  101  		this._show();
  102: 		this.telemetryService.publicLog2<
  103  			WorkbenchActionExecutedEvent,
  104  			WorkbenchActionExecutedClassification
  105  		>("workbenchActionExecuted", {
  106  			id: "welcomeWidgetRendered",
  107  			from: "welcomeWidget",

  207  						Link,
  208  						p,
  209  						node,
  210  						{
  211  							opener: (href: string) => {
  212: 								this.telemetryService.publicLog2<
  213  									WorkbenchActionExecutedEvent,
  214  									WorkbenchActionExecutedClassification
  215  								>("workbenchActionExecuted", {
  216  									id: "welcomeWidetLinkAction",
  217  									from: "welcomeWidget",

  259  		}
  260
  261  		this._isVisible = true;
  262  		this._rootDomNode.style.display = "none";
  263  		this._editor.removeOverlayWidget(this);
  264: 		this.telemetryService.publicLog2<
  265  			WorkbenchActionExecutedEvent,
  266  			WorkbenchActionExecutedClassification
  267  		>("workbenchActionExecuted", {
  268  			id: "welcomeWidgetDismissed",
  269  			from: "welcomeWidget",
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\welcomeGettingStarted\browser\gettingStarted.ts:

```sh
    69  } from "vs/platform/storage/common/storage";
    70  import {
    71  	firstSessionDateStorageKey,
    72  	ITelemetryService,
    73  	TelemetryLevel,
    74: } from "vs/platform/telemetry/common/telemetry";
    75: import { getTelemetryLevel } from "vs/platform/telemetry/common/telemetryUtils";
    76  import {
    77  	defaultButtonStyles,
    78  	defaultToggleStyles,
    79  } from "vs/platform/theme/browser/defaultStyles";
    80  import { IWindowOpenable } from "vs/platform/window/common/window";

   255  		private readonly keybindingService: IKeybindingService,
   256  		@IWalkthroughsService
   257  		private readonly gettingStartedService: IWalkthroughsService,
   258  		@IConfigurationService
   259  		private readonly configurationService: IConfigurationService,
   260: 		@ITelemetryService telemetryService: ITelemetryService,
   261  		@ILanguageService private readonly languageService: ILanguageService,
   262  		@IFileService private readonly fileService: IFileService,
   263  		@IOpenerService private readonly openerService: IOpenerService,
   264  		@IWorkbenchThemeService
   265  		protected override readonly themeService: IWorkbenchThemeService,

   284  		private readonly accessibilityService: IAccessibilityService,
   285  	) {
   286  		super(
   287  			GettingStartedPage.ID,
   288  			group,
   289: 			telemetryService,
   290  			themeService,
   291  			storageService,
   292  		);
   293
   294  		this.container = $(".gettingStartedContainer", {

   601  		});
   602  	}
   603
   604  	private async runDispatchCommand(command: string, argument: string) {
   605  		this.commandService.executeCommand("workbench.action.keepEditor");
   606: 		this.telemetryService.publicLog2<
   607  			GettingStartedActionEvent,
   608  			GettingStartedActionClassification
   609  		>("gettingStarted.ActionExecuted", {
   610  			command,
   611  			argument,

   666  			}
   667  			case "hideCategory": {
   668  				this.hideCategory(argument);
   669  				break;
   670  			}
   671: 			// Use selectTask over selectStep to keep telemetry consistant:https://github.com/microsoft/vscode/issues/122256
   672  			case "selectTask": {
   673  				this.selectStep(argument);
   674  				break;
   675  			}
   676  			case "toggleStepCompletion": {

   872  						)
   873  						.flat();
   874  					if (hrefs.length === 1) {
   875  						const href = hrefs[0];
   876  						if (href.startsWith("http")) {
   877: 							this.telemetryService.publicLog2<
   878  								GettingStartedActionEvent,
   879  								GettingStartedActionClassification
   880  							>("gettingStarted.ActionExecuted", {
   881  								command: "runStepAction",
   882  								argument: href,

   938  						)
   939  						.flat();
   940  					if (hrefs.length === 1) {
   941  						const href = hrefs[0];
   942  						if (href.startsWith("http")) {
   943: 							this.telemetryService.publicLog2<
   944  								GettingStartedActionEvent,
   945  								GettingStartedActionClassification
   946  							>("gettingStarted.ActionExecuted", {
   947  								command: "runStepAction",
   948  								argument: href,

  1247  				"Show welcome page on startup",
  1248  			),
  1249  		);
  1250  		const onShowOnStartupChanged = () => {
  1251  			if (showOnStartupCheckbox.checked) {
  1252: 				this.telemetryService.publicLog2<
  1253  					GettingStartedActionEvent,
  1254  					GettingStartedActionClassification
  1255  				>("gettingStarted.ActionExecuted", {
  1256  					command: "showOnStartupChecked",
  1257  					argument: undefined,

  1260  				this.configurationService.updateValue(
  1261  					configurationKey,
  1262  					"welcomePage",
  1263  				);
  1264  			} else {
  1265: 				this.telemetryService.publicLog2<
  1266  					GettingStartedActionEvent,
  1267  					GettingStartedActionClassification
  1268  				>("gettingStarted.ActionExecuted", {
  1269  					command: "showOnStartupUnchecked",
  1270  					argument: undefined,

  1402  		);
  1403  		if (
  1404  			this.editorInput.showTelemetryNotice &&
  1405  			this.productService.openToWelcomeMainPage
  1406  		) {
  1407: 			const telemetryNotice = $("p.telemetry-notice");
  1408: 			this.buildTelemetryFooter(telemetryNotice);
  1409: 			footer.appendChild(telemetryNotice);
  1410  		} else if (
  1411  			!this.productService.openToWelcomeMainPage &&
  1412  			!someStepsComplete &&
  1413  			!this.hasScrolledToFirstCategory &&
  1414  			this.showFeaturedWalkthrough

  1486  					name,
  1487  					parentPath,
  1488  				),
  1489  			);
  1490  			link.addEventListener("click", (e) => {
  1491: 				this.telemetryService.publicLog2<
  1492  					GettingStartedActionEvent,
  1493  					GettingStartedActionClassification
  1494  				>("gettingStarted.ActionExecuted", {
  1495  					command: "openRecent",
  1496  					argument: undefined,

  1943  	private runStepCommand(href: string) {
  1944  		const isCommand = href.startsWith("command:");
  1945  		const toSide = href.startsWith("command:toSide:");
  1946  		const command = href.replace(/command:(toSide:)?/, "command:");
  1947
  1948: 		this.telemetryService.publicLog2<
  1949  			GettingStartedActionEvent,
  1950  			GettingStartedActionClassification
  1951  		>("gettingStarted.ActionExecuted", {
  1952  			command: "runStepAction",
  1953  			argument: href,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\welcomeGettingStarted\browser\gettingStartedService.ts:

```sh
   41  import {
   42  	IStorageService,
   43  	StorageScope,
   44  	StorageTarget,
   45  } from "vs/platform/storage/common/storage";
   46: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   47  import { IUserDataSyncEnablementService } from "vs/platform/userDataSync/common/userDataSync";
   48  import { IWorkspaceContextService } from "vs/platform/workspace/common/workspace";
   49  import { Memento } from "vs/workbench/common/memento";
   50  import { walkthroughsExtensionPoint } from "vs/workbench/contrib/welcomeGettingStarted/browser/gettingStartedExtensionPoint";
   51  import { walkthroughs } from "vs/workbench/contrib/welcomeGettingStarted/common/gettingStartedContent";

  201  		private readonly configurationService: IConfigurationService,
  202  		@IExtensionManagementService
  203  		private readonly extensionManagementService: IExtensionManagementService,
  204  		@IHostService private readonly hostService: IHostService,
  205  		@IViewsService private readonly viewsService: IViewsService,
  206: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
  207  		@IWorkbenchAssignmentService
  208  		private readonly tasExperimentService: IWorkbenchAssignmentService,
  209  	) {
  210  		super();
  211

  671  				};
  672  			};
  673  			type GettingStartedAutoOpenEvent = {
  674  				id: string;
  675  			};
  676: 			this.telemetryService.publicLog2<
  677  				GettingStartedAutoOpenEvent,
  678  				GettingStartedAutoOpenClassification
  679  			>("gettingStarted.didAutoOpenWalkthrough", { id: sectionToOpen });
  680  			this.commandService.executeCommand(
  681  				"workbench.action.openWalkthrough",
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\welcomeGettingStarted\browser\startupPage.ts:

```sh
   18  import {
   19  	IStorageService,
   20  	StorageScope,
   21  	StorageTarget,
   22  } from "vs/platform/storage/common/storage";
   23: import { TelemetryLevel } from "vs/platform/telemetry/common/telemetry";
   24: import { getTelemetryLevel } from "vs/platform/telemetry/common/telemetryUtils";
   25  import {
   26  	IWorkspaceContextService,
   27  	UNKNOWN_EMPTY_WINDOW_WORKSPACE,
   28  	WorkbenchState,
   29  } from "vs/platform/workspace/common/workspace";

   56  	step?: string;
   57  };
   58
   59  const configurationKey = "workbench.startupEditor";
   60  const oldConfigurationKey = "workbench.welcome.enabled";
   61: const telemetryOptOutStorageKey = "workbench.telemetryOptOutShown";
   62
   63  export class StartupPageEditorResolverContribution
   64  	implements IWorkbenchContribution
   65  {
   66  	static readonly ID = "workbench.contrib.startupPageEditorResolver";

  137  			this.productService.showTelemetryOptOut &&
  138  			getTelemetryLevel(this.configurationService) !==
  139  				TelemetryLevel.NONE &&
  140  			!this.environmentService.skipWelcome &&
  141  			!this.storageService.get(
  142: 				telemetryOptOutStorageKey,
  143  				StorageScope.PROFILE,
  144  			)
  145  		) {
  146  			this.storageService.store(
  147: 				telemetryOptOutStorageKey,
  148  				true,
  149  				StorageScope.PROFILE,
  150  				StorageTarget.USER,
  151  			);
  152  			await this.openGettingStarted(true);
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\welcomeWalkthrough\browser\walkThroughInput.ts:

```sh
  47  export interface WalkThroughInputOptions {
  48  	readonly typeId: string;
  49  	readonly name: string;
  50  	readonly description?: string;
  51  	readonly resource: URI;
  52: 	readonly telemetryFrom: string;
  53  	readonly onReady?: (
  54  		container: HTMLElement,
  55  		contentDisposables: DisposableStore,
  56  	) => void;
  57  	readonly layout?: (dimension: Dimension) => void;

  92  	override getDescription(): string {
  93  		return this.options.description || "";
  94  	}
  95
  96  	getTelemetryFrom(): string {
  97: 		return this.options.telemetryFrom;
  98  	}
  99
  100  	override getTelemetryDescriptor(): { [key: string]: unknown } {
  101  		const descriptor = super.getTelemetryDescriptor();
  102  		descriptor["target"] = this.getTelemetryFrom();
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\welcomeWalkthrough\browser\walkThroughPart.ts:

```sh
   53  import { IInstantiationService } from "vs/platform/instantiation/common/instantiation";
   54  import { IKeybindingService } from "vs/platform/keybinding/common/keybinding";
   55  import { INotificationService } from "vs/platform/notification/common/notification";
   56  import { IOpenerService } from "vs/platform/opener/common/opener";
   57  import { IStorageService } from "vs/platform/storage/common/storage";
   58: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   59  import { IThemeService } from "vs/platform/theme/common/themeService";
   60  import { EditorPane } from "vs/workbench/browser/parts/editor/editorPane";
   61  import { IEditorMemento, IEditorOpenContext } from "vs/workbench/common/editor";
   62  import { WalkThroughInput } from "vs/workbench/contrib/welcomeWalkthrough/browser/walkThroughInput";
   63  import {

   96  	private size: Dimension | undefined;
   97  	private editorMemento: IEditorMemento<IWalkThroughEditorViewState>;
   98
   99  	constructor(
  100  		group: IEditorGroup,
  101: 		@ITelemetryService telemetryService: ITelemetryService,
  102  		@IThemeService themeService: IThemeService,
  103  		@ITextResourceConfigurationService
  104  		textResourceConfigurationService: ITextResourceConfigurationService,
  105  		@IInstantiationService
  106  		private readonly instantiationService: IInstantiationService,

  118  		@IEditorGroupsService editorGroupService: IEditorGroupsService,
  119  	) {
  120  		super(
  121  			WalkThroughPart.ID,
  122  			group,
  123: 			telemetryService,
  124  			themeService,
  125  			storageService,
  126  		);
  127  		this.editorFocus = WALK_THROUGH_FOCUS.bindTo(this.contextKeyService);
  128  		this.editorMemento = this.getEditorMemento<IWalkThroughEditorViewState>(

  454  					) as HTMLElement;
  455
  456  					const options = this.getEditorOptions(
  457  						model.getLanguageId(),
  458  					);
  459: 					const telemetryData = {
  460  						target:
  461  							this.input instanceof WalkThroughInput
  462  								? this.input.getTelemetryFrom()
  463  								: undefined,
  464  						snippet: i,

  466  					const editor = this.instantiationService.createInstance(
  467  						CodeEditorWidget,
  468  						div,
  469  						options,
  470  						{
  471: 							telemetryData: telemetryData,
  472  						},
  473  					);
  474  					editor.setModel(model);
  475  					this.contentDisposables.push(editor);
  476
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\welcomeWalkthrough\browser\editor\editorWalkThrough.ts:

```sh
  37  		query: JSON.stringify({
  38  			moduleId:
  39  				"vs/workbench/contrib/welcomeWalkthrough/browser/editor/vs_code_editor_walkthrough",
  40  		}),
  41  	}),
  42: 	telemetryFrom: "walkThrough",
  43  };
  44
  45  export class EditorWalkThroughAction extends Action2 {
  46  	public static readonly ID = "workbench.action.showInteractivePlayground";
  47  	public static readonly LABEL = localize2(
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\workspace\browser\workspace.contribution.ts:

```sh
    41  import {
    42  	IStorageService,
    43  	StorageScope,
    44  	StorageTarget,
    45  } from "vs/platform/storage/common/storage";
    46: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
    47  import { isVirtualWorkspace } from "vs/platform/workspace/common/virtualWorkspace";
    48  import {
    49  	isEmptyWorkspaceIdentifier,
    50  	ISingleFolderWorkspaceIdentifier,
    51  	isSingleFolderWorkspaceIdentifier,

  1321  	implements IWorkbenchContribution
  1322  {
  1323  	constructor(
  1324  		@IWorkbenchEnvironmentService
  1325  		private readonly environmentService: IWorkbenchEnvironmentService,
  1326: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
  1327  		@IWorkspaceContextService
  1328  		private readonly workspaceContextService: IWorkspaceContextService,
  1329  		@IWorkspaceTrustEnablementService
  1330  		private readonly workspaceTrustEnablementService: IWorkspaceTrustEnablementService,
  1331  		@IWorkspaceTrustManagementService

  1366
  1367  			type WorkspaceTrustDisabledEvent = {
  1368  				reason: "setting" | "cli";
  1369  			};
  1370
  1371: 			this.telemetryService.publicLog2<
  1372  				WorkspaceTrustDisabledEvent,
  1373  				WorkspaceTrustDisabledEventClassification
  1374  			>("workspaceTrustDisabled", {
  1375  				reason: disabledByCliFlag ? "cli" : "setting",
  1376  			});

  1389
  1390  		type WorkspaceTrustInfoEvent = {
  1391  			trustedFoldersCount: number;
  1392  		};
  1393
  1394: 		this.telemetryService.publicLog2<
  1395  			WorkspaceTrustInfoEvent,
  1396  			WorkspaceTrustInfoEventClassification
  1397  		>("workspaceTrustFolderCounts", {
  1398  			trustedFoldersCount:
  1399  				this.workspaceTrustManagementService.getTrustedUris().length,

  1423  				purpose: "FeatureInsight";
  1424  				comment: "true if the workspace is trusted";
  1425  			};
  1426  		};
  1427
  1428: 		this.telemetryService.publicLog2<
  1429  			WorkspaceTrustStateChangedEvent,
  1430  			WorkspaceTrustStateChangedEventClassification
  1431  		>("workspaceTrustStateChanged", {
  1432  			workspaceId: this.workspaceContextService.getWorkspace().id,
  1433  			isTrusted: isTrusted,

  1484
  1485  				const workspaceFolderDepth = getDepth(folder.uri.fsPath);
  1486  				const trustedFolderDepth = getDepth(uri.fsPath);
  1487  				const delta = workspaceFolderDepth - trustedFolderDepth;
  1488
  1489: 				this.telemetryService.publicLog2<
  1490  					WorkspaceTrustFolderInfoEvent,
  1491  					WorkspaceTrustFolderInfoEventClassification
  1492  				>("workspaceFolderDepthBelowTrustedFolder", {
  1493  					workspaceFolderDepth,
  1494  					trustedFolderDepth,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\contrib\workspace\browser\workspaceTrustEditor.ts:

```sh
   61  import { WorkbenchTable } from "vs/platform/list/browser/listService";
   62  import { Link } from "vs/platform/opener/browser/link";
   63  import { IProductService } from "vs/platform/product/common/productService";
   64  import { Registry } from "vs/platform/registry/common/platform";
   65  import { IStorageService } from "vs/platform/storage/common/storage";
   66: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   67  import {
   68  	defaultButtonStyles,
   69  	defaultInputBoxStyles,
   70  } from "vs/platform/theme/browser/defaultStyles";
   71  import {

  959  	private configurationContainer!: HTMLElement;
  960  	private workspaceTrustedUrisTable!: WorkspaceTrustedUrisTable;
  961
  962  	constructor(
  963  		group: IEditorGroup,
  964: 		@ITelemetryService telemetryService: ITelemetryService,
  965  		@IThemeService themeService: IThemeService,
  966  		@IStorageService storageService: IStorageService,
  967  		@IWorkspaceContextService
  968  		private readonly workspaceService: IWorkspaceContextService,
  969  		@IExtensionsWorkbenchService

  983  		private readonly keybindingService: IKeybindingService,
  984  	) {
  985  		super(
  986  			WorkspaceTrustEditor.ID,
  987  			group,
  988: 			telemetryService,
  989  			themeService,
  990  			storageService,
  991  		);
  992  	}
  993
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\electron-sandbox\desktop.contribution.ts:

```sh
   32  	KeybindingWeight,
   33  } from "vs/platform/keybinding/common/keybindingsRegistry";
   34  import { INativeHostService } from "vs/platform/native/common/native";
   35  import product from "vs/platform/product/common/product";
   36  import { Registry } from "vs/platform/registry/common/platform";
   37: import { TELEMETRY_SETTING_ID } from "vs/platform/telemetry/common/telemetry";
   38  import {
   39  	MAX_ZOOM_LEVEL,
   40  	MIN_ZOOM_LEVEL,
   41  } from "vs/platform/window/electron-sandbox/window";
   42  import {

  492  		},
  493  	});
  494
  495  	// Telemetry
  496  	registry.registerConfiguration({
  497: 		"id": "telemetry",
  498  		"order": 110,
  499: 		title: localize("telemetryConfigurationTitle", "Telemetry"),
  500  		"type": "object",
  501  		"properties": {
  502: 			"telemetry.enableCrashReporter": {
  503  				"type": "boolean",
  504  				"description": localize(
  505: 					"telemetry.enableCrashReporting",
  506  					"Enable crash reports to be collected. This helps us improve stability. \nThis option requires restart to take effect.",
  507  				),
  508  				"default": true,
  509: 				"tags": ["usesOnlineServices", "telemetry"],
  510  				"markdownDeprecationMessage": localize(
  511  					"enableCrashReporterDeprecated",
  512: 					"If this setting is false, no telemetry will be sent regardless of the new setting's value. Deprecated due to being combined into the {0} setting.",
  513  					`\`#${TELEMETRY_SETTING_ID}#\``,
  514  				),
  515  			},
  516  		},
  517  	});
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\electron-sandbox\window.ts:

```sh
  112  import {
  113  	IStorageService,
  114  	StorageScope,
  115  	StorageTarget,
  116  } from "vs/platform/storage/common/storage";
  117: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
  118  import {
  119  	extractLocalHostUriMetaDataForPortMapping,
  120  	extractQueryLocalHostUriMetaDataForPortMapping,
  121  	ITunnelService,
  122  	RemoteTunnel,

  216  		@INotificationService
  217  		private readonly notificationService: INotificationService,
  218  		@ICommandService private readonly commandService: ICommandService,
  219  		@IKeybindingService
  220  		private readonly keybindingService: IKeybindingService,
  221: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
  222  		@IWorkspaceEditingService
  223  		private readonly workspaceEditingService: IWorkspaceEditingService,
  224  		@IFileService private readonly fileService: IFileService,
  225  		@IMenuService private readonly menuService: IMenuService,
  226  		@ILifecycleService private readonly lifecycleService: ILifecycleService,

  326  					await this.commandService.executeCommand(
  327  						request.id,
  328  						...args,
  329  					);
  330
  331: 					this.telemetryService.publicLog2<
  332  						WorkbenchActionExecutedEvent,
  333  						WorkbenchActionExecutedClassification
  334  					>("workbenchActionExecuted", {
  335  						id: request.id,
  336  						from: request.from,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\services\accessibility\electron-sandbox\accessibilityService.ts:

```sh
  15  	InstantiationType,
  16  	registerSingleton,
  17  } from "vs/platform/instantiation/common/extensions";
  18  import { ILayoutService } from "vs/platform/layout/browser/layoutService";
  19  import { INativeHostService } from "vs/platform/native/common/native";
  20: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
  21  import {
  22  	IWorkbenchContribution,
  23  	registerWorkbenchContribution2,
  24  	WorkbenchPhase,
  25  } from "vs/workbench/common/contributions";

  51  		environmentService: INativeWorkbenchEnvironmentService,
  52  		@IContextKeyService contextKeyService: IContextKeyService,
  53  		@IConfigurationService configurationService: IConfigurationService,
  54  		@ILayoutService _layoutService: ILayoutService,
  55  		@ITelemetryService
  56: 		private readonly _telemetryService: ITelemetryService,
  57  		@INativeHostService
  58  		private readonly nativeHostService: INativeHostService,
  59  	) {
  60  		super(contextKeyService, _layoutService, configurationService);
  61  		this.setAccessibilitySupport(

  91
  92  		if (
  93  			!this.didSendTelemetry &&
  94  			accessibilitySupport === AccessibilitySupport.Enabled
  95  		) {
  96: 			this._telemetryService.publicLog2<
  97  				AccessibilityMetrics,
  98  				AccessibilityMetricsClassification
  99  			>("accessibility", { enabled: true });
  100  			this.didSendTelemetry = true;
  101  		}
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\services\assignment\common\assignmentService.ts:

```sh
   28  import {
   29  	IStorageService,
   30  	StorageScope,
   31  	StorageTarget,
   32  } from "vs/platform/storage/common/storage";
   33: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   34  import { workbenchConfigurationNodeBase } from "vs/workbench/common/configuration";
   35  import { Memento, MementoObject } from "vs/workbench/common/memento";
   36
   37  export const IWorkbenchAssignmentService =
   38  	createDecorator<IWorkbenchAssignmentService>("WorkbenchAssignmentService");

   65  }
   66
   67  class WorkbenchAssignmentServiceTelemetry implements IExperimentationTelemetry {
   68  	private _lastAssignmentContext: string | undefined;
   69  	constructor(
   70: 		private telemetryService: ITelemetryService,
   71  		private productService: IProductService,
   72  	) {}
   73
   74  	get assignmentContext(): string[] | undefined {
   75  		return this._lastAssignmentContext?.split(";");

   83  				?.assignmentContextTelemetryPropertyName
   84  		) {
   85  			this._lastAssignmentContext = value;
   86  		}
   87
   88: 		this.telemetryService.setExperimentProperty(name, value);
   89  	}
   90
   91  	postEvent(eventName: string, props: Map<string, string>): void {
   92  		const data: ITelemetryData = {};
   93  		for (const [key, value] of props.entries()) {

   99  				"owner": "sbatten",
  100  				"comment": "Logs queries to the experiment service by feature for metric calculations",
  101  				"ABExp.queriedFeature": { "classification": "SystemMetaData", "purpose": "FeatureInsight", "comment": "The experimental feature being queried" }
  102  			}
  103  		*/
  104: 		this.telemetryService.publicLog(eventName, data);
  105  	}
  106  }
  107
  108  export class WorkbenchAssignmentService extends BaseAssignmentService {
  109  	constructor(
  110: 		@ITelemetryService private telemetryService: ITelemetryService,
  111  		@IStorageService storageService: IStorageService,
  112  		@IConfigurationService configurationService: IConfigurationService,
  113  		@IProductService productService: IProductService,
  114  		@IEnvironmentService environmentService: IEnvironmentService,
  115  	) {
  116  		super(
  117: 			telemetryService.machineId,
  118  			configurationService,
  119  			productService,
  120  			environmentService,
  121  			new WorkbenchAssignmentServiceTelemetry(
  122: 				telemetryService,
  123  				productService,
  124  			),
  125  			new MementoKeyValueStorage(
  126  				new Memento("experiment.service.memento", storageService),
  127  			),

  158  				purpose: "PerformanceAndHealth";
  159  				comment: "The name of the treatment that was read";
  160  			};
  161  		};
  162
  163: 		this.telemetryService.publicLog2<
  164  			TASClientReadTreatmentData,
  165  			TASClientReadTreatmentClassification
  166  		>("tasClientReadTreatmentComplete", {
  167  			treatmentName: name,
  168  			treatmentValue: JSON.stringify(result),

  180  			return undefined;
  181  		}
  182
  183  		await this.tasClient;
  184
  185: 		return (this.telemetry as WorkbenchAssignmentServiceTelemetry)
  186  			?.assignmentContext;
  187  	}
  188  }
  189
  190  registerSingleton(
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\services\auxiliaryWindow\browser\auxiliaryWindowService.ts:

```sh
   48  import {
   49  	InstantiationType,
   50  	registerSingleton,
   51  } from "vs/platform/instantiation/common/extensions";
   52  import { createDecorator } from "vs/platform/instantiation/common/instantiation";
   53: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   54  import {
   55  	IRectangle,
   56  	WindowMinimumSize,
   57  } from "vs/platform/window/common/window";
   58  import { BaseWindow } from "vs/workbench/browser/window";

  342  		@IWorkbenchLayoutService
  343  		private readonly layoutService: IWorkbenchLayoutService,
  344  		@IDialogService protected readonly dialogService: IDialogService,
  345  		@IConfigurationService
  346  		protected readonly configurationService: IConfigurationService,
  347: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
  348  		@IHostService protected readonly hostService: IHostService,
  349  		@IWorkbenchEnvironmentService
  350  		protected readonly environmentService: IWorkbenchEnvironmentService,
  351  	) {
  352  		super();

  420  			};
  421  		};
  422  		type AuxiliaryWindowOpenEvent = {
  423  			bounds: boolean;
  424  		};
  425: 		this.telemetryService.publicLog2<
  426  			AuxiliaryWindowOpenEvent,
  427  			AuxiliaryWindowClassification
  428  		>("auxiliaryWindowOpen", { bounds: !!options?.bounds });
  429
  430  		return auxiliaryWindow;
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\services\auxiliaryWindow\electron-sandbox\auxiliaryWindowService.ts:

```sh
   22  	InstantiationType,
   23  	registerSingleton,
   24  } from "vs/platform/instantiation/common/extensions";
   25  import { IInstantiationService } from "vs/platform/instantiation/common/instantiation";
   26  import { INativeHostService } from "vs/platform/native/common/native";
   27: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   28  import { applyZoom } from "vs/platform/window/electron-sandbox/window";
   29  import {
   30  	AuxiliaryWindow,
   31  	AuxiliaryWindowMode,
   32  	BrowserAuxiliaryWindowService,

  178  		@INativeHostService
  179  		private readonly nativeHostService: INativeHostService,
  180  		@IDialogService dialogService: IDialogService,
  181  		@IInstantiationService
  182  		private readonly instantiationService: IInstantiationService,
  183: 		@ITelemetryService telemetryService: ITelemetryService,
  184  		@IHostService hostService: IHostService,
  185  		@IWorkbenchEnvironmentService
  186  		environmentService: IWorkbenchEnvironmentService,
  187  	) {
  188  		super(
  189  			layoutService,
  190  			dialogService,
  191  			configurationService,
  192: 			telemetryService,
  193  			hostService,
  194  			environmentService,
  195  		);
  196  	}
  197
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\services\contextmenu\electron-sandbox\contextmenuService.ts:

```sh
   48  	InstantiationType,
   49  	registerSingleton,
   50  } from "vs/platform/instantiation/common/extensions";
   51  import { IKeybindingService } from "vs/platform/keybinding/common/keybinding";
   52  import { INotificationService } from "vs/platform/notification/common/notification";
   53: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   54  import { hasNativeTitlebar } from "vs/platform/window/common/window";
   55
   56  export class ContextMenuService implements IContextMenuService {
   57  	declare readonly _serviceBrand: undefined;
   58

   65  		return this.impl.onDidHideContextMenu;
   66  	}
   67
   68  	constructor(
   69  		@INotificationService notificationService: INotificationService,
   70: 		@ITelemetryService telemetryService: ITelemetryService,
   71  		@IKeybindingService keybindingService: IKeybindingService,
   72  		@IConfigurationService configurationService: IConfigurationService,
   73  		@IContextViewService contextViewService: IContextViewService,
   74  		@IMenuService menuService: IMenuService,
   75  		@IContextKeyService contextKeyService: IContextKeyService,
   76  	) {
   77  		// Custom context menu: Linux/Windows if custom title is enabled
   78  		if (!isMacintosh && !hasNativeTitlebar(configurationService)) {
   79  			this.impl = new HTMLContextMenuService(
   80: 				telemetryService,
   81  				notificationService,
   82  				contextViewService,
   83  				keybindingService,
   84  				menuService,
   85  				contextKeyService,

   88
   89  		// Native context menu: otherwise
   90  		else {
   91  			this.impl = new NativeContextMenuService(
   92  				notificationService,
   93: 				telemetryService,
   94  				keybindingService,
   95  				menuService,
   96  				contextKeyService,
   97  			);
   98  		}

  126  	readonly onDidHideContextMenu = this._onDidHideContextMenu.event;
  127
  128  	constructor(
  129  		@INotificationService
  130  		private readonly notificationService: INotificationService,
  131: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
  132  		@IKeybindingService
  133  		private readonly keybindingService: IKeybindingService,
  134  		@IMenuService private readonly menuService: IMenuService,
  135  		@IContextKeyService
  136  		private readonly contextKeyService: IContextKeyService,

  361  		actionToRun: IAction,
  362  		delegate: IContextMenuDelegate,
  363  		event: IContextMenuEvent,
  364  	): Promise<void> {
  365  		if (!delegate.skipTelemetry) {
  366: 			this.telemetryService.publicLog2<
  367  				WorkbenchActionExecutedEvent,
  368  				WorkbenchActionExecutedClassification
  369  			>("workbenchActionExecuted", {
  370  				id: actionToRun.id,
  371  				from: "contextMenu",
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\services\dialogs\electron-sandbox\fileDialogService.ts:

```sh
  94  	private toNativeOpenDialogOptions(
  95  		options: IPickAndOpenOptions,
  96  	): INativeOpenDialogOptions {
  97  		return {
  98  			forceNewWindow: options.forceNewWindow,
  99: 			telemetryExtraData: options.telemetryExtraData,
  100  			defaultPath: options.defaultUri?.fsPath,
  101  		};
  102  	}
  103
  104  	private shouldUseSimplified(schema: string): {
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\services\editor\browser\editorResolverService.ts:

```sh
    42  import {
    43  	IStorageService,
    44  	StorageScope,
    45  	StorageTarget,
    46  } from "vs/platform/storage/common/storage";
    47: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
    48  import {
    49  	DEFAULT_EDITOR_ASSOCIATION,
    50  	EditorInputWithOptions,
    51  	EditorResourceAccessor,
    52  	IResourceSideBySideEditorInput,

   137  		private readonly configurationService: IConfigurationService,
   138  		@IQuickInputService
   139  		private readonly quickInputService: IQuickInputService,
   140  		@INotificationService
   141  		private readonly notificationService: INotificationService,
   142: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
   143  		@IStorageService private readonly storageService: IStorageService,
   144  		@IExtensionService private readonly extensionService: IExtensionService,
   145  		@ILogService private readonly logService: ILogService,
   146  	) {
   147  		super();

  1276  		};
  1277  		type editorResolutionEvent = {
  1278  			viewType: string;
  1279  		};
  1280  		if (chosenInput.editorId) {
  1281: 			this.telemetryService.publicLog2<
  1282  				editorResolutionEvent,
  1283  				editorResolutionClassification
  1284  			>("override.viewType", { viewType: chosenInput.editorId });
  1285  		}
  1286  	}
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\services\extensionManagement\browser\extensionsProfileScannerService.ts:

```sh
  11  import {
  12  	InstantiationType,
  13  	registerSingleton,
  14  } from "vs/platform/instantiation/common/extensions";
  15  import { ILogService } from "vs/platform/log/common/log";
  16: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
  17  import { IUriIdentityService } from "vs/platform/uriIdentity/common/uriIdentity";
  18  import { IUserDataProfilesService } from "vs/platform/userDataProfile/common/userDataProfile";
  19  import { IWorkbenchEnvironmentService } from "vs/workbench/services/environment/common/environmentService";
  20
  21  export class ExtensionsProfileScannerService extends AbstractExtensionsProfileScannerService {

  24  		environmentService: IWorkbenchEnvironmentService,
  25  		@IFileService fileService: IFileService,
  26  		@IUserDataProfilesService
  27  		userDataProfilesService: IUserDataProfilesService,
  28  		@IUriIdentityService uriIdentityService: IUriIdentityService,
  29: 		@ITelemetryService telemetryService: ITelemetryService,
  30  		@ILogService logService: ILogService,
  31  	) {
  32  		super(
  33  			environmentService.userRoamingDataHome,
  34  			fileService,
  35  			userDataProfilesService,
  36  			uriIdentityService,
  37: 			telemetryService,
  38  			logService,
  39  		);
  40  	}
  41  }
  42
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\services\extensionManagement\common\extensionManagementService.ts:

```sh
    63  import {
    64  	IStorageService,
    65  	StorageScope,
    66  	StorageTarget,
    67  } from "vs/platform/storage/common/storage";
    68: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
    69  import { IUriIdentityService } from "vs/platform/uriIdentity/common/uriIdentity";
    70  import {
    71  	IUserDataSyncEnablementService,
    72  	SyncResource,
    73  } from "vs/platform/userDataSync/common/userDataSync";

   155  		@ILogService private readonly logService: ILogService,
   156  		@IInstantiationService
   157  		private readonly instantiationService: IInstantiationService,
   158  		@IExtensionsScannerService
   159  		private readonly extensionsScannerService: IExtensionsScannerService,
   160: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
   161  	) {
   162  		super();
   163
   164  		this.workspaceExtensionManagementService = this._register(
   165  			this.instantiationService.createInstance(

  1092  		try {
  1093  			await this.workspaceExtensionManagementService.uninstall(extension);
  1094  			this.logService.info(
  1095  				`Successfully uninstalled the workspace extension ${extension.identifier.id} from ${extension.location.toString()}`,
  1096  			);
  1097: 			this.telemetryService.publicLog2<
  1098  				{},
  1099  				{
  1100  					owner: "sandy081";
  1101  					comment: "Uninstall workspace extension";
  1102  				}

  1626  		@IExtensionsScannerService
  1627  		private readonly extensionsScannerService: IExtensionsScannerService,
  1628  		@IStorageService private readonly storageService: IStorageService,
  1629  		@IUriIdentityService
  1630  		private readonly uriIdentityService: IUriIdentityService,
  1631: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
  1632  	) {
  1633  		super();
  1634
  1635  		this._register(
  1636  			Event.debounce<FileChangesEvent, FileChangesEvent[]>(

  1774  				workspaceExtension,
  1775  			);
  1776  		}
  1777
  1778  		this.saveWorkspaceExtensions();
  1779: 		this.telemetryService.publicLog2<
  1780  			{},
  1781  			{
  1782  				owner: "sandy081";
  1783  				comment: "Install workspace extension";
  1784  			}

  1796  		if (existingExtensionIndex !== -1) {
  1797  			this.extensions.splice(existingExtensionIndex, 1);
  1798  			this.saveWorkspaceExtensions();
  1799  		}
  1800
  1801: 		this.telemetryService.publicLog2<
  1802  			{},
  1803  			{
  1804  				owner: "sandy081";
  1805  				comment: "Uninstall workspace extension";
  1806  			}
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\services\extensionManagement\common\webExtensionManagementService.ts:

```sh
   40  	IExtensionManifest,
   41  	TargetPlatform,
   42  } from "vs/platform/extensions/common/extensions";
   43  import { ILogService } from "vs/platform/log/common/log";
   44  import { IProductService } from "vs/platform/product/common/productService";
   45: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   46  import { IUriIdentityService } from "vs/platform/uriIdentity/common/uriIdentity";
   47  import { IUserDataProfilesService } from "vs/platform/userDataProfile/common/userDataProfile";
   48  import {
   49  	IProfileAwareExtensionManagementService,
   50  	IScannedExtension,

  121  	readonly onDidChangeProfile = this._onDidChangeProfile.event;
  122
  123  	constructor(
  124  		@IExtensionGalleryService
  125  		extensionGalleryService: IExtensionGalleryService,
  126: 		@ITelemetryService telemetryService: ITelemetryService,
  127  		@ILogService logService: ILogService,
  128  		@IWebExtensionsScannerService
  129  		private readonly webExtensionsScannerService: IWebExtensionsScannerService,
  130  		@IExtensionManifestPropertiesService
  131  		private readonly extensionManifestPropertiesService: IExtensionManifestPropertiesService,

  136  		userDataProfilesService: IUserDataProfilesService,
  137  		@IUriIdentityService uriIdentityService: IUriIdentityService,
  138  	) {
  139  		super(
  140  			extensionGalleryService,
  141: 			telemetryService,
  142  			uriIdentityService,
  143  			logService,
  144  			productService,
  145  			userDataProfilesService,
  146  		);
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\services\extensionManagement\electron-sandbox\extensionManagementService.ts:

```sh
  22  	registerSingleton,
  23  } from "vs/platform/instantiation/common/extensions";
  24  import { IInstantiationService } from "vs/platform/instantiation/common/instantiation";
  25  import { ILogService } from "vs/platform/log/common/log";
  26  import { IProductService } from "vs/platform/product/common/productService";
  27: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
  28  import { IUserDataSyncEnablementService } from "vs/platform/userDataSync/common/userDataSync";
  29  import { IWorkspaceTrustRequestService } from "vs/platform/workspace/common/workspaceTrust";
  30  import { INativeWorkbenchEnvironmentService } from "vs/workbench/services/environment/electron-sandbox/environmentService";
  31  import {
  32  	IExtensionManagementServer,

  60  		@IFileService fileService: IFileService,
  61  		@ILogService logService: ILogService,
  62  		@IInstantiationService instantiationService: IInstantiationService,
  63  		@IExtensionsScannerService
  64  		extensionsScannerService: IExtensionsScannerService,
  65: 		@ITelemetryService telemetryService: ITelemetryService,
  66  	) {
  67  		super(
  68  			extensionManagementServerService,
  69  			extensionGalleryService,
  70  			userDataProfileService,

  77  			extensionManifestPropertiesService,
  78  			fileService,
  79  			logService,
  80  			instantiationService,
  81  			extensionsScannerService,
  82: 			telemetryService,
  83  		);
  84  	}
  85
  86  	protected override async installVSIXInServer(
  87  		vsix: URI,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\services\extensions\browser\extensionService.ts:

```sh
   27  	IRemoteAuthorityResolverService,
   28  	RemoteAuthorityResolverError,
   29  	ResolverResult,
   30  } from "vs/platform/remote/common/remoteAuthorityResolver";
   31  import { IRemoteExtensionsScannerService } from "vs/platform/remote/common/remoteExtensionsScanner";
   32: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   33  import { IWorkspaceContextService } from "vs/platform/workspace/common/workspace";
   34  import { IWorkspaceTrustManagementService } from "vs/platform/workspace/common/workspaceTrust";
   35  import { IBrowserWorkbenchEnvironmentService } from "vs/workbench/services/environment/browser/environmentService";
   36  import {
   37  	IWebExtensionsScannerService,

   94  	constructor(
   95  		@IInstantiationService instantiationService: IInstantiationService,
   96  		@INotificationService notificationService: INotificationService,
   97  		@IBrowserWorkbenchEnvironmentService
   98  		private readonly _browserEnvironmentService: IBrowserWorkbenchEnvironmentService,
   99: 		@ITelemetryService telemetryService: ITelemetryService,
  100  		@IWorkbenchExtensionEnablementService
  101  		extensionEnablementService: IWorkbenchExtensionEnablementService,
  102  		@IFileService fileService: IFileService,
  103  		@IProductService productService: IProductService,
  104  		@IWorkbenchExtensionManagementService

  144  			extensionHostFactory,
  145  			new BrowserExtensionHostKindPicker(logService),
  146  			instantiationService,
  147  			notificationService,
  148  			_browserEnvironmentService,
  149: 			telemetryService,
  150  			extensionEnablementService,
  151  			fileService,
  152  			productService,
  153  			extensionManagementService,
  154  			contextService,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\services\extensions\browser\extensionUrlHandler.ts:

```sh
   36  import {
   37  	IStorageService,
   38  	StorageScope,
   39  	StorageTarget,
   40  } from "vs/platform/storage/common/storage";
   41: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   42  import {
   43  	IOpenURLOptions,
   44  	IURLHandler,
   45  	IURLService,
   46  } from "vs/platform/url/common/url";

  181  		@ICommandService private readonly commandService: ICommandService,
  182  		@IHostService private readonly hostService: IHostService,
  183  		@IStorageService private readonly storageService: IStorageService,
  184  		@IConfigurationService
  185  		private readonly configurationService: IConfigurationService,
  186: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
  187  		@INotificationService
  188  		private readonly notificationService: INotificationService,
  189  		@IProductService private readonly productService: IProductService,
  190  		@IWorkbenchEnvironmentService
  191  		private readonly workbenchEnvironmentService: IWorkbenchEnvironmentService,

  225  		if (!isExtensionId(uri.authority)) {
  226  			return false;
  227  		}
  228
  229  		const extensionId = uri.authority;
  230: 		this.telemetryService.publicLog2<
  231  			ExtensionUrlHandlerEvent,
  232  			ExtensionUrlHandlerClassification
  233  		>("uri_invoked/start", { extensionId });
  234
  235  		const initialHandler = this.extensionHandlers.get(

  283  					"&&Open",
  284  				),
  285  			});
  286
  287  			if (!result.confirmed) {
  288: 				this.telemetryService.publicLog2<
  289  					ExtensionUrlHandlerEvent,
  290  					ExtensionUrlHandlerClassification
  291  				>("uri_invoked/cancel", { extensionId });
  292  				return true;
  293  			}

  365  		extensionId: ExtensionIdentifier | string,
  366  		handler: IURLHandler,
  367  		uri: URI,
  368  		options?: IOpenURLOptions,
  369  	): Promise<boolean> {
  370: 		this.telemetryService.publicLog2<
  371  			ExtensionUrlHandlerEvent,
  372  			ExtensionUrlHandlerClassification
  373  		>("uri_invoked/end", {
  374  			extensionId: ExtensionIdentifier.toKey(extensionId),
  375  		});

  379  	private async handleUnhandledURL(
  380  		uri: URI,
  381  		extensionId: string,
  382  		options?: IOpenURLOptions,
  383  	): Promise<void> {
  384: 		this.telemetryService.publicLog2<
  385  			ExtensionUrlHandlerEvent,
  386  			ExtensionUrlHandlerClassification
  387  		>("uri_invoked/install_extension/start", { extensionId });
  388
  389  		try {

  396  						action: localize("openUri", "Open URI"),
  397  					},
  398  					enable: true,
  399  				},
  400  			);
  401: 			this.telemetryService.publicLog2<
  402  				ExtensionUrlHandlerEvent,
  403  				ExtensionUrlHandlerClassification
  404  			>("uri_invoked/install_extension/accept", { extensionId });
  405  		} catch (error) {
  406  			if (isCancellationError(error)) {
  407: 				this.telemetryService.publicLog2<
  408  					ExtensionUrlHandlerEvent,
  409  					ExtensionUrlHandlerClassification
  410  				>("uri_invoked/install_extension/cancel", { extensionId });
  411  			} else {
  412: 				this.telemetryService.publicLog2<
  413  					ExtensionUrlHandlerEvent,
  414  					ExtensionUrlHandlerClassification
  415  				>("uri_invoked/install_extension/error", { extensionId });
  416  				this.notificationService.error(error);
  417  			}

  422
  423  		if (extension) {
  424  			await this.handleURL(uri, { ...options, trusted: true });
  425  		} else {
  426  			/* Extension cannot be added and require window reload */
  427: 			this.telemetryService.publicLog2<
  428  				ExtensionUrlReloadHandlerEvent,
  429  				ExtensionUrlReloadHandlerClassification
  430  			>("uri_invoked/install_extension/reload", {
  431  				extensionId,
  432  				isRemote: !!this.workbenchEnvironmentService.remoteAuthority,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\services\extensions\browser\webWorkerExtensionHost.ts:

```sh
   26  import {
   27  	IStorageService,
   28  	StorageScope,
   29  	StorageTarget,
   30  } from "vs/platform/storage/common/storage";
   31: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   32: import { isLoggingOnly } from "vs/platform/telemetry/common/telemetryUtils";
   33  import { IUserDataProfilesService } from "vs/platform/userDataProfile/common/userDataProfile";
   34  import {
   35  	IWorkspaceContextService,
   36  	WorkbenchState,
   37  } from "vs/platform/workspace/common/workspace";

   82  	constructor(
   83  		public readonly runningLocation: LocalWebWorkerRunningLocation,
   84  		public readonly startup: ExtensionHostStartup,
   85  		private readonly _initDataProvider: IWebWorkerExtensionHostDataProvider,
   86  		@ITelemetryService
   87: 		private readonly _telemetryService: ITelemetryService,
   88  		@IWorkspaceContextService
   89  		private readonly _contextService: IWorkspaceContextService,
   90  		@ILabelService private readonly _labelService: ILabelService,
   91  		@ILogService private readonly _logService: ILogService,
   92  		@ILoggerService private readonly _loggerService: ILoggerService,

  458  				includeStack: false,
  459  				logNative: this._environmentService.debugRenderer,
  460  			},
  461  			extensions: this.extensions.toSnapshot(),
  462  			nlsBaseUrl: nlsUrlWithDetails,
  463: 			telemetryInfo: {
  464: 				sessionId: this._telemetryService.sessionId,
  465: 				machineId: this._telemetryService.machineId,
  466: 				sqmId: this._telemetryService.sqmId,
  467: 				devDeviceId: this._telemetryService.devDeviceId,
  468: 				firstSessionDate: this._telemetryService.firstSessionDate,
  469: 				msftInternal: this._telemetryService.msftInternal,
  470  			},
  471  			logLevel: this._logService.getLevel(),
  472  			loggers: [...this._loggerService.getRegisteredLoggers()],
  473  			logsLocation: this._extensionHostLogsLocation,
  474  			autoStart: this.startup === ExtensionHostStartup.EagerAutoStart,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\services\extensions\common\abstractExtensionService.ts:

```sh
    45  	RemoteAuthorityResolverError,
    46  	RemoteAuthorityResolverErrorCode,
    47  	ResolverResult,
    48  } from "vs/platform/remote/common/remoteAuthorityResolver";
    49  import { IRemoteExtensionsScannerService } from "vs/platform/remote/common/remoteExtensionsScanner";
    50: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
    51  import { IWorkspaceContextService } from "vs/platform/workspace/common/workspace";
    52  import { IWorkbenchEnvironmentService } from "vs/workbench/services/environment/common/environmentService";
    53  import {
    54  	Extensions as ExtensionFeaturesExtensions,
    55  	IExtensionFeatureMarkdownRenderer,

   202  		@INotificationService
   203  		protected readonly _notificationService: INotificationService,
   204  		@IWorkbenchEnvironmentService
   205  		protected readonly _environmentService: IWorkbenchEnvironmentService,
   206  		@ITelemetryService
   207: 		protected readonly _telemetryService: ITelemetryService,
   208  		@IWorkbenchExtensionEnablementService
   209  		protected readonly _extensionEnablementService: IWorkbenchExtensionEnablementService,
   210  		@IFileService protected readonly _fileService: IFileService,
   211  		@IProductService protected readonly _productService: IProductService,
   212  		@IWorkbenchExtensionManagementService

  1764  				type: Severity;
  1765  				extensionId: string;
  1766  				extensionPointId: string;
  1767  				message: string;
  1768  			};
  1769: 			this._telemetryService.publicLog2<
  1770  				ExtensionsMessageEvent,
  1771  				ExtensionsMessageClassification
  1772  			>("extensionsMessage", {
  1773  				type,
  1774  				extensionId: extensionId.value,

  1920  		};
  1921  		type ExtensionActivationErrorEvent = {
  1922  			extensionId: string;
  1923  			error: string;
  1924  		};
  1925: 		this._telemetryService.publicLog2<
  1926  			ExtensionActivationErrorEvent,
  1927  			ExtensionActivationErrorClassification
  1928  		>("extensionActivationError", {
  1929  			extensionId: extensionId.value,
  1930  			error: error.message,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\services\extensions\common\extensionHostManager.ts:

```sh
   25  import { ILogService } from "vs/platform/log/common/log";
   26  import {
   27  	getRemoteAuthorityPrefix,
   28  	RemoteAuthorityResolverErrorCode,
   29  } from "vs/platform/remote/common/remoteAuthorityResolver";
   30: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   31  import { IEditorService } from "vs/workbench/services/editor/common/editorService";
   32  import { IWorkbenchEnvironmentService } from "vs/workbench/services/environment/common/environmentService";
   33  import {
   34  	ExtensionHostKind,
   35  	extensionHostKindToString,

  156  		@IInstantiationService
  157  		private readonly _instantiationService: IInstantiationService,
  158  		@IWorkbenchEnvironmentService
  159  		private readonly _environmentService: IWorkbenchEnvironmentService,
  160  		@ITelemetryService
  161: 		private readonly _telemetryService: ITelemetryService,
  162  		@ILogService private readonly _logService: ILogService,
  163  	) {
  164  		super();
  165  		this._cachedActivationEvents = new Map<string, Promise<void>>();
  166  		this._resolvedActivationEvents = new Set<string>();

  173  		const startingTelemetryEvent: ExtensionHostStartupEvent = {
  174  			time: Date.now(),
  175  			action: "starting",
  176  			kind: extensionHostKindToString(this.kind),
  177  		};
  178: 		this._telemetryService.publicLog2<
  179  			ExtensionHostStartupEvent,
  180  			ExtensionHostStartupClassification
  181  		>("extensionHostStartup", startingTelemetryEvent);
  182
  183  		this._proxy = this._extensionHost.start().then(

  188  				const successTelemetryEvent: ExtensionHostStartupEvent = {
  189  					time: Date.now(),
  190  					action: "success",
  191  					kind: extensionHostKindToString(this.kind),
  192  				};
  193: 				this._telemetryService.publicLog2<
  194  					ExtensionHostStartupEvent,
  195  					ExtensionHostStartupClassification
  196  				>("extensionHostStartup", successTelemetryEvent);
  197
  198  				return this._createExtensionHostCustomers(this.kind, protocol);

  217  					failureTelemetryEvent.errorMessage = err.message;
  218  				}
  219  				if (err && err.stack) {
  220  					failureTelemetryEvent.errorStack = err.stack;
  221  				}
  222: 				this._telemetryService.publicLog2<
  223  					ExtensionHostStartupEvent,
  224  					ExtensionHostStartupClassification
  225  				>("extensionHostStartup", failureTelemetryEvent);
  226
  227  				return null;

  329  			LOG_EXTENSION_HOST_COMMUNICATION ||
  330  			this._environmentService.logExtensionHostCommunication
  331  		) {
  332  			logger = new RPCLogger(kind);
  333  		} else if (TelemetryRPCLogger.isEnabled()) {
  334: 			logger = new TelemetryRPCLogger(this._telemetryService);
  335  		}
  336
  337  		this._rpcProtocol = new RPCProtocol(protocol, logger);
  338  		this._register(
  339  			this._rpcProtocol.onDidChangeResponsiveState(

  766
  767  	private readonly _pendingRequests = new Map<number, string>();
  768
  769  	constructor(
  770  		@ITelemetryService
  771: 		private readonly _telemetryService: ITelemetryService,
  772  	) {}
  773
  774  	logIncoming(
  775  		msgLength: number,
  776  		req: number,

  783  		) {
  784  			// log the size of reply messages
  785  			const requestStr =
  786  				this._pendingRequests.get(req) ?? "unknown_reply";
  787  			this._pendingRequests.delete(req);
  788: 			this._telemetryService.publicLog2<
  789  				RPCTelemetryData,
  790  				RPCTelemetryDataClassification
  791  			>("extensionhost.incoming", {
  792  				type: `${str} ${requestStr}`,
  793  				length: msgLength,

  797  		if (
  798  			initiator === RequestInitiator.OtherSide &&
  799  			/^receiveRequest /.test(str)
  800  		) {
  801  			// incoming request
  802: 			this._telemetryService.publicLog2<
  803  				RPCTelemetryData,
  804  				RPCTelemetryDataClassification
  805  			>("extensionhost.incoming", {
  806  				type: `${str}`,
  807  				length: msgLength,

  818  		if (
  819  			initiator === RequestInitiator.LocalSide &&
  820  			str.startsWith("request: ")
  821  		) {
  822  			this._pendingRequests.set(req, str);
  823: 			this._telemetryService.publicLog2<
  824  				RPCTelemetryData,
  825  				RPCTelemetryDataClassification
  826  			>("extensionhost.outgoing", {
  827  				type: str,
  828  				length: msgLength,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\services\extensions\common\extensionHostProtocol.ts:

```sh
38 parentPid: number | 0
39 environment: IEnvironment
40 workspace?: IStaticWorkspaceData | null
41 extensions: IExtensionDescriptionSnapshot
42 nlsBaseUrl?: URI
43: telemetryInfo: {
44 readonly sessionId: string
45 readonly machineId: string
46 readonly sqmId: string
47 readonly devDeviceId: string
48 readonly firstSessionDate: string
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\services\extensions\common\remoteExtensionHost.ts:

```sh
   24  	IRemoteAuthorityResolverService,
   25  	IRemoteConnectionData,
   26  } from "vs/platform/remote/common/remoteAuthorityResolver";
   27  import { IRemoteSocketFactoryService } from "vs/platform/remote/common/remoteSocketFactoryService";
   28  import { ISignService } from "vs/platform/sign/common/sign";
   29: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   30: import { isLoggingOnly } from "vs/platform/telemetry/common/telemetryUtils";
   31  import {
   32  	IWorkspaceContextService,
   33  	WorkbenchState,
   34  } from "vs/platform/workspace/common/workspace";
   35  import { IWorkbenchEnvironmentService } from "vs/workbench/services/environment/common/environmentService";

   88  		@IWorkspaceContextService
   89  		private readonly _contextService: IWorkspaceContextService,
   90  		@IWorkbenchEnvironmentService
   91  		private readonly _environmentService: IWorkbenchEnvironmentService,
   92  		@ITelemetryService
   93: 		private readonly _telemetryService: ITelemetryService,
   94  		@ILogService private readonly _logService: ILogService,
   95  		@ILoggerService protected readonly _loggerService: ILoggerService,
   96  		@ILabelService private readonly _labelService: ILabelService,
   97  		@IRemoteAuthorityResolverService
   98  		private readonly remoteAuthorityResolverService: IRemoteAuthorityResolverService,

  327  				logNative: Boolean(
  328  					this._environmentService.debugExtensionHost.debugId,
  329  				),
  330  			},
  331  			extensions: this.extensions.toSnapshot(),
  332: 			telemetryInfo: {
  333: 				sessionId: this._telemetryService.sessionId,
  334: 				machineId: this._telemetryService.machineId,
  335: 				sqmId: this._telemetryService.sqmId,
  336: 				devDeviceId: this._telemetryService.devDeviceId,
  337: 				firstSessionDate: this._telemetryService.firstSessionDate,
  338: 				msftInternal: this._telemetryService.msftInternal,
  339  			},
  340  			logLevel: this._logService.getLevel(),
  341  			loggers: [...this._loggerService.getRegisteredLoggers()],
  342  			logsLocation: remoteInitData.extensionHostLogsPath,
  343  			autoStart: this.startup === ExtensionHostStartup.EagerAutoStart,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\services\extensions\electron-sandbox\localProcessExtensionHost.ts:

```sh
   30  	INotificationService,
   31  	NotificationPriority,
   32  	Severity,
   33  } from "vs/platform/notification/common/notification";
   34  import { IProductService } from "vs/platform/product/common/productService";
   35: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   36: import { isLoggingOnly } from "vs/platform/telemetry/common/telemetryUtils";
   37  import { IUserDataProfilesService } from "vs/platform/userDataProfile/common/userDataProfile";
   38  import {
   39  	isUntitledWorkspace,
   40  	IWorkspaceContextService,
   41  	WorkbenchState,

  160  		@INativeWorkbenchEnvironmentService
  161  		private readonly _environmentService: INativeWorkbenchEnvironmentService,
  162  		@IUserDataProfilesService
  163  		private readonly _userDataProfilesService: IUserDataProfilesService,
  164  		@ITelemetryService
  165: 		private readonly _telemetryService: ITelemetryService,
  166  		@ILogService private readonly _logService: ILogService,
  167  		@ILoggerService private readonly _loggerService: ILoggerService,
  168  		@ILabelService private readonly _labelService: ILabelService,
  169  		@IExtensionHostDebugService
  170  		private readonly _extensionHostDebugService: IExtensionHostDebugService,

  694  				logNative:
  695  					!this._isExtensionDevTestFromCli &&
  696  					this._isExtensionDevHost,
  697  			},
  698  			extensions: this.extensions.toSnapshot(),
  699: 			telemetryInfo: {
  700: 				sessionId: this._telemetryService.sessionId,
  701: 				machineId: this._telemetryService.machineId,
  702: 				sqmId: this._telemetryService.sqmId,
  703: 				devDeviceId: this._telemetryService.devDeviceId,
  704: 				firstSessionDate: this._telemetryService.firstSessionDate,
  705: 				msftInternal: this._telemetryService.msftInternal,
  706  			},
  707  			logLevel: this._logService.getLevel(),
  708  			loggers: [...this._loggerService.getRegisteredLoggers()],
  709  			logsLocation: this._environmentService.extHostLogsPath,
  710  			autoStart: this.startup === ExtensionHostStartup.EagerAutoStart,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\services\extensions\electron-sandbox\nativeExtensionService.ts:

```sh
   55  import {
   56  	getRemoteName,
   57  	parseAuthorityWithPort,
   58  } from "vs/platform/remote/common/remoteHosts";
   59  import { updateProxyConfigurationsScope } from "vs/platform/request/common/request";
   60: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   61  import { IWorkspaceContextService } from "vs/platform/workspace/common/workspace";
   62  import { IWorkspaceTrustManagementService } from "vs/platform/workspace/common/workspaceTrust";
   63  import { IWorkbenchEnvironmentService } from "vs/workbench/services/environment/common/environmentService";
   64  import {
   65  	EnablementState,

  139  	constructor(
  140  		@IInstantiationService instantiationService: IInstantiationService,
  141  		@INotificationService notificationService: INotificationService,
  142  		@IWorkbenchEnvironmentService
  143  		environmentService: IWorkbenchEnvironmentService,
  144: 		@ITelemetryService telemetryService: ITelemetryService,
  145  		@IWorkbenchExtensionEnablementService
  146  		extensionEnablementService: IWorkbenchExtensionEnablementService,
  147  		@IFileService fileService: IFileService,
  148  		@IProductService productService: IProductService,
  149  		@IWorkbenchExtensionManagementService

  197  				logService,
  198  			),
  199  			instantiationService,
  200  			notificationService,
  201  			environmentService,
  202: 			telemetryService,
  203  			extensionEnablementService,
  204  			fileService,
  205  			productService,
  206  			extensionManagementService,
  207  			contextService,

  393  		type ExtensionHostCrashEvent = {
  394  			code: number;
  395  			signal: string | null;
  396  			extensionIds: string[];
  397  		};
  398: 		this._telemetryService.publicLog2<
  399  			ExtensionHostCrashEvent,
  400  			ExtensionHostCrashClassification
  401  		>("extensionHostCrash", {
  402  			code,
  403  			signal,

  427  			type ExtensionHostCrashExtensionEvent = {
  428  				code: number;
  429  				signal: string | null;
  430  				extensionId: string;
  431  			};
  432: 			this._telemetryService.publicLog2<
  433  				ExtensionHostCrashExtensionEvent,
  434  				ExtensionHostCrashExtensionClassification
  435  			>("extensionHostCrashExtension", {
  436  				code,
  437  				signal,

  699  				"owner": "sandy081",
  700  				"userReaction" : { "classification": "SystemMetaData", "purpose": "FeatureInsight" },
  701  				"extensionId": { "classification": "PublicNonPersonalData", "purpose": "FeatureInsight" }
  702  			}
  703  			*/
  704: 			this._telemetryService.publicLog(
  705  				"remoteExtensionRecommendations:popup",
  706  				{ userReaction, extensionId: resolverExtensionId },
  707  			);
  708  		};
  709
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\services\keybinding\browser\keybindingService.ts:

```sh
   85  import { IKeyboardLayoutService } from "vs/platform/keyboardLayout/common/keyboardLayout";
   86  import { IKeyboardMapper } from "vs/platform/keyboardLayout/common/keyboardMapper";
   87  import { ILogService } from "vs/platform/log/common/log";
   88  import { INotificationService } from "vs/platform/notification/common/notification";
   89  import { Registry } from "vs/platform/registry/common/platform";
   90: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   91  import { IUriIdentityService } from "vs/platform/uriIdentity/common/uriIdentity";
   92  // workbench
   93  import { commandsExtensionPoint } from "vs/workbench/services/actions/common/menusExtensionPoint";
   94  import { IExtensionService } from "vs/workbench/services/extensions/common/extensions";
   95  import {

  305  	private readonly kbsJsonSchema: KeybindingsJsonSchema;
  306
  307  	constructor(
  308  		@IContextKeyService contextKeyService: IContextKeyService,
  309  		@ICommandService commandService: ICommandService,
  310: 		@ITelemetryService telemetryService: ITelemetryService,
  311  		@INotificationService notificationService: INotificationService,
  312  		@IUserDataProfileService
  313  		userDataProfileService: IUserDataProfileService,
  314  		@IHostService private readonly hostService: IHostService,
  315  		@IExtensionService extensionService: IExtensionService,

  320  		private readonly keyboardLayoutService: IKeyboardLayoutService,
  321  	) {
  322  		super(
  323  			contextKeyService,
  324  			commandService,
  325: 			telemetryService,
  326  			notificationService,
  327  			logService,
  328  		);
  329
  330  		this.isComposingGlobalContextKey = contextKeyService.createKey(
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\services\languageDetection\browser\languageDetectionWorkerServiceImpl.ts:

```sh
   30  import {
   31  	IStorageService,
   32  	StorageScope,
   33  	StorageTarget,
   34  } from "vs/platform/storage/common/storage";
   35: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   36  import { IWorkspaceContextService } from "vs/platform/workspace/common/workspace";
   37  import { IEditorService } from "vs/workbench/services/editor/common/editorService";
   38  import { IWorkbenchEnvironmentService } from "vs/workbench/services/environment/common/environmentService";
   39  import {
   40  	ILanguageDetectionWorker,

   94  		private readonly _diagnosticsService: IDiagnosticsService,
   95  		@IWorkspaceContextService
   96  		private readonly _workspaceContextService: IWorkspaceContextService,
   97  		@IModelService modelService: IModelService,
   98  		@IEditorService private readonly _editorService: IEditorService,
   99: 		@ITelemetryService telemetryService: ITelemetryService,
  100  		@IStorageService storageService: IStorageService,
  101  		@ILogService private readonly _logService: ILogService,
  102  	) {
  103  		super();
  104
  105  		const useAsar = canASAR && this._environmentService.isBuilt && !isWeb;
  106  		this._languageDetectionWorkerClient = this._register(
  107  			new LanguageDetectionWorkerClient(
  108  				modelService,
  109  				languageService,
  110: 				telemetryService,
  111  				// TODO@esm: See if it's possible to bundle vscode-languagedetection
  112  				useAsar
  113  					? FileAccess.asBrowserUri(
  114  							`${moduleLocationAsar}/dist/lib/index.js`,
  115  						).toString(true)

  335  		| undefined;
  336
  337  	constructor(
  338  		private readonly _modelService: IModelService,
  339  		private readonly _languageService: ILanguageService,
  340: 		private readonly _telemetryService: ITelemetryService,
  341  		private readonly _indexJsUri: string,
  342  		private readonly _modelJsonUri: string,
  343  		private readonly _weightsUri: string,
  344  		private readonly _regexpModelUri: string,
  345  	) {

  423  	async sendTelemetryEvent(
  424  		languages: string[],
  425  		confidences: number[],
  426  		timeSpent: number,
  427  	): Promise<void> {
  428: 		this._telemetryService.publicLog2<
  429  			ILanguageDetectionStats,
  430  			LanguageDetectionStatsClassification
  431  		>(LanguageDetectionStatsId, {
  432  			languages: languages.join(","),
  433  			confidences: confidences.join(","),

  478  				purpose: "FeatureInsight";
  479  				comment: "The language that was detected";
  480  			};
  481  		};
  482
  483: 		this._telemetryService.publicLog2<
  484  			ILanguageDetectionPerf,
  485  			LanguageDetectionPerfClassification
  486  		>(LanguageDetectionStatsId, {
  487  			timeSpent: Date.now() - startTime,
  488  			detection: languageId || "unknown",
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\services\remote\common\abstractRemoteAgentService.ts:

```sh
   32  import { IRemoteSocketFactoryService } from "vs/platform/remote/common/remoteSocketFactoryService";
   33  import { ISignService } from "vs/platform/sign/common/sign";
   34  import {
   35  	ITelemetryData,
   36  	TelemetryLevel,
   37: } from "vs/platform/telemetry/common/telemetry";
   38  import { IWorkbenchEnvironmentService } from "vs/workbench/services/environment/common/environmentService";
   39  import { RemoteExtensionEnvironmentChannelClient } from "vs/workbench/services/remote/common/remoteAgentEnvironmentChannel";
   40  import {
   41  	IExtensionHostExitInfo,
   42  	IRemoteAgentConnection,

  142  				),
  143  			undefined,
  144  		);
  145  	}
  146
  147: 	updateTelemetryLevel(telemetryLevel: TelemetryLevel): Promise<void> {
  148  		return this._withTelemetryChannel(
  149  			(channel) =>
  150  				RemoteExtensionEnvironmentChannelClient.updateTelemetryLevel(
  151  					channel,
  152: 					telemetryLevel,
  153  				),
  154  			undefined,
  155  		);
  156  	}
  157

  216  	): Promise<R> {
  217  		const connection = this.getConnection();
  218  		if (!connection) {
  219  			return Promise.resolve(fallback);
  220  		}
  221: 		return connection.withChannel("telemetry", (channel) =>
  222  			callback(channel, connection),
  223  		);
  224  	}
  225  }
  226
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\services\remote\common\remoteAgentEnvironmentChannel.ts:

```sh
   14  } from "vs/platform/diagnostics/common/diagnostics";
   15  import { IRemoteAgentEnvironment } from "vs/platform/remote/common/remoteAgentEnvironment";
   16  import {
   17  	ITelemetryData,
   18  	TelemetryLevel,
   19: } from "vs/platform/telemetry/common/telemetry";
   20  import { IUserDataProfile } from "vs/platform/userDataProfile/common/userDataProfile";
   21  import { IExtensionHostExitInfo } from "vs/workbench/services/remote/common/remoteAgentService";
   22
   23  export interface IGetEnvironmentDataArguments {
   24  	remoteAuthority: string;

  110  		return channel.call<IDiagnosticInfo>("getDiagnosticInfo", options);
  111  	}
  112
  113  	static updateTelemetryLevel(
  114  		channel: IChannel,
  115: 		telemetryLevel: TelemetryLevel,
  116  	): Promise<void> {
  117: 		return channel.call<void>("updateTelemetryLevel", { telemetryLevel });
  118  	}
  119
  120  	static logTelemetry(
  121  		channel: IChannel,
  122  		eventName: string,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\services\remote\common\remoteAgentService.ts:

```sh
  17  	RemoteAgentConnectionContext,
  18  } from "vs/platform/remote/common/remoteAgentEnvironment";
  19  import {
  20  	ITelemetryData,
  21  	TelemetryLevel,
  22: } from "vs/platform/telemetry/common/telemetry";
  23
  24  export const IRemoteAgentService =
  25  	createDecorator<IRemoteAgentService>("remoteAgentService");
  26
  27  export interface IRemoteAgentService {

  55  	endConnection(): Promise<void>;
  56
  57  	getDiagnosticInfo(
  58  		options: IDiagnosticInfoOptions,
  59  	): Promise<IDiagnosticInfo | undefined>;
  60: 	updateTelemetryLevel(telemetryLevel: TelemetryLevel): Promise<void>;
  61  	logTelemetry(eventName: string, data?: ITelemetryData): Promise<void>;
  62  	flushTelemetry(): Promise<void>;
  63  }
  64
  65  export interface IExtensionHostExitInfo {
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\services\remote\electron-sandbox\remoteAgentService.ts:

```sh
  19  	RemoteAuthorityResolverError,
  20  	RemoteConnectionType,
  21  } from "vs/platform/remote/common/remoteAuthorityResolver";
  22  import { IRemoteSocketFactoryService } from "vs/platform/remote/common/remoteSocketFactoryService";
  23  import { ISignService } from "vs/platform/sign/common/sign";
  24: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
  25  import {
  26  	IWorkbenchContribution,
  27  	registerWorkbenchContribution2,
  28  	WorkbenchPhase,
  29  } from "vs/workbench/common/contributions";

  71  		@IRemoteAgentService
  72  		private readonly _remoteAgentService: IRemoteAgentService,
  73  		@INotificationService notificationService: INotificationService,
  74  		@IWorkbenchEnvironmentService
  75  		environmentService: IWorkbenchEnvironmentService,
  76: 		@ITelemetryService telemetryService: ITelemetryService,
  77  		@INativeHostService nativeHostService: INativeHostService,
  78  		@IRemoteAuthorityResolverService
  79  		private readonly _remoteAuthorityResolverService: IRemoteAuthorityResolverService,
  80  		@IOpenerService openerService: IOpenerService,
  81  	) {
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\services\search\browser\searchService.ts:

```sh
  24  	InstantiationType,
  25  	registerSingleton,
  26  } from "vs/platform/instantiation/common/extensions";
  27  import { IInstantiationService } from "vs/platform/instantiation/common/instantiation";
  28  import { ILogService } from "vs/platform/log/common/log";
  29: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
  30  import { IUriIdentityService } from "vs/platform/uriIdentity/common/uriIdentity";
  31  import { IEditorService } from "vs/workbench/services/editor/common/editorService";
  32  import { IExtensionService } from "vs/workbench/services/extensions/common/extensions";
  33  import {
  34  	ILocalFileSearchSimpleWorker,

  49
  50  export class RemoteSearchService extends SearchService {
  51  	constructor(
  52  		@IModelService modelService: IModelService,
  53  		@IEditorService editorService: IEditorService,
  54: 		@ITelemetryService telemetryService: ITelemetryService,
  55  		@ILogService logService: ILogService,
  56  		@IExtensionService extensionService: IExtensionService,
  57  		@IFileService fileService: IFileService,
  58  		@IInstantiationService
  59  		private readonly instantiationService: IInstantiationService,
  60  		@IUriIdentityService uriIdentityService: IUriIdentityService,
  61  	) {
  62  		super(
  63  			modelService,
  64  			editorService,
  65: 			telemetryService,
  66  			logService,
  67  			extensionService,
  68  			fileService,
  69  			uriIdentityService,
  70  		);
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\services\search\common\search.ts:

```sh
16 import * as paths from "vs/base/common/path"
17 import { fuzzyContains, getNLines } from "vs/base/common/strings"
18 import { URI, UriComponents } from "vs/base/common/uri"
19 import { IFilesConfiguration } from "vs/platform/files/common/files"
20 import { createDecorator } from "vs/platform/instantiation/common/instantiation"
21: import { ITelemetryData } from "vs/platform/telemetry/common/telemetry"
22 import {
23 GlobPattern,
24 TextSearchCompleteMessageType,
25 } from "vs/workbench/services/search/common/searchExtTypes"
26

115 disregardParentIgnoreFiles?: boolean
116 ignoreSymlinks?: boolean
117 }
118
119 export interface ICommonQueryProps extends UriComponents < U > {
120: /** For telemetry - indicates what is triggering the source */
121 _reason?: string
122
123 folderQueries: IFolderQuery < U > []
124 // The include pattern for files that gets passed into ripgrep.
125 // Note that this will override any ignore files if applicable.
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\services\search\common\searchService.ts:

```sh
   18  import { isNumber } from "vs/base/common/types";
   19  import { URI, URI as uri } from "vs/base/common/uri";
   20  import { IModelService } from "vs/editor/common/services/model";
   21  import { IFileService } from "vs/platform/files/common/files";
   22  import { ILogService } from "vs/platform/log/common/log";
   23: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   24  import { IUriIdentityService } from "vs/platform/uriIdentity/common/uriIdentity";
   25  import {
   26  	EditorResourceAccessor,
   27  	SideBySideEditor,
   28  } from "vs/workbench/common/editor";

   92  	private loggedSchemesMissingProviders = new Set<string>();
   93
   94  	constructor(
   95  		@IModelService private readonly modelService: IModelService,
   96  		@IEditorService private readonly editorService: IEditorService,
   97: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
   98  		@ILogService private readonly logService: ILogService,
   99  		@IExtensionService private readonly extensionService: IExtensionService,
  100  		@IFileService private readonly fileService: IFileService,
  101  		@IUriIdentityService
  102  		private readonly uriIdentityService: IUriIdentityService,

  596  					cacheLookupTime: number;
  597  					cacheFilterTime: number;
  598  					cacheEntryCount: number;
  599  					scheme: string;
  600  				};
  601: 				this.telemetryService.publicLog2<
  602  					CachedSearchCompleteEvent,
  603  					CachedSearchCompleteClassifcation
  604  				>("cachedSearchComplete", {
  605  					reason: query._reason,
  606  					resultCount: fileSearchStats.resultCount,

  688  					cmdTime: number;
  689  					cmdResultCount?: number;
  690  					scheme: string;
  691  				};
  692
  693: 				this.telemetryService.publicLog2<
  694  					SearchCompleteEvent,
  695  					SearchCompleteClassification
  696  				>("searchComplete", {
  697  					reason: query._reason,
  698  					resultCount: fileSearchStats.resultCount,

  760  				workspaceFolderCount: number;
  761  				endToEndTime: number;
  762  				scheme: string;
  763  				error?: string;
  764  			};
  765: 			this.telemetryService.publicLog2<
  766  				TextSearchCompleteEvent,
  767  				TextSearchCompleteClassification
  768  			>("textSearchComplete", {
  769  				reason: query._reason,
  770  				workspaceFolderCount: query.folderQueries.length,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\services\telemetry\browser\telemetryService.ts:

```sh
   10  	registerSingleton,
   11  } from "vs/platform/instantiation/common/extensions";
   12  import { ILoggerService, ILogService } from "vs/platform/log/common/log";
   13  import { IProductService } from "vs/platform/product/common/productService";
   14  import { IStorageService } from "vs/platform/storage/common/storage";
   15: import { OneDataSystemWebAppender } from "vs/platform/telemetry/browser/1dsAppender";
   16  import {
   17  	ClassifiedEvent,
   18  	IGDPRProperty,
   19  	OmitMetadata,
   20  	StrictPropertyCheck,
   21: } from "vs/platform/telemetry/common/gdprTypings";
   22  import {
   23  	ITelemetryData,
   24  	ITelemetryService,
   25  	TELEMETRY_SETTING_ID,
   26  	TelemetryLevel,
   27: } from "vs/platform/telemetry/common/telemetry";
   28: import { TelemetryLogAppender } from "vs/platform/telemetry/common/telemetryLogAppender";
   29  import {
   30  	TelemetryService as BaseTelemetryService,
   31  	ITelemetryServiceConfig,
   32: } from "vs/platform/telemetry/common/telemetryService";
   33  import {
   34  	getTelemetryLevel,
   35  	isInternalTelemetry,
   36  	isLoggingOnly,
   37  	ITelemetryAppender,
   38  	NullTelemetryService,
   39  	supportsTelemetry,
   40: } from "vs/platform/telemetry/common/telemetryUtils";
   41  import { IBrowserWorkbenchEnvironmentService } from "vs/workbench/services/environment/browser/environmentService";
   42  import { IRemoteAgentService } from "vs/workbench/services/remote/common/remoteAgentService";
   43: import { resolveWorkbenchCommonProperties } from "vs/workbench/services/telemetry/browser/workbenchCommonProperties";
   44
   45  export class TelemetryService extends Disposable implements ITelemetryService {
   46  	declare readonly _serviceBrand: undefined;
   47
   48  	private impl: ITelemetryService = NullTelemetryService;

   87  			storageService,
   88  			productService,
   89  			remoteAgentService,
   90  		);
   91
   92: 		// When the level changes it could change from off to on and we want to make sure telemetry is properly intialized
   93  		this._register(
   94  			configurationService.onDidChangeConfiguration((e) => {
   95  				if (e.affectsConfiguration(TELEMETRY_SETTING_ID)) {
   96  					this.impl = this.initializeService(
   97  						environmentService,

  106  			}),
  107  		);
  108  	}
  109
  110  	/**
  111: 	 * Initializes the telemetry service to be a full fledged service.
  112: 	 * This is only done once and only when telemetry is enabled as this will also ping the endpoint to
  113: 	 * ensure its not adblocked and we can send telemetry
  114  	 */
  115  	private initializeService(
  116  		environmentService: IBrowserWorkbenchEnvironmentService,
  117  		logService: ILogService,
  118  		loggerService: ILoggerService,
  119  		configurationService: IConfigurationService,
  120  		storageService: IStorageService,
  121  		productService: IProductService,
  122  		remoteAgentService: IRemoteAgentService,
  123  	) {
  124: 		const telemetrySupported =
  125  			supportsTelemetry(productService, environmentService) &&
  126  			productService.aiConfig?.ariaKey;
  127  		if (
  128: 			telemetrySupported &&
  129  			getTelemetryLevel(configurationService) !== TelemetryLevel.NONE &&
  130  			this.impl === NullTelemetryService
  131  		) {
  132: 			// If remote server is present send telemetry through that, else use the client side appender
  133  			const appenders: ITelemetryAppender[] = [];
  134  			const isInternal = isInternalTelemetry(
  135  				productService,
  136  				configurationService,
  137  			);

  195
  196  	setExperimentProperty(name: string, value: string): void {
  197  		return this.impl.setExperimentProperty(name, value);
  198  	}
  199
  200: 	get telemetryLevel(): TelemetryLevel {
  201: 		return this.impl.telemetryLevel;
  202  	}
  203
  204  	publicLog(eventName: string, data?: ITelemetryData) {
  205  		this.impl.publicLog(eventName, data);
  206  	}
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\services\telemetry\browser\workbenchCommonProperties.ts:

```sh
15 import {
16 firstSessionDateStorageKey,
17 ICommonProperties,
18 lastSessionDateStorageKey,
19 machineIdKey,
20: } from "vs/platform/telemetry/common/telemetry"
21: import { cleanRemoteAuthority } from "vs/platform/telemetry/common/telemetryUtils"
22
23 /**
24 * General function to help reduce the individuality of user agents
25 * @param userAgent userAgent from browser window
26 * @returns A simplified user agent with less detail
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\services\telemetry\common\workbenchCommonProperties.ts:

```sh
   6  import { INodeProcess } from "vs/base/common/platform";
   7  import {
   8  	IStorageService,
   9  	StorageScope,
  10  } from "vs/platform/storage/common/storage";
  11: import { resolveCommonProperties } from "vs/platform/telemetry/common/commonProperties";
  12  import {
  13  	firstSessionDateStorageKey,
  14  	ICommonProperties,
  15  	lastSessionDateStorageKey,
  16: } from "vs/platform/telemetry/common/telemetry";
  17: import { cleanRemoteAuthority } from "vs/platform/telemetry/common/telemetryUtils";
  18
  19  export function resolveWorkbenchCommonProperties(
  20  	storageService: IStorageService,
  21  	release: string,
  22  	hostname: string,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\services\telemetry\electron-sandbox\telemetryService.ts:

```sh
   16  import {
   17  	ClassifiedEvent,
   18  	IGDPRProperty,
   19  	OmitMetadata,
   20  	StrictPropertyCheck,
   21: } from "vs/platform/telemetry/common/gdprTypings";
   22  import {
   23  	ITelemetryData,
   24  	ITelemetryService,
   25  	TelemetryLevel,
   26: } from "vs/platform/telemetry/common/telemetry";
   27: import { TelemetryAppenderClient } from "vs/platform/telemetry/common/telemetryIpc";
   28  import {
   29  	TelemetryService as BaseTelemetryService,
   30  	ITelemetryServiceConfig,
   31: } from "vs/platform/telemetry/common/telemetryService";
   32  import {
   33  	getPiiPathsFromEnvironment,
   34  	isInternalTelemetry,
   35  	NullTelemetryService,
   36  	supportsTelemetry,
   37: } from "vs/platform/telemetry/common/telemetryUtils";
   38  import { INativeWorkbenchEnvironmentService } from "vs/workbench/services/environment/electron-sandbox/environmentService";
   39: import { resolveWorkbenchCommonProperties } from "vs/workbench/services/telemetry/common/workbenchCommonProperties";
   40
   41  export class TelemetryService extends Disposable implements ITelemetryService {
   42  	declare readonly _serviceBrand: undefined;
   43
   44  	private impl: ITelemetryService;

   77  			const isInternal = isInternalTelemetry(
   78  				productService,
   79  				configurationService,
   80  			);
   81  			const channel =
   82: 				sharedProcessService.getChannel("telemetryAppender");
   83  			const config: ITelemetryServiceConfig = {
   84  				appenders: [new TelemetryAppenderClient(channel)],
   85  				commonProperties: resolveWorkbenchCommonProperties(
   86  					storageService,
   87  					environmentService.os.release,

  115
  116  	setExperimentProperty(name: string, value: string): void {
  117  		return this.impl.setExperimentProperty(name, value);
  118  	}
  119
  120: 	get telemetryLevel(): TelemetryLevel {
  121: 		return this.impl.telemetryLevel;
  122  	}
  123
  124  	publicLog(eventName: string, data?: ITelemetryData) {
  125  		this.impl.publicLog(eventName, data);
  126  	}
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\services\textMate\browser\textMateTokenizationFeatureImpl.ts:

````sh
   40  import { INotificationService } from "vs/platform/notification/common/notification";
   41  import {
   42  	IProgressService,
   43  	ProgressLocation,
   44  } from "vs/platform/progress/common/progress";
   45: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   46  import { IWorkbenchEnvironmentService } from "vs/workbench/services/environment/common/environmentService";
   47  import {
   48  	ExtensionMessageCollector,
   49  	IExtensionPointUser,
   50  } from "vs/workbench/services/extensions/common/extensionsRegistry";

  127  		@IWorkbenchEnvironmentService
  128  		private readonly _environmentService: IWorkbenchEnvironmentService,
  129  		@IInstantiationService
  130  		private readonly _instantiationService: IInstantiationService,
  131  		@ITelemetryService
  132: 		private readonly _telemetryService: ITelemetryService,
  133  	) {
  134  		super();
  135
  136  		this._styleElement = dom.createStyleSheet();
  137  		this._styleElement.className = "vscode-tokens-styles";

  624
  625  		// 50 events per hour (one event has a low probability)
  626  		if (
  627  			TextMateTokenizationFeature.reportTokenizationTimeCounter[key] > 50
  628  		) {
  629: 			// Don't flood telemetry with too many events
  630  			return;
  631  		}
  632  		if (
  633  			TextMateTokenizationFeature.reportTokenizationTimeCounter[key] === 0
  634  		) {

  641  				1000 * 60 * 60,
  642  			);
  643  		}
  644  		TextMateTokenizationFeature.reportTokenizationTimeCounter[key]++;
  645
  646: 		this._telemetryService.publicLog2<
  647  			{
  648  				timeMs: number;
  649  				languageId: string;
  650  				lineLength: number;
  651  				fromWorker: boolean;

# File: ```Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\services\textMate\browser\backgroundTokenization\threadedBackgroundTokenizerFactory.ts:

```sh
   28  import { ITextModel } from "vs/editor/common/model";
   29  import { IConfigurationService } from "vs/platform/configuration/common/configuration";
   30  import { IEnvironmentService } from "vs/platform/environment/common/environment";
   31  import { IExtensionResourceLoaderService } from "vs/platform/extensionResourceLoader/common/extensionResourceLoader";
   32  import { INotificationService } from "vs/platform/notification/common/notification";
   33: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   34  import { TextMateWorkerTokenizerController } from "vs/workbench/services/textMate/browser/backgroundTokenization/textMateWorkerTokenizerController";
   35  import {
   36  	ICreateData,
   37  	StateDeltas,
   38  	TextMateTokenizationWorker,

   75  		@IEnvironmentService
   76  		private readonly _environmentService: IEnvironmentService,
   77  		@INotificationService
   78  		private readonly _notificationService: INotificationService,
   79  		@ITelemetryService
   80: 		private readonly _telemetryService: ITelemetryService,
   81  	) {}
   82
   83  	public dispose(): void {
   84  		this._disposeWorker();
   85  	}

  170  						"Async Tokenization Token Mismatch in line " +
  171  						lineNumber,
  172  					name: "Async Tokenization Token Mismatch",
  173  				});
  174
  175: 				this._telemetryService.publicLog2<
  176  					{},
  177  					{
  178  						owner: "hediet";
  179  						comment: "Used to see if async tokenization is bug-free";
  180  					}
````

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\services\themes\browser\workbenchThemeService.ts:

```sh
   27  } from "vs/platform/instantiation/common/extensions";
   28  import { ILogService } from "vs/platform/log/common/log";
   29  import { Registry } from "vs/platform/registry/common/platform";
   30  import { getRemoteAuthority } from "vs/platform/remote/common/remoteHosts";
   31  import { IStorageService } from "vs/platform/storage/common/storage";
   32: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   33  import { getIconsStyleSheet } from "vs/platform/theme/browser/iconsStyleSheet";
   34  import {
   35  	asCssVariableName,
   36  	getColorRegistry,
   37  } from "vs/platform/theme/common/colorRegistry";

  155  	constructor(
  156  		@IExtensionService extensionService: IExtensionService,
  157  		@IStorageService private readonly storageService: IStorageService,
  158  		@IConfigurationService
  159  		private readonly configurationService: IConfigurationService,
  160: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
  161  		@IBrowserWorkbenchEnvironmentService
  162  		private readonly environmentService: IBrowserWorkbenchEnvironmentService,
  163  		@IFileService fileService: IFileService,
  164  		@IExtensionResourceLoaderService
  165  		private readonly extensionResourceLoaderService: IExtensionResourceLoaderService,

  945  					name: string;
  946  					isBuiltin: boolean;
  947  					publisherDisplayName: string;
  948  					themeId: string;
  949  				};
  950: 				this.telemetryService.publicLog2<
  951  					ActivatePluginEvent,
  952  					ActivatePluginClassification
  953  				>("activatePlugin", {
  954  					id: themeData.extensionId,
  955  					name: themeData.extensionName,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\services\timer\browser\timerService.ts:

```sh
    8  import * as perf from "vs/base/common/performance";
    9  import { isWeb } from "vs/base/common/platform";
   10  import { IAccessibilityService } from "vs/platform/accessibility/common/accessibility";
   11  import { createDecorator } from "vs/platform/instantiation/common/instantiation";
   12  import { Registry } from "vs/platform/registry/common/platform";
   13: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   14: import { TelemetryTrustedValue } from "vs/platform/telemetry/common/telemetryUtils";
   15  import {
   16  	ITerminalBackendRegistry,
   17  	TerminalExtensions,
   18  } from "vs/platform/terminal/common/terminal";
   19  import { IUpdateService } from "vs/platform/update/common/update";

  531  		private readonly _paneCompositeService: IPaneCompositePartService,
  532  		@IEditorService private readonly _editorService: IEditorService,
  533  		@IAccessibilityService
  534  		private readonly _accessibilityService: IAccessibilityService,
  535  		@ITelemetryService
  536: 		private readonly _telemetryService: ITelemetryService,
  537  		@IWorkbenchLayoutService layoutService: IWorkbenchLayoutService,
  538  	) {
  539  		Promise.all([
  540  			this._extensionService.whenInstalledExtensionsRegistered(), // extensions registered
  541  			_lifecycleService.when(LifecyclePhase.Restored), // workbench created and parts restored

  642  	getStartTime(mark: string): number {
  643  		return this._marks.getStartTime(mark);
  644  	}
  645
  646  	private _reportStartupTimes(metrics: IStartupMetrics): void {
  647: 		// report IStartupMetrics as telemetry
  648  		/* __GDPR__
  649  			"startupTimeVaried" : {
  650  				"owner": "jrieken",
  651  				"${include}": [
  652  					"${IStartupMetrics}"
  653  				]
  654  			}
  655  		*/
  656: 		this._telemetryService.publicLog("startupTimeVaried", metrics);
  657  	}
  658
  659  	protected _shouldReportPerfMarks(): boolean {
  660  		return this._rndValueShouldSendTelemetry;
  661  	}

  668  			// the `startup.timer.mark` event is send very often. In order to save resources
  669  			// we let some of our instances/sessions send this event
  670  			return;
  671  		}
  672
  673: 		// report raw timers as telemetry. each mark is send a separate telemetry
  674  		// event and it is "normalized" to a relative timestamp where the first mark
  675  		// defines the start
  676
  677  		type Mark = {
  678  			source: string;

  698  				comment: "The absolute timestamp (unix time)";
  699  			};
  700  		};
  701
  702  		for (const mark of marks) {
  703: 			this._telemetryService.publicLog2<Mark, MarkClassification>(
  704  				"startup.timer.mark",
  705  				{
  706  					source,
  707  					name: new TelemetryTrustedValue(mark.name),
  708  					startTime: mark.startTime,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\services\timer\electron-sandbox\timerService.ts:

```sh
  14  import {
  15  	IStorageService,
  16  	StorageScope,
  17  	StorageTarget,
  18  } from "vs/platform/storage/common/storage";
  19: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
  20  import { IUpdateService } from "vs/platform/update/common/update";
  21  import { IWorkspaceContextService } from "vs/platform/workspace/common/workspace";
  22  import { IEditorService } from "vs/workbench/services/editor/common/editorService";
  23  import { INativeWorkbenchEnvironmentService } from "vs/workbench/services/environment/electron-sandbox/environmentService";
  24  import { IExtensionService } from "vs/workbench/services/extensions/common/extensions";

  44  		@IUpdateService updateService: IUpdateService,
  45  		@IPaneCompositePartService
  46  		paneCompositeService: IPaneCompositePartService,
  47  		@IEditorService editorService: IEditorService,
  48  		@IAccessibilityService accessibilityService: IAccessibilityService,
  49: 		@ITelemetryService telemetryService: ITelemetryService,
  50  		@IWorkbenchLayoutService layoutService: IWorkbenchLayoutService,
  51  		@IProductService private readonly _productService: IProductService,
  52  		@IStorageService private readonly _storageService: IStorageService,
  53  	) {
  54  		super(

  57  			extensionService,
  58  			updateService,
  59  			paneCompositeService,
  60  			editorService,
  61  			accessibilityService,
  62: 			telemetryService,
  63  			layoutService,
  64  		);
  65  		this.setPerformanceMarks("main", _environmentService.window.perfMarks);
  66  	}
  67
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\services\userDataProfile\browser\userDataProfileManagement.ts:

```sh
   14  	registerSingleton,
   15  } from "vs/platform/instantiation/common/extensions";
   16  import { ILogService } from "vs/platform/log/common/log";
   17  import { IProductService } from "vs/platform/product/common/productService";
   18  import { asJson, IRequestService } from "vs/platform/request/common/request";
   19: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   20  import {
   21  	DidChangeProfilesEvent,
   22  	IUserDataProfile,
   23  	IUserDataProfileOptions,
   24  	IUserDataProfilesService,

   68  		@IWorkspaceContextService
   69  		private readonly workspaceContextService: IWorkspaceContextService,
   70  		@IExtensionService private readonly extensionService: IExtensionService,
   71  		@IWorkbenchEnvironmentService
   72  		private readonly environmentService: IWorkbenchEnvironmentService,
   73: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
   74  		@IProductService private readonly productService: IProductService,
   75  		@IRequestService private readonly requestService: IRequestService,
   76  		@ILogService private readonly logService: ILogService,
   77  	) {
   78  		super();

  165  			name,
  166  			options,
  167  			toWorkspaceIdentifier(this.workspaceContextService.getWorkspace()),
  168  		);
  169  		await this.changeCurrentProfile(profile);
  170: 		this.telemetryService.publicLog2<
  171  			ProfileManagementActionExecutedEvent,
  172  			ProfileManagementActionExecutedClassification
  173  		>("profileManagementActionExecuted", { id: "createAndEnterProfile" });
  174  		return profile;
  175  	}

  180  				toWorkspaceIdentifier(
  181  					this.workspaceContextService.getWorkspace(),
  182  				),
  183  			);
  184  		await this.changeCurrentProfile(profile);
  185: 		this.telemetryService.publicLog2<
  186  			ProfileManagementActionExecutedEvent,
  187  			ProfileManagementActionExecutedClassification
  188  		>("profileManagementActionExecuted", {
  189  			id: "createAndEnterTransientProfile",
  190  		});

  212  		}
  213  		const updatedProfile = await this.userDataProfilesService.updateProfile(
  214  			profile,
  215  			updateOptions,
  216  		);
  217: 		this.telemetryService.publicLog2<
  218  			ProfileManagementActionExecutedEvent,
  219  			ProfileManagementActionExecutedClassification
  220  		>("profileManagementActionExecuted", { id: "updateProfile" });
  221  		return updatedProfile;
  222  	}

  236  					"Cannot delete the default profile",
  237  				),
  238  			);
  239  		}
  240  		await this.userDataProfilesService.removeProfile(profile);
  241: 		this.telemetryService.publicLog2<
  242  			ProfileManagementActionExecutedEvent,
  243  			ProfileManagementActionExecutedClassification
  244  		>("profileManagementActionExecuted", { id: "removeProfile" });
  245  	}
  246

  261  		await this.userDataProfilesService.setProfileForWorkspace(
  262  			workspaceIdentifier,
  263  			profile,
  264  		);
  265  		await this.changeCurrentProfile(profile);
  266: 		this.telemetryService.publicLog2<
  267  			ProfileManagementActionExecutedEvent,
  268  			ProfileManagementActionExecutedClassification
  269  		>("profileManagementActionExecuted", { id: "switchProfile" });
  270  	}
  271
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\services\userDataSync\browser\userDataSyncWorkbenchService.ts:

```sh
    47  import {
    48  	IStorageService,
    49  	StorageScope,
    50  	StorageTarget,
    51  } from "vs/platform/storage/common/storage";
    52: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
    53  import { IUriIdentityService } from "vs/platform/uriIdentity/common/uriIdentity";
    54  import { UserDataSyncStoreTypeSynchronizer } from "vs/platform/userDataSync/common/globalStateSync";
    55  import {
    56  	IAuthenticationProvider,
    57  	IResourcePreview,

   203  		@IStorageService private readonly storageService: IStorageService,
   204  		@IUserDataSyncEnablementService
   205  		private readonly userDataSyncEnablementService: IUserDataSyncEnablementService,
   206  		@IUserDataAutoSyncService
   207  		private readonly userDataAutoSyncService: IUserDataAutoSyncService,
   208: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
   209  		@ILogService private readonly logService: ILogService,
   210  		@IProductService private readonly productService: IProductService,
   211  		@IExtensionService private readonly extensionService: IExtensionService,
   212  		@IBrowserWorkbenchEnvironmentService
   213  		private readonly environmentService: IBrowserWorkbenchEnvironmentService,

  1225  		this.currentSessionId = sessionId;
  1226  		await this.update();
  1227  	}
  1228
  1229  	private async onDidAuthFailure(): Promise<void> {
  1230: 		this.telemetryService.publicLog2<
  1231  			{},
  1232  			{
  1233  				owner: "sandy081";
  1234  				comment: "Report when there are successive auth failures during settings sync";
  1235  			}
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\services\views\browser\viewDescriptorService.ts:

```sh
   40  import {
   41  	IStorageService,
   42  	StorageScope,
   43  	StorageTarget,
   44  } from "vs/platform/storage/common/storage";
   45: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
   46  import {
   47  	ViewPaneContainer,
   48  	ViewPaneContainerAction,
   49  	ViewsSubMenu,
   50  } from "vs/workbench/browser/parts/views/viewPaneContainer";

  194  		private readonly instantiationService: IInstantiationService,
  195  		@IContextKeyService
  196  		private readonly contextKeyService: IContextKeyService,
  197  		@IStorageService private readonly storageService: IStorageService,
  198  		@IExtensionService private readonly extensionService: IExtensionService,
  199: 		@ITelemetryService private readonly telemetryService: ITelemetryService,
  200  		@ILoggerService loggerService: ILoggerService,
  201  	) {
  202  		super();
  203
  204  		this.logger = new Lazy(() =>

  663  			this.cleanUpGeneratedViewContainer(from.id);
  664
  665  			// Save new locations
  666  			this.saveViewCustomizations();
  667
  668: 			// Log to telemetry
  669  			this.reportMovedViews(views, from, to);
  670  		}
  671  	}
  672
  673  	reset(): void {

  808  				purpose: "FeatureInsight";
  809  				comment: "The location of the destination view container. e.g. Panel";
  810  			};
  811  		};
  812
  813: 		this.telemetryService.publicLog2<
  814  			ViewDescriptorServiceMoveViewsEvent,
  815  			ViewDescriptorServiceMoveViewsClassification
  816  		>("viewDescriptorService.moveViews", {
  817  			viewCount,
  818  			fromContainer,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vs\workbench\services\views\browser\viewsService.ts:

```sh
    42  } from "vs/platform/instantiation/common/instantiation";
    43  import { KeybindingWeight } from "vs/platform/keybinding/common/keybindingsRegistry";
    44  import { IProgressIndicator } from "vs/platform/progress/common/progress";
    45  import { Registry } from "vs/platform/registry/common/platform";
    46  import { IStorageService } from "vs/platform/storage/common/storage";
    47: import { ITelemetryService } from "vs/platform/telemetry/common/telemetry";
    48  import { IThemeService } from "vs/platform/theme/common/themeService";
    49  import { IWorkspaceContextService } from "vs/platform/workspace/common/workspace";
    50  import {
    51  	PaneComposite,
    52  	PaneCompositeDescriptor,

  1125  		viewContainerLocation: ViewContainerLocation,
  1126  	): void {
  1127  		const that = this;
  1128  		class PaneContainer extends PaneComposite {
  1129  			constructor(
  1130: 				@ITelemetryService telemetryService: ITelemetryService,
  1131  				@IWorkspaceContextService
  1132  				contextService: IWorkspaceContextService,
  1133  				@IStorageService storageService: IStorageService,
  1134  				@IInstantiationService
  1135  				instantiationService: IInstantiationService,

  1137  				@IContextMenuService contextMenuService: IContextMenuService,
  1138  				@IExtensionService extensionService: IExtensionService,
  1139  			) {
  1140  				super(
  1141  					viewContainer.id,
  1142: 					telemetryService,
  1143  					storageService,
  1144  					instantiationService,
  1145  					themeService,
  1146  					contextMenuService,
  1147  					extensionService,
```

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vscode-dts\vscode.d.ts:

````sh
  10778  		 * `true` if within the first day of installation otherwise `false`.
  10779  		 */
  10780  		export const isNewAppInstall: boolean;
  10781
  10782  		/**
  10783: 		 * Indicates whether the users has telemetry enabled.
  10784: 		 * Can be observed to determine if the extension should send telemetry.
  10785  		 */
  10786  		export const isTelemetryEnabled: boolean;
  10787
  10788  		/**
  10789: 		 * An {@link Event} which fires when the user enabled or disables telemetry.
  10790: 		 * `true` if the user has enabled telemetry or `false` if the user has disabled telemetry.
  10791  		 */
  10792  		export const onDidChangeTelemetryEnabled: Event<boolean>;
  10793
  10794  		/**
  10795  		 * An {@link Event} which fires when the default shell changes. This fires with the new
  10796  		 * shell path.
  10797  		 */
  10798  		export const onDidChangeShell: Event<string>;
  10799
  10800  		/**
  10801: 		 * Creates a new {@link TelemetryLogger telemetry logger}.
  10802  		 *
  10803: 		 * @param sender The telemetry sender that is used by the telemetry logger.
  10804: 		 * @param options Options for the telemetry logger.
  10805: 		 * @returns A new telemetry logger
  10806  		 */
  10807  		export function createTelemetryLogger(
  10808  			sender: TelemetrySender,
  10809  			options?: TelemetryLoggerOptions,
  10810  		): TelemetryLogger;

  19694  		 */
  19695  		constructor(value: T);
  19696  	}
  19697
  19698  	/**
  19699: 	 * A telemetry logger which can be used by extensions to log usage and error telementry.
  19700  	 *
  19701  	 * A logger wraps around an {@link TelemetrySender sender} but it guarantees that
  19702: 	 * - user settings to disable or tweak telemetry are respected, and that
  19703  	 * - potential sensitive data is removed
  19704  	 *
  19705  	 * It also enables an "echo UI" that prints whatever data is send and it allows the editor
  19706  	 * to forward unhandled errors to the respective extensions.
  19707  	 *
  19708  	 * To get an instance of a `TelemetryLogger`, use
  19709  	 * {@link env.createTelemetryLogger `createTelemetryLogger`}.
  19710  	 */
  19711  	export interface TelemetryLogger {
  19712  		/**
  19713: 		 * An {@link Event} which fires when the enablement state of usage or error telemetry changes.
  19714  		 */
  19715  		readonly onDidChangeEnableStates: Event<TelemetryLogger>;
  19716
  19717  		/**
  19718: 		 * Whether or not usage telemetry is enabled for this logger.
  19719  		 */
  19720  		readonly isUsageEnabled: boolean;
  19721
  19722  		/**
  19723: 		 * Whether or not error telemetry is enabled for this logger.
  19724  		 */
  19725  		readonly isErrorsEnabled: boolean;
  19726
  19727  		/**
  19728  		 * Log a usage event.
  19729  		 *
  19730: 		 * After completing cleaning, telemetry setting checks, and data mix-in calls `TelemetrySender.sendEventData` to log the event.
  19731: 		 * Automatically supports echoing to extension telemetry output channel.
  19732  		 * @param eventName The event name to log
  19733  		 * @param data The data to log
  19734  		 */
  19735  		logUsage(
  19736  			eventName: string,

  19738  		): void;
  19739
  19740  		/**
  19741  		 * Log an error event.
  19742  		 *
  19743: 		 * After completing cleaning, telemetry setting checks, and data mix-in calls `TelemetrySender.sendEventData` to log the event. Differs from `logUsage` in that it will log the event if the telemetry setting is Error+.
  19744: 		 * Automatically supports echoing to extension telemetry output channel.
  19745  		 * @param eventName The event name to log
  19746  		 * @param data The data to log
  19747  		 */
  19748  		logError(
  19749  			eventName: string,

  19751  		): void;
  19752
  19753  		/**
  19754  		 * Log an error event.
  19755  		 *
  19756: 		 * Calls `TelemetrySender.sendErrorData`. Does cleaning, telemetry checks, and data mix-in.
  19757: 		 * Automatically supports echoing to extension telemetry output channel.
  19758  		 * Will also automatically log any exceptions thrown within the extension host process.
  19759  		 * @param error The error object which contains the stack trace cleaned of PII
  19760  		 * @param data Additional data to log alongside the stack trace
  19761  		 */
  19762  		logError(

  19769  		 */
  19770  		dispose(): void;
  19771  	}
  19772
  19773  	/**
  19774: 	 * The telemetry sender is the contract between a telemetry logger and some telemetry service. **Note** that extensions must NOT
  19775  	 * call the methods of their sender directly as the logger provides extra guards and cleaning.
  19776  	 *
  19777  	 * ```js
  19778  	 * const sender: vscode.TelemetrySender = {...};
  19779  	 * const logger = vscode.env.createTelemetryLogger(sender);
  19780  	 *
  19781  	 * // GOOD - uses the logger
  19782  	 * logger.logUsage('myEvent', { myData: 'myValue' });
  19783  	 *
  19784: 	 * // BAD - uses the sender directly: no data cleansing, ignores user settings, no echoing to the telemetry output channel etc
  19785  	 * sender.logEvent('myEvent', { myData: 'myValue' });
  19786  	 * ```
  19787  	 */
  19788  	export interface TelemetrySender {
  19789  		/**
````

# File: Application\CodeEditorLand\Dependency\Land\Dependency\Editor\Source\vscode-dts\vscode.proposed.telemetry.d.ts:

```sh
   4   *--------------------------------------------------------------------------------------------*/
   5
   6  declare module "vscode" {
   7  	export interface TelemetryConfiguration {
   8  		/**
   9: 		 * Whether or not usage telemetry collection is allowed
  10  		 */
  11  		readonly isUsageEnabled: boolean;
  12  		/**
  13: 		 * Whether or not crash error telemetry collection is allowed
  14  		 */
  15  		readonly isErrorsEnabled: boolean;
  16  		/**
  17  		 * Whether or not crash report collection is allowed
  18  		 */
  19  		readonly isCrashEnabled: boolean;
  20  	}
  21
  22  	export namespace env {
  23  		/**
  24: 		 * Indicates what telemetry is enabled / disabled
  25: 		 * Can be observed to determine what telemetry the extension is allowed to send
  26  		 */
  27: 		export const telemetryConfiguration: TelemetryConfiguration;
  28
  29  		/**
  30: 		 * An {@link Event} which fires when the collectable state of telemetry changes
  31  		 * Returns a {@link TelemetryConfiguration} object
  32  		 */
  33  		export const onDidChangeTelemetryConfiguration: Event<
  34  			TelemetryConfiguration | undefined
  35  		>;
```
