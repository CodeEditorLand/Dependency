use clap::{arg, Command};

pub fn main() {
	let matches = Command::new("Land")
		.version("0.1.0")
		.author("Nikola R. Hristov <nikola@nikolahristov.tech>")
		.about("Build")
		.arg(arg!(--category <VALUE>).required(true))
		.arg(arg!(--process <VALUE>).required(true))
		.get_matches();

	let category =
		matches.get_one::<String>("category").expect("Cannot get the value of category!");

	let process = matches.get_one::<String>("process").expect("Cannot get the value of process!");

	if category == "cache" {
		if process == "get" {
			Cache::Get::Fn();
		}
	} else {
		eprintln!("Invalid process specified. Please use 'get'.");
	}
}
