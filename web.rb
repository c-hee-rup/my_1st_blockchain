require 'sinatra'
require './class'

b = Blockchain.new


get '/' do
 "전체 블록수는 : " + b.my_blocks.to_s
end

get '/mine'do
 b.mining.to_s
end
