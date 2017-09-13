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
**Crystal 0.23.1** | 387.64 | 337.41 | 51.57 | 776.63
**C# - Mono 5.2.0** | 2747.65 | 2420.84 | 293.70 | 5462.19
**C# - .Net Core 2.0.0** | 2294.17 | 2039.31 | 243.44 | 4576.92
**Go 1.8.3** | 488.42 | 476.93 | 821.02 | 1786.37
**Java 1.8.0** | 606.52 | 592.29 | 444.14 | 1642.95
**Javascript - Node.js 7.7.3** | 185.43 | 167.20 | 99.67 | 452.30
**Kotlin 1.1.4** | 692.58 | 687.12 | 558.30 | 1938.00
**PHP 7.1.7** | 95.80 | 91.64 | 41.54 | 228.98
**Python 2.7.13** | 444.19 | 342.43 | 598.85 | 1385.47
**Python 3.6.2** | 714.17 | 584.29 | 667.22 | 1965.69
**Python - PyPy 5.8.0** | 278.82 | 264.67 | 464.17 | 1007.66
**Ruby 2.4.1** | 442.29 | 393.10 | 116.86 | 952.25
**Rust 1.20.0** | 49.56 | 49.66 | 23.32 | 122.53

*Sorted alphabetically.*

- **Language**: Indicates language and version.
- **Email(ms)**, **URI(ms)**, **IP(ms)**: Indicates the time elapsed in milliseconds for finding all matches for the pattern.
- **Total(ms)**: Indicates the total time elapsed in milliseconds for finding all matches.

# Contributing

All contributions are welcome, from the tiny optimizations to new implementations.

The requirement is following the current implementations style.

# Kudos

- Heng Li's for his work on [Benchmark of Regex Libraries](http://lh3lh3.users.sourceforge.net/reb.shtml).
- A "challenge" on [Madrid Devs](http://madriddevs.org/) group inspired me.

# License

MIT © [Mario Juárez](https://github.com/mariomka).
