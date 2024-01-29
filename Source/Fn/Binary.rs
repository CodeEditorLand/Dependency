use clap::{arg, Command};
use Cache::Get::Fn;

pub fn main() {
	if Command::new("Land")
		.version("0.1.0")
		.author("Nikola R. Hristov <nikola@nikolahristov.tech>")
		.about("Build")
		.arg(arg!(--process <VALUE>).required(true))
		.get_matches()
		.get_one::<String>("process")
		.expect("required")
		== "get"
	{
		Fn();
	} else {
		eprintln!("Invalid process specified. Please use 'get'.");
	}
}
