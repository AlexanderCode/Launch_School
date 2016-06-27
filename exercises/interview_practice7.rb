# interview_practice7.rb

# create a method that takes a number and outputs
# check output
# create a prime check without using .prime
# output a Boolean value

def is_prime?(n)
  return false if n == 1
  (2..(n-1)).each do |divisor|
    return false if n % divisor == 0
  end
  true
end

def select_primes(arr)
  arr.select { |num| is_prime?(num) }
end

def count_primes(arr)
  select_primes(arr).count
end


p count_primes([1, 2, 3, 4]) # => 2
p count_primes([4, 6, 8, 10]) # => 0
