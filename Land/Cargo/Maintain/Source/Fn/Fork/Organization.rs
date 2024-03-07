use std::process::Command;

fn main() {
	println!("Process: Fork/Organization.sh");

	// List of repositories
	let repositories = vec![
		"microsoft/applicationinsights-vscode",
		"microsoft/azure-boards-vscode",
		// Add all repositories here...
		"microsoft/vscodespaces-quickstart",
		"microsoft/vscodetestcover",
	];

	// Fork each repository in parallel
	repositories.par_iter().for_each(|repository| {
		script(repository);
	});
}

fn script(repository: &str) {
	let output = Command::new("gh")
		.arg("repo")
		.arg("fork")
		.arg(repository)
		.arg("--org")
		.arg("CodeEditorLand")
		.output()
		.expect("Failed to execute gh repo fork command");

	println!("{}", String::from_utf8_lossy(&output.stdout));
}
