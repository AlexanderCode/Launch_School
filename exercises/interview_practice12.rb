# interview_practice12.rb

# create a method that takes a number year
# output an interger
# check dates for friday the 13th
# count how many times it happens
# output the count

require 'date'

def friday_13th?(year)
  amount = 0
  (1..12).each do |month|
    if Date.new(year, month, 13).friday?
      amount += 1
    end
  end
  amount
end

p friday_13th?(2015)
p friday_13th?(1986)


# need to work on reading documentation, the logic was there, just not how to use date.