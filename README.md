# Languages Regex Benchmark

It's just a simple regex benchmark for different programming languages.

Measures how long it takes to find and count non-overlapping occurrences.

> All benchmarks are wrong, but some are useful - [Szilard](https://github.com/szilard), [benchm-ml](https://github.com/szilard/benchm-ml)

I hope this benchmark can be helpful for choosing a language but it's not only about performance, each language has its engine and offers different features (like UTF support, backreferences, capturing groups...)

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
**C PCRE2** | 25.00 | 25.02 | 5.65 | 55.66
**Rust** | 31.31 | 31.73 | 6.75 | 69.79
**PHP** | 54.39 | 50.22 | 5.80 | 110.40
**Javascript** | 74.88 | 63.09 | 2.02 | 140.00
**D ldc** | 146.01 | 140.03 | 5.19 | 291.24
**D dmd** | 205.52 | 200.30 | 5.59 | 411.41
**Perl** | 246.91 | 170.74 | 45.60 | 463.24
**Crystal** | 339.79 | 280.74 | 27.03 | 647.56
**Python PyPy** | 207.96 | 177.18 | 329.85 | 714.99
**Ruby** | 354.16 | 308.55 | 52.73 | 715.44
**Java** | 382.57 | 456.34 | 297.66 | 1136.57
**Kotlin** | 395.23 | 474.31 | 293.53 | 1163.07
**Python 2** | 368.85 | 286.70 | 514.10 | 1169.65
**Python 3** | 565.71 | 416.32 | 493.07 | 1475.09
**Go** | 423.53 | 415.45 | 722.53 | 1561.51
**C# .Net Core** | 1952.13 | 1681.00 | 111.32 | 3744.45
**C# Mono** | 2463.84 | 2088.87 | 153.78 | 4706.49

- **Language**: Indicates the language.
- **Email(ms)**, **URI(ms)**, **IP(ms)**: Indicates the time elapsed in milliseconds for find and count non-overlapping occurrences for the pattern.
- **Total(ms)**: Indicates the sum of the above times.

### Versions and notes

- **C**: Apple LLVM 8.1.0 (clang-802.0.42) with PCRE2 10.30 with JIT.
- **Crystal**: crystal 0.23.1
- **C#**: dotnet 2.0.0 | mono 5.2.0.215
- **D**: dmd64 v2.076.0 | ldc v1.3.0
- **Go**: go 1.8.3
- **Java**: java 11 (Hotspot OpenJDK 11+28)
- **Javascript**: node v7.7.3
- **Kotlin**: kotlinc 1.1.4
- **Perl**: perl v5.26.0
- **PHP**: PHP 7.1.7
- **Python**: Python 2.7.13 | Python 3.6.2 | PyPy 5.8.0
- **Ruby**: ruby 2.4.1p111
- **Rust**: rustc 1.20.0

# Contributing

All contributions are welcome, from the tiny optimizations to new implementations.

The requirement is following the current implementations style.

# Kudos

- Heng Li's for his work on [Benchmark of Regex Libraries](http://lh3lh3.users.sourceforge.net/reb.shtml).
- A "challenge" on [Madrid Devs](http://madriddevs.org/) group inspired me.
- [Programming subreddit](https://www.reddit.com/r/programming/), helped me to improve the benchmark.

# License

MIT © [Mario Juárez](https://github.com/mariomka).
