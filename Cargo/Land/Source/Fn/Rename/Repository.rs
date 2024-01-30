use std::process::Command;

fn main() {
	println!("Process: Rename/Repository.sh");

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
	let mut rename = String::new();

	let first_char = folder.chars().next().unwrap();
	rename.push_str(&first_char.to_uppercase().to_string());

	for (i, c) in folder.chars().enumerate() {
		if i > 0 {
			if c == '-' {
				if let Some(next_char) = folder.chars().nth(i + 1) {
					if next_char.is_lowercase() {
						rename.push_str(&next_char.to_uppercase().to_string());
					} else {
						rename.push_str(&c.to_string());
					}
				}
			} else {
				rename.push_str(&c.to_string());
			}
		}
	}

	rename = rename.replace("vscode", "Land");

	println!("Rename: ");
	println!("{}", rename);

	let output = Command::new("gh")
		.arg("repo")
		.arg("rename")
		.arg(&rename)
		.arg("--yes")
		.output()
		.expect("Failed to execute gh repo rename command");

	println!("{}", String::from_utf8_lossy(&output.stdout));
}
