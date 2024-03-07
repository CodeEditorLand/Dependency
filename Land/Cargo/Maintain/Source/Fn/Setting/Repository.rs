use std::{env, fs, process::Command};

fn main() {
	println!("Process: Setting/Repository.sh");

	// Context: CodeEditorLand/Environment/Stream

	for repository in std::fs::read_to_string(
		std::env::current_dir()
			.expect("Failed to get current directory")
			.join("../Cache/Repository/Build.md"),
	)?
	.lines()
	.map(|s| s.to_string())
	.collect()
	.expect("Failed to read repositories")
	{
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
	if !Command::new(command).args(args).status()?.success() {
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
