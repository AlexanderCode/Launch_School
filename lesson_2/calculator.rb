# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def messages(message, lang = 'en')
  MESSAGES[lang][message]
end

LANGUAGE = 'en'

def prompt(message)
  puts "=> #{message}"
end

def valid_number?(input)
  input.to_i.to_s == input
end

def float?(input)
  input.to_f.to_s == input
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

prompt messages('welcome', LANGUAGE)
puts ''
prompt messages('name', LANGUAGE)
name = ''

loop do
  name = gets.chomp
  if name.empty?
    prompt messages('valid_name', LANGUAGE)
  else
    break
  end
end

prompt messages('greeting_name', LANGUAGE) + "#{name}!"

loop do # main loop
  loop do
    prompt messages('first_num', LANGUAGE)
    number1 = gets.chomp

    if valid_number?(number1)
      break
    else
      prompt messages('valid_num', LANGUAGE)
    end
  end

  prompt number1 + messages('first_confirm', LANGUAGE)
  puts ''

  loop do
    prompt messages('second_num', LANGUAGE)
    number2 = gets.chomp

    if valid_number?(number2)
      break
    else
      prompt messages('valid_num', LANGUAGE)
    end
  end

  prompt number2 + messages('second_confirm', LANGUAGE)
  puts ''

  prompt messages('op_choice', LANGUAGE)
  prompt messages('op_choice1', LANGUAGE)
  prompt messages('op_choice2', LANGUAGE)
  prompt messages('op_choice3', LANGUAGE)
  prompt messages('op_choice4', LANGUAGE)

  operator = ''
  loop do
    operator = gets.chomp

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt messages('valid_op', LANGUAGE)
    end
  end

  prompt "#{operation_to_message(operator)} " + number1 +
         messages('working', LANGUAGE) + number2 + "..."

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

  prompt messages('calc_answer', LANGUAGE) + "#{result}!"
  prompt messages('again', LANGUAGE)
  answer = gets.chomp
  break unless answer.downcase.start_with? 'y'
end

prompt messages('thank', LANGUAGE)
