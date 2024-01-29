use rayon::prelude::*;
use std::{error::Error, fs, process::Command};

fn main() {
	println!("Process: Clean/Detail.sh");

	// Get the current directory
	let directory = match std::env::current_dir() {
		Ok(dir) => dir,
		Err(e) => {
			eprintln!("Error getting current directory: {}", e);
			std::process::exit(1);
		}
	};

	// Read the list of repositories
	let repository_file = directory.join("../Cache/Repository/Build.md");
	let repository_contents = match fs::read_to_string(&repository_file) {
		Ok(contents) => contents,
		Err(e) => {
			eprintln!("Error reading repository file {:?}: {}", repository_file, e);
			std::process::exit(1);
		}
	};

	// Extract repository names
	let repositories: Vec<String> = repository_contents.lines().map(String::from).collect();

	// Clean repositories in parallel
	repositories.par_iter().for_each(|repo| {
		if let Err(err) = clean_repository(&directory, repo) {
			eprintln!("Error cleaning repository {}: {}", repo, err);
		}
	});
}

fn clean_repository(directory: &std::path::Path, repository: &str) -> Result<(), Box<dyn Error>> {
	let folder = repository.replace("CodeEditorLand/", "");
	let folder_path = directory.join(&folder);

	// Change directory to repository
	let _output =
		Command::new("sh").arg("-c").arg(format!("cd {:?} || exit", folder_path)).output()?;

	println!("Current directory: {:?}", folder_path);

	// Find and execute Detail.sh for each package.json file
	let _output = Command::new("find")
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
		.arg("package.json")
		.arg("-type")
		.arg("f")
		.arg("-execdir")
		.arg("sh")
		.arg("-c")
		.arg(format!("{}/../Action/Clean/Detail.sh", directory.display()))
		.output()?;

	Ok(())
}
