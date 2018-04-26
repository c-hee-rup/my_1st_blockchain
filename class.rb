require 'digest'

class Blockchain
	
	def initialize
		@number_of_blocks = 1
	end

	def mining
		@number_of_blocks = @number_of_blocks + 1
		history = []
		if @number_of_blocks < 100
		begin
			nonce = rand(1000000)
			hashed = Digest::SHA256.hexdigest(nonce.to_s)
			history << nonce
		end while hashed[0..1] != '00'
		history
		if @number_of_blocks > 200
		begin
			nonce = rand(1000000)
			hashed = Digest::SHA256.hexdigest(nonce.to_s)
			history << nonce
		end while hashed[0..3] != '0000'
		history
	end

	def my_blocks
		@number_of_blocks
	end

end
