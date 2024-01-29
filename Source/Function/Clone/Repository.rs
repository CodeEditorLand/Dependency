use rayon::prelude::*;
use std::{error::Error, process::Command};

fn main() {
	// Fetch the list of repositories
	let repositories = match std::fs::read_to_string("../Cache/Repository/Build.md") {
		Ok(contents) => contents.lines().map(|s| s.trim().to_string()).collect::<Vec<_>>(),
		Err(e) => {
			eprintln!("Error reading repository list: {}", e);
			std::process::exit(1);
		}
	};

	// Clone repositories in parallel
	repositories.par_iter().for_each(|repo| {
		if let Err(err) = clone_repository(repo) {
			eprintln!("Error cloning repository {}: {}", repo, err);
		}
	});
}

fn clone_repository(repository: &str) -> Result<(), Box<dyn Error>> {
	// Execute git clone command
	let output = Command::new("git")
		.args(&["clone", "--depth=1", "--recurse-submodules", "--shallow-submodules"])
		.arg(format!("ssh://git@github.com/{}.git", repository))
		.output()?;

	// Print the output
	println!("{}", String::from_utf8_lossy(&output.stdout));

	// Check if the command was successful
	if !output.status.success() {
		return Err(format!("Failed to clone repository {}", repository).into());
	}

	Ok(())
}
