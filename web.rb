require 'sinatra'
require './class'

b = Blockchain.new


get '/' do
 b.current_chain.to_s
end

get '/mine'do
 b.mining
 "블럭찾았다!"
end
