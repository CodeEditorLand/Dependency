use std::{fs, process::Command};

fn main() {
	println!("Process: Move/license.sh");

	// Context: CodeEditorLand/Application
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

	let mut find_command = Command::new("find");
	find_command
		.arg(".")
		.arg("-type")
		.arg("d")
		.arg("(")
		.arg("-iname")
		.arg("node_modules")
		.arg("-o")
		.arg("-iname")
		.arg("vendor")
		.arg("-o")
		.arg("-iname")
		.arg("dist")
		.arg("-o")
		.arg("-iname")
		.arg("target")
		.arg("-o")
		.arg("-iname")
		.arg(".git")
		.arg("-o")
		.arg("-iname")
		.arg(".next")
		.arg(")")
		.arg("-prune")
		.arg("-false")
		.arg("-o")
		.arg("-iname")
		.arg("license.txt")
		.arg("-type")
		.arg("f")
		.arg("-execdir")
		.arg("mv")
		.arg("{}")
		.arg("LICENSE")
		.arg("\\;");
	find_command.output().expect("Failed to execute find command");

	let mut find_command = Command::new("find");
	find_command
		.arg(".")
		.arg("-type")
		.arg("d")
		.arg("(")
		.arg("-iname")
		.arg("node_modules")
		.arg("-o")
		.arg("-iname")
		.arg("vendor")
		.arg("-o")
		.arg("-iname")
		.arg("dist")
		.arg("-o")
		.arg("-iname")
		.arg("target")
		.arg("-o")
		.arg("-iname")
		.arg(".git")
		.arg("-o")
		.arg("-iname")
		.arg(".next")
		.arg(")")
		.arg("-prune")
		.arg("-false")
		.arg("-o")
		.arg("-iname")
		.arg("license.md")
		.arg("-type")
		.arg("f")
		.arg("-execdir")
		.arg("mv")
		.arg("{}")
		.arg("LICENSE")
		.arg("\\;");
	find_command.output().expect("Failed to execute find command");

	let output = Command::new("cd").arg("-").output().expect("Failed to execute cd - command");

	println!("{}", String::from_utf8_lossy(&output.stdout));
}
