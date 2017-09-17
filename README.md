# Languages Regex Benchmark

It's just a simple regex benchmark for different programming languages.

Measures how long it takes to find and count non-overlapping occurrences.

Isn't a Holy Grail of the regex benchmarks. It can be helpful for choosing a language but it's not only about performance, each language has his engine and offers different features (like UTF support, backreferences, capturing groups...)

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

Elapsed times include pattern compilation, find and count matches.

## Performance

System: MacBook Pro (Retina, 15-inch, Late 2013), 2.3 GHz Intel Core i7, 16 GB 1600 Mhz DDR3 with macOS Sierra 10.12.5.

Language | Email(ms) | URI(ms) | IP(ms) | Total(ms)
--- | ---: | ---: | ---: | ---:
**Rust 1.20.0** | 28.56 | 28.14 | 6.27 | 62.97
**PHP 7.1.7** | 52.30 | 48.37 | 5.42 | 106.08
**Javascript - Node.js 7.7.3** | 75.87 | 62.27 | 1.87 | 140.01
**Crystal 0.23.1** | 335.51 | 275.13 | 26.79 | 637.43
**Ruby 2.4.1** | 331.58 | 289.28 | 50.63 | 671.49
**Python - PyPy 5.8.0** | 201.65 | 170.32 | 322.11 | 694.08
**Java 1.8.0** | 375.83 | 451.56 | 282.60 | 1109.98
**Kotlin 1.1.4** | 385.40 | 444.00 | 285.00 | 1114.40
**Python 2.7.13** | 355.43 | 276.82 | 489.56 | 1121.82
**Python 3.6.2** | 552.37 | 403.05 | 482.01 | 1437.42
**Go 1.8.3** | 410.58 | 403.68 | 699.88 | 1514.14
**C# - .Net Core 2.0.0** | 1888.54 | 1631.34 | 108.89 | 3628.77
**C# - Mono 5.2.0** | 2329.62 | 1953.92 | 152.58 | 4436.13

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
