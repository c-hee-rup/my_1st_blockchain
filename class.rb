require 'digest'

class Blockchain
	
	def initialize
		@chain = []
	end

	def mining
		begin
			nonce = rand(100)
		end while nonce != 0

		block = {
			'index' => @chain.length + 1,
			'time' => Time.now.to_i
		}
		@chain << block
	end
end
