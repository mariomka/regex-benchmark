extern crate regex;

use std::env;
use std::process;
use regex::Regex;
use std::io::Read;
use std::fs::File;

fn main() {
    if env::args().len() != 3 {
        println!("Usage: line-per-line <filename> <regex-name>");
        process::exit(1);
    }

    let pattern = match env::args().nth(2).unwrap().as_ref() {
        "email" => r"[\w\.+-]+@[\w\.-]+\.[\w\.-]+",
        "uri" => r"[\w]+://[^/\s?#]+[^\s?#]+(?:\?[^\s#]*)?(?:#[^\s]*)?",
        "ip" => r"(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9])\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9])",
        _ => {
            println!("Regex name must be: email, uri or ip.");
            process::exit(1);
        }
    };

    let regex = Regex::new(pattern).unwrap();

    let mut count = 0;

    let mut file = File::open(env::args().nth(1).unwrap()).unwrap();
    let mut data = String::new();
    file.read_to_string(&mut data).unwrap();

    for captures in regex.captures_iter(&data) {
        count += captures.len();
    }

    println!("{} found.", count);
}
