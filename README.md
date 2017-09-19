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
**C PCRE2** | 25.62 | 24.47 | 5.71 | 55.81
**Rust** | 30.42 | 31.64 | 6.62 | 68.69
**PHP** | 53.76 | 49.58 | 5.38 | 108.71
**Javascript** | 76.50 | 63.95 | 1.95 | 142.40
**D ldc** | 147.53 | 139.26 | 5.30 | 292.09
**Perl** | 248.28 | 169.33 | 45.71 | 463.32
**Crystal** | 367.64 | 302.68 | 30.48 | 700.81
**Ruby** | 351.88 | 310.57 | 53.62 | 716.07
**Python PyPy** | 205.90 | 176.65 | 334.60 | 717.14
**D dmd** | 487.47 | 477.21 | 6.62 | 971.30
**Kotlin** | 392.17 | 441.77 | 294.75 | 1128.69
**Java** | 381.74 | 461.25 | 298.24 | 1141.23
**Python 2** | 367.53 | 287.20 | 506.07 | 1160.81
**Python 3** | 563.77 | 414.82 | 494.74 | 1473.34
**Go** | 421.26 | 418.92 | 721.55 | 1561.73
**C# .Net Core** | 1958.69 | 1696.62 | 113.94 | 3769.25
**C# Mono** | 2540.13 | 2116.65 | 162.86 | 4819.64

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
