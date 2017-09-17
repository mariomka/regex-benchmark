# Languages Regex Benchmark

It's just a simple regex benchmark for different programming languages.

Measures how long it takes to find and count non-overlapping occurrences.

Isn't a Holy Grail of the regex benchmarks. It can be helpful for choosing a language but it's not only about performance, each language has its engine and offers different features (like UTF support, backreferences, capturing groups...)

## Input text

The [input text](input-text.txt) is a concatenation of [Learn X in Y minutes](https://github.com/adambard/learnxinyminutes-docs) repository.

*Maybe isn't the best representative text. I'm searching other texts to add to the benchmark.*

## Regex patterns

- Email: ``[\w\.+-]+@[\w\.-]+\.[\w\.-]+``
- URI: ``[\w]+://[^/\s?#]+[^\s?#]+(?:\?[^\s#]*)?(?:#[^\s]*)?``
- IPv4: ``(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9])\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9])``

The above regex patterns aren't the best or the optimal. The focus is the benchmark, not the matching.

The patterns are applied to the whole file.

## Measure

Measuring is done inside the programs to avoid include startup, reading and writing times on results.

Elapsed time include pattern compilation, find and count occurrences.

## Performance

System: MacBook Pro (Retina, 15-inch, Late 2013), 2.3 GHz Intel Core i7, 16 GB 1600 Mhz DDR3 with macOS Sierra 10.12.5.

Language | Email(ms) | URI(ms) | IP(ms) | Total(ms)
--- | ---: | ---: | ---: | ---:
**Rust 1.20.0** | 28.53 | 28.46 | 6.25 | 63.24
**PHP 7.1.7** | 52.62 | 49.86 | 5.40 | 107.89
**Javascript - Node.js 7.7.3** | 73.99 | 61.30 | 1.85 | 137.14
**Perl 5.26.0** | 238.71 | 165.46 | 44.26 | 448.42
**Crystal 0.23.1** | 334.76 | 274.69 | 26.41 | 635.86
**Ruby 2.4.1** | 331.64 | 292.05 | 52.25 | 675.94
**Python - PyPy 5.8.0** | 201.93 | 171.11 | 319.39 | 692.43
**Java 1.8.0** | 372.71 | 451.11 | 287.84 | 1111.67
**Python 2.7.13** | 357.34 | 277.52 | 486.35 | 1121.21
**Kotlin 1.1.4** | 385.41 | 461.78 | 289.76 | 1136.95
**Python 3.6.2** | 542.00 | 401.42 | 470.92 | 1414.35
**Go 1.8.3** | 407.80 | 401.74 | 695.69 | 1505.22
**C - PCRE 2 10.30** | 220.65 | 1584.60 | 21.55 | 1826.80
**C# - .Net Core 2.0.0** | 1898.46 | 1640.94 | 108.89 | 3648.28
**C# - Mono 5.2.0** | 2365.17 | 1982.16 | 153.94 | 4501.28

- **Language**: Indicates language and version.
- **Email(ms)**, **URI(ms)**, **IP(ms)**: Indicates the time elapsed in milliseconds for find and count non-overlapping occurrences for the pattern.
- **Total(ms)**: Indicates the sum of the above times.

# Contributing

All contributions are welcome, from the tiny optimizations to new implementations.

The requirement is following the current implementations style.

# Kudos

- Heng Li's for his work on [Benchmark of Regex Libraries](http://lh3lh3.users.sourceforge.net/reb.shtml).
- A "challenge" on [Madrid Devs](http://madriddevs.org/) group inspired me.
- [Programming subreddit](https://www.reddit.com/r/programming/), helped me to improve the benchmark.

# License

MIT © [Mario Juárez](https://github.com/mariomka).
