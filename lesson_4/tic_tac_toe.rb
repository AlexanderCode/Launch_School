# tic_tac_toe.rb

# 1. display the initial empty 3x3 board.
# 2. ask the user to mark a square.
# 3. computer marks a square.
# 4. display the updated board state.
# 5. if winner, display winner.
# 6. if board is full, display tie.
# 7. if neither winner nor board is full, go to #2
# 8. play again?
# 9. if yes, go to #1
# 10. Have a nice day.

require 'pry'

NUMBER_GAMES = 5
INITIAL_MARKER = ' '.freeze
PLAYER_MARKER = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]]              # diagonals

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/MethodLength, Metrics/AbcSize
def display_board(brd, score1, score2)
  system 'clear'
  puts "You are a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts "Your score : #{score1}, Computer's score: #{score2}"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/MethodLength, Metrics/AbcSize

def intialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def computer_places_piece!(brd)
  square = nil

  # offense first
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd, COMPUTER_MARKER)
    break if square
  end

  defense
  if !square
    WINNING_LINES.each do |line|
      square = find_at_risk_square(line, brd, PLAYER_MARKER)
      break if square
    end
  end

  # just pick a square
  if !square
    square = empty_squares(brd).sample
  end

  brd[square] = COMPUTER_MARKER
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(arr, delimiter=', ', word='or')
  arr[-1] = "#{word} #{arr.last}" if arr.size > 1
  arr.size == 2 ? arr.join(' ') : arr.join(delimiter)
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "choose a square: (#{joinor(empty_squares(brd), ', ')})"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "sorry that is not a correct choice!"
  end

  brd[square] = PLAYER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def clear_score(score)
  score[:player] = score [:computer] = 0
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def decide_initial_player
  loop do
    prompt "Would you like to go first? (Y or N)"
    answer = gets.chomp
    if answer.downcase.start_with? 'y', 'n'
      initial_player = answer == 'y' ? 'Player' : 'Computer'
      return initial_player
    end
    prompt "Must enter Y or N."
  end
end

def alternate_player(current_player)
  current_player == 'Player' ? 'Computer' : 'Player'
end

def place_piece!(board, current_player)
  if current_player == 'Player'
    player_places_piece!(board)
  elsif current_player == 'Computer'
    computer_places_piece!(board)
  end
end

# Defense/Offense

def find_at_risk_square(line, board, marker)
  return unless board.values_at(*line).count(marker) == 2
  board.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
end

# Main Game
score = { player: 0, computer: 0 }
initial_player = decide_initial_player
current_player = initial_player

loop do
  board = intialize_board

  loop do
    display_board(board, score[:player], score[:computer])
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board, score[:player], score[:computer])

  if someone_won?(board)
    if detect_winner(board) == 'Player'
      score[:player] += 1
    else
      score[:computer] += 1
    end
    prompt "#{detect_winner(board)} earned 1 point!"
  else
    prompt "It's a tie!"
  end

  if score[:player] == 5 || score[:computer] == 5
    display_board(board, score[:player], score [:computer])
    prompt "game was won"
    prompt score[:player] == NUMBER_GAMES ? "You won!" : "Computer won!"
    prompt "Play again? (y or n)"
    answer = gets.chomp
    break unless answer.downcase.start_with?('y')
  end

  prompt "Enter to continue!"
  continue = gets.chomp
  break unless continue == ''
end

clear_score(score)
prompt "Good bye and thank you for playing."
