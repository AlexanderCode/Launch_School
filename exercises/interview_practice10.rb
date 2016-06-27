# interview_practice10.rb


def substring(word, begin_num, end_num = nil)
  return word.split('')[begin_num] if !end_num
  array = []
  word.split('').each_with_index do |letter, index| 
    array.push(letter) if index >= begin_num && index <= end_num
  end
  return array.join('')
end


p substring("honey", 0, 2)
p substring("honey", 1, 2)
p substring("honey", 3, 9)
p substring("honey", 2)