# ok so I am doing a maximum rotation in my number which means the number all the way
# to the left gets placed on the end and then we freeze it in place while now moving the 
# second most to the left to the end and then freezing that one into place.

# essentially what I am doin is creating a loop that deletes a number and places that
# number at the end but the deleting number changes to the right each loop.

# if the integer starts with a zero it should be dropped before the exchange of values
# between index's happens.

# my data structure will be an array and i will be using each with index

def max_rotation(num)
  delete_index = 0
  num = num.to_s
  loop do
    break if (delete_index + 1) == num.size
    add_num = num[delete_index]
    num.gsub!(num[delete_index], '')
    num = num + add_num
    delete_index += 1
  end
  num.to_i
end


p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15
p max_rotation(8_703_529_146) == 7_321_609_845