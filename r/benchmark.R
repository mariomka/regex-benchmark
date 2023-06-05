#!/usr/bin/env Rscript
library(stringr)
library(readr)

measure <- function(data, pattern) {
    start <- Sys.time()
    # res <- length(regmatches(data, gregexpr(pattern, data, perl = TRUE))[[1]])
    res <- str_count(data, pattern)
    end <- Sys.time()
    s <- end - start
    out <- paste0(format(as.numeric(s)*1e3, digits = 3), " - ", res)
    print(out)
}

args = commandArgs(trailingOnly=TRUE)

if (length(args)==0) {
  stop("At least one argument must be supplied (input file).n", call.=FALSE)
}

file_str <- read_file(args[1])

# Email
measure(file_str, r"{[\w\\.+-]+@[\w\.-]+\.[\w\.-]+}")

# URI
measure(file_str, r"{[\w]+://[^/\s?#]+[^\s?#]+(?:\?[^\s#]*)?(?:#[^\s]*)?}")

# IPv4
measure(file_str, r"{(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9])\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9])}") 
