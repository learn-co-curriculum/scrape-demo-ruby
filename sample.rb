# 1. Load Your Libraries
require 'nokogiri'
require 'open-uri'
require 'pry'

# 2. Load Your Document
document = Nokogiri::HTML(open("https://newyork.craigslist.org/search/roo"))

# 3. Define Your Main Selector
price_selector = "span.price"

# 4. Scrape for the Tags
price_spans = document.search(price_selector)

# 5. Process the data
prices = price_spans.collect do |price_span|
  price_span.text.gsub("$", "").to_i
end

# 6. Answer Your Question
average_price = prices.inject(:+)/prices.size

# 7. Output it:
puts "The average price of a room is: $#{average_price}"
