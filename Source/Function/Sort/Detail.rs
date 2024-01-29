use std::process::Command;

fn main() {
	println!("Process: Sort/Detail.sh");

	// Context: CodeEditorLand/Application
	let directory = std::env::current_dir().expect("Failed to get current directory");
	let cache_path = directory.join("../Cache/Repository/Build.md");

	let repositories = read_array(&cache_path).expect("Failed to read repositories");

	for repository in repositories {
		let folder = repository.replace("CodeEditorLand/", "");

		let output =
			Command::new("cd").arg(&folder).output().expect("Failed to execute cd command");

		println!("{}", String::from_utf8_lossy(&output.stdout));

		let output = Command::new("pwd").output().expect("Failed to execute pwd command");

		println!("{}", String::from_utf8_lossy(&output.stdout));

		let output = Command::new("find")
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
			.arg("sort-package-json")
			.output()
			.expect("Failed to execute find command");

		println!("{}", String::from_utf8_lossy(&output.stdout));

		let output = Command::new("cd").arg("-").output().expect("Failed to execute cd - command");

		println!("{}", String::from_utf8_lossy(&output.stdout));
	}
}

fn read_array(file_path: &std::path::Path) -> Result<Vec<String>, std::io::Error> {
	let content = std::fs::read_to_string(file_path)?;
	let repositories: Vec<String> = content.lines().map(|s| s.to_string()).collect();
	Ok(repositories)
}
