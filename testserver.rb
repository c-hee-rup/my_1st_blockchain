require 'sinatra'
require './test'

b = Blockchain.new


get '/' do
"now : " + b.my_blocks.to_s
end


get '/mine'do
 b.mining.to_s
end
