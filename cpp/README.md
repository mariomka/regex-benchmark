# C++ Benchmark

## How to build

```sh
wget -q http://www.akenotsuki.com/misc/srell/srell-latest -O srell.zip
mkdir -p /tmp/srell
unzip srell.zip -d /tmp/srell
cp -p -u /tmp/srell/single-header/srell.hpp /usr/local/include

g++ -std=c++11 -O3 benchmark.cpp -o bin/benchmark-stl
g++ -std=c++11 -O3 benchmark.cpp -lboost_regex -o bin/benchmark-boost -DUSE_BOOST
g++ -std=c++11 -O3 benchmark.cpp -o bin/benchmark-srell -DUSE_SRELL
```

## How to run

```sh
./bin/benchmark-stl <filename>
./bin/benchmark-boost <filename>
./bin/benchmark-srell <filename>
```
