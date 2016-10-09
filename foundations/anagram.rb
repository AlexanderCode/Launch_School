# first I need to clarify my data... I am taking a word and looking for that word in a list
# given when the method match is called.

# i need to iterate over the array of possible words in the list and check it for the word
# given to me when the class instance is created

# one idea to identify anagrams is to delete any exact matches from the list and then sort
# each word in the anagram and the word we are matching and then they should be equal.

# select will be my itrerator to find the true

# class Anagram

#   def initialize(word)
#     @word = word.downcase
#   end

#   def match(word_array)
#     word_array.select { |anagram| valid?(anagram) }
#   end

#   private

#   def valid?(string)
#     string.downcase != @word && string.downcase.chars.sort == @word.chars.sort
#   end
# end

# the challenge is using no sort.  I decided to count the letters of each possible anagram
# word and see if they match the letter count of the word we are matching


# class Anagram

#   def initialize(word)
#     @word = word.downcase
#   end

#   def match(word_array)
#     word_array.select { |anagram| valid?(anagram) }
#   end

#   private

#   def valid?(string)
#     str = Hash[string.downcase.chars.group_by{ |c| c }.map{ |k, v| [k, v.size] }]
#     wor = Hash[@word.chars.group_by{ |c| c }.map{ |k, v| [k, v.size] }]
#     string.downcase != @word && str == wor
#   end
# end


# this one with permutation works but it takes a great deal of time for it to work since
# it has to look at every option for a word and check it to the main word.


class Anagram

  def initialize(word)
    @word = word.downcase
  end

  def match(word_array)
    word_array.select { |anagram| valid?(anagram) }
  end

  private

  def valid?(string)
    string.downcase != @word && string.chars.permutation.any? { |perm| perm == @word.chars }
  end
end