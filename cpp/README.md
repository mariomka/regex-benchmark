# C++ Benchmark

## How to build

```sh
g++ -std=c++11 -O3 benchmark.cpp -lboost_regex -o bin/benchmark-stl -DREGEX_NAMESPACE=std
g++ -std=c++11 -O3 benchmark.cpp -lboost_regex -o bin/benchmark-boost -DREGEX_NAMESPACE=boost
```

## How to run

```sh
./bin/benchmark-stl <filename>
./bin/benchmark-boost <filename>
```
