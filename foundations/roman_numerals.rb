# converting numbers to roman numerals.. its seems to me that ranges can help with this
# and looping or doing somthign so many times based on where the number falls in the range
# can help.

# my data should be an array to start with possibly splitting the number and dealing with
# each number seaperatly through a case statment and then joining them at the end

# if i reverse the array with the converting number then i get a corisponding index


# if /[1-3]/ === num then 'I' * num

class Fixnum
  SYM = [['I', 'V' ,'X'], ['X' , 'L', 'C'], ['C', 'D', 'M'], ['M']]

  def to_roman
    result = []
    self.to_s.chars.reverse.each_with_index do |v, idx|
      case v
      when /[1-3]/ then result << SYM[idx][0] * v.to_i
      when '4' then result << SYM[idx][0] + SYM[idx][1]
      when '5' then result << SYM[idx][1]
      when /[6-8]/ then result << SYM[idx][1]  + SYM[idx][0] * (v.to_i - 5)
      when '9' then result << SYM[idx][0] + SYM[idx][2]
      end
    end
    result.reverse.join
  end
end
