# right most digit is a check digit
# moving left we double every second digit
# if the doubled digit is greater then 9 then we subtract 9 from it
# we need to have a check sum where all digits are added together.
# if the chech sum ends in 0 then its valid so we need a check valid method
# the check digit makes the checksum a valid number ending in 0

# first i need to purify my data.. i am getting a number and it will need
# to be converted into an array when its done being processed

# i need a create method on teh class that gives the translated
# number

# i need a valid check method called on the object to see if it ends with 0 
# when the check digit is added

# i need a checksum method called on the object to

# i need a method called addends to do the adition changes of the number 
# before adding the check digit

class Luhn
	
	def initialize(num)
		@@original_num = num
		@translated_num = (addends).join('')
		@@check_sum = checksum
		
	end

	def self.create(num)
		result = num.to_s.chars << check_digit(num).to_s
		result.join('').to_i
	end

	def addends
		result = []
		new_num = @@original_num.to_s.chars.map(&:to_i)
		new_num.reverse.each_with_index do |value, idx|
			case 
			when idx.even? then result << value
			when idx.odd?	then result << value * 2
			end
		end
		result = result.map do |num|
			if num < 10
				num
			else
				num - 9
			end
		end
		result.reverse
	end

	def self.check_digit(num)
		result = []
		array = num.to_s.chars.map(&:to_i)
		array.each_with_index do |value, idx|
			if array.size.odd?
				case 
				when idx.odd? then result << value
				when idx.even?	then result << value * 2
				end
			else
				case 
				when idx.even? then result << value
				when idx.odd?	then result << value * 2
				end
			end
		end
		result = result.map do |num|
			if num < 10
				num
			else
				num - 9
			end
		end
		result = result.reduce(:+)
		if result % 10 == 0
			result = 0
		else
			result = 10 - (result % 10)
		end
		result
	end

	def checksum
		@translated_num.to_s.chars.map(&:to_i).reduce(:+)
	end

	def valid?
		@@check_sum % 10 == 0
	end

end