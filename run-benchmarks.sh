#!/usr/bin/env bash

crystal build crystal/benchmark.cr --release -o crystal/bin/benchmark
bench 'crystal/bin/benchmark input-text.txt email'
bench 'crystal/bin/benchmark input-text.txt uri'
bench 'crystal/bin/benchmark input-text.txt ip'

bench 'node javascript/benchmark.js input-text.txt email'
bench 'node javascript/benchmark.js input-text.txt uri'
bench 'node javascript/benchmark.js input-text.txt ip'

bench 'php php/benchmark.php input-text.txt email'
bench 'php php/benchmark.php input-text.txt uri'
bench 'php php/benchmark.php input-text.txt ip'

bench 'python python/benchmark.py input-text.txt email'
bench 'python python/benchmark.py input-text.txt uri'
bench 'python python/benchmark.py input-text.txt ip'

bench 'python3 python/benchmark.py input-text.txt email'
bench 'python3 python/benchmark.py input-text.txt uri'
bench 'python3 python/benchmark.py input-text.txt ip'

bench 'pypy python/benchmark.py input-text.txt email'
bench 'pypy python/benchmark.py input-text.txt uri'
bench 'pypy python/benchmark.py input-text.txt ip'

bench 'ruby ruby/benchmark.rb input-text.txt email'
bench 'ruby ruby/benchmark.rb input-text.txt uri'
bench 'ruby ruby/benchmark.br input-text.txt ip'

cargo build --release --manifest-path=rust/Cargo.toml &> /dev/null
bench 'rust/target/release/benchmark input-text.txt email'
bench 'rust/target/release/benchmark input-text.txt uri'
bench 'rust/target/release/benchmark input-text.txt ip'
