# interview_practice13.rb

# create a method that takes a number
# the method should randomly generate an amount of math
# the method should loop creating math phrases till the number from the argument is reached
# the phrases should be combined in one string
# Then the method should output the math phrases

NUMBERS = %w(zero one two three four five six seven eight nine ten)
OPERATORS = %w(plus minus times divided)

def prompt(msg)
  p "=> #{msg}"
end

def mathphrase(arguments)
  array_num = []
  array_op = []
  (arguments + 1).times do 
    array_num << NUMBERS.shuffle.first
  end
  (arguments).times do 
    array_op << OPERATORS.shuffle.first
  end
  array_num.zip(array_op).join(' ').gsub('divided', 'divided by')
end

def mathphrase_argument(num)
  (num).times do
  length = (1..20).to_a.sample 
   prompt mathphrase(length)
  end
end


#p mathphrase(1)
#p mathphrase(2)
#p mathphrase(3)

mathphrase_argument(10)
