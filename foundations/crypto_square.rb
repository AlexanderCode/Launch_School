# i am encrypting words in 8 group words

# I need to normalize the words first and remove all symboles and spaces with
# a normalize_plaintext method

# i need a size method that evenly divides all letters up into the
# corrisponding square size just bigger then the amount of characters
# in the message

# i need a plaintext_segments method that gives an array of the broken
# up text

# i then need a ciphertext that stacks the colums of the squares

# then i need a normalize_ciphertext that breaks the ciphertext into the 
# squares again

# first i will purify my data cleaning out all non alpahnumric chars with
# regex.

# then i will use a case statment to determin which square to use

# then i will use slice to create the segments in an array

# i am thinking i will use a loop to create my ciphertext

# then feed the ciphertext into my plaintext_segments to break it up again
# and join it so its not in an array

class Crypto

	def initialize(string)
		@text = string.gsub(/\W/, '').downcase
	end

	def normalize_plaintext
		@text
	end

	def size
		Math.sqrt(@text.size).ceil
	end

	def plaintext_segments
		@text.scan(/.{1,#{size}}/)
	end

	def ciphertext
		normalize_ciphertext.delete(' ')
	end

	def normalize_ciphertext
		cipher_array.map { |chunk| chunk.join.strip }.join(' ')
	end

	def cipher_array
    segment = plaintext_segments
    segment[-1] = plaintext_segments[-1].ljust(size)
    segment.map(&:chars).transpose
  end

end
