if(ARGV.size != 2)
  puts "Usage: ruby benchmark.rb <filename> <regex-name>"
  exit 1
end

data = File.read(ARGV[0])

case ARGV[1]
when "email"
    pattern = /[\w\.+-]+@[\w\.-]+\.[\w\.-]+/
when "uri"
    pattern = /[\w]+:\/\/[^\/\s?#]+[^\s?#]+(?:\?[^\s#]*)?(?:#[^\s]*)?/
when "ip"
    pattern = /(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9])\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9])/
else
    puts "Regex name must be: email, uri or ip."
    exit 2
end

count = data.scan(pattern).size

puts "#{count} found."
