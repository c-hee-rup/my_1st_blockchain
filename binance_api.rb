#encoding: UTF-8
require 'httparty'

url = "https://api.binance.com/api/v3/ticker/price?symbol=ETHUSDT"

total_price = HTTParty.get(url).body

parsed_price = JSON.parse(total_price)

target_price = parsed_price["price"]

float_price = target_price.to_f

final_price = float_price.round(2)

msg_price = "현재 이더리움 가격은" + final_price.to_s + "달러입니다."

puts total_price
puts parsed_price
puts target_price
puts float_price
puts final_price
puts msg_price