# C PCRE Regex Benchmark

## How to build

```sh
gcc -O3 -DNDEBUG benchmark.c -I/usr/local/include/ -lpcre2-8 -o bin/benchmark 
```

## How to run

```sh
./benchmark <filename>
```
