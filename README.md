# WIP: Languages Regex Benchmark (Optimized)

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

Docker image was run on: MacBook Pro (Retina, 15-inch, 2017), 2.8 GHz Intel Core i7, 16 GB 1600 Mhz DDR3 with macOS Catalina 10.15.3.

Language | Email(ms) | URI(ms) | IP(ms) | Total(ms)
--- | ---: | ---: | ---: | ---:
| - | - | - | - | -


- **Language**: Indicates the language.
- **Email(ms)**, **URI(ms)**, **IP(ms)**: Indicates the time elapsed in milliseconds for finding and counting non-overlapping occurrences for the pattern.
- **Total(ms)**: Indicates the sum of the above times.

### Versions and notes

- **C**: gcc 7.5.0 & PCRE2 10.31-2
- **Crystal**: crystal 0.34.0 - LLVM: 8.0.0
- **C++**: g++ 7.5.0 | Boost 1.65.1.0
- **C#**: dotnet 3.0.103 | Mono 6.8.0.105
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
