# i have three letter codes that corespond to a protein name

# i will make a hash of keys consisting of the codon's and values that are
# the protein names

# there are three codon's that are hard stops that need to then return what
# I have translated ignoring the rest.

# my output needs to be an array of protein names

# i could use regex and case statment instead of the hash or both...


class Translation
	PROTEIN = {'AUG' => 'Methionine', 'UUU' => 'Phenylalanine',
						'UUC' => 'Phenylalanine', 'UUA' => 'Leucine', 
						'UUG' => 'Leucine', 'UCU' => 'Serine', 'UCC' => 'Serine',
						'UCA' => 'Serine', 'UCG' => 'Serine', 'UAU' => 'Tyrosine', 
						'UAC' => 'Tyrosine', 'UGU' => 'Cysteine', 'UGC' => 'Cysteine',
						'UGG' => 'Tryptophan', 'UAA' => 'STOP', 'UAG' => 'STOP', 
						'UGA' => 'STOP'}

	def self.of_codon(string)
		PROTEIN[string]
	end

	def self.of_rna(string)
		raise InvalidCodonError if (PROTEIN[string.slice(0..2)]) == nil
		str = []
		num_protein = string.size / 3
		num_protein.times do
			str << PROTEIN[string.slice!(0..2)]
		end
		result = []
		str.each do |protein|
			if 'STOP' == protein then return result
			else            result << protein
			end
		end
		result
	end
end

class InvalidCodonError < StandardError

end