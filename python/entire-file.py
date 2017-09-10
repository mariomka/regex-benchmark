import sys
import re

if len(sys.argv) != 2:
    print('Usage: python line-per-line.py <filename>')
    sys.exit(1)

emailRegex = re.compile('[\w\.-]+@[\w\.-]*\.[\w]{2,}')
uriRegex = re.compile('[\w]+:\/\/[\w\.-]*(?:\/[\w\.-?=&]*)?')
ipRegex = re.compile('\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}')

emailCount = 0
uriCount = 0
ipCount = 0

with open(sys.argv[1]) as file:
    data = file.read()

    count = len(re.findall(emailRegex, data))
    if count > 0:
        emailCount += count

    count = len(re.findall(uriRegex, data))
    if count > 0:
        uriCount += count

    count = len(re.findall(ipRegex, data))
    if count > 0:
        ipCount += count

print(str(emailCount) + ' emails found.')
print(str(uriCount) + ' URIs found.')
print(str(ipCount) + ' IPs found.')
