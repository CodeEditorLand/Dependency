use std::{
	error::Error,
	fs::File,
	io::{self, Read, Write},
};

fn main() {
	println!("Action: Append/Detail.sh");

	// Get the current directory
	let current_dir = match std::env::current_dir() {
		Ok(dir) => dir,
		Err(err) => {
			eprintln!("Error getting current directory: {}", err);
			return;
		}
	};
	println!("Current directory: {:?}", current_dir);

	// Define the JSON content
	let json_content = r#"
    {
        "homepage": "https://github.com/CodeEditorLand/Build#readme",
        "bugs": {
            "url": "https://github.com/CodeEditorLand/Build/issues"
        },
        "repository": {
            "type": "git",
            "url": "git+https://github.com/CodeEditorLand/Build.git"
        },
        "version": "0.0.1",
        "license": "SEE LICENSE IN LICENSE",
        "type": "module",
        "publisher": "playform",
        "private": false,
        "publishConfig": {
            "access": "public"
        },
        "author": {
            "name": "Nikola Hristov",
            "email": "nikola@nikolahristov.tech",
            "url": "https://nikolahristov.tech"
        },
        "scripts": {
            "prepublishOnly": "TypeScriptESBuild 'Source/**/*.ts'"
        },
        "devDependencies": {
            "typescript-esbuild": "0.3.6"
        }
    }
    "#;

	// Open package.json file
	let package_json_path = current_dir.join("package.json");
	let mut package_json_file = match File::open(&package_json_path) {
		Ok(file) => file,
		Err(err) => {
			eprintln!("Error opening package.json file: {}", err);
			return;
		}
	};

	// Read package.json content
	let mut package_json_content = String::new();
	if let Err(err) = package_json_file.read_to_string(&mut package_json_content) {
		eprintln!("Error reading package.json content: {}", err);
		return;
	}

	// Append JSON content
	let mut new_content = package_json_content + json_content;

	// Write new content to a temporary file
	let package_json_tmp_path = current_dir.join("package.json.tmp");
	let mut package_json_tmp_file = match File::create(&package_json_tmp_path) {
		Ok(file) => file,
		Err(err) => {
			eprintln!("Error creating package.json.tmp file: {}", err);
			return;
		}
	};

	if let Err(err) = package_json_tmp_file.write_all(new_content.as_bytes()) {
		eprintln!("Error writing to package.json.tmp file: {}", err);
		return;
	}

	// Rename temporary file to package.json
	if let Err(err) = std::fs::rename(&package_json_tmp_path, &package_json_path) {
		eprintln!("Error renaming package.json.tmp to package.json: {}", err);
		return;
	}
}
