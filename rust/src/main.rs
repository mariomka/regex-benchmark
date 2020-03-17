use std::time::Instant;

use regex::bytes::RegexBuilder;

fn measure(data: &str, pattern: &str) {
    let start = Instant::now();

    let regex = RegexBuilder::new(pattern).unicode(false).build().unwrap();
    let count = regex.find_iter(data.as_bytes()).count();

    let elapsed = Instant::now().duration_since(start);

    println!("{} - {}", elapsed.as_secs_f64() * 1e3, count);
}

fn main() -> Result<(), Box<dyn std::error::Error + Send + Sync>> {
    let path = match std::env::args_os().nth(1) {
        None => return Err(From::from("Usage: benchmark <filename>")),
        Some(path) => path,
    };
    let data = std::fs::read_to_string(path)?;

    // Email
    measure(&data, r"[\w\.+-]+@[\w\.-]+\.[\w\.-]+");

    // URI
    measure(&data, r"[\w]+://[^/\s?#]+[^\s?#]+(?:\?[^\s#]*)?(?:#[^\s]*)?");

    // IP
    measure(&data, r"(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9])\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9])");

    Ok(())
}
