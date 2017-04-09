





# def bubble_sort!(array)
#   loop do
#     done = true
#     idx = 0
#     loop do
#       if block_given?
#         if yield(array[idx], array[idx + 1])
#           array[idx], array[idx + 1] = array[idx + 1], array[idx]
#           idx += 1
#           done = false
#         else
#           idx += 1
#         end
#       else
#         if array[idx] > array[idx + 1]
#           array[idx], array[idx + 1] = array[idx + 1], array[idx]
#           idx += 1
#           done = false
#         else
#           idx += 1
#         end
#       end
#       break if idx == array.size - 1
#     end
#     break if done == true
#   end
#   array
# end

def bubble_sort!(array)
  loop do
    done = true
    idx = 0
    loop do
      break if idx == array.size - 1
      if block_given?
        idx += 1
        next if yield(array[idx - 1], array[idx])
      else
        idx += 1
        next if array[idx - 1] <= array[idx]
      end

      array[idx], array[idx - 1] = array[idx - 1], array[idx]
      done = false
    end
    break if done == true
  end
  array
end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [5, 3, 7]
bubble_sort!(array) { |first, second| first >= second }
p array == [7, 5, 3]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = [6, 12, 27, 22, 14]
bubble_sort!(array) { |first, second| (first % 7) <= (second % 7) }
p array == [14, 22, 12, 6, 27]

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array)
p array == %w(Kim Pete Tyler alice bonnie rachel sue)

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array) { |first, second| first.downcase <= second.downcase }
p array == %w(alice bonnie Kim Pete rachel sue Tyler)