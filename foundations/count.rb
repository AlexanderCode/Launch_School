
def count(array)
  counter = 0
  array.each { |num| counter += 1 if yield num }
  counter
end

p count([1, 3, 6]) { |value| value.odd? } == 2
p count([1, 3, 6]) { |value| value.even? } == 1
p count([1, 3, 6]) { |value| value > 6 } == 0
p count([1, 3, 6]) { |value| true } == 3
p count([]) { |value| false } == 0
p count([1, 3, 6]) { |value| value - 6 } == 3
