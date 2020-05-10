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
**Rust** | 16.82 | 16.50 | 7.03 | 40.34
**C PCRE2** | 31.50 | 27.39 | 6.39 | 65.28
**PHP** | 30.25 | 28.78 | 9.36 | 68.39
**Nim** | 30.45 | 29.80 | 10.31 | 70.57
**Javascript** | 83.18 | 67.87 | 2.12 | 153.16
**C++ Boost** | 93.85 | 94.29 | 31.70 | 219.84
**Perl** | 125.67 | 88.64 | 59.73 | 274.03
**Dart** | 160.64 | 157.93 | 153.12 | 471.69
**Crystal** | 319.36 | 283.66 | 24.57 | 627.59
**D dmd** | 399.17 | 408.93 | 9.78 | 817.87
**Python PyPy2** | 228.29 | 213.32 | 398.03 | 839.64
**Ruby** | 434.12 | 384.80 | 71.18 | 890.10
**D ldc** | 459.53 | 468.51 | 9.60 | 937.64
**Python PyPy3** | 373.30 | 337.43 | 385.02 | 1095.75
**Go** | 347.30 | 357.23 | 531.23 | 1235.76
**Kotlin** | 287.22 | 324.44 | 768.30 | 1379.96
**Java** | 302.91 | 334.33 | 742.75 | 1380.00
**Python 2** | 1000.39 | 340.19 | 1237.43 | 2578.01
**C++ STL** | 910.44 | 787.49 | 1077.83 | 2775.76
**Python 3** | 1161.25 | 405.61 | 1247.74 | 2814.60
**C# .Net Core** | 2409.07 | 2065.53 | 147.49 | 4622.09
**C# Mono** | 2452.05 | 2040.25 | 221.21 | 4713.50
**Dart Native** | 2196.88 | 2489.73 | 40.45 | 4727.06


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
git checkout optimized
cd regex-benchmark
docker run --rm -v $(pwd):/var/regex mariomka/regex-benchmark:1.5
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
