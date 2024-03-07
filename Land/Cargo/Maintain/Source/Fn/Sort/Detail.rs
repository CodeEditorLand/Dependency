use std::process::Command;

fn main() {
	println!("Process: Sort/Detail.sh");

	// Context: CodeEditorLand/Property/Foundation

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
