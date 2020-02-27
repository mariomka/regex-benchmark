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

Docker image was run on: MacBook Pro (Retina, 15-inch, 2017), 2.8 GHz Intel Core i7, 16 GB 1600 Mhz DDR3 with macOS Sierra 10.13.6.

Language | Email(ms) | URI(ms) | IP(ms) | Total(ms)
--- | ---: | ---: | ---: | ---:
**C PCRE2** | 23.65 | 23.41 | 6.59 | 53.66
**PHP** | 24.36 | 23.43 | 6.20 | 53.99
**Rust** | 24.56 | 26.00 | 7.11 | 57.67
**Javascript** | 68.47 | 54.71 | 1.76 | 124.93
**Perl** | 103.83 | 72.04 | 22.74 | 198.61
**Crystal** | 134.12 | 115.41 | 14.58 | 264.10
**Dart** | 116.25 | 113.86 | 92.50 | 322.62
**D ldc** | 202.58 | 202.91 | 5.97 | 411.46
**D dmd** | 232.56 | 238.09 | 6.62 | 477.27
**Ruby** | 282.52 | 249.00 | 55.74 | 587.26
**Python PyPy2** | 182.65 | 169.74 | 334.07 | 686.46
**Python 2** | 224.24 | 155.98 | 361.56 | 741.78
**Java** | 203.92 | 240.52 | 339.92 | 784.36
**Kotlin** | 220.12 | 238.17 | 329.70 | 787.98
**Dart Native** | 387.16 | 442.54 | 7.44 | 837.13
**Python PyPy3** | 292.92 | 265.08 | 320.00 | 878.00
**Python 3** | 314.01 | 233.17 | 387.53 | 934.71
**Go** | 298.15 | 301.22 | 453.10 | 1052.47
**C++** | 428.43 | 366.11 | 312.41 | 1106.96
**C# .Net Core** | 1223.51 | 1020.84 | 87.26 | 2331.60
**C# Mono** | 2968.90 | 2504.45 | 175.21 | 5648.57

- **Language**: Indicates the language.
- **Email(ms)**, **URI(ms)**, **IP(ms)**: Indicates the time elapsed in milliseconds for find and count non-overlapping occurrences for the pattern.
- **Total(ms)**: Indicates the sum of the above times.

### Versions and notes

- **C**: gcc 7.4.0 & PCRE2 10.31-2
- **Crystal**: crystal 0.31.1 - LLVM: 8.0.0
- **C++**: g++ 7.4.0 | Boost 1.65.0
- **C#**: dotnet 3.0.100 | Mono 6.4.0.198
- **D**: DMD v2.089.0 | LDC 1.8.0
- **Dart**: Dart 2.6.1
- **Go**: go 1.13.4
- **Java**: OpenJDK 11.0.4
- **Javascript**: node v13.1.0
- **Kotlin**: kotlinc-jvm 1.3.50
- **Perl**: perl v5.26.1
- **PHP**: PHP 7.2.24
- **Python**: Python 2.7.15+ | Python 3.6.8 | PyPy 7.2.0
- **Ruby**: ruby 2.5.1p57
- **Rust**: rustc 1.39.0

# How to run

The easiest way to run the benchmark is by using Docker.

```sh
git clone https://github.com/mariomka/regex-benchmark.git
cd regex-benchmark
docker run --rm -v $(pwd):/var/regex mariomka/regex-benchmark:1.2 
```

# Contributing

All contributions are welcome, from tiny optimizations to new implementations.

There are only two requirements:
- Follow the style of the current implementations
- Update `Dockerfile` if it's necessary

# Kudos

- Heng Li's for his work on [Benchmark of Regex Libraries](http://lh3lh3.users.sourceforge.net/reb.shtml).
- A "challenge" on [Madrid Devs](http://madriddevs.org/) group inspired me.
- [Programming subreddit](https://www.reddit.com/r/programming/), helped me to improve the benchmark.

# License

MIT © [Mario Juárez](https://github.com/mariomka).
