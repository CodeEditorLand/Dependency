use std::fs;

fn main() {
	println!("cargo:rerun-if-changed=Cargo.toml");
	println!(
		"cargo:rustc-env=CARGO_PKG_VERSION={}",
		fs::read_to_string("Cargo.toml")
			.expect("Failed to read Cargo.toml.")
			.lines()
			.find(|line| line.starts_with("version"))
			.unwrap()
			.split('=')
			.nth(1)
			.expect("Invalid version line format.")
			.trim()
			.trim_matches('"')
	);
}
