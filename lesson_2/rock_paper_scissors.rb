# rock_paper_scissors.rb

# the user makes a choice
# the computer makes a choice
# the winner is displayed
# repeat

VAILD_CHOICES = %w(rock paper scissors spock lizard)

def prompt(message)
  puts "=> #{message}"
end

def win?(first, second)
  first == 'rock' && second == 'scissors' ||
    first == 'rock' && second == 'lizard' ||
    first == 'paper' && second == 'spock' ||
    first == 'paper' && second == 'rock' ||
    first == 'scissors' && second == 'lizard' ||
    first == 'scissors' && second == 'paper' ||
    first == 'lizard' && second == 'paper' ||
    first == 'lizard' && second == 'spock' ||
    first == 'spock' && second == 'rock' ||
    first == 'spock' && second == 'scissors' ||
end

def display_result(player, computer)
  if win?(player, computer)
    prompt "You won!"
  elsif win?(computer, player)
    prompt "Computer won!"
  else
    prompt "Its a tie!"
  end
end

prompt "Welcome to Alex's Rock, Paper, Scissors, Lizard, and Spock game!"

player = ''

computer = ''

loop do
  loop do
    prompt "Choose one : #{VAILD_CHOICES.join(', ')}"
    player = gets.chomp

    if VAILD_CHOICES.include?(player)
      break
    else
      prompt "What game are you playing? thats not one of the choices!."
    end
  end

  computer = VAILD_CHOICES.sample

  prompt "you chose: #{player}; Computer chose: #{computer}"

  display_result(player, computer)

  prompt "play again? (Y for Yes)"
  answer = gets.chomp
  break unless answer.downcase.start_with? 'y'
end

prompt "Thanks for playing!"
