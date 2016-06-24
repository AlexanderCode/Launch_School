#interview_practice2.rb
#fizzbuzz

# create a method that takes 2 arguments
# need to iterate through each number
# identify the numbers divisable by 3
# replace these numbers with Fizz
# identify the numbers divisable by 5
# replace these numbers with Buzz
# identify the numbers divisable by both 3 and 5
# replace these numbers with FizzBuzz
# place it all in an array
# convert the array to a string


def fizzbuzz (num1, num2)
  numbers = Array(num1..num2).map do |n|
    if n % 3 == 0 && n % 5 == 0
     "FizzBuzz"
    elsif n % 3 == 0
      "Fizz"
    elsif n % 5 == 0
      "Buzz"
    else 
      n
    end 
  end
  numbers.join(', ')
end

p fizzbuzz(1, 15)