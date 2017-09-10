const fs = require('fs')

if (process.argv.length !== 3) {
  console.log('Usage: node line-per-line.js <filename>')
  process.exit(1)
}

const data = fs.readFileSync(process.argv[2], 'utf8')

const emailPattern = /[\w\.-]+@[\w\.-]*\.[\w]{2,}/g
const uriPattern = /[\w]+:\/\/[\w\.-]*(?:\/[\w\.-?=&]*)?/g
const ipPattern = /\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}/g

let emailCount = 0
let uriCount = 0
let ipCount = 0

let matches = data.match(emailPattern)
if (matches) {
  emailCount += matches.length
}

matches = data.match(uriPattern)
if (matches) {
  uriCount += matches.length
}

matches = data.match(ipPattern)
if (matches) {
  ipCount += matches.length
}

console.log(`${emailCount} emails found.`)
console.log(`${uriCount} URIs found.`)
console.log(`${ipCount} IPs found.`)

