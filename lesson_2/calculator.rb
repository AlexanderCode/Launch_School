# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

puts "Hello and welcome to Alex's calculator!"
puts ""
puts "what is your first number?"
number1 = gets.chomp
puts ""
puts number1 + " is your first number."
puts ""
puts "what is your second number?"
number2 = gets.chomp
puts ""
puts number2 + " is your second number."
puts ""
puts "what is your operation? 1) add 2) subtract 3) multiply 4) divide"
operator = gets.chomp

if operator == '1'
  result = number1.to_i + number2.to_i
elsif operator == '2'
  result = number1.to_i - number2.to_i
elsif operator == '3'
  result = number1.to_i * number2.to_i
else 
  result = number1.to_f / number2.to_f
end

puts "your answer is #{result}!"