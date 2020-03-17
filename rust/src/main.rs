extern crate regex;

use std::env;
use std::process;
use std::io::Read;
use std::fs::File;
use std::time::Instant;

use regex::bytes::Regex;

fn measure(data: &Vec<u8>, pattern: String) {

    let start = Instant::now();

    let regex = Regex::new(&pattern).unwrap();

    let count = regex.find_iter(&data).count();

    let elapse = start.elapsed().as_millis();

    println!("{} - {}", elapse, count);
}

fn main() {
    
    if env::args().len() != 2 {
        println!("Usage: benchmark <filename>");
        process::exit(1);
    }

    let mut file = File::open(env::args().nth(1).unwrap()).unwrap();

    let mut data = Vec::<u8>::new();

    file.read_to_end(&mut data).unwrap();

    // Email
    measure(&data, r"(?-u)[\w\.+-]+@[\w\.-]+\.[\w\.-]+".to_string());

    // URI
    measure(&data, r"(?-u)[\w]+://[^/\s?#]+[^\s?#]+(?:\?[^\s#]*)?(?:#[^\s]*)?".to_string());

    // IP
    measure(&data, r"(?-u)(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9])\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9])".to_string());
}
