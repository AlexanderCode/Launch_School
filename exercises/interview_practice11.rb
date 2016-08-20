# interview_practice11.rb

# create a method that takes a string
# split that string
# capitalize the first letter of each word
# recombine the words into a string
# output the string

require 'pry'
def letter_cap(string)
string.split.collect do |words|
  letters = words.split('')
  letters.first.upcase!
  
  new_words = letters.join('')
  
  new_words
end

end

def word_cap(string)
  letter_cap(string).join(' ')
end

p word_cap('four score and seven')
p word_cap('the javaScript language')
p word_cap('this is a "quoted" word')


# I got this to work by making 2 splits and then 2 definitions, 
# so I could do 2 joins.  javaScript is what made me do this.