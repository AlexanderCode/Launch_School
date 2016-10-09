# when the object is created I am given a sentence and i need to break it up into
# individual words with a count of each word next to it in a hash

# first i need to create my data structure wich shall be an array to start off with
# consisting of each word

# i am needing to create my array of words ignoring puncuation and quotes and symboles
# but there is a word "can't" so if i just strip out all symboles then that test will
# fail so what I need is a regex that is smart enough to not pull out the "'" but also
# know to grab words without grabbing quotes.

# a method called word_count will be called to count the words.. i think i will group
# the words with group_by and then map with a key and size count of each array that is
# grouped

class Phrase

  def initialize(string)
    @string = string.downcase.scan(/\b[\w']+\b/) # .scan(/\w+'?\w+|\w+/) works too
  end

  def word_count
    Hash[@string.group_by { |word| word }.map { |k, v| [k, v.size] }]
  end
end