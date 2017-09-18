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
**C PCRE2** | 24.77 | 24.75 | 5.54 | 55.06
**Rust** | 31.11 | 29.36 | 6.58 | 67.06
**PHP** | 54.36 | 50.44 | 5.75 | 110.55
**Javascript** | 78.95 | 63.90 | 2.23 | 145.08
**Perl** | 249.23 | 167.75 | 45.21 | 462.19
**Crystal** | 342.55 | 279.80 | 27.88 | 650.23
**Ruby** | 342.03 | 299.24 | 52.19 | 693.46
**Python PyPy** | 202.64 | 172.73 | 330.06 | 705.44
**D** | 507.24 | 477.80 | 6.86 | 991.89
**Python 2** | 367.86 | 287.47 | 508.55 | 1163.88
**Java** | 385.92 | 477.95 | 300.31 | 1164.18
**Kotlin** | 396.76 | 477.55 | 298.82 | 1173.13
**Python 3** | 566.18 | 414.81 | 493.87 | 1474.87
**Go** | 432.99 | 424.71 | 729.95 | 1587.65
**C# .Net Core** | 1969.02 | 1706.32 | 113.67 | 3789.02
**C# Mono** | 2455.84 | 2042.34 | 159.66 | 4657.85

- **Language**: Indicates the language.
- **Email(ms)**, **URI(ms)**, **IP(ms)**: Indicates the time elapsed in milliseconds for find and count non-overlapping occurrences for the pattern.
- **Total(ms)**: Indicates the sum of the above times.

### Versions and notes

- **C**: Apple LLVM 8.1.0 (clang-802.0.42) with PCRE2 10.30 with JIT.
- **Crystal**: crystal 0.23.1
- **C#**: dotnet 2.0.0 | mono 5.2.0.215
- **D**: dmd64 v2.076.0
- **Go**: go 1.8.3
- **Java**: java 1.8.0_131
- **Javascript**: node v7.7.3
- **Kotlin**: kotlinc 1.1.4
- **Perl**: perl v5.26.0
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
