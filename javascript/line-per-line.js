const readline = require('readline')
const fs = require('fs')

if (process.argv.length !== 3) {
  console.log('Usage: node line-per-line.js <filename>')
  process.exit(1)
}

const rl = readline.createInterface({
  input: fs.createReadStream(process.argv[2])
})

const emailPattern = /[\w\.-]+@[\w\.-]*\.[\w]{2,}/g
const uriPattern = /[\w]+:\/\/[\w\.-]*(?:\/[\w\.-?=&]*)?/g
const ipPattern = /\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}/g

let emailCount = 0
let uriCount = 0
let ipCount = 0

rl.on('line', function (line) {
  let matches = line.match(emailPattern)
  if (matches) {
    emailCount += matches.length
  }

  matches = line.match(uriPattern)
  if (matches) {
    uriCount += matches.length
  }

  matches = line.match(ipPattern)
  if (matches) {
    ipCount += matches.length
  }
})

rl.on('close', function (line) {
  console.log(`${emailCount} emails found.`)
  console.log(`${uriCount} URIs found.`)
  console.log(`${ipCount} IPs found.`)
})
