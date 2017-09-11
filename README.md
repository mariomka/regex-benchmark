# Languages Regex Benchmark

It's just a simple regex benchmark for different languages.

## Input text

The [input text](input-text.txt) is a concatenation of [Learn X in Y minutes](https://github.com/adambard/learnxinyminutes-docs) repository.

## Regex patterns

- Email: ``[\w\.+-]+@[\w\.-]+\.[\w\.-]+``
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
**Crystal 0.23.1** | 382.56 | 323.58 | 48.94 | 755.09
**C# - Mono 5.2.0** | 2669.56 | 2279.67 | 276.63 | 5225.86
**C# - .Net Core 2.0.0** | 2170.21 | 1940.08 | 232.88 | 4343.17
**Java 1.8.0** | 630.60 | 640.21 | 471.59 | 1742.40
**Javascript - Node.js 7.7.3** | 178.17 | 158.72 | 94.10 | 430.99
**PHP 7.1.7** | 98.13 | 85.89 | 38.91 | 222.93
**Python 2.7.13** | 422.05 | 331.02 | 577.62 | 1330.69
**Python 3.6.2** | 690.24 | 550.66 | 626.37 | 1867.28
**Python - PyPy 5.8.0** | 262.74 | 241.81 | 417.53 | 922.08
**Ruby 2.4.1** | 420.07 | 373.13 | 110.94 | 904.15
**Rust 1.20.0** | 46.68 | 47.23 | 21.95 | 115.85

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
