use std::{
	fs::File,
	io::{self, Write},
	path::PathBuf,
	process::Command,
};

pub fn Fn() {
	println!("Process: Cache/Get.rs");

	// Contextless

	let directory = std::env::current_dir().expect("Failed to get current directory");

	let organization = "CodeEditorLand";

	let mut repository: Vec<String> = Vec::new();

	for page in 1..=10 {
		let output = Command::new("gh")
			.args(&[
				"api",
				&format!("orgs/{}/repos?per_page=100&page={}", organization, page),
				"-H",
				"Accept: application/vnd.github+json",
				"-H",
				"X-GitHub-Api-Version: 2022-11-28",
			])
			.output()
			.expect("Failed to execute command");

		println!(
			"{:?}",
			String::from_utf8_lossy(&output.stdout)
				.lines()
				.map(|line| line.trim())
				.filter(|line| !line.is_empty())
				.filter(|line| ![
					"CodeEditorLand/.github",
					"CodeEditorLand/Babel",
					"CodeEditorLand/Biome",
					"CodeEditorLand/Build",
					"CodeEditorLand/Commonality",
					"CodeEditorLand/debugger-libs",
					"CodeEditorLand/node-gyp",
					"CodeEditorLand/NRefactory",
					"CodeEditorLand/Oniguruma",
					"CodeEditorLand/TypeScript",
					"CodeEditorLand/Wil",
				]
				.contains(&line))
				.collect::<Vec<_>>()
		)
	}

	repository.sort();

	let mut file =
		File::create(directory.join("Repository/Build.md")).expect("Failed to create file");

	for repo in &repository {
		writeln!(file, "{}", repo).expect("Failed to write to file");
	}
}
