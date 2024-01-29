use std::{fs, path::Path};

fn main() {
	println!("Process: Append/Detail.sh");

	// Get the current directory
	let current_dir = match std::env::current_dir() {
		Ok(dir) => dir,
		Err(_) => {
			eprintln!("Failed to get the current directory.");
			return;
		}
	};

	// Read the list of repositories from the file
	let repository_file_path = current_dir.join("../Cache/Repository/Build.md");
	let repository_list = match fs::read_to_string(&repository_file_path) {
		Ok(content) => content,
		Err(_) => {
			eprintln!("Failed to read the repository list file.");
			return;
		}
	};

	// Process each repository
	for repository in repository_list.lines() {
		let repository_path = current_dir.join(repository.replace("CodeEditorLand/", ""));
		if let Err(_) = process_repository(&repository_path) {
			eprintln!("Failed to process repository: {}", repository);
		}
	}

	println!("Process completed successfully.");
}

fn process_repository(repository_path: &Path) -> std::io::Result<()> {
	// Change directory to the repository
	std::env::set_current_dir(repository_path)?;

	// Print current directory
	println!("Current directory: {:?}", repository_path);

	// Find package.json files and execute the script
	let walker = ignore::WalkBuilder::new(".")
		.hidden(false)
		.ignore(false)
		.git_ignore(false)
		.git_global(false)
		.git_exclude(false)
		.build();

	for entry in walker {
		match entry {
			Ok(entry) if entry.file_type().map_or(false, |t| t.is_file()) => {
				if entry.file_name() == "package.json" {
					if let Err(_) = execute_script(entry.path()) {
						eprintln!("Failed to execute script for package.json: {:?}", entry.path());
					}
				}
			}
			_ => {}
		}
	}

	Ok(())
}

fn execute_script(package_json_path: &Path) -> std::io::Result<()> {
	// Execute the script for the package.json file
	let script_path = package_json_path.parent().unwrap().join("../Action/Append/Detail.sh");
	let status = std::process::Command::new("bash")
		.arg("-c")
		.arg(&script_path.to_string_lossy())
		.status()?;

	if !status.success() {
		return Err(std::io::Error::new(
			std::io::ErrorKind::Other,
			format!("Script execution failed for {:?}", package_json_path),
		));
	}

	Ok(())
}
