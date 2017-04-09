# making random robot names that have 2 letters and 3 numbers

# when the robot is made it needs a name and then I need to be able to reset
# the name

# when reseting the name I need to confirm that the random new name is not
# the same as the old name.

class Robot
	@@taken_names = []

	def initialize
		@name = name_generator
		@name = uniq_name(@name)
		name_storage(@name)
	end

	def name_storage(name)
		@@taken_names << name
	end

	def uniq_name(name)
		if @@taken_names.include?(name)
			reset
		else
			@name
		end
	end

	def name
		@name
	end

	def name_generator
		alpha = ('A'..'Z').to_a
		alpha = 2.times.map { alpha.sample }.join
		numbers = (1..9).to_a
		numbers = 3.times.map { numbers.sample }.join
		(alpha + numbers)
	end

	def reset
		new_name = name_generator
		loop do 
			break if new_name != @name
			new_name = name_generator
		end
		@name = new_name
	end

end