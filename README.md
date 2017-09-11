# Languages Regex Benchmark

It's just a simple regex benchmark for different languages.

## Input text

The [input text](input-text.txt) is a concatenation of [Learn X in Y minutes](https://github.com/adambard/learnxinyminutes-docs) repository.

## Regex patterns

- Email: ``[\w\.+-]+@[\w\.+-]+\.[\w\.-]+``
- URI: ``[\w]+://[^/\s?#]+[^\s?#]+(?:\?[^\s#]*)?(?:#[^\s]*)?``
- IPv4: ``(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9])\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9])``

The above regex patterns aren't the best or the optimal. The benchmark is the objective, not the matching.

The patterns are applied to the whole file.

## Running

[Bench](https://github.com/Gabriel439/bench) is used to measure the results.

## Performance

System: MacBook Pro (Retina, 15-inch, Late 2013), 2.3 GHz Intel Core i7, 16 GB 1600 Mhz DDR3 with macOS Sierra 10.12.5.

Language | Email(ms) | URI(ms) | IP(ms) | Total(ms)
--- | ---: | ---: | ---: | ---:
**Crystal 0.23.1** | 385.10  | 329.00 | 51.36 | 765.46
**Javascript - Node.js 7.7.3** | 183.80  | 167.90 | 100.50 | 452.20
**PHP 7.1.7** | 95.52 | 90.87 | 41.80 | 228.19
**Python 2.7.13** | 426.30 | 349.10 | 580.60 | 1356.00
**Python 3.6.2** | 723.40 | 570.20 | 659.70 | 1953.3
**Python - PyPy 5.8.0** | 280.70 | 256.60 | 446.7 | 984.00
**Rust 1.20.0** | 49.07 | 49.67 | 21.81 | 120.55

*Sorted alphabetically.*

- **Language**: Indicates language and version.
- **Email(ms)**, **URI(ms)**, **IP(ms)**: Indicates the time elapsed in milliseconds for finding all matches for the pattern.
- **Total(ms)**: Indicates the total time elapsed in milliseconds for finding all matches.

# Contributing

All contributions are welcome, from the tiny optimizations to new implementations.

The requirement is following the current implementations style.

# Kudos

- Heng Li's for his work on [Benchmark of Regex Libraries](http://lh3lh3.users.sourceforge.net/reb.shtml).
- [Madrid Devs](http://madriddevs.org/).

# License

MIT © [Mario Juárez](https://github.com/mariomka).
