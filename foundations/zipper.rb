
def zip(array1, array2)
  index = 0
  result = []
  array1.size.times do
    new_array = [array1[index], array2[index]]
    result << new_array
    index += 1
  end
  result
end

# or

def zipper(array1, array2)
  result = []
  array1.each_with_index do |value, index|
    result << [value , array2[index]]
  end
  result
end

# or

def zipper_refactored(array1, array2)
  array1.each_with_index.with_object([]) do |(value, index), result|
    result << [value, array2[index]]
  end
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]