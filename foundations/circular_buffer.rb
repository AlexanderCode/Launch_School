# this is an array where wer are using shift and push to remove or add things

# if teh buffer is full we need an argument to be raised

# if the buffer is empty we need a an argument raised

# a method read will pull out the oldest number in the buffer and 
# delete it while outputing it to the user

# a method write will put a number in the buffer and if the buffer is full
# it raise an error

# nil cannot be writing into the buffer

# a method write! will overwrite the oldest number if the buffer is full
# but still write! cannot force nil into the buffer

# write! should just add a number if there is space to add the number in the
# buffer.


class CircularBuffer

	def initialize(num)
		@max_size = num
		@buffer = []
	end

	def clear
		@buffer = []
	end

	def read
		raise BufferEmptyException if @buffer.empty?
		@buffer.shift
	end

	def write(obj)
		if obj.nil?
			nil
		elsif @buffer.size == @max_size
			raise BufferFullException
		else
			@buffer.push(obj)
		end
	end

	def write!(obj)
		if obj.nil?
			nil
		elsif @buffer.size == @max_size
			@buffer.shift
			@buffer.push(obj)
		else
			@buffer.push(obj)
		end
	end

	class BufferEmptyException < Exception

	end

	class BufferFullException < Exception

	end
end

