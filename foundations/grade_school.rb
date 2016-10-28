# storing students names and the grade they are in

# in need a to_h method that gives a hash of arrays of all the students and the grades
# they are in... the grade being the key

# I need a add method to add kids to the roster that includes their name 
# and grade

# i need a grade method that calls a specific list of the grades kids with
# the output of their names in an array



class School

	def initialize
		@school_hash = Hash.new
	end
	
	def to_h
		Hash[@school_hash.sort]
	end

	def add(name, grade)
		if @school_hash[grade].nil?
			@school_hash[grade] = [name]
		else
			@school_hash[grade] << name
			@school_hash[grade] = @school_hash[grade].sort
		end
	end

	def grade(num)
		if @school_hash[num].nil?
			[]
		else
			@school_hash[num]
		end
	end

end