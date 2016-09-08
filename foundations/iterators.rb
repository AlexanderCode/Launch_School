
def count(array)
  times = 0
  array.select { |n| times += 1 if yield(n) }
  times
end

def one?(array)
  seen_one = false
  array.each do |n|
    next unless yield(n)
    return false if seen_one
    seen_one = true
  end
  seen_one
end

def none?(array)
  array.each do |n|
    return false if yield(n) == true
  end
  true
end

# or none? could be:

# def none?(array, &block)
#   !any?(array, &block)
# end

def any?(array)
  array.each do |n|
    return true if yield(n) == true
  end
  false
end

def all?(array)
  array.each do |n|
    return false if yield(n) == false
  end
  true
end

p count([1,2,3,4,5]) { |value| value.odd? } == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2
