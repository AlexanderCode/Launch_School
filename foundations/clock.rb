# i get a number or 2 when i call at first number is hour second is mins
# and then i need an at method to denote the 24 hour time

# remember mins cap at 60 and anything over 12 in hours is into the 24 hour
# clock.

# i need a to_s method that will create the time

# i need a + method that adds time to the base time created with at method

# i need a - method that subtracts time from the base time
require 'date'


class Clock

  def self.at(hour, min = 0)
    @@hour = hour
    @@min = min
  end

  def self.to_s
    DateTime.parse(("8:0")).strftime("%H:%M")
  end

  def hour_check
    if @hour <= 24
      @hour
    else
      @hour = @hour - 24
    end
  end

  def negative_hour_check
    neg_hour = 0
  end

  def positive_min_check
    if @min < 60
      @min
    else
      @hours = num / 60
      @min = num % 60
    end
  end

  def +(num)
    @min += num
    positive_min_check
    hour_check
  end

  def -(num)
    num * -1
    if num < @min
      @min - num
    elsif num < 60 && num > @min
      @hours -= 1
      @min = 60 - (num - @min)
    elsif num > 60 && num % 60 > @mins
      @hours -= (num / 60) + 2
      @min = 60 - (num - @mins)
    else
      @hours -= @hours -= num / 60
      @mins -= num % 60
    end
    hour_check
  end

end