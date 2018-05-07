#encoding: UTF-8

require 'sinatra'
require './class'


b = Blockchain.new

get '/number_of_blocks' do
	b.all_chains.size.to_s
end

get '/recv' do
	recv_block = JSON.parse(params["blocks"])
	b.recv(recv_block)
	b.all_chains.to_json
end


get '/ask' do
	b.ask_other_block.to_s
end

get '/add_node' do
	b.add_node(params["node"])
end

get '/' do
	message = "<center>"
	b.all_chains.each do |c|
		message << "Block number :" + c["nHeight"].to_s + "<br>"
		message << "Nonce :" + c["nNonce"].to_s + "<br>"
		message << "Timestamp :" + c["nTime"].to_s + "<br>"
		message << "Previous address :" + c["previous_address"].to_s + "<br>"
		message << "Hash :" + Digest::SHA256.hexdigest(c.to_s) + "<br>"
		message << "Transactions :" +c["transactions"].to_s + "<br>"
		message << "<hr>"	
end
	message << "</center>"
	message
end

get '/mine'do
	message = "<center>"

	b.mining.each do |d|
		message << d["block"].to_s + "<br>"
		message << "<hr>"

end

	message << "</center>"
	message
end

get '/trans'do
	b.make_a_trans(params["sender"], params["recv"], params["amount"]).to_s
end

get '/new_wallet' do
	b.make_a_new_wallet.to_s
end

get '/all_wallet' do
	b.show_all_wallet.to_s
end
