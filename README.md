# Languages Regex Benchmark

It's just a simple regex benchmark for different programming languages.

Measures how long it takes to find and count non-overlapping occurrences with **default settings**.

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

Docker image was run on: MacBook Pro (Retina, 15-inch, 2017), 2.8 GHz Intel Core i7, 16 GB 1600 Mhz DDR3 with macOS Catalina 10.15.3.

Language | Email(ms) | URI(ms) | IP(ms) | Total(ms)
--- | ---: | ---: | ---: | ---:
**PHP** | 28.65 | 28.16 | 9.14 | 65.95
**Nim** | 28.51 | 28.70 | 9.34 | 66.55
**Rust** | 58.02 | 56.57 | 6.68 | 121.26
**Javascript** | 80.64 | 66.08 | 2.07 | 148.79
**C++ Boost** | 91.91 | 90.49 | 30.87 | 213.27
**Perl** | 119.21 | 84.16 | 50.87 | 254.24
**Dart** | 159.02 | 156.80 | 147.42 | 463.24
**Crystal** | 309.38 | 276.27 | 23.99 | 609.64
**C PCRE2** | 316.15 | 290.52 | 36.25 | 642.93
**Python PyPy2** | 217.51 | 194.75 | 375.67 | 787.93
**D dmd** | 383.97 | 396.27 | 9.50 | 789.74
**Ruby** | 427.38 | 373.20 | 68.10 | 868.69
**D ldc** | 446.19 | 451.91 | 9.37 | 907.48
**Python PyPy3** | 349.46 | 310.80 | 358.30 | 1018.56
**Go** | 339.67 | 341.59 | 514.33 | 1195.58
**Kotlin** | 280.55 | 318.19 | 718.12 | 1316.86
**Java** | 285.24 | 316.65 | 758.83 | 1360.72
**Python 2** | 974.68 | 329.36 | 1206.70 | 2510.74
**C++ STL** | 874.57 | 750.66 | 1035.19 | 2660.42
**Python 3** | 1140.98 | 392.79 | 1214.10 | 2747.86
**C# .Net Core** | 2333.01 | 2006.57 | 142.39 | 4481.96
**Dart Native** | 2129.82 | 2415.06 | 39.12 | 4584.00
**C# Mono** | 3945.79 | 3258.92 | 216.47 | 7421.17

- **Language**: Indicates the language.
- **Email(ms)**, **URI(ms)**, **IP(ms)**: Indicates the time elapsed in milliseconds for finding and counting non-overlapping occurrences for the pattern.
- **Total(ms)**: Indicates the sum of the above times.

### Versions and notes

- **C**: gcc 7.5.0 & PCRE2 10.31-2
- **Crystal**: crystal 0.34.0 - LLVM: 8.0.0
- **C++**: g++ 7.5.0 | Boost 1.65.1.0
- **C#**: dotnet 3.1.201 | Mono 6.8.0.105
- **D**: DMD v2.089.0 | LDC 1.8.0
- **Dart**: Dart 2.7.2
- **Go**: go 1.14.2
- **Java**: OpenJDK 11.0.7
- **Javascript**: node v13.14.0
- **Kotlin**: kotlinc-jvm 1.3.50
- **Nim**: Nim 1.2.0
- **Perl**: perl v5.26.1
- **PHP**: PHP 7.2.24
- **Python**: Python 2.7.17 | Python 3.6.0 | PyPy 7.2.0
- **Ruby**: ruby 2.5.1p57
- **Rust**: rustc 1.43.0 & regex 1.3.5

# How to run

The easiest way to run the benchmark is by using Docker.

```sh
git clone https://github.com/mariomka/regex-benchmark.git
cd regex-benchmark
docker run --rm -v $(pwd):/var/regex mariomka/regex-benchmark:1.5
```

# Contributing

All contributions are welcome, from tiny optimizations to new implementations.

There are only a few requirements:
- Follow the style of the current implementations
- Use the default settings for the regex engine
- Update `Dockerfile` if it's necessary

# Kudos

- Heng Li's for his work on [Benchmark of Regex Libraries](http://lh3lh3.users.sourceforge.net/reb.shtml).
- A "challenge" on [Madrid Devs](http://madriddevs.org/) group inspired me.
- [Programming subreddit](https://www.reddit.com/r/programming/), helped me to improve the benchmark.

# License

MIT © [Mario Juárez](https://github.com/mariomka).
