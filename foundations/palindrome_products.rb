# so here I am taking the product of two 2 digit numbers and seeing if its a 
# palindromic number and my out put is the largest of those numbers in a
# range.

# I get a max factor and somtimes a min factor on initilization

# i need a generate method called on the object and then a largest
# method clalled on the palindroms generated from the first method
# and then a value method called on the largest method to get the
# actual value of the largest palindrom

# finaly in need a factors method called on the largest method that outputs
# me an array of arrays of arrays example [[[3, 3], [1, 9]], [[1, 9], [3, 3]]]
require 'pry'


class Palindromes

	def initialize(factor)
		@max_num = factor[:max_factor]
		@min_num = factor[:min_factor] || 1
		@raw_array = (@min_num..@max_num).to_a
		@palindromic = Hash.new { |hash, key| hash[key] = [] }
	end

	def generate
		@factors = []
		@raw_array.repeated_combination(2) do |num1, num2|
			@palindromic[num1 * num2] << [num1, num2 ] if (num1 * num2).to_s == (num1 * num2).to_s.reverse
		end
	end

	def largest
		largest_pal = @palindromic.keys.max
		Struct.new(:value, :factors).new(largest_pal, @palindromic[largest_pal])
	end

	def smallest
		smallest_pal = @palindromic.keys.min
		Struct.new(:value, :factors).new(smallest_pal, @palindromic[smallest_pal])
	end
end