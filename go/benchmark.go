package main

import (
    "bytes"
    "fmt"
    "log"
    "os"
    "regexp"
    "time"
)

func measure(data string, pattern string) {
    start := time.Now()
    
    r, err := regexp.Compile(pattern)
    if err != nil {
        log.Fatal(err)
    }

    matches := r.FindAllString(data, -1)
    count := len(matches)
    
    elapsed := time.Since(start)

    fmt.Printf("%f - %v\n", float64(elapsed) / float64(time.Millisecond), count)
}

func main() {
    if len(os.Args) != 2 {
        fmt.Println("Usage: benchmark <filename>")
        os.Exit(1)
    }

    filerc, err := os.Open(os.Args[1])
    if err != nil {
        log.Fatal(err)
    }
    defer filerc.Close()

    buf := new(bytes.Buffer)
    buf.ReadFrom(filerc)
    data := buf.String()

    // Email
    measure(data, `[\w\.+-]+@[\w\.-]+\.[\w\.-]+`)

    // URI
    measure(data, `[\w]+://[^/\s?#]+[^\s?#]+(?:\?[^\s#]*)?(?:#[^\s]*)?`)

    // IP
    measure(data, `(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9])\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9])`)
}
