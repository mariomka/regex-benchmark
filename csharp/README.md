# C# Regex Benchmark

## How to build

```sh
# Mono
mcs Benchmark.cs -out:bin-mono/benchmark.exe -debug- -optimize

# .NET
dotnet build -c Release
```

## How to run

```sh
# Mono
mono -O=all bin-mono/benchmark.exe <filename>

# .NET
dotnet bin/Release/net6.0/benchmark.dll <filename>
```
