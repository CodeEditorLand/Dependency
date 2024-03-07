use std::{fs::File, io::prelude::*, process::Command};

fn main() {
	println!("Process: Module/Git.sh");

	// Context: CodeEditorLand/Property/Stream
	let directory = std::env::current_dir().expect("Failed to get current directory");
	let cache_path = directory.join("../Cache/Repository/Build.md");

	let repositories = read_array(&cache_path).expect("Failed to read repositories");

	// Remove existing .gitmodules file
	let _ = std::fs::remove_file(directory.join("../../.gitmodules"));

	for repository in repositories {
		let folder = repository.replace("CodeEditorLand/", "");

		let output =
			Command::new("cd").arg(&folder).output().expect("Failed to execute cd command");

		println!("{}", String::from_utf8_lossy(&output.stdout));

		// Execute script here
		script(&folder, &repository);

		let output = Command::new("cd").arg("-").output().expect("Failed to execute cd - command");

		println!("{}", String::from_utf8_lossy(&output.stdout));
	}
}

fn read_array(file_path: &std::path::Path) -> Result<Vec<String>, std::io::Error> {
	let content = std::fs::read_to_string(file_path)?;
	let repositories: Vec<String> = content.lines().map(|s| s.to_string()).collect();
	Ok(repositories)
}

fn script(folder: &str, repository: &str) {
	let output = Command::new("cd").arg(folder).output().expect("Failed to execute cd command");

	println!("{}", String::from_utf8_lossy(&output.stdout));

	let origin = String::from_utf8_lossy(
		&Command::new("git")
			.arg("remote")
			.arg("get-url")
			.arg("origin")
			.output()
			.expect("Failed to execute git remote get-url origin command")
			.stdout,
	)
	.trim()
	.to_string();

	println!("Folder: {}", folder);
	println!("Origin: {}", origin);

	let mut submodule = format!(
		"[submodule \"Application/{}\"]\n\
         path = Application/{}\n\
         url = {}\n",
		folder, folder, origin
	);

	// Append submodule entry to .gitmodules
	let mut file = File::create("../../.gitmodules").expect("Failed to create .gitmodules file");
	file.write_all(submodule.as_bytes()).expect("Failed to write to .gitmodules file");

	let output = Command::new("cd").arg("-").output().expect("Failed to execute cd - command");

	println!("{}", String::from_utf8_lossy(&output.stdout));
}
