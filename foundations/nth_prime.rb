# i need a program that caluculates the prime number given a number the 
# is the specific prime numric order.. example prime 1 is 2 and prime 6
# is 13.

# i will need a method called nth that takes a number and that tells me which
# prime number I need

# my output will be a number.

# my caluculation needs to be a fast one to handle large numbers

# i need to raise an argument error if the nth number is 0
require 'pry'

class Prime

	def self.nth(num)
		raise ArgumentError if num < 1
		result = []
		number = 2
		while result.size < num
			result << number if prime?(number)
			number += 1
		end
		result[-1]
	end

	def self.prime?(num)
    (2..Math.sqrt(num)).each { |divisor| return false if num % divisor == 0 }
  end

end

#Prime.nth(6)