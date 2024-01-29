use std::process::Command;

fn main() {
	// Repository list
	let repositories = vec![
		"microsoft/applicationinsights-vscode",
		"microsoft/azure-boards-vscode",
		// Add more repositories here...
	];

	// Process each repository
	repositories.iter().for_each(|repository| {
		// Run the script for each repository
		if let Err(err) = script(repository) {
			eprintln!("Error processing repository {}: {}", repository, err);
		}
	});
}

fn script(repository: &str) -> Result<(), Box<dyn std::error::Error>> {
	// Compute directory path
	let directory = format!("/path/to/Cache/Repository/{}", repository);

	// Change directory
	let output = Command::new("sh").arg("-c").arg(format!("cd {}", directory)).output()?;

	// Print current directory
	println!("{}", std::str::from_utf8(&output.stdout)?);

	// Get origin URL
	let output = Command::new("git").args(&["remote", "get-url", "origin"]).output()?;
	let origin = String::from_utf8(output.stdout)?.trim().to_string();
	let origin = origin.replace("git@github.com:", "ssh://git@github.com/");

	// Set origin URL
	Command::new("git").args(&["remote", "set-url", "origin", &origin]).output()?;

	// Print origin URL
	println!("Origin: {}", origin);

	// Get upstream URL
	let output = Command::new("gh").args(&["repo", "view", "--json", "parent"]).output()?;
	let upstream_json = String::from_utf8(output.stdout)?;
	let upstream = match serde_json::from_str::<serde_json::Value>(&upstream_json) {
		Ok(json) => {
			let owner = json.get("parent").and_then(|parent| {
				parent
					.get("owner")
					.and_then(|owner| owner.get("login"))
					.and_then(|login| login.as_str())
			});
			let name = json
				.get("parent")
				.and_then(|parent| parent.get("name").and_then(|name| name.as_str()));
			match (owner, name) {
				(Some(owner), Some(name)) => {
					Some(format!("ssh://git@github.com/{}/{}.git", owner, name))
				}
				_ => None,
			}
		}
		Err(_) => None,
	};

	// Set upstream URL if exists
	if let Some(upstream) = upstream {
		// Print upstream URL
		println!("Upstream: {}", upstream);

		// Remove existing upstream remote
		Command::new("git").args(&["remote", "remove", "upstream"]).output()?;

		// Add new upstream remote
		Command::new("git").args(&["remote", "add", "upstream", &upstream]).output()?;
	}

	Ok(())
}
