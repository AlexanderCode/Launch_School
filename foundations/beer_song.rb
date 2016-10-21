# i am writing a repeating song with the number in the song changing with every loop
# and when the number reaches 0 the whole text changes.

# when the object is created with no data coming in.. when verse is called i get 2
#   numbers, a start and finish that default to 0 and 99

# when lyrics are called it plays the whole song fromm 99 to 0


class BeerSong

  def many_beer(number)
    "#{number} #{plural_bottle(number)} of beer on the wall, #{number} #{plural_bottle(number)} of beer.\n" \
    "Take one down and pass it around, #{number - 1} #{plural_bottle(number - 1)} of beer on the wall.\n"
  end

  def one_beer
    "1 bottle of beer on the wall, 1 bottle of beer.\n" \
    "Take it down and pass it around, no more bottles of beer on the wall.\n"
  end

  def no_beer
    "No more bottles of beer on the wall, no more bottles of beer.\n" \
    "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
  end

  def plural_bottle(number)
    if number < 2
      "bottle"
    else
      "bottles"
    end
  end

  def lyrics(start = 99, stop = 0)
    result = []
    number_array = (stop..start).to_a.reverse
    number_array.each do |number|
      case number
      when 0 then result << no_beer
      when 1 then result << one_beer
      else        result << many_beer(number)
      end
    end
    result.join('\n')
  end

  def verse(start)
    lyrics(start, start)
  end

  def verses(start, stop)
    lyrics(start, stop)
  end

end


p BeerSong.new.verses(99, 98)