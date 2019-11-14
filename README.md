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
**PHP** | 22.99 | 23.47 | 6.28 | 52.74
**C PCRE2** | 24.61 | 24.64 | 6.88 | 56.13
**Rust** | 24.75 | 27.54 | 6.62 | 58.92
**Javascript** | 68.30 | 54.74 | 1.75 | 124.80
**Perl** | 103.39 | 71.81 | 22.88 | 198.07
**Crystal** | 142.48 | 123.13 | 15.74 | 281.35
**D ldc** | 205.65 | 205.57 | 5.88 | 417.11
**D dmd** | 233.14 | 236.44 | 6.74 | 476.33
**Ruby** | 283.77 | 250.48 | 55.14 | 589.39
**Python PyPy2** | 179.98 | 171.88 | 334.90 | 686.76
**Python 2** | 226.40 | 154.39 | 368.31 | 749.10
**Kotlin** | 212.87 | 230.06 | 321.01 | 763.94
**Java** | 203.57 | 247.48 | 316.80 | 767.85
**Python 3** | 317.25 | 237.16 | 390.30 | 944.71
**Go** | 296.17 | 296.38 | 452.80 | 1045.35
**Python PyPy3** | 344.45 | 308.61 | 409.94 | 1063.00
**C++** | 437.43 | 376.83 | 319.47 | 1133.72
**C# .Net Core** | 1211.23 | 1006.61 | 86.48 | 2304.31
**C# Mono** | 2961.09 | 2489.78 | 171.24 | 5622.11

- **Language**: Indicates the language.
- **Email(ms)**, **URI(ms)**, **IP(ms)**: Indicates the time elapsed in milliseconds for find and count non-overlapping occurrences for the pattern.
- **Total(ms)**: Indicates the sum of the above times.

### Versions and notes

- **C**: gcc 7.4.0 & PCRE2 10.31-2
- **Crystal**: crystal 0.31.1 - LLVM: 8.0.0
- **C++**: g++ 7.4.0 
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
