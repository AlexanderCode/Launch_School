# in pascals triangle each number is computed by adding the numbers to the
# right and left of the current position in the previous row.

# my method rows will be an array of arrays.. the internal arrays will be
# each row.

# when the class is called it takes a number and that is how many rows there
# will be

class Triangle

	def initialize(row)
		@total_row = row
		@triangle = [[1]]
	end

	def rows
		loop do
			return @triangle if @triangle.size == @total_row
			@triangle << @triangle.last.each_cons(2).map { |p| p.reduce(:+) }.unshift(1).push(1)
		end
	end

end