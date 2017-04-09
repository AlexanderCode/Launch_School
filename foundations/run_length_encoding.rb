# i need a way of counting the letters and I think chunk will do that nicley
# and I will get an array of the letters and the counts when joined it will
# give me exaclty what Im looking for but now I need to convert it back.

# I need a runlengthencoding class

# I need a decode method to take the nubmers and letters and turn them
# back into just a string

# I need an encode method to take a string and turn them into letters and 
# nubmers
require 'pry'

class RunLengthEncoding

	def self.encode(string)
		encoded = string.chars.chunk { |l| l}.map { |l, b| [b.size, l] }
		encoded.each { |ary| ary.delete_if { |n| n == 1 } }.join
	end

	def self.decode(string)
		decoded = string.chars
		digit = '0'
		result = []
		decoded.each do |char|
			case char
			when /\d/
				if digit == '0'
					digit = char
				else
					digit = digit + char
				end
			else
				if digit == '0'
					result << char
				else
					result << char * digit.to_i
					digit = '0'
				end
			end
		end
		result.join
	end

end