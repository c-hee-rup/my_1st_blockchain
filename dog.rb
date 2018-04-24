require 'sinatra'
require './block'

puppy = Dog.new

get '/' do
	"Dog" + puppy.my_weight
end

get '/eat' do
	puppy.eat
	'먹었음'
end
