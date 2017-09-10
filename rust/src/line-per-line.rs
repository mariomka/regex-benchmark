extern crate regex;

use std::env;
use std::process;
use regex::Regex;
use std::io::BufReader;
use std::io::BufRead;
use std::fs::File;

fn main() {
    if env::args().len() != 2 {
        println!("Usage: line-per-line <filename>");
        process::exit(1);
    }

    let email_regex = Regex::new(r"[\w\.-]+@[\w\.-]*\.[\w]{2,}").unwrap();
    let uri_regex = Regex::new(r"[\w]+://[\w\.-]*(?:/[\w\.-?=&]*)?").unwrap();
    let ip_regex = Regex::new(r"\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}").unwrap();

    let mut email_count = 0;
    let mut uri_count = 0;
    let mut ip_count = 0;

    let file = File::open(env::args().nth(1).unwrap()).unwrap();
    let reader = BufReader::new(file);

    for line in reader.lines() {
        let line_un = line.unwrap();

        for captures in email_regex.captures_iter(&line_un) {
            email_count += captures.len();
        }

        for captures in uri_regex.captures_iter(&line_un) {
            uri_count += captures.len();
        }

        for captures in ip_regex.captures_iter(&line_un) {
            ip_count += captures.len();
        }
    }

    println!("{} emails found.", email_count);
    println!("{} URIs found.", uri_count);
    println!("{} IPs found.", ip_count);
}
