# C# Regex Benchmark

## How to build

```sh
# Mono
mcs Benchmark.cs -out:bin-mono/benchmark.exe -debug- -optimize

# .Net Core
dotnet build -c Release
```

## How to run

```sh
# Mono
mono bin-mono/benchmark.exe <filename> <regex-name>

# .Net Core
dotnet bin/Release/netcoreapp2.0/benchmark.dll <filename> <regex-name>
```
