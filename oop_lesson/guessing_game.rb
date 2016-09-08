
class PingGame
  attr_accessor :winning_number, :answer, :number_of_guesses, :low, :high

  def initialize(guesses, low_number, high_number)
    @number_of_guesses = guesses
    @answer = ''
    @low = low_number
    @high = high_number
  end

  def clear_screen
     system 'clear'
  end

  def play
    clear_screen
    reset
    winning_number_section
    game_message
    validation
    correct_answer?
  end

  def reset
    @number_of_guesses = 7
  end

  def guesses_check
    if number_of_guesses == 0
      p "You are out of guesses. You lose!"
    else
      game_message
    end
  end

  def winning_number_section
    @winning_number = (low..high).to_a.sample
  end

  def correct_answer?
    loop do
      break if number_of_guesses == 0
      if answer > winning_number
        p "Your guess is too high!"
        self.number_of_guesses -= 1
        guesses_check
      elsif answer < winning_number
        p "Your guess is too low!"
        self.number_of_guesses -= 1
        guesses_check
      else
        p "You Win!!"
        break
      end
    end
  end

  def validation
    loop do
      break if answer >= 1 && answer <= 100 && (answer.to_i.to_s == answer.to_s)
      p "Not a valid answer!"
    end
  end

  def game_message
    p "You have #{number_of_guesses} remaining."
    p "Enter a number between 1 and 100:"
    @answer = gets.chomp.to_i
  end
end

game = PingGame.new
game.play

game.play
