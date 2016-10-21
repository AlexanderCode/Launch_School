# a perfect number is a number that is equal to the sum of its divisors.  and if its more
# its abundant and if its under then its deficient.

# my data strucuture is going to be an array of the multiples.  I will do this with
# select and a iteration. the array can not include the final number but becuase it is
# an array of divisors that does not need the number itself we will never go past the 
# half way marker of the number.. and that last number does need to be included..
# example would be 6 becuase the array would be 1, 2, 3, and the last divisor would be
# 6 if we were including the number itself but since we are not its just the 1, 2, 3 
# so we see it never makes it past the half way mark. so instead of a range of 1...6 we
# can do (1..(6/2))

# once I have my array it will be a simple matter of reducing the sum of the array and
# comparing it to the number.

# my output will be one of 3 strings 'abundant' 'perfect' or 'deficient'

class PerfectNumber

  def self.classify(num)
    raise RuntimeError, 'Please only valid numbers!' if num < 2
    sum = (1..(num/2)).select { |n| num % n == 0 }.inject(:+)
    if sum < num
      "deficient"
    elsif sum > num
      "abundant"
    else
      "perfect"
    end
  end
end