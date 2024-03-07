use std::process::Command;

fn main() {
	println!("Process: Rename/Branch.sh");

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

	// Execute commands using git and gh
	let output = Command::new("git")
		.arg("switch")
		.arg("-c")
		.arg("main")
		.output()
		.expect("Failed to execute git switch -c main command");

	println!("{}", String::from_utf8_lossy(&output.stdout));

	let output = Command::new("git")
		.arg("push")
		.arg("-f")
		.arg("--set-upstream")
		.arg("origin")
		.arg("main")
		.output()
		.expect("Failed to execute git push -f --set-upstream origin main command");

	println!("{}", String::from_utf8_lossy(&output.stdout));

	let output = Command::new("gh")
		.arg("repo")
		.arg("edit")
		.arg("--default-branch")
		.arg("main")
		.output()
		.expect("Failed to execute gh repo edit --default-branch main command");

	println!("{}", String::from_utf8_lossy(&output.stdout));
}
