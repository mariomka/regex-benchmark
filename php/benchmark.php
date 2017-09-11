<?php

if (count($argv) != 3) {
    echo 'Usage: php entire-file.php <filename> <regex-name>';
    die(1);
}

$data = file_get_contents($argv[1]);

switch($argv[2]) {
    case 'email':
        $pattern = '/[\w\.+-]+@[\w\.-]+\.[\w\.-]+/';
        break;
    case 'uri':
        $pattern = '/[\w]+:\/\/[^\/\s?#]+[^\s?#]+(?:\?[^\s#]*)?(?:#[^\s]*)?/';
        break;
    case 'ip':
        $pattern = '/(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9])\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9])/';
        break;
    default:
        echo 'Regex name must be: email, uri or ip.';
        die(2);
}

$count = preg_match_all($pattern, $data, $matches);

echo $count . ' found.' . PHP_EOL;
