require 'httparty'

index = 1
while true do
 HTTParty.get("www.al-co.co.kr")
 index = index + 1
 puts index
 end
