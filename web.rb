require 'sinatra'
require './class'
#encoding: UTF-8 

b = Blockchain.new


get '/' do
	message = ""
	b.current_chain.each do |c|
		message << "번호는" + c['index'].to_s + "입니다.<br>"
		message << "Nonce" + c['nonce'].to_s + "입니다.<br>"
		message << "시간은" + c['time'].to_s + "입니다.<br>"
		message << "이전 주소는" + c['previous_block'].to_s + "입니다.<br>"
		message << "내 주소는" + Digest::SHA256.hexdigest(c.to_s) + "입니다.<br>"
		message << "<hr>"	
end

message
end


get '/mine'do
	"<center><h1>nonce 값을 찾았습니다.</h1></center>" + b.mining.to_s

end