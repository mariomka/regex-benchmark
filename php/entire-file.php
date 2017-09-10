<?php

if (count($argv) != 2) {
    echo 'Usage: php entire-file.php <filename>';
    die(1);
}

$data = file_get_contents($argv[1]);

$lines      = 0;
$emailCount = 0;
$uriCount   = 0;
$ipCount    = 0;

$count = preg_match_all('/[\w\.-]+@[\w\.-]*\.[\w]{2,}/', $data, $matches);
if ($count) {
    $emailCount += $count;
}

$count = preg_match_all('/[\w]+:\/\/[\w\.-]*(?:\/[\w\.-?=&]*)?/', $data, $matches);
if ($count) {
    $uriCount += $count;
}

$count = preg_match_all('/\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}/', $data, $matches);
if ($count) {
    $ipCount += $count;
}

echo $emailCount . ' emails found.' . PHP_EOL;
echo $uriCount . ' URIs found.' . PHP_EOL;
echo $ipCount . ' IPs found.' . PHP_EOL;
