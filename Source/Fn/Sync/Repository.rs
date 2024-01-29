use std::process::Command;

fn main() {
	println!("Process: Sync/Repository.sh");

	// Context: CodeEditorLand/Application
	for repository in read_array(
		&std::fs::read_to_string(
			std::env::current_dir()
				.expect("Failed to get current directory")
				.join("../Cache/Repository/Build.md"),
		)?
		.lines()
		.map(|s| s.to_string())
		.collect(),
	)
	.expect("Failed to read repositories")
	{
		println!(
			"{}",
			String::from_utf8_lossy(
				&Command::new("cd")
					.arg(&repository.replace("CodeEditorLand/", ""))
					.output()
					.expect("Failed to execute cd command")
					.stdout
			)
		);

		println!(
			"{}",
			String::from_utf8_lossy(
				&Command::new("git")
					.arg("add")
					.arg(".")
					.output()
					.expect("Failed to execute git add command")
					.stdout
			)
		);

		// TODO: Add more commands here...

		println!(
			"{}",
			String::from_utf8_lossy(
				&Command::new("cd")
					.arg("-")
					.output()
					.expect("Failed to execute cd - command")
					.stdout
			)
		);
	}
}
