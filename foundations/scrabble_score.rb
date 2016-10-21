# I am calculating a scrabble score where I am given at the start a string.. I then have
# values for each letter which i will add up to the final sum.

# first I will take the string of letters and convert them into an array.  Then i will take
# a hash of letters to values and translate the array of letters into numbers. then I will
# reduce the numbers to a sum.

# i could also do a 7 level case statment and just replace the letters with numbers

class Scrabble

  def initialize(string)
    @result = [0]
    string.nil? ? @result : string.upcase.chars.each do |letter|
      case letter
      when /[A,E,I,O,U,L,N,R,S,T]/ then @result << 1
      when /[D,G]/                 then @result << 2
      when /[B,C,M,P]/             then @result << 3
      when /[F,H,V,W,Y]/           then @result << 4
      when /[K]/                   then @result << 5
      when /[J,X]/                 then @result << 8
      when /[Q,Z]/                 then @result << 10
      end
    end
  end

  def score
    @result.reduce(:+)
  end

  def self.score(string)
    Scrabble.new(string).score
  end
end
