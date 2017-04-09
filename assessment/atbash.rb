require 'rubocop'

# encoding letters with Atbash cipher and making words uniform length
class Atbash
  ALPHA = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z).freeze

  def self.encode(str)
    letters = str.downcase.gsub(/\W/, '').scan(/.{1,5}/).join(' ').chars
    cipher = letters.map do |letter|
      if /[[:alpha:]]/ =~ letter
        ALPHA[-(ALPHA.index(letter) + 1)]
      else
        letter
      end
    end
    cipher.join
  end
end
