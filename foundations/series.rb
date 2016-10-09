class Series
  attr_reader :number

  def initialize(string)
    @number = string.to_s
  end

  def check_string_size(num)
    raise ArgumentError, "slice length to long!" if num > number.size
  end

  def slices(num)
    check_string_size(num)
    number.chars.each_cons(num).map { |arr| arr.map(&:to_i)}
  end
end

# inital exploration

#   def slices(num)
#     check_string_size(num)
#     count = 0
#     ending = num - 1
#     final_array = []
#     loop do
#       array = []
#       sliced_string = ''
#       sliced_string << @number.slice(count..ending)
#       break if sliced_string.size < num
#       sliced_string.size > 1 ? array = sliced_string.split('') : array << sliced_string
#       final_array << array.map(&:to_i)
#       count += 1
#       ending += 1
#     end
#     final_array
#   end
# end
