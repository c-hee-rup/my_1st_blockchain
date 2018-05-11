
require 'httparty'

url = 'http://api.fixer.io/latest?base=USD'

rate = HTTParty.get(url).body

parsed_rate = JSON.parse(rate)

final_rate = parsed_rate["rates"]["KRW"]

puts final_rate