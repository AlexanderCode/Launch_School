class Robot
	DIRECTION = [:west, :north, :east, :south]
	attr_accessor :coordinates, :bearing		

	def orient(start)
		DIRECTION.include?(start) ? self.bearing = start : (raise ArgumentError)
	end

	def turn_right
		idx = DIRECTION.index(bearing)
		if idx < 3
			self.bearing = DIRECTION[idx + 1]
		else
			self.bearing = DIRECTION[0]
		end
	end

	def turn_left
		idx = DIRECTION.index(bearing)
		if idx > 0
			self.bearing = DIRECTION[idx - 1]
		else
			self.bearing = DIRECTION[3]
		end
	end

	def advance
		case bearing
		when :north then   coordinates[1] += 1
		when :east then    coordinates[0] += 1
    when :south then   coordinates[1] -= 1
    when :west then    coordinates[0] -= 1
		end
	end

	def at(num1, num2)
		self.coordinates = [num1, num2]
	end

end

class Simulator
	COMMANDS = {"R" => :turn_right, "A" => :advance, "L" => :turn_left}

	def instructions(string)
		command_array = string.chars.map { |letter| COMMANDS[letter] }
	end

	def place(bot, x:, y:, direction:)
		bot.orient(direction)
		bot.at(x, y)
	end

	def evaluate(bot, string)
		instructions(string).each { |command| bot.send(command) }
	end

end