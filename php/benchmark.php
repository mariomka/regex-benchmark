<?php

if (count($argv) != 2) {
    echo 'Usage: php entire-file.php <filename>';
    die(1);
}

$data  = file_get_contents($argv[1]);

// Email
measure($data, '/[\w\.+-]+@[\w\.-]+\.[\w\.-]+/');

// URI
measure($data, '/[\w]+:\/\/[^\/\s?#]+[^\s?#]+(?:\?[^\s#]*)?(?:#[^\s]*)?/');

// IP
measure($data, '/(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9])\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9])/');

function measure($data, $pattern) {
    $startTime = microtime(true);

    $count = preg_match_all($pattern, $data, $matches);

    $elapsed = (microtime(true) - $startTime) * 1000;

    echo $elapsed . " - " . $count . PHP_EOL;
}
