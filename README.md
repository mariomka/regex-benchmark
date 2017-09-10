# Languages Regex Benchmark

It's just a simple regex benchmark for different languages.

## Input text

The [input text](input-text.txt) is a concatenation of [Learn X in Y minutes](https://github.com/adambard/learnxinyminutes-docs) repository.

## Regex patterns

- Email: ``/[\w\.-]+@[\w\.-]*\.[\w]{2,}/``
- URI: ``/[\w]+:\/\/[\w\.-]*(?:\/[\w\.-?=&]*)?/``
- IPv4: ``/\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}/``

The above regex patterns aren't the best or the optimal. The benchmark is the objective, not the matching.

## Running

[Bench](https://github.com/Gabriel439/bench) is used to measure the results.

## Performance

System: MacBook Pro (Retina, 15-inch, Late 2013), 2.3 GHz Intel Core i7, 16 GB 1600 Mhz DDR3 with macOS Sierra 10.12.5.

Language | Entire File(ms) | Line per line(ms)
--- | ---: | ---:
**Crystal 0.23.1** | 713.8 | 279.3
**Javascript - Node.js 7.7.3** | 259.1 | 378.0
**PHP 7.1.7** | 156.7 | 245.4
**Python 2.7.13** | 883.0 | 2299.0
**Python 3.6.2** | 1280.0 | 2659.0
**Python - PyPy 5.8.0** | 488.1 | 793.9

*Sorted alphabetically.*

- **Language**: Indicates language and version.
- **Entire File(ms)**: Indicates the time elapsed in milliseconds for finding all matches, reading the whole file.
- **Line per line(ms)**: Indicates the time elapsed in milliseconds for finding all matches, reading line per line.

# Contributing

All contributions are welcome, from the tiny optimizations to new implementations.

The requirement is following the current implementations style.

# Kudos

- Heng Li's for his work on [Benchmark of Regex Libraries](http://lh3lh3.users.sourceforge.net/reb.shtml).
- [Madrid Devs](http://madriddevs.org/).

# License

MIT © [Mario Juárez](https://github.com/mariomka).
