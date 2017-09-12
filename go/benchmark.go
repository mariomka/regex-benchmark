package main

import (
    "bytes"
    "fmt"
    "log"
    "os"
    "regexp"
)

func main() {
    if len(os.Args) != 3 {
        fmt.Println("Usage: benchmark <filename> <regex-name>")
        os.Exit(1)
    }

    var pattern string
    switch os.Args[2] {
        case "email":
            pattern = `[\w\.+-]+@[\w\.-]+\.[\w\.-]+`
        case "uri":
            pattern = `[\w]+://[^/\s?#]+[^\s?#]+(?:\?[^\s#]*)?(?:#[^\s]*)?`
        case "ip":
            pattern = `(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9])\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9])`
        default:
            fmt.Println("Regex name must be: email, uri or ip.")
            os.Exit(2)
    }

    r, err := regexp.Compile(pattern)
    if err != nil {
        log.Fatal(err)
    }

    filerc, err := os.Open(os.Args[1])
    if err != nil {
        log.Fatal(err)
    }
    defer filerc.Close()

    buf := new(bytes.Buffer)
    buf.ReadFrom(filerc)
    data := buf.String()

    matches := r.FindAllString(data, -1)

    fmt.Printf("%v found.\n", len(matches))
}
