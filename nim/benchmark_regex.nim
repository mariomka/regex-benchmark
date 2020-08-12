import times
import os
import strformat

import pkg/regex

if paramCount() == 0:
  echo "Usage: ./benchmark <filename>"
  quit(QuitFailure)

proc measure(data: string, pattern: string) =
  let time = cpuTime()
  let r_pattern = re(pattern)
  let matches = data.findAll(r_pattern)
  let count = len(matches)
  let elapsed_time = cpuTime() - time 
  echo &"{elapsed_time * 1e3} - {count}"

let data = readFile(paramStr(1))

measure(data, r"[\w\.+-]+@[\w\.-]+\.[\w\.-]+")

measure(data, r"[\w]+://[^/\s?#]+[^\s?#]+(?:\?[^\s#]*)?(?:#[^\s]*)?")

measure(data, r"(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9])\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9])")
