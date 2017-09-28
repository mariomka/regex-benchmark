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
**C PCRE2** | 26.10 | 25.33 | 5.60 | 57.03
**Rust** | 29.97 | 28.99 | 6.28 | 65.24
**PHP** | 54.04 | 50.99 | 5.33 | 110.35
**Javascript** | 74.07 | 63.12 | 1.92 | 139.10
**D ldc** | 145.71 | 138.03 | 5.09 | 288.83
**D dmd** | 202.59 | 200.88 | 5.46 | 408.92
**Perl** | 247.17 | 169.66 | 44.81 | 461.64
**Crystal** | 340.33 | 281.19 | 27.60 | 649.12
**Ruby** | 344.97 | 299.62 | 53.90 | 698.49
**Python PyPy** | 208.60 | 176.45 | 335.06 | 720.11
**Java** | 383.98 | 456.78 | 297.50 | 1138.26
**Python 2** | 369.52 | 287.59 | 506.10 | 1163.21
**Kotlin** | 400.89 | 466.42 | 297.16 | 1164.47
**Python 3** | 565.05 | 416.92 | 492.49 | 1474.46
**Go** | 425.90 | 419.22 | 720.68 | 1565.81
**C# .Net Core** | 1954.64 | 1691.29 | 110.97 | 3756.90
**C# Mono** | 2445.52 | 2096.15 | 152.45 | 4694.12

- **Language**: Indicates the language.
- **Email(ms)**, **URI(ms)**, **IP(ms)**: Indicates the time elapsed in milliseconds for find and count non-overlapping occurrences for the pattern.
- **Total(ms)**: Indicates the sum of the above times.

### Versions and notes

- **C**: Apple LLVM 8.1.0 (clang-802.0.42) with PCRE2 10.30 with JIT.
- **Crystal**: crystal 0.23.1
- **C#**: dotnet 2.0.0 | mono 5.2.0.215
- **D**: dmd64 v2.076.0 | ldc v1.3.0
- **Go**: go 1.8.3
- **Java**: java 1.8.0_131
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
