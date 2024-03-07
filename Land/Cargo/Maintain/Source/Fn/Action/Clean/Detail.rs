use serde_json::{json, Value};
use std::fs;

fn main() {
	// Read package.json file
	let package_json_str = fs::read_to_string("package.json").expect("Failed to read package.json");
	let mut package_json: Value =
		serde_json::from_str(&package_json_str).expect("Failed to parse package.json");

	// Delete keys from package.json
	let keys_to_delete = vec![
		".eslintConfig",
		".prettier",
		".peerDependencies",
		".engines",
		".tags",
		".categories",
		".keywords",
		".scripts.lint",
		".scripts.\"lint-fix\"",
		".scripts.\"lint:fix\"",
		".scripts.\"lint:eslint\"",
		".scripts.\"lint:client\"",
		".scripts.\"lint:scripts\"",
		".scripts.\"lint:server\"",
		".scripts.pretest",
		".scripts.test",
		".scripts.\"test:lint\"",
		".scripts.\"test:eslint-rules\"",
		".scripts.posttest",
		".test",
		".tslint",
		".check",
		".fix",
	];

	for key in keys_to_delete {
		remove_key(&mut package_json, key);
	}

	// Delete specific dependencies/devDependencies
	let omit = vec![
		"@babel/eslint-config-internal",
		"@babel/eslint-parser",
		"@babel/eslint-plugin-development-internal",
		"@babel/eslint-plugin-development",
		"@eslint/eslintrc",
		"@eslint/js",
		"@microsoft/eslint-config-azuretools",
		"@microsoft/eslint-config-fast-dna",
		"@nicolo-ribaudo/eslint-scope-5-internals",
		"@typescript-eslint/eslint-plugin-tslint",
		"@typescript-eslint/eslint-plugin",
		"@typescript-eslint/experimental-utils",
		"@typescript-eslint/parser",
		"@typescript-eslint/utils",
		"eslint-cli",
		"eslint-config-airbnb",
		"eslint-config-commonality",
		"eslint-config-next",
		"eslint-config-prettier",
		"eslint-config-standard",
		"eslint-formatter-autolinkable-stylish",
		"eslint-formatter-codeframe",
		"eslint-import-resolver-node",
		"eslint-import-resolver-typescript",
		"eslint-plugin-filenames",
		"eslint-plugin-header",
		"eslint-plugin-html",
		"eslint-plugin-import",
		"eslint-plugin-jest",
		"eslint-plugin-jsdoc",
		"eslint-plugin-jsx-a11y",
		"eslint-plugin-license-header",
		"eslint-plugin-local-rules",
		"eslint-plugin-local",
		"eslint-plugin-n",
		"eslint-plugin-no-null",
		"eslint-plugin-no-only-tests",
		"eslint-plugin-node",
		"eslint-plugin-notice",
		"eslint-plugin-prefer-arrow",
		"eslint-plugin-prettier",
		"eslint-plugin-promise",
		"eslint-plugin-react-hooks",
		"eslint-plugin-react",
		"eslint-plugin-require-path-exists",
		"eslint-plugin-security",
		"eslint-plugin-simple-import-sort",
		"eslint-plugin-standard",
		"eslint-plugin-tslint",
		"eslint-plugin-unicorn",
		"eslint-plugin-unused-imports",
		"eslint-plugin-vue",
		"eslint-rule-composer",
		"eslint-scope",
		"eslint-utils",
		"eslint-visitor-keys",
		"eslint",
		"gulp-eslint",
		"prettier-eslint-cli",
		"prettier-eslint",
		"prettier",
		"tslint-eslint-rules",
		"tslint",
		"vue-eslint-parser",
	];

	remove_dependencies(&mut package_json, &omit, "dependencies");
	remove_dependencies(&mut package_json, &omit, "devDependencies");

	// Write modified package.json back to file
	fs::write(
		"package.json",
		serde_json::to_string_pretty(&package_json).expect("Failed to serialize package.json"),
	)
	.expect("Failed to write modified package.json");

	println!("Action: Clean/Detail.sh completed successfully.");
}

fn remove_key(value: &mut Value, key: &str) {
	if let Some(obj) = value.as_object_mut() {
		obj.remove(key);
	}
}

fn remove_dependencies(value: &mut Value, omit: &[&str], dependency_type: &str) {
	if let Some(mut dependencies) = value.get_mut(dependency_type).and_then(Value::as_object_mut) {
		for dependency in omit {
			dependencies.remove(*dependency);
		}
	}
}
