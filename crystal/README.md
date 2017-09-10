# Crystal Regex Benchmark

## How to build

```sh
crystal build crystal/entire-file.cr --release -o bin/entire-file
crystal build crystal/line-per-line.cr --release -o bin/line-per-line
```

## How to run

```sh
./bin/entire-file <filename>
./bin/line-per-line <filename>
```
