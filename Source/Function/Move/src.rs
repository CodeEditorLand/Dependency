use std::{fs, process::Command};

fn main() {
	println!("Process: Move/src.sh");

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

	if let Ok(entries) = fs::read_dir("src") {
		for entry in entries {
			if let Ok(entry) = entry {
				let path = entry.path();
				if path.is_dir() {
					fs::create_dir_all("Source").expect("Failed to create Source directory");
					fs::copy(&path, "Source").expect("Failed to copy src directory to Source");
					fs::remove_dir_all("src").expect("Failed to remove src directory");
				}
			}
		}
	}

	// Find all 'src' directories and move their contents to 'Source'
	if let Ok(entries) = fs::read_dir(".") {
		for entry in entries {
			if let Ok(entry) = entry {
				let path = entry.path();
				if let Some(file_name) = path.file_name() {
					if file_name == "src" {
						if let Ok(src_entries) = fs::read_dir(&path) {
							for src_entry in src_entries {
								if let Ok(src_entry) = src_entry {
									let src_path = src_entry.path();
									if src_path.is_dir() {
										fs::copy(&src_path, "Source")
											.expect("Failed to copy src directory to Source");
										fs::remove_dir_all("src")
											.expect("Failed to remove src directory");
									}
								}
							}
						}
					}
				}
			}
		}
	}

	let output = Command::new("cd").arg("-").output().expect("Failed to execute cd - command");

	println!("{}", String::from_utf8_lossy(&output.stdout));
}
