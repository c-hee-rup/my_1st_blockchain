require 'telegram/bot'

token = '561672078:AAEb0mZRrNXuLGMlNbebLBx85CoJMwL40gs'

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    case message.text
    when '/start'
      bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}")
    when '/stop'
      bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}")
    when '시세는 얼마니'
      bot.api.send_message(chat_id: message.chat.id, text: "1,100만원 입니다.")
    end
  end
end