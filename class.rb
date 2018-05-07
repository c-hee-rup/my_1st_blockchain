require 'digest'
require 'securerandom'

class Blockchain
	
	def initialize
		@chain = []
		@trans = []
		@wallet ={}
	end

	def make_a_new_wallet
		address = SecureRandom.uuid.gsub("-","")
		@wallet[address] = 1000
		@wallet
	end

	def show_all_wallet
		@wallet
	end

	def make_a_trans(s, r, a)
		if @wallet[s].nil?
			"보내는 주소가 잘못되었습니다."
		elsif @wallet[r].nil?
			"받는 주소가 잘못되었습니다."
		elsif @wallet[s].to_f < a.to_f
			"돈 없다."
		else

		@wallet[s] = @wallet[s] - a.to_f
		@wallet[r] = @wallet[r] + a.to_f



			trans = {
				"sender" => s,
				"receiver" => r,
				"amount" => a
        	}
			@trans << trans
			@trans
		end
	end

	def mining
		begin
			nonce = rand(1000000)
			hashed = Digest::SHA256.hexdigest(nonce.to_s)	
		end while hashed[0..1] != '00'

		block = {
			"nHeight" => @chain.size,
			"nTime" => Time.now.to_i,
			"nNonce" => nonce,
			"previous_address" => Digest::SHA256.hexdigest(last_block.to_s),
			"transactions" => @trans,
			"block" => @chain << block
		}
		@trans = []
		@chain << block
	end
	
	def last_block
		@chain[-1]
	end
	def all_chains
		@chain
	end
end