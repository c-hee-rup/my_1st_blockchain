require 'httparty'

url = 'https://crix-api-cdn.upbit.com/v1/crix/candles/minutes/30?code=CRIX.UPBIT.KRW-ETH'

upbit_price = HTTParty.get(url).body
parsed_upbit_price = JSON.parse(upbit_price)
final_upbit_price = parsed_upbit_price[0]["tradePrice"]

puts final_upbit_price