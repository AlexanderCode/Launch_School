# converting a trinary number to a decimal

# we need an array of data that is valid and non valid data = [0]
# we need to then take that array and reduce it to a single number

class Trinary
  attr_reader :trinary_array
  

  def initialize(string)
    @trinary_array = /^[0-2]+$/ =~ string ? string.chars.map(&:to_i) : [0]
  end

  def to_decimal
    trinary_array.inject(0) { |sum, num| (sum + num) * 3 } / 3
  end

end