extern crate time;
extern crate regex;

use std::env;
use std::process;
use regex::Regex;
use std::io::Read;
use std::fs::File;
use time::precise_time_ns;

fn measure(data: String, pattern: String) {
    let mut count = 0;
    let start = precise_time_ns();

    let regex = Regex::new(&pattern).unwrap();
    for captures in regex.captures_iter(&data) {
        count += captures.len();
    }

    let elapse = precise_time_ns() - start;

    println!("{} - {}", elapse as f64 / 1000000.0, count);
}

fn main() {
    if env::args().len() != 2 {
        println!("Usage: benchmark <filename>");
        process::exit(1);
    }

    let mut file = File::open(env::args().nth(1).unwrap()).unwrap();
    let mut data = String::new();

    file.read_to_string(&mut data).unwrap();

    // Email
    measure(data.clone(), r"[\w\.+-]+@[\w\.-]+\.[\w\.-]+".to_string());

    // URI
    measure(data.clone(), r"[\w]+://[^/\s?#]+[^\s?#]+(?:\?[^\s#]*)?(?:#[^\s]*)?".to_string());

    // IP
    measure(data.clone(), r"(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9])\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9])".to_string());
}
