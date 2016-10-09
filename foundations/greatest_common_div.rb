# when given 2 numbers i need to identify common multipliers and then identify which
# one is the largest.

# i will start this one by creating an array of each numbers multipliers by iterating over
# a range of numbers to the number.

# Then i will zip them together and delete ones that dont match
# this did not work since there are different length arrays.

# i will be left with an array of arrays and i will then flatten it and sort it poping
# the last diget off.

# this takes a long time since its doing so much caluculation.

# def gcd(a, b)
#   a_list = (1..a).to_a.select { |n| a % n == 0 }
#   b_list = (1..b).to_a.select { |n| b % n == 0 }
#   list = a_list.select do |num|
#     b_list.any? { |n| n == num }
#   end
#   list.sort.pop
# end

# another way to do it much more efficient

# def gcd(a, b)
#   [a, b].min.downto(1) { |num| return num if a % num == 0 && b % num == 0 }
# end

# even better

def gcd(a, b)
  [a, b].min.downto(1).find { |num| a % num == 0 && b % num == 0 }
end

p gcd(9, 15) == 3
p gcd(100, 1) == 1
p gcd(14, 28) == 14