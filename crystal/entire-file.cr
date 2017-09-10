if(ARGV.size != 1)
  puts "Usage: line-per-line <filename>"
  exit 1
end

data = File.read(ARGV[0])

emailPattern = /[\w\.-]+@[\w\.-]*\.[\w]{2,}/
uriPattern = /[\w]+:\/\/[\w\.-]*(?:\/[\w\.-?=&]*)?/
ipPattern = /\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}/

emailCount = 0
uriCount = 0
ipCount = 0

data.scan(emailPattern) do |matchData|
  emailCount += 1
end

data.scan(uriPattern) do |matchData|
  uriCount += 1
end

data.scan(ipPattern) do |matchData|
  ipCount += 1
end

puts "#{emailCount} emails found."
puts "#{uriCount} URIs found."
puts "#{ipCount} IPs found."
