

require 'open-uri'
require 'rss'

url = ARGV.to_s         # Argument for feed to parse via CMD

content = ""              # Var to store feed content

open(url) do |parse|
    content = parse.read
    end

rss = RSS::Parser.parse(content, true)

# Output the feeds title, URL, and number of entries
puts "=================================="
puts "Title: #{rss.channel.title}"
puts "URL: #{rss.channel.link}"
puts "Total Entries: #{rss.items.size}"
puts "=================================="


# Setup to read feed and parse all items
# Change for this: parse top 5 posts, ask if more, (Y/N?), get/end

rss.items.each do |item|
    puts "Title: #{item.title}"
    puts "Published: #{item.date}"
    puts "#{item.description}"
    puts "=================================="
end