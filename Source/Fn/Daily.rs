use std::{env, fs, path::Path};

fn main() {
	println!("Process: Daily.rs");

	// Context: CodeEditorLand/Application
	let directory = env::current_dir().expect("Failed to get current directory");

	run_script(&directory.join("Cache").join("Get.sh"));
	run_script(&directory.join("Clone").join("Repository.sh"));
	run_script(&directory.join("Module").join("Git.sh"));
	run_script(&directory.join("Configure").join("Repository.sh"));
	run_script(&directory.join("Setting").join("Repository.sh"));
	run_script(&directory.join("Rename").join("Repository.sh"));
	run_script(&directory.join("Rename").join("Branch.sh"));
	run_script(&directory.join("Sync").join("Repository.sh"));
	run_script(&directory.join("Clean").join("Repository.sh"));
	run_script(&directory.join("Clean").join("Detail.sh"));
	run_script(&directory.join("Move").join("license.sh"));
	run_script(&directory.join("Move").join("package.sh"));
	run_script(&directory.join("Move").join("src.sh"));
	run_script(&directory.join("Append").join("Detail.sh"));
	run_script(&directory.join("Sort").join("Detail.sh"));

	maintain_workflow();
}

fn run_script(script_path: &Path) {
	if script_path.exists() {
		println!("Running script: {:?}", script_path);
	// TODO: Execute the script here
	} else {
		println!("Script not found: {:?}", script_path);
	}
}

fn maintain_workflow() {
	println!("Maintain Workflow");
}
