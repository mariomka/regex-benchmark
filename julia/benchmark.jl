function measure(data, pattern)
    start = time()
    count = length(collect(eachmatch(pattern, data)))
    elapsed = time() - start
    elapsed_ms = 1000 * elapsed

    println(string(elapsed_ms) * " - " * string(count))
end

if length(ARGS) < 1
    println("Usage: julia benchmark.jl <filename>")
    exit(1)
end

data = open(f->read(f, String), ARGS[1])

measure(data, r"[\w.+-]+@[\w.-]+\.[\w.-]+")
measure(data, r"[\w]+://[^/\s?#]+[^\s?#]+(?:\?[^\s#]*)?(?:#[^\s]*)?")
measure(data, r"(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9])\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9])")
