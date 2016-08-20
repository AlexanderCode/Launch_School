class Player
  def initialize
    @player_hand = Deck.new
  end

  def hit
    
  end

  def stay
    
  end

  def busted?
    
  end

  def total
    #definatly looks like we need to know about "cards" to produce some total
  end
end

class Dealer
  def initialize
    
  end

  def hit
    
  end

  def stay
    
  end

  def busted?
    
  end

  def total
    
  end
end

class Participant
  # what goes in here? all the redundant behaviors from player and dealr?
end

class Deck

  def initialize
    @deck = Card.new.deck_possibilities
    @player_hand = []
    @dealer_hand = []
  end

  def deal
    hand = []
    2.times { hand << deck.shuffle.pop }
    hand
  end

  def deal_one
    hand = []
    hand << deck.shuffle.pop
    hand
  end
end

class Card
  SUITS = ['H', 'D', 'S', 'C']
  FACES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

  def initialize
    deck_possibilities
  end

  def deck_possibilities
  deck_array = []
    SUITS.map do |suit|
      FACES.each do |n|
        card_array = [suit, n]
        deck_array << card_array
      end
    end
    deck_array
  end
end

p Player.new
