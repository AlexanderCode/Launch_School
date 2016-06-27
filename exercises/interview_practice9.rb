# interview_practice9.rb

# create a method that takes two arrays as arguments
# combine the arrays alternating between them
# output the new array

def combine(array1, array2)
  array1.zip(array2).flatten
end

p combine([1, 2, 3], ["a", "b", "c"])