# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  num.to_i != 0
end

def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

number1 = ''
number2 = ''

prompt "Hello and welcome to Alex's calculator!"
puts ''
prompt "What is your name?"
name = ''

loop do
  name = gets.chomp
  if name.empty?
    prompt "I need a name!"
  else
    break
  end
end

prompt "Hi #{name}!"

loop do # main loop
  loop do
    prompt "what is your first number?"
    number1 = gets.chomp

    if valid_number?(number1)
      break
    else
      prompt "That does not look like a valid number to me..."
    end
  end

  prompt number1 + " is your first number."
  puts ''

  loop do
    prompt "what is your second number?"
    number2 = gets.chomp

    if valid_number?(number2)
      break
    else
      prompt "That does not look like a valid number to me..."
    end
  end

  prompt number2 + " is your second number."
  puts ''

  operator_prompt = <<-MSG
  What operation would you like to preform?
  1) add
  2) subtract
  3) multiply
  4) divide
  MSG

  prompt operator_prompt

  operator = ''
  loop do
    operator = gets.chomp

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt "Must choose 1, 2, 3, or 4"
    end
  end

  prompt "#{operation_to_message(operator)} the two numbers..."

  result = case operator
           when '1'
             number1.to_i + number2.to_i
           when '2'
             number1.to_i - number2.to_i
           when '3'
             number1.to_i * number2.to_i
           when '4'
             number1.to_f / number2.to_f
           end

  prompt "your answer is #{result}!"
  prompt "do you want to perform another calculation? (Y to calculate again)"
  answer = gets.chomp
  break unless answer.downcase.start_with? 'y'
end

prompt "Thank you for using Alex's Calculator!"
