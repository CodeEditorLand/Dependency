use std::process::Command;

fn main() {
	println!("Process: Move/package.sh");

	// Context: CodeEditorLand/Property/Land/Foundation
	let directory = std::env::current_dir().expect("Failed to get current directory");
	let cache_path = directory.join("../Cache/Repository/Build.md");

	let repositories = read_array(&cache_path).expect("Failed to read repositories");

	for repository in repositories {
		let folder = repository.replace("CodeEditorLand/", "");

		let output =
			Command::new("cd").arg(&folder).output().expect("Failed to execute cd command");

		println!("{}", String::from_utf8_lossy(&output.stdout));

		// Execute script here
		script(&folder);

		let output = Command::new("cd").arg("-").output().expect("Failed to execute cd - command");

		println!("{}", String::from_utf8_lossy(&output.stdout));
	}
}

fn read_array(file_path: &std::path::Path) -> Result<Vec<String>, std::io::Error> {
	let content = std::fs::read_to_string(file_path)?;
	let repositories: Vec<String> = content.lines().map(|s| s.to_string()).collect();
	Ok(repositories)
}

fn script(folder: &str) {
	let output = Command::new("cd").arg(folder).output().expect("Failed to execute cd command");

	println!("{}", String::from_utf8_lossy(&output.stdout));

	if folder == "LandGeneratorCode" {
		move_package(
			"generators/app/templates/ext-colortheme/package.json",
			"generators/app/templates/ext-colortheme/template.package.json",
		);
		move_package(
			"generators/app/templates/ext-command-js/package.json",
			"generators/app/templates/ext-command-js/template.package.json",
		);
		move_package(
			"generators/app/templates/ext-command-ts/package.json",
			"generators/app/templates/ext-command-ts/template.package.json",
		);
		move_package(
			"generators/app/templates/ext-command-ts/vscode-webpack/package.json",
			"generators/app/templates/ext-command-ts/vscode-webpack/template.package.json",
		);
		move_package(
			"generators/app/templates/ext-command-web/package.json",
			"generators/app/templates/ext-command-web/template.package.json",
		);
		move_package(
			"generators/app/templates/ext-extensionpack/package.json",
			"generators/app/templates/ext-extensionpack/template.package.json",
		);
		move_package(
			"generators/app/templates/ext-keymap/package.json",
			"generators/app/templates/ext-keymap/template.package.json",
		);
		move_package(
			"generators/app/templates/ext-language/package.json",
			"generators/app/templates/ext-language/template.package.json",
		);
		move_package(
			"generators/app/templates/ext-localization/package.json",
			"generators/app/templates/ext-localization/template.package.json",
		);
		move_package(
			"generators/app/templates/ext-notebook-renderer/package.json",
			"generators/app/templates/ext-notebook-renderer/template.package.json",
		);
		move_package(
			"generators/app/templates/ext-snippets/package.json",
			"generators/app/templates/ext-snippets/template.package.json",
		);
	}

	let output = Command::new("cd").arg("-").output().expect("Failed to execute cd - command");

	println!("{}", String::from_utf8_lossy(&output.stdout));
}

fn move_package(source: &str, destination: &str) {
	if let Err(err) = std::fs::rename(source, destination) {
		println!("Error moving package.json file: {}", err);
	}
}
