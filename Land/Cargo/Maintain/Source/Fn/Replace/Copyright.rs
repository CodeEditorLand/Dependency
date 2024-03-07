use std::process::Command;

fn main() {
	println!("Process: Replace/Copyright.sh");

	// Context: CodeEditorLand/Property/Stream

	for repository in read_array(
		&std::env::current_dir()
			.expect("Failed to get current directory")
			.join("../Cache/Repository/Build.md"),
	)
	.expect("Failed to read repositories")
	{
		println!(
			"{}",
			String::from_utf8_lossy(
				&Command::new("cd")
					.arg(&folder)
					.output()
					.expect("Failed to execute cd command")
					.stdout
			)
		);

		script(&repository.replace("CodeEditorLand/", ""));

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

fn read_array(file_path: &std::path::Path) -> Result<Vec<String>, std::io::Error> {
	Ok(std::fs::read_to_string(file_path)?.lines().map(|s| s.to_string()).collect())
}

fn script(folder: &str) {
	println!(
		"{}",
		String::from_utf8_lossy(
			&Command::new("cd").arg(folder).output().expect("Failed to execute cd command").stdout
		)
	);

	// Add your script commands here

	println!(
		"{}",
		String::from_utf8_lossy(
			&Command::new("cd").arg("-").output().expect("Failed to execute cd - command").stdout
		)
	);
}
