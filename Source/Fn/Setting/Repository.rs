use std::{env, fs, process::Command};

fn main() {
	println!("Process: Setting/Repository.sh");

	// Get the current directory
	let current_dir = match env::current_dir() {
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
		if let Err(_) = process_repository(repository, &current_dir) {
			eprintln!("Failed to process repository: {}", repository);
		}
	}

	println!("Process completed successfully.");
}

fn process_repository(repository: &str, current_dir: &std::path::Path) -> std::io::Result<()> {
	// Change directory to the repository
	let repository_path = current_dir.join(repository.replace("CodeEditorLand/", ""));
	env::set_current_dir(&repository_path)?;

	// Print current directory
	println!("Current directory: {:?}", repository_path);

	// Execute GitHub CLI commands
	execute_command("gh", &["repo", "set-default", &get_origin_url()])?;
	execute_command(
		"gh",
		&[
			"api",
			"--method",
			"PUT",
			"-H",
			"Accept: application/vnd.github+json",
			"-H",
			"X-GitHub-Api-Version: 2022-11-28",
			&format!("repos/{}/actions/permissions/access", repository),
			"-f",
			"access_level=organization",
			"--silent",
		],
	)?;
	execute_command(
		"gh",
		&[
			"api",
			"--method",
			"PUT",
			"-H",
			"Accept: application/vnd.github+json",
			"-H",
			"X-GitHub-Api-Version: 2022-11-28",
			&format!("user/starred/{}", repository),
			"--silent",
		],
	)?;
	// Continue with other commands...

	Ok(())
}

fn execute_command(command: &str, args: &[&str]) -> std::io::Result<()> {
	let status = Command::new(command).args(args).status()?;

	if !status.success() {
		return Err(std::io::Error::new(
			std::io::ErrorKind::Other,
			format!("Command execution failed: {} {:?}", command, args),
		));
	}

	Ok(())
}

fn get_origin_url() -> String {
	// Get the URL of the origin remote
	match Command::new("git").args(&["remote", "get-url", "origin"]).output() {
		Ok(output) => {
			if output.status.success() {
				String::from_utf8_lossy(&output.stdout).trim().to_string()
			} else {
				String::new()
			}
		}
		Err(_) => String::new(),
	}
}
