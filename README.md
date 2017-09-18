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
**C PCRE2** | 26.11 | 24.87 | 6.26 | 57.23
**Rust** | 29.86 | 28.82 | 6.34 | 65.02
**PHP** | 54.36 | 50.78 | 5.33 | 110.47
**Javascript** | 74.49 | 62.35 | 1.86 | 138.71
**Perl** | 244.88 | 169.18 | 44.61 | 458.67
**Crystal** | 345.39 | 284.62 | 28.10 | 658.12
**Ruby** | 348.34 | 304.18 | 54.15 | 706.68
**Python PyPy** | 209.90 | 175.40 | 331.49 | 716.80
**D** | 478.13 | 489.90 | 9.08 | 977.12
**Java** | 382.92 | 450.79 | 294.18 | 1127.88
**Python 2** | 366.78 | 285.84 | 507.35 | 1159.96
**Kotlin** | 395.54 | 473.11 | 297.26 | 1165.91
**Python 3** | 571.89 | 419.63 | 498.56 | 1490.08
**Go** | 425.08 | 412.62 | 715.08 | 1552.77
**C# .Net Core** | 1937.64 | 1679.95 | 112.29 | 3729.88
**C# Mono** | 2442.07 | 2030.78 | 156.07 | 4628.92

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
