const fs = require('fs')

if (process.argv.length !== 4) {
  console.log('Usage: node line-per-line.js <filename> <regex-name>')
  process.exit(1)
}

switch (process.argv[3]) {
  case 'email':
    pattern = /[\w\.+-]+@[\w\.-]+\.[\w\.-]+/g
    break
  case 'uri':
    pattern = /[\w]+:\/\/[^\/\s?#]+[^\s?#]+(?:\?[^\s#]*)?(?:#[^\s]*)?/g
    break
  case 'ip':
    pattern = /(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9])\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9])/g
    break
  default:
    console.log('Regex name must be: email, uri or ip.')
    process.exit(2)
}

const data = fs.readFileSync(process.argv[2], 'utf8')
const matches = data.match(pattern)

console.log(`${matches.length} found.`)
