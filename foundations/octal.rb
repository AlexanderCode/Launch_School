# class Octal
#   attr_reader :oct_num

#   def initialize(num)
#     @oct_num = num
#   end

#   def alpha_check
#     array = []
#     oct_num.chars do |num|
#       if num.to_i.to_s == num
#         array << false
#       else
#         array << true
#       end
#     end
#     return true if array.include?(true)
#   end

#   def oct_check(array)
#     return true if array.include?('9') || array.include?('8')
#     false
#   end

#   def to_decimal
#     array = oct_num.split('')
#     return 0 if oct_check(array)
#     return 0 if alpha_check
#     n = 0
#     final_array = []
    
#     loop do
#       break if array == []
#       final_array << ((array.pop).to_i * (8**n))
#       n += 1
#       end
#     final_array.inject(:+)
#   end
# end

# first step is to get my clean data... an array with only numbers and no edge case problems

# so just looking at the data we can see that only 0-7 are the numbers we want so no 8 or 9 and 
# no letters so this feels like a regex check and if it does not qualify then change to 0

# then I need to combine my array into one value or reduce it down

# need to play with the math but i think i can inject a formula to reduce an array to our number

class Octal
  attr_reader :oct_array

  def initialize(string)
    @oct_array = /^[0-7]+$/ === string ? string.chars.map(&:to_i) : [0]
  end

  def to_decimal
    oct_array.inject(0) { |sum, num| (sum + num) * 8 } / 8
  end

end
