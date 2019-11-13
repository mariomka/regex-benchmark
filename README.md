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

System: MacBook Pro (Retina, 15-inch, Late 2013), 2.3 GHz Intel Core i7, 16 GB 1600 Mhz DDR3 with macOS Sierra 10.12.5.

Language | Email(ms) | URI(ms) | IP(ms) | Total(ms)
--- | ---: | ---: | ---: | ---:
**C PCRE2** | 25.00 | 25.02 | 5.65 | 55.66
**Rust** | 31.31 | 31.73 | 6.75 | 69.79
**PHP** | 54.39 | 50.22 | 5.80 | 110.40
**Javascript** | 74.88 | 63.09 | 2.02 | 140.00
**D ldc** | 146.01 | 140.03 | 5.19 | 291.24
**D dmd** | 205.52 | 200.30 | 5.59 | 411.41
**Perl** | 246.91 | 170.74 | 45.60 | 463.24
**Crystal** | 339.79 | 280.74 | 27.03 | 647.56
**Python PyPy** | 207.96 | 177.18 | 329.85 | 714.99
**Ruby** | 354.16 | 308.55 | 52.73 | 715.44
**Java** | 382.57 | 456.34 | 297.66 | 1136.57
**Kotlin** | 395.23 | 474.31 | 293.53 | 1163.07
**Python 2** | 368.85 | 286.70 | 514.10 | 1169.65
**Python 3** | 565.71 | 416.32 | 493.07 | 1475.09
**Go** | 423.53 | 415.45 | 722.53 | 1561.51
**C# .Net Core** | 1952.13 | 1681.00 | 111.32 | 3744.45
**C# Mono** | 2463.84 | 2088.87 | 153.78 | 4706.49

- **Language**: Indicates the language.
- **Email(ms)**, **URI(ms)**, **IP(ms)**: Indicates the time elapsed in milliseconds for find and count non-overlapping occurrences for the pattern.
- **Total(ms)**: Indicates the sum of the above times.

### Versions and notes

- **C**: gcc 7.4.0 & PCRE2 10.31-2
- **Crystal**: crystal 0.31.1 - LLVM: 8.0.0
- **C#**: dotnet 3.0.100 | Mono 6.4.0.198
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
