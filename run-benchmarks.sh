#!/usr/bin/env bash

crystal build crystal/entire-file.cr --release -o crystal/bin/entire-file
crystal build crystal/line-per-line.cr --release -o crystal/bin/line-per-line

bench 'crystal/bin/entire-file input-text.txt'
bench 'crystal/bin/line-per-line input-text.txt'

bench 'node javascript/entire-file.js input-text.txt'
bench 'node javascript/line-per-line.js input-text.txt'

bench 'php php/entire-file.php input-text.txt'
bench 'php php/line-per-line.php input-text.txt'

bench 'python python/entire-file.py input-text.txt'
bench 'python python/line-per-line.py input-text.txt'

bench 'python3 python/entire-file.py input-text.txt'
bench 'python3 python/line-per-line.py input-text.txt'

bench 'pypy python/entire-file.py input-text.txt'
bench 'pypy python/line-per-line.py input-text.txt'
