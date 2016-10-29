# i get a number or 2 when i call at first number is hour second is mins
# and then i need an at method to denote the 24 hour time

# remember mins cap at 60 and anything over 12 in hours is into the 24 hour
# clock.

# i need a to_s method that will create the time

# i need a + method that adds time to the base time created with at method

# i need a - method that subtracts time from the base time
require 'date'

class Clock

  def initialize(hour, min)
    @hour = hour
    @min = min
  end

  def self.at(hour, min = 0)
    Clock.new(hour, min)
  end
    
  def to_s
    @time = format('%02d:%02d', @hour, @min)
  end

  def translate(min)
    @min += min % 60
    @hour += min / 60
    @hour %= 24
    self
  end

  def +(num)
    translate(num)
  end

  def -(num)
    translate(-num)
  end

  def ==(time)
      to_s == time.to_s
  end

end
