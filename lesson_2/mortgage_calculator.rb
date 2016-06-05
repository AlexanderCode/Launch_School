# mortgage_calculator.rb

def prompt(message)
  puts "=> #{message}"
end

prompt "Welcome to Alex's Mortgage Calculator!"
puts ''

loop do
  loan = ''
  interest_rate = ''
  years = ''

  loop do
    prompt "What is the loan amount?"
    loan = gets.chomp

    if loan.empty? || loan.to_f < 0
      prompt "Please enter a valid positive number"
    else
      break
    end
  end

  loop do
    prompt "What is the interest rate?"
    prompt "(Example: 5 for 5% or 2.5 for 2.5%)"
    interest_rate = gets.chomp

    if interest_rate.empty? || interest_rate.to_f < 0
      prompt "Please enter a valid positive number"
    else
      break
    end
  end

  loop do
    prompt "What is the loan duration in years?"
    years = gets.chomp
    if years.empty? || years.to_i < 0
      prompt "Please enter a valid number"
    else
      break
    end
  end

  annual_interest_rate = interest_rate.to_f / 100
  monthly_interest_rate = annual_interest_rate / 12
  months = years.to_i * 12

  monthly_payment = loan.to_f *
                    (monthly_interest_rate /
                    (1 - (1 + monthly_interest_rate)**-months.to_i))

  prompt "Your monthly payment is: $#{format('%02.2f', monthly_payment)}"
  prompt "would you like to do this again? (Y for yes)"
  answer = gets.chomp
  break unless answer.downcase.start_with? 'y'
end

prompt "Good bye and have a nice day!"
