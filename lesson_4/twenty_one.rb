# twenty_one.rb

# initialize deck
# deal cards to player and dealer
# player turn: hit or stay
# repeat 5 until bust or stay
# if player bust then dealr wins
# dealer turn: hit or stay
# repeat until total >= 17
# if dealer bust, player wins
# compare cards and declare winner
# ask for repeat : if yes then return to 4
# good bye

suits = ['C', 'D', 'H', 'S']
values = ['A', '2', '3', '4', '5', '6', '7',
          '8', '9', '10', 'J', 'Q', 'K']

def prompt(msg)
  puts "=>#{msg}"
end

def deal_two_cards(card_deck, player_hand, dealer_hand)
  2.times do
    player_hand << card_deck.shuffle!.pop
    dealer_hand << card_deck.shuffle!.pop
  end
end

def deal_one_card(card_deck, hand)
  hand << card_deck.shuffle!.pop
end

def busted?(hand_value)
  hand_value > 21
end

# rubocop:disable Metrics/CyclomaticComplexity,MethodLength,PerceivedComplexity
def calculate_hand_value(hand)
  ace_count = 0
  hand_value = 0

  hand.flatten.each do |card|
    if card == 'A'
      ace_count += 1
      hand_value += 11
    elsif card == 'K' || card == 'Q' || card == 'J'
      hand_value += 10
    else
      hand_value += card.to_i
    end
  end

  while hand_value > 21 && ace_count > 0
    hand_value -= 10
    ace_count -= 1
  end
  hand_value
end
# rubocop:enable Metrics/CyclomaticComplexity, MethodLength, PerceivedComplexity

def play_again?
  loop do
    prompt "Would you like to play again? (Y or N)"
    answer = gets.chomp
    if answer.downcase.start_with?('y')
      break
    elsif answer.downcase.start_with?('n')
      prompt "Have a nice day!"
      sleep(1)
      exit
    else
      prompt "Not a valid choice!"
    end
  end
end

def compare_hands(player_hand, dealer_hand)
  if player_hand > dealer_hand || dealer_hand > 21
    prompt "Player wins!"
  elsif player_hand == dealer_hand
    prompt "It's a tie!"
  else
    prompt "Dealer wins!"
  end
end

def get_card_values(hand)
  hand.map { |_, value| value }.join(', ')
end

loop do
  loop do
    player_hand_value = 0
    card_deck = suits.product(values)
    dealer_hand = []
    player_hand = []
    deal_two_cards(card_deck, player_hand, dealer_hand)
    loop do
      system 'clear'
      prompt "You have: #{get_card_values(player_hand)}"
      player_hand_value = calculate_hand_value(player_hand)
      prompt "...for a total of: #{player_hand_value}"
      puts ""
      sleep(1)
      prompt "The dealer is showing: #{dealer_hand[0][1]}"

      break if player_hand_value > 21

      prompt "Would you like to 'hit' (h) or 'stay' (s)?"
      answer = gets.chomp
      if answer.downcase.start_with?('h')
        deal_one_card(card_deck, player_hand)
      elsif answer.downcase.start_with?('s')
        dealer_hand_value = calculate_hand_value(dealer_hand)
        prompt "dealer has: #{dealer_hand_value}"
        prompt "Dealer's cards: #{get_card_values(dealer_hand)}"
        sleep(1)
        break
      end
    end

    if !busted?(player_hand_value)
      dealer_hand_value = calculate_hand_value(dealer_hand)

      while dealer_hand_value < 17
        prompt "The dealer hits."
        sleep(1)
        deal_one_card(card_deck, dealer_hand)
        dealer_hand_value = calculate_hand_value(dealer_hand)
        prompt "Dealer has: #{get_card_values(dealer_hand)}"
        prompt "...for a total of: #{dealer_hand_value}"
        sleep(1)
      end
      compare_hands(player_hand_value, dealer_hand_value)
      sleep(1)
    else
      prompt "You bust! You lose."
    end
    break
  end
  play_again?
end
