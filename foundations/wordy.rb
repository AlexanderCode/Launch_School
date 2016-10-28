# ok in this problem the first 2 words of every string should be deleted
# and if the next string can not be converted to an interger and equal its
# string to ineger equivlent then we need to raise an argument error.  then
# we need to create a hash of math symboles so we can get multiplies by and
# divided by and plus and minus and cubed. then we need to create the 
# math problem with variables or possibly with a stack though the send
# method might work well here.


class WordProblem

	def initialize(string)
		string.gsub('?', '')
		@math_array = []
		@str_ary = !string.match(/[0-9]/) || string.include?('cubed') ? 
			(raise ArgumentError) : string.split(' ')
		@str_ary.each do |word|
			case word
			when /[0-9]/ then @math_array << word.to_i
			when 'multiplied' then @math_array << word
			when 'minus' then @math_array << word
			when 'plus' then @math_array << word
			when 'divided' then @math_array << word
			end
		end
	end

	def answer
		@sum = @math_array.shift
		idx = 1
		@math_array.each do |word|
			case word
			when 'multiplied'
				@sum = @sum.send '*', @math_array[idx]
				idx += 2
			when 'minus' 
				@sum = @sum.send '-', @math_array[idx]
				idx += 2
			when 'plus'
				@sum = @sum.send '+', @math_array[idx]
				idx += 2
			when 'divided'
				@sum = @sum.send '/', @math_array[idx]
				idx += 2
			end
		end
		@sum
	end
end

