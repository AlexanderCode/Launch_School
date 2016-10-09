# multiples of 2 numbers must be found up to a max numbers
# those numbers must be agranged in an array
# then we need the sum of all the numbers in the array

# class SumOfMultiples

#   def initialize(m1 = 3, m2 = 5, m3 = 0)
#     @@mult1 = m1
#     @@mult2 = m2
#     @@mult3 = m3
#   end

#   def self.array_check(array, num)
#     if array.count == 1
#       array
#     else
#       array = (1..(num - 1)).to_a
#     end
#   end

#    def array_check(array, num)
#     if array.count == 1
#       array
#     else
#       array = (1..(num - 1)).to_a
#     end
#   end

#   def self.to(num)
#     mult_array = (1..num).to_a
#     mult_array = array_check(mult_array, num)
#     final_mult_array = mult_array.map { |n| n % 3 == 0 || n % 5 == 0 ? n : 0 }.inject(:+)
#   end

#   def check_3rd_mult(num)
#     mult_array = (1..num).to_a
#     if @@mult3 != 0
#       mult_array.map { |n| n % @@mult3 == 0 ? n : 0 }
#     else
#       0
#     end
#   end

#   def to(num)
#     mult_array = (1..num).to_a
#     mult_array = array_check(mult_array, num)
#     final_mult_array = mult_array.map { |n| n % @@mult1 == 0 || n % @@mult2 == 0 ? n : 0 }
#     final_mult_array << check_3rd_mult(num)
#     final_mult_array.flatten.uniq.inject(:+)
#   end

# end

# I need to get my data straight... varibles are not cutting it so finish all my data collection 
# and storage in the initialize

# i should build a to definition that can be used in the self to as well this needs to iterate
# with my math

# possibly build out the calculation into a def

# class SumOfMultiples

#   def initialize(*multiples)
#     @@multiples = multiples.empty? ? [3, 5] : multiples
#   end

#   def to(num)
#     (0...num).select { |n| math(n) }.inject(:+)
#   end

#   def self.to(num)
#     SumOfMultiples.new.to(num)
#   end

#   def math(num)
#     @@multiples.any? { |multiple| num % multiple == 0 }
#   end

# end



# I need to clean my data and since i do not know how many multiples are going to be
# added in then i need to accept an array as my data.

# my range should be up to the limit number but not include it.

# I need to iterate over my array of my range of data, and for each number i need to 
# iterate over my multiples.

# I will start iterating over my range and use a def of math passed in the block that
# iterates over my multiples checking... i only want the true ones so the first iteration
# should be select.


class SumOfMultiples

  def initialize(*multiples)
    @multiples = multiples.empty? ? [3, 5] : multiples
  end

  def to(limit)
    (0...limit).select { |num| math(num) }.reduce(:+)
  end

  def math(num)
    @multiples.any? { |multiple| num % multiple == 0 }
  end

  def self.to(limit)
    SumOfMultiples.new.to(limit)
  end

end
