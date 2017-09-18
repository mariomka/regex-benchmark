import sys
import re
from timeit import default_timer as timer

if len(sys.argv) != 2:
    print('Usage: python benchmark.py <filename>')
    sys.exit(1)

def measure(data, pattern):
    start_time = timer()

    regex = re.compile(pattern)
    matches = re.findall(regex, data)

    elapsed_time = timer() - start_time

    print(str(elapsed_time * 1e3) + ' - ' + str(len(matches)))

with open(sys.argv[1]) as file:
    data = file.read()

    # Email
    measure(data, '[\w\.+-]+@[\w\.-]+\.[\w\.-]+')

    # URI
    measure(data, '[\w]+://[^/\s?#]+[^\s?#]+(?:\?[^\s#]*)?(?:#[^\s]*)?')

    # IP
    measure(data, '(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9])\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9])')
