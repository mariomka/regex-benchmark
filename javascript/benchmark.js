const fs = require('fs')

if (process.argv.length !== 3) {
  console.log('Usage: node benchmark.js <filename>')
  process.exit(1)
}

function measure(data, pattern) {
  const start = process.hrtime()

  const matches = data.match(pattern)

  const end = process.hrtime(start);
  
  console.log((end[0] * 1e9 + end[1]) / 1000000 + ' - ' + matches.length);
}

const data = fs.readFileSync(process.argv[2], 'utf8')

// Email
measure(data, /[\w\.+-]+@[\w\.-]+\.[\w\.-]+/g)

// URI
measure(data, /[\w]+:\/\/[^\/\s?#]+[^\s?#]+(?:\?[^\s#]*)?(?:#[^\s]*)?/g)

// IP
measure(data, /(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9])\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9])/g)
