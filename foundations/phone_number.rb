# 5 rules to accepting a correct phone number

# 1. if the phone number is less then 10 digits then its bad
# 2. if the phone number is 10 digits assume its good
# 3. if the phone number is 11 digits and the first number is 1, take off the
# 	 1 and use the last 10 digits
# 4. if the phone number is 11 digits and the first number is not 1 then its
# 	 a bad number
# 5. if the phone number is more then 11 digits assume that its a bad number

# the phone number is given upon calling the class and then the method number
# calls the number as a string without any non alphanumric chars.

# i will use regex to strip the non alphanumric characters out and then strip
# the spaces out.

class PhoneNumber

	def initialize(number)
		@phone_number = number.gsub(/\W/, '')
		@phone_number.match(/\D/) ? @phone_number = '0000000000' : @phone_number
	end

	def number
		case 
		when @phone_number.size == 10
			@phone_number
		when @phone_number.size == 11 && @phone_number[0] == '1'
			@phone_number.slice!(0)
			@phone_number
		else
			@phone_number = '0000000000'
		end
	end

	def area_code
		number
		@phone_number.slice!(0..2)
	end

	def to_s
		number
		code = area_code
		"(#{code}) #{@phone_number.slice!(0..2)}-#{@phone_number}"
	end

end