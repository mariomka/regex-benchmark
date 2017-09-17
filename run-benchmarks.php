<?php

const PATTERNS_COUNT = 3;

const RUN_TIMES = 10;

const BUILDS = [
    'C - PCRE 2 10.30'     => 'gcc -O3 -DNDEBUG -I/usr/local/include/ -L/usr/local/lib -lpcre2-8 -o c/bin/benchmark c/benchmark.c',
    'Crystal 0.23.1'       => 'crystal build crystal/benchmark.cr --release -o crystal/bin/benchmark',
    'C# - Mono 5.2.0'      => 'mcs csharp/benchmark.cs -out:csharp/bin-mono/benchmark.exe -debug- -optimize',
    'C# - .Net Core 2.0.0' => 'dotnet build csharp/benchmark.csproj -c Release',
    'Go 1.8.3'             => 'go build -ldflags "-s -w" -o go/bin/benchmark ./go',
    'Java 1.8.0'           => 'javac java/Benchmark.java',
    'Kotlin 1.1.4'         => 'kotlinc kotlin/benchmark.kt -include-runtime -d kotlin/benchmark.jar',
    'Rust 1.20.0'          => 'cargo build --quiet --release --manifest-path=rust/Cargo.toml',
];

const COMMANDS = [
    'C - PCRE 2 10.30'           => './c/bin/benchmark input-text.txt',
    'Crystal 0.23.1'             => 'crystal/bin/benchmark',
    'C# - Mono 5.2.0'            => 'mono csharp/bin-mono/benchmark.exe',
    'C# - .Net Core 2.0.0'       => 'dotnet csharp/bin/Release/netcoreapp2.0/benchmark.dll',
    'Go 1.8.3'                   => 'go/bin/benchmark',
    'Java 1.8.0'                 => 'java -classpath java Benchmark',
    'Javascript - Node.js 7.7.3' => 'node javascript/benchmark.js',
    'Kotlin 1.1.4'               => 'kotlin kotlin/benchmark.jar',
    'Perl 5.26.0'                => 'perl perl/benchmark.pl input-text.txt',
    'PHP 7.1.7'                  => 'php php/benchmark.php',
    'Python 2.7.13'              => 'python python/benchmark.py',
    'Python 3.6.2'               => 'python3 python/benchmark.py',
    'Python - PyPy 5.8.0'        => 'pypy python/benchmark.py',
    'Ruby 2.4.1'                 => 'ruby ruby/benchmark.rb',
    'Rust 1.20.0'                => 'rust/target/release/benchmark',
];

echo '- Build' . PHP_EOL;

foreach (BUILDS as $language => $buildCmd) {
    shell_exec($buildCmd);

    echo $language . ' built.' . PHP_EOL;
}

echo PHP_EOL . '- Run' . PHP_EOL;

$results = [];

foreach (COMMANDS as $language => $command) {
    $currentResults = [];

    for ($i = 0; $i < RUN_TIMES; $i++) {
        $out = shell_exec($command . ' input-text.txt');
        preg_match_all('/^\d+\.\d+/m', $out, $matches);

        for ($j = 0; $j < PATTERNS_COUNT; $j++) {
            $currentResults[$j][] = $matches[0][$j];
        }
    }

    for ($i = 0; $i < PATTERNS_COUNT; $i++) {
        $results[$language][] = array_sum($currentResults[$i]) / count($currentResults[$i]);
    }

    $results[$language][PATTERNS_COUNT] = array_sum($results[$language]);

    echo $language . ' ran.' . PHP_EOL;
}

echo PHP_EOL . '- Results' . PHP_EOL;

uasort($results, function ($a, $b) {
    return $a[PATTERNS_COUNT] < $b[PATTERNS_COUNT] ? -1 : 1;
});

$results = array_walk($results, function ($result, $language) {
    $result = array_map(function ($time) {
        return number_format($time, 2, '.', '');
    }, $result);

    echo '**' . $language . '** | ' . implode(' | ', $result) . PHP_EOL;
});
