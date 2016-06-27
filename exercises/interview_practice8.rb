# interview_practice8.rb

# greet user
# ask user for input
# take input
# ask user if they want the sum or product
# compute sum or product
# tell the user the answer

def prompt(msg)
  puts "=> #{msg}"
end

def calculate_sum(num)
  (1..num).inject { |sum, n| sum + n }
end

def calculate_product(num)
  (1..num).inject { |pro, n| pro * n }
end

sum = ''
product = ''
num = ''
action = ''

prompt "Hello, please give me a number greater than 0"
num = gets.chomp.to_i

prompt "What would you like to do? enter 's' for sum and 'p' for product"
action = gets.chomp

if action.downcase.start_with? 's'
  sum = calculate_sum(num)
  prompt "the sum of the intergers between 1 and #{num} is #{sum}"
else
  product = calculate_product(num)
  prompt "the product of the intergers between 1 and #{num} is #{product}"
end