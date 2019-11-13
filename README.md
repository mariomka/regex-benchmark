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
**PHP** | 22.97 | 23.34 | 6.14 | 52.45
**C PCRE2** | 24.01 | 24.24 | 7.02 | 55.27
**Rust** | 24.48 | 26.42 | 6.60 | 57.50
**Javascript** | 68.77 | 54.94 | 1.71 | 125.42
**Perl** | 105.08 | 72.21 | 22.53 | 199.82
**Crystal** | 141.09 | 121.37 | 15.20 | 277.66
**D ldc** | 144.86 | 142.31 | 4.67 | 291.84
**D dmd** | 221.55 | 206.43 | 5.09 | 433.07
**Ruby** | 286.18 | 252.30 | 55.56 | 594.03
**Python PyPy2** | 188.12 | 172.02 | 333.74 | 693.88
**Python 2** | 223.88 | 157.69 | 365.21 | 746.78
**Java** | 204.76 | 261.09 | 314.96 | 780.81
**Kotlin** | 217.14 | 245.99 | 329.70 | 792.83
**Python 3** | 319.95 | 233.07 | 387.41 | 940.44
**Python PyPy3** | 321.83 | 290.43 | 361.08 | 973.34
**Go** | 301.00 | 300.37 | 455.19 | 1056.56
**C# .Net Core** | 1238.26 | 1035.53 | 89.71 | 2363.50
**C# Mono** | 3089.06 | 2631.22 | 182.76 | 5903.04

- **Language**: Indicates the language.
- **Email(ms)**, **URI(ms)**, **IP(ms)**: Indicates the time elapsed in milliseconds for find and count non-overlapping occurrences for the pattern.
- **Total(ms)**: Indicates the sum of the above times.

### Versions and notes

- **C**: gcc 7.4.0 & PCRE2 10.31-2
- **Crystal**: crystal 0.31.1 - LLVM: 8.0.0
- **C#**: dotnet 3.0.100 | Mono 6.4.0.198
- **D**: DMD v2.089.0 | LDC 1.8.0
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
docker run --rm -v $PWD:/var/regex mariomka/regex-benchmark:1.1
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
