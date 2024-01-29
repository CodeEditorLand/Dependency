use std::env;
use std::fs;
use std::path::Path;

fn main() {
    println!("Process: Daily.rs");

    // Context: CodeEditorLand/Application
    let directory = env::current_dir().expect("Failed to get current directory");

    let cache_path = directory.join("Cache").join("Get.sh");
    run_script(&cache_path);

    let clone_path = directory.join("Clone").join("Repository.sh");
    run_script(&clone_path);

    let module_path = directory.join("Module").join("Git.sh");
    run_script(&module_path);

    let configure_path = directory.join("Configure").join("Repository.sh");
    run_script(&configure_path);

    let setting_path = directory.join("Setting").join("Repository.sh");
    run_script(&setting_path);

    let rename_repository_path = directory.join("Rename").join("Repository.sh");
    run_script(&rename_repository_path);

    let rename_branch_path = directory.join("Rename").join("Branch.sh");
    run_script(&rename_branch_path);

    let sync_repository_path = directory.join("Sync").join("Repository.sh");
    run_script(&sync_repository_path);

    let clean_repository_path = directory.join("Clean").join("Repository.sh");
    run_script(&clean_repository_path);

    let clean_detail_path = directory.join("Clean").join("Detail.sh");
    run_script(&clean_detail_path);

    let move_license_path = directory.join("Move").join("license.sh");
    run_script(&move_license_path);

    let move_package_path = directory.join("Move").join("package.sh");
    run_script(&move_package_path);

    let move_src_path = directory.join("Move").join("src.sh");
    run_script(&move_src_path);

    let append_detail_path = directory.join("Append").join("Detail.sh");
    run_script(&append_detail_path);

    let sort_detail_path = directory.join("Sort").join("Detail.sh");
    run_script(&sort_detail_path);

    maintain_workflow();
}

fn run_script(script_path: &Path) {
    if script_path.exists() {
        println!("Running script: {:?}", script_path);
        // Execute the script here
    } else {
        println!("Script not found: {:?}", script_path);
    }
}

fn maintain_workflow() {
    println!("Maintain Workflow");
}
