require 'sinatra'
require './class'

b = Blockchain.new


get '/' do
 "전체 블록수는 : " + b.my_blocks.to_s
end

get '/mine'do
 b.mining
 "마이닝을 하였습니다."
end
