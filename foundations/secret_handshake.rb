# I need to translate the data to binary and then translate that into the
# secret hand shake.  my thought is that i can take the binary number and
# reverse it and put it into an array so we work it from left to right.
# and depending on the index we will have specific responses and if there
# is a greater number then 1 we are multiplying by the value... so value
# multiplies how many of a move happens and the index determins which move
# is being activated.



class SecretHandshake
	MOVES = ['wink', 'double blink', 'close your eyes', 'jump', 'R']

	def initialize(num)
		@number = num.to_i.to_s(2).chars.reverse
	end

	def commands
		result = []
		@number.each_with_index do |value, idx|
			value != '0' ? result << (MOVES[idx] * value.to_i) : ''
		end
		if result.include?('R')
			result.pop
			result.reverse
		else
			result
		end
	end

end