# C PCRE Regex Benchmark

## How to build

```sh
gcc -O3 -DNDEBUG -I/usr/local/include/ -L/usr/local/lib -lpcre2-8 -o bin/benchmark benchmark.c
```

## How to run

```sh
./benchmark <filename>
```
