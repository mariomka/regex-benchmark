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
**Rust 1.20.0** | 45.61 | 46.29 | 21.76 | 113.66
**PHP 7.1.7** | 88.41 | 83.44 | 38.46 | 210.31
**Javascript - Node.js 7.7.3** | 172.80 | 152.45 | 90.27 | 415.52
**Crystal 0.23.1** | 361.61 | 303.85 | 48.13 | 713.58
**Ruby 2.4.1** | 400.44 | 354.80 | 106.67 | 861.91
**Python - PyPy 5.8.0** | 250.49 | 236.23 | 418.69 | 905.41
**Python 2.7.13** | 393.26 | 314.66 | 538.85 | 1246.77
**Java 1.8.0** | 563.25 | 547.28 | 431.13 | 1541.67
**Go 1.8.3** | 436.73 | 431.54 | 746.73 | 1614.99
**Python 3.6.2** | 654.93 | 523.40 | 595.08 | 1773.41
**Kotlin 1.1.4** | 642.04 | 659.61 | 526.57 | 1828.22
**C# - .Net Core 2.0.0** | 2057.50 | 1826.86 | 224.96 | 4109.32
**C# - Mono 5.2.0** | 2489.39 | 2158.94 | 264.32 | 4912.65

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
