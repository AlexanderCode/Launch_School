# interview_practice6.rb

# create a method that caluculates prime
# confirm prime oupute from method
# create method that checks range for prime
# print from second method
# create range between numbers and check primes
# out put primes

def prime_math(n)
  (2..(n - 1)).each do |divisor|
    return false if n % divisor == 0 
  end
  true
end



def primes(num1, num2)
  pri = (num1..num2).select do |n|
          prime_math(n)
  end
  pri.join(', ')
end

p primes(3, 10)