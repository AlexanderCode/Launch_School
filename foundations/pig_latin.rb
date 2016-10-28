# rule 1 is if a word begins with a vowel sound add an ay sound to the
# end of the word

# rule 2 is if a word begins with a consonant sound move it to the end
# of the word and then add an ay sound to the end of the word.

# i should use regex to determin if a vowel is in front of the word and 
# then I will just apply ay to the end of that word and done

# anything that gets past that check should fall into rule 2

class PigLatin

	def self.translate(string)
		case string
			when /^yt/
			return string + 'ay'
		when /^xr/
			return string + 'ay'
		end
		
		final = string.split(' ').map do |str|
			new_string = double_consonant(str)
			if new_string[0].match(/[aeiou]/)
				result = new_string
				double_consonant(result) + 'ay'
			else
				string_array = new_string.chars
				switch_char = string_array.shift
				string_array = string_array.push(switch_char)
				result = string_array.join('')
				double_consonant(result) + 'ay'
			end
		end
		final.join(' ')
	end

	def self.double_consonant(string)
		case string
		when /^ch/
			sliced = string.slice!(0..1)
			string + sliced
		when /^qu/
			sliced = string.slice!(0..1)
			string + sliced
		when /^th/
			sliced = string.slice!(0..1)
			string + sliced
		when /^thr/
			sliced = string.slice!(0..2)
			string + sliced
		when /^sch/
			sliced = string.slice!(0..2)
			string + sliced
		else
			string
		end
	end

end