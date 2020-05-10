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
**Nim** | 28.28 | 28.58 | 9.20 | 66.06
**PHP** | 29.20 | 28.05 | 9.12 | 66.37
**Rust** | 59.58 | 56.31 | 6.63 | 122.52
**Javascript** | 81.87 | 67.16 | 2.04 | 151.07
**C++ Boost** | 92.99 | 92.21 | 31.16 | 216.36
**Perl** | 119.22 | 84.36 | 53.89 | 257.47
**Dart** | 161.10 | 156.19 | 148.52 | 465.82
**Crystal** | 322.07 | 284.07 | 25.16 | 631.30
**C PCRE2** | 325.02 | 297.94 | 37.61 | 660.57
**Python PyPy2** | 215.48 | 197.57 | 374.35 | 787.40
**D dmd** | 394.74 | 408.07 | 9.79 | 812.60
**Ruby** | 419.26 | 374.27 | 68.22 | 861.75
**D ldc** | 452.97 | 456.02 | 9.77 | 918.76
**Python PyPy3** | 354.38 | 314.82 | 367.19 | 1036.39
**Go** | 338.22 | 342.98 | 514.72 | 1195.92
**Kotlin** | 281.21 | 312.83 | 730.56 | 1324.60
**Java** | 310.30 | 326.81 | 732.19 | 1369.30
**Python 2** | 977.37 | 332.51 | 1200.50 | 2510.39
**C++ STL** | 895.50 | 783.38 | 1071.07 | 2749.95
**Python 3** | 1134.41 | 397.06 | 1220.28 | 2751.75
**Dart Native** | 2114.06 | 2399.51 | 38.76 | 4552.32
**C# .Net Core** | 2414.70 | 2053.11 | 150.13 | 4617.94
**C# Mono** | 3958.80 | 3291.35 | 217.47 | 7467.61

### Optimized

> The following results are for the [optimized version](https://github.com/mariomka/regex-benchmark/tree/optimized).

Language | Email(ms) | URI(ms) | IP(ms) | Total(ms)
--- | ---: | ---: | ---: | ---:
**Rust** | 16.42 | 15.54 | 6.90 | 38.86
**C PCRE2** | 30.94 | 27.14 | 6.43 | 64.52
**PHP** | 28.79 | 27.81 | 9.15 | 65.74
**Nim** | 28.56 | 28.37 | 9.20 | 66.13
**Javascript** | 80.64 | 66.53 | 2.08 | 149.25
**C++ Boost** | 90.57 | 90.59 | 30.51 | 211.68
**Perl** | 119.25 | 84.61 | 54.35 | 258.22
**Dart** | 159.45 | 154.45 | 147.60 | 461.50
**Crystal** | 312.54 | 276.46 | 24.19 | 613.19
**Python PyPy2** | 215.31 | 198.09 | 369.29 | 782.69
**D dmd** | 383.71 | 398.64 | 10.34 | 792.69
**Ruby** | 425.79 | 375.77 | 69.13 | 870.70
**D ldc** | 447.77 | 452.37 | 9.33 | 909.48
**Python PyPy3** | 351.28 | 311.91 | 358.64 | 1021.84
**Go** | 341.41 | 344.39 | 523.33 | 1209.13
**Java** | 263.55 | 314.37 | 719.25 | 1297.17
**Kotlin** | 279.78 | 312.16 | 715.65 | 1307.58
**Python 2** | 974.39 | 330.55 | 1200.23 | 2505.17
**C++ STL** | 867.84 | 743.66 | 937.08 | 2548.58
**Python 3** | 1122.67 | 398.51 | 1206.83 | 2728.01
**C# .Net Core** | 2329.68 | 2005.52 | 143.48 | 4478.68
**Dart Native** | 2116.81 | 2396.46 | 38.58 | 4551.85
**C# Mono** | 2384.82 | 1991.34 | 216.20 | 4592.36

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
