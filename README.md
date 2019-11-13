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
**PHP** | 24.78 | 25.46 | 6.49 | 56.72
**C PCRE2** | 26.51 | 27.65 | 7.77 | 61.92
**Rust** | 26.67 | 28.71 | 7.19 | 62.57
**Javascript** | 74.72 | 59.79 | 1.78 | 136.30
**Perl** | 111.00 | 76.89 | 23.50 | 211.39
**Crystal** | 155.25 | 127.69 | 15.95 | 298.90
**D ldc** | 155.59 | 151.01 | 5.28 | 311.88
**D dmd** | 236.94 | 223.38 | 5.52 | 465.83
**Ruby** | 309.53 | 271.57 | 59.56 | 640.65
**Python 2** | 240.52 | 169.07 | 392.58 | 802.18
**Python PyPy2** | 211.36 | 210.30 | 385.73 | 807.39
**Python 3** | 325.13 | 242.23 | 400.85 | 968.22
**Python PyPy3** | 333.20 | 301.28 | 359.45 | 993.92
**Kotlin** | 400.57 | 428.61 | 271.39 | 1100.57
**Go** | 315.93 | 316.68 | 485.22 | 1117.82
**Java** | 431.63 | 499.97 | 295.35 | 1226.95
**C# .Net Core** | 694.35 | 572.88 | 92.63 | 1359.85
**C# Mono** | 1953.85 | 1581.50 | 184.76 | 3720.11

- **Language**: Indicates the language.
- **Email(ms)**, **URI(ms)**, **IP(ms)**: Indicates the time elapsed in milliseconds for find and count non-overlapping occurrences for the pattern.
- **Total(ms)**: Indicates the sum of the above times.

### Versions and notes

- **C**: gcc 7.4.0 & PCRE2 10.31-2
- **Crystal**: crystal 0.31.1 - LLVM: 8.0.0
- **C#**: dotnet 3.0.100 | Mono 6.4.0.198 -- RegexOptions.ECMAScript mode
- **D**: DMD v2.089.0 | LDC 1.8.0
- **Go**: go 1.13.4
- **Java**: Java 1.8.0_222 - OpenJDK
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
docker run --rm -v $PWD:/var/regex mariomka/regex-benchmark:1.0
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
