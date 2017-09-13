<?php

const REPORT_FILENAME = './report.csv';

const BUILDS = [
    'Crystal 0.23.1'       => 'crystal build crystal/benchmark.cr --release -o crystal/bin/benchmark',
    'C# - Mono 5.2.0'      => 'mcs csharp/benchmark.cs -out:csharp/bin-mono/benchmark.exe -debug- -optimize',
    'C# - .Net Core 2.0.0' => 'dotnet build csharp/benchmark.csproj -c Release',
    'Go 1.8.3'             => 'go build -ldflags "-s -w" -o go/bin/benchmark ./go',
    'Java 1.8.0'           => 'javac java/Benchmark.java',
    'Kotlin 1.1.4'         => 'kotlinc kotlin/benchmark.kt -include-runtime -d kotlin/benchmark.jar',
    'Rust 1.20.0'          => 'cargo build --quiet --release --manifest-path=rust/Cargo.toml',
];

const COMMANDS = [
    'Crystal 0.23.1'             => 'crystal/bin/benchmark',
    'C# - Mono 5.2.0'            => 'mono csharp/bin-mono/benchmark.exe',
    'C# - .Net Core 2.0.0'       => 'dotnet csharp/bin/Release/netcoreapp2.0/benchmark.dll',
    'Go 1.8.3'                   => 'go/bin/benchmark',
    'Java 1.8.0'                 => 'java -classpath java Benchmark',
    'Javascript - Node.js 7.7.3' => 'node javascript/benchmark.js',
    'Kotlin 1.1.4'               => 'kotlin kotlin/benchmark.jar',
    'PHP 7.1.7'                  => 'php php/benchmark.php',
    'Python 2.7.13'              => 'python python/benchmark.py',
    'Python 3.6.2'               => 'python3 python/benchmark.py',
    'Python - PyPy 5.8.0'        => 'pypy python/benchmark.py',
    'Ruby 2.4.1'                 => 'ruby ruby/benchmark.rb',
    'Rust 1.20.0'                => 'rust/target/release/benchmark',
];

const PATTERNS = [
    'email',
    'uri',
    'ip',
];

@unlink(REPORT_FILENAME);

echo '- Build' . PHP_EOL;

foreach (BUILDS as $language => $buildCmd) {
    shell_exec($buildCmd);

    echo $language . ' built.' . PHP_EOL;
}

echo PHP_EOL . '- Run' . PHP_EOL;

$results = [];

foreach (COMMANDS as $language => $command) {
    $benchmarkCmd = 'bench --csv report.csv';

    foreach (PATTERNS as $pattern) {
        $benchmarkCmd .= ' \'' . $command . ' input-text.txt ' . $pattern . '\'';
    }

    shell_exec($benchmarkCmd);

    $handler = fopen(REPORT_FILENAME, 'r');

    $result = [];

    while (($line = fgetcsv($handler)) !== false) {
        if ($line[0] == 'Name') {
            continue;
        }

        $result[] = floatval($line[1]) * 1000;
    }

    fclose($handler);
    unlink(REPORT_FILENAME);

    $result[] = array_reduce($result, function ($total, $result) {
        return $total + $result;
    });

    $results[$language] = $result;

    echo $language . ' ran.' . PHP_EOL;
}

echo PHP_EOL . '- Results' . PHP_EOL;

uasort($results, function($a, $b) {
    return $a[3] < $b[3] ? -1 : 1;
});

$results = array_walk($results, function ($result, $language) {
    $result = array_map(function ($time) {
        return number_format($time, 2, '.', '');
    }, $result);

    echo '**' . $language . '** | ' . implode(' | ', $result) . PHP_EOL;
});
