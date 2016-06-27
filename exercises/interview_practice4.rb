# interview_practice4.rb


# create a method
# out put something from that method
# accept an array of strings
# iterate over that array
# grab the vowels
# remove the vowels
# output an array with the changed strings



def vowel_remover(arr)
  arr.join(' ').downcase.gsub("a", '').gsub("e", '').gsub("o", '').gsub("u", '').gsub("i", '').split(' ')
end

p vowel_remover(["green", "yellow", "black", "white"])