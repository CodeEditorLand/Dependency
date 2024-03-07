use std::{env, fs, path::Path};

fn main() {
	println!("Process: Daily.rs");

	// Context: CodeEditorLand/Property/Stream
	let current = env::current_dir().expect("Failed to get current directory");

	run_script(&current.join("Cache").join("Get.sh"));
	run_script(&current.join("Clone").join("Repository.sh"));
	run_script(&current.join("Module").join("Git.sh"));
	run_script(&current.join("Configure").join("Repository.sh"));
	run_script(&current.join("Setting").join("Repository.sh"));
	run_script(&current.join("Rename").join("Repository.sh"));
	run_script(&current.join("Rename").join("Branch.sh"));
	run_script(&current.join("Sync").join("Repository.sh"));
	run_script(&current.join("Clean").join("Repository.sh"));
	run_script(&current.join("Clean").join("Detail.sh"));
	run_script(&current.join("Move").join("license.sh"));
	run_script(&current.join("Move").join("package.sh"));
	run_script(&current.join("Move").join("src.sh"));
	run_script(&current.join("Append").join("Detail.sh"));
	run_script(&current.join("Sort").join("Detail.sh"));

	// TODO: Execute Maintain Workflow
	// Maintain Workflow
}

fn run_script(script_path: &Path) {
	if script_path.exists() {
		println!("Running script: {:?}", script_path);
	// TODO: Execute the script here
	} else {
		println!("Script not found: {:?}", script_path);
	}
}
