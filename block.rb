class Dog
 def initialize
 	@weight = 0.5
 	@age = 1
 	@previous_weight = 0
 end
 def my_weight
 	puts "기존 몸무게 : " + @previous_weight.to_s
 	puts "현재 몸무게 : " + @weight.to_s
 end
 def eat
 	@previous_weight = @weight
 	@weight = @weight +0.5
 	puts "먹는다."
 end

 def run
 	puts "뛴다."
 end

 def walk
 	puts "걷는다."
 end
end

puppy = Dog.new
puppy.my_weight
puppy.eat
puppy.my_weight

