require 'digest'

class Blockchain
	
	def initialize
		@chain = []
	end

	def make_a_trans(s, r, a)
		s + r + a
	end

	def mining
		begin
			nonce = rand(1000000)
			hashed = Digest::SHA256.hexdigest(nonce.to_s)
		end while hashed[0..1] != '00'

		block = {
			'index' => @chain.length + 1,
			'time' => Time.now.to_i,
			'nonce' => nonce,
			'previous_block' => Digest::SHA256.hexdigest(last_block.to_s)
		}
		@chain << block
	end

	def current_chain
		@chain
	end
	
	def last_block
		@chain[-1]
	end
  
end
