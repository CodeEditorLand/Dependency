use std::process::Command;

fn main() {
	println!("Process: Replace/Import.sh");

	// Context: CodeEditorLand/Property/Foundation

	for repository in read_array(
		&std::env::current_dir()
			.expect("Failed to get current directory")
			.join("../Cache/Repository/Build.md"),
	)
	.expect("Failed to read repositories")
	{
		println!(
			"{}",
			String::from_utf8_lossy(
				&Command::new("cd")
					.arg(&folder)
					.output()
					.expect("Failed to execute cd command")
					.stdout
			)
		);

		script(&repository.replace("CodeEditorLand/", ""));

		println!(
			"{}",
			String::from_utf8_lossy(
				&Command::new("cd")
					.arg("-")
					.output()
					.expect("Failed to execute cd - command")
					.stdout
			)
		);
	}
}

pub fn replace() {
	// Read TypeScript code from a file
	let ts_code = fs::read_to_string("example.ts").expect("Error reading file");

	// Initialize the source map and session
	let cm = SourceMap::default();
	let handler = Box::new(Session { handler: &swc_ecma_parser::Handler::new(&cm) });

	// Initialize the parser
	let comments = SingleThreadedComments::default();
	let lexer = Lexer::new(
		Syntax::Typescript(TsConfig {
			tsx: false, // Set to true if you want to support JSX
			dynamic_import: true,
			decorators: true,
			import_assertions: true,
			no_early_errors: false,
		}),
		Default::default(),
		SourceFileInput::from(
			SourceMap::new().new_source_file(FileName::Custom("example.ts".into()), ts_code.into()),
		),
		Some(&comments),
	);
	let mut parser = Parser::new_from(lexer);

	// Parse the TypeScript code
	let mut module = parser.parse_typescript_module().expect("Failed to parse TypeScript code");

	// Replace import statements
	module.body.retain(|item| match item {
		ModuleItem::Stmt(Stmt::Import(import_stmt)) => {
			// Check if it's an import statement you want to replace
			let src_str = cm.span_to_snippet(import_stmt.src.value.span).unwrap();
			if src_str == "'vs/platform/userDataSync/common/userDataSyncLocalStoreService'" {
				// Replace the import with your desired import
				*item = ModuleItem::Stmt(Stmt::Decl(Decl::Var(VarDecl {
					span: import_stmt.span,
					kind: VarDeclKind::Const,
					declare: false,
					decls: once(VarDeclarator {
						span: DUMMY_SP,
						name: Pat::Ident(Ident::new(
							js_word!("IUserDataSyncLocalStoreService"),
							DUMMY_SP,
						)),
						init: Some(Box::new(Expr::Ident(Ident::new(
							js_word!("UserDataSyncLocalStoreService"),
							DUMMY_SP,
						)))),
						definite: false,
					})
					.collect(),
				})));
			}
			true // Keep the item
		}
		_ => true, // Keep other items
	});

	// Write the modified code back to the file
	let mut src = Vec::new();
	{
		let mut emitter = Emitter {
			cfg: EmitterConfig {
				indent: None,
				minify: false,
				cm: cm.clone(),
				config: Default::default(),
			},
			comments: Some(&comments),
			cm: cm.clone(),
			wr: Box::new(JsWriter::new(cm.clone(), "\n", &mut src, None)),
		};

		emitter.emit_module(&module).expect("Failed to emit module");
	}

	// Write the modified code back to the file
	fs::write("modified_example.ts", &src).expect("Error writing file");
}
