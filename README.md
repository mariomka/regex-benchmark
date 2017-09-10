# Languages Regex Benchmark

It's just a simple regex benchmark for different languages.

## Input text

The [Input text](input-text.txt) is a concatenation of [Learn X in Y minutes](https://github.com/adambard/learnxinyminutes-docs) repository.

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
--- | --- | ---
**Javascript - Node.js 7.7.3** | 255.5 | 390.2
**PHP 7.1.7** | 153.1 | 240.6

*Sorted alphabetically.*

- **Language**: Indicates language and version.
- **Entire File(ms)**: Indicates the time elapsed in milliseconds for finding all matches, reading the whole file.
- **Line per line(ms)**: Indicates the time elapsed in milliseconds for finding all matches, reading line per line.

# Contributing

All contributions are welcome, from the tiny optimizations to new implementations.

The requirement is following current implementations style.

# License

MIT © [Mario Juárez](https://github.com/mariomka)
