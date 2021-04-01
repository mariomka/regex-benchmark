# Languages Regex Benchmark (Optimized)

> This is an **optimized** version of the benchmark. It allows code and settings optimizations but keeping the measure, code style/structure and regex patterns.

It's just a simple regex benchmark for different programming languages.

Measures how long it takes to find and count non-overlapping occurrences.

> All benchmarks are wrong, but some are useful - [Szilard](https://github.com/szilard), [benchm-ml](https://github.com/szilard/benchm-ml)

I hope this benchmark can be helpful, but it's not only about performance, but each language also has its engine and offers different features (like UTF support, backreferences, capturing groups ...)

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

> The following results are for the optimized version. [Go to default version](https://github.com/mariomka/regex-benchmark/tree/master).

Docker image was run on: MacBook Pro (Retina, 15-inch, 2017), 2.8 GHz Intel Core i7, 16 GB 1600 Mhz DDR3 with macOS Catalina 10.15.3.

Language | Email(ms) | URI(ms) | IP(ms) | Total(ms)
--- | ---: | ---: | ---: | ---:
**Rust** | 11.43 | 11.40 | 5.11 | 27.94
**Nim Regex** | 1.37 | 25.51 | 7.27 | 34.15
**Nim** | 22.79 | 21.64 | 6.77 | 51.21
**C PCRE2** | 46.22 | 36.92 | 4.73 | 87.87
**PHP** | 43.18 | 46.71 | 5.23 | 95.12
**C++ Boost** | 44.68 | 44.50 | 15.10 | 104.28
**Javascript** | 59.20 | 47.67 | 1.61 | 108.48
**C# .Net Core** | 61.76 | 47.86 | 11.63 | 121.25
**Perl** | 96.00 | 63.39 | 20.59 | 179.99
**Julia** | 104.31 | 87.98 | 5.16 | 197.45
**Crystal** | 129.52 | 116.33 | 13.12 | 258.97
**Dart** | 105.82 | 107.78 | 78.18 | 291.78
**D ldc** | 167.60 | 165.71 | 5.07 | 338.37
**D dmd** | 187.66 | 192.16 | 5.55 | 385.37
**Ruby** | 236.93 | 206.51 | 43.70 | 487.14
**Python PyPy2** | 161.33 | 143.56 | 258.06 | 562.96
**Dart Native** | 273.17 | 306.14 | 5.89 | 585.20
**Python 2** | 200.54 | 132.89 | 290.26 | 623.69
**Kotlin** | 184.13 | 220.31 | 273.76 | 678.21
**Java** | 190.74 | 223.77 | 275.24 | 689.75
**Python PyPy3** | 268.41 | 226.74 | 261.17 | 756.32
**Python 3** | 273.70 | 194.09 | 322.09 | 789.88
**Go** | 244.14 | 238.40 | 365.27 | 847.81
**C++ STL** | 433.18 | 341.07 | 246.85 | 1021.10
**C# Mono** | 1400.04 | 1189.50 | 145.73 | 2735.28

- **Language**: Indicates the language.
- **Email(ms)**, **URI(ms)**, **IP(ms)**: Indicates the time elapsed in milliseconds for finding and counting non-overlapping occurrences for the pattern.
- **Total(ms)**: Indicates the sum of the above times.

### Versions and notes

- **C**: gcc 7.5.0 & PCRE2 10.36-2
- **Crystal**: crystal 0.35.1 - LLVM: 8.0.0
- **C++**: g++ 7.5.0 | Boost 1.65.1.0
- **C#**: dotnet 5.0.201 | Mono 6.12.0.122
- **D**: DMD v2.089.0 | LDC 1.8.0
- **Dart**: Dart 2.12.2
- **Go**: go 1.16.2
- **Java**: OpenJDK 11.0.10
- **Javascript**: node v15.13.0
- **Julia**: Julia 1.6.0
- **Kotlin**: kotlinc-jvm 1.4.32
- **Nim**: Nim 1.4.4
- **Perl**: perl v5.26.1
- **PHP**: PHP 8.0.3
- **Python**: Python 2.7.17 | Python 3.6.9 | PyPy 7.3.3
- **Ruby**: ruby 2.5.1p57
- **Rust**: rustc 1.51.0 & regex 1.4.5

# How to run

The easiest way to run the benchmark is by using Docker.

```sh
git clone https://github.com/mariomka/regex-benchmark.git
git checkout optimized
cd regex-benchmark
docker run --rm -v $(pwd):/var/regex mariomka/regex-benchmark:1.6
```

# Contributing

All contributions are welcome, from tiny optimizations to new implementations.

There are only a few requirements:
- Follow the style of the current implementations
- Update `Dockerfile` if it's necessary

# Kudos

- Heng Li's for his work on [Benchmark of Regex Libraries](http://lh3lh3.users.sourceforge.net/reb.shtml).
- A "challenge" on [Madrid Devs](http://madriddevs.org/) group inspired me.
- [Programming subreddit](https://www.reddit.com/r/programming/), helped me to improve the benchmark.

# License

MIT © [Mario Juárez](https://github.com/mariomka).
