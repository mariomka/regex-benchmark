<?php

if (count($argv) != 2) {
    echo 'Usage: php line-per-line.php <filename>';
    die(1);
}

$handle = fopen($argv[1], 'r');

$emailCount = 0;
$uriCount   = 0;
$ipCount    = 0;

while (($line = fgets($handle)) !== false) {
    $count = preg_match_all('/[\w\.-]+@[\w\.-]*\.[\w]{2,}/', $line, $matches);
    if ($count) {
        $emailCount += $count;
    }

    $count = preg_match_all('/[\w]+:\/\/[\w\.-]*(?:\/[\w\.-?=&]*)?/', $line, $matches);
    if ($count) {
        $uriCount += $count;
    }

    $count = preg_match_all('/\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}/', $line, $matches);
    if ($count) {
        $ipCount += $count;
    }
}

echo $emailCount . ' emails found' . PHP_EOL;
echo $uriCount . ' URIs found' . PHP_EOL;
echo $ipCount . ' IPs found.' . PHP_EOL;

fclose($handle);
