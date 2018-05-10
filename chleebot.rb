#encoding: UTF-8
require 'telegram/bot'
require 'httparty'

token = '561672078:AAEb0mZRrNXuLGMlNbebLBx85CoJMwL40gs'

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    case message.text
    when '/start'
      bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}")
    when '/stop'
      bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}")
    when 'price'

5.times do
  url = "https://api.binance.com/api/v3/ticker/price?symbol=ETHUSDT"

  total_price = HTTParty.get(url).body
  parsed_price = JSON.parse(total_price)
  target_price = parsed_price["price"]
  float_price = target_price.to_f
  final_price = float_price.round(2)
  msg_price = "현재 이더리움 가격은" + final_price.to_s + "달러입니다."


  url = 'http://api.fixer.io/latest?base=USD'

  rate = HTTParty.get(url).body
  parsed_rate = JSON.parse(rate)
  final_rate = parsed_rate["rates"]["KRW"]

  msg_price << "\nKRW : " + (float_price * final_rate.to_f).round(0).to_s + "만원"

  url = 'https://crix-api-cdn.upbit.com/v1/crix/candles/minutes/30?code=CRIX.UPBIT.KRW-ETH'
  upbit_price = HTTParty.get(url).body
  parsed_upbit_price = JSON.parse(upbit_price)
  final_upbit_price = parsed_upbit_price[0]["tradePrice"]
  float_final_upbit_price = final_upbit_price.to_f


kp = ((float_final_upbit_price - float_price * final_rate.to_f) / (float_price * final_rate.to_f)) * 100

    msg_price << "\nPremium : " + kp.round(2).to_s + "%"


      bot.api.send_message(chat_id: message.chat.id, text: msg_price)
      sleep(5)
    end
  end
end
end