import sys
import re

if len(sys.argv) != 3:
    print('Usage: python line-per-line.py <filename> <regex-name>')
    sys.exit(1)

pattern = {
    'email': '[\w\.+-]+@[\w\.+-]+\.[\w\.-]+',
    'uri': '[\w]+://[^/\s?#]+[^\s?#]+(?:\?[^\s#]*)?(?:#[^\s]*)?',
    'ip': '(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9])\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9])'
}.get(sys.argv[2], None)

if pattern is None:
    print('Regex name must be: email, uri or ip.')
    sys.exit(2)

regex = re.compile(pattern)

with open(sys.argv[1]) as file:
    data = file.read()
    matches = re.findall(regex, data)

print(str(len(matches)) + ' found.')
