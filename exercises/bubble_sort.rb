# input

# array of words
# array of integers

# output

# array of words sorted from a to z
# array of integers from lowest number to highest

# i need to sort from lowest to highest number starting with the most
# left 2 numbers

# when I need to perform an exchange then my loop does not break
# but when no exchanges happen then I break and have my solution.

def bubble_sort!(array)
  loop do
    done = true
    idx = 0
    loop do
      if array[idx] > array[idx + 1]
        array[idx], array[idx + 1] = array[idx + 1], array[idx]
        idx += 1
        done = false
      else
        idx += 1
      end
      break if idx == array.size - 1
    end
    break if done == true
  end
  array
end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)