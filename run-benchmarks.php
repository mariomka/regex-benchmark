<?php

const REPORT_FILENAME = './report.csv';

const BUILDS = [
    'Crystal 0.23.1'       => 'crystal build crystal/benchmark.cr --release -o crystal/bin/benchmark',
    'C# - Mono 5.2.0'      => 'mcs csharp/benchmark.cs -out:csharp/bin-mono/benchmark.exe -debug- -optimize',
    'C# - .Net Core 2.0.0' => 'dotnet build csharp/benchmark.csproj -c Release',
    'Rust 1.20.0'          => 'cargo build --quiet --release --manifest-path=rust/Cargo.toml',
];

const COMMANDS = [
    'Crystal 0.23.1'             => 'crystal/bin/benchmark',
    'C# - Mono 5.2.0'            => 'mono csharp/bin-mono/benchmark.exe',
    'C# - .Net Core 2.0.0'       => 'dotnet csharp/bin/Release/netcoreapp2.0/benchmark.dll',
    'Javascript - Node.js 7.7.3' => 'node javascript/benchmark.js',
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

foreach (BUILDS as $language => $build) {
    shell_exec($build);

    echo $language . ' built' . PHP_EOL;
}

echo PHP_EOL . '- Run:' . PHP_EOL;

foreach (COMMANDS as $language => $command) {
    $benchmark = 'bench --csv report.csv';

    foreach (PATTERNS as $pattern) {
        $benchmark .= ' \'' . $command . ' input-text.txt ' . $pattern . '\'';
    }

    shell_exec($benchmark);

    $handler = fopen(REPORT_FILENAME, 'r');
    $results = [];

    while (($line = fgetcsv($handler)) !== false) {
        if ($line[0] == 'Name') {
            continue;
        }

        $results[] = floatval($line[1]) * 1000;
    }

    fclose($handler);
    unlink(REPORT_FILENAME);

    $total = number_format(array_reduce($results, function ($total, $result) {
        return $total + $result;
    }), 2, '.', '');

    $results = array_map(function ($result) {
        return number_format($result, 2, '.', '');
    }, $results);

    echo '**' . $language . '** | ' . implode(' | ', $results) . ' | ' . $total . PHP_EOL;
}
