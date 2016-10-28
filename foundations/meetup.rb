# when my class is called it will take a number of a month and a year and
# I need to be able to call up the whole date including the day based off
# of a few basic paramaters

# I need a method called day that will take symboles of things like day of the\
# week and whether the name of the day number ends in teenth like the
# thirteenth... once i combine those to clues it leads to one day of that
# month.

# the symboles will be first (as in first monday for example), teenth, the 
# day of the week, second, third, fourth, last
require 'date'


class Meetup


	def initialize(month, year)
		@month = month
		@year = year
	end

	def day(day_of_week, identifier)
		@day_of_week = day_of_week
		case 
		when identifier == :teenth
			@day = days((13..19).to_a)
		when identifier == :first
			@day = days((1..7).to_a)
		when identifier == :second
			@day = days((8..14).to_a)
		when identifier == :third
			@day = days((15..21).to_a)
		when identifier == :fourth
			@day = days((22..31).to_a)
		when identifier == :last
			@day = days((22..31).to_a.reverse)
		end
		Date.new(@year, @month, @day)
	end

	def days(array)
		ary = array.select { |d| Date.valid_date?(@year, @month, d) }
		result = 0
		case 
		when @day_of_week == :sunday 
			ary.each do |day|
				if Date.new(@year, @month, day).sunday?
					return day
				end
			end
		when @day_of_week == :monday 
			ary.each do |day|
				if Date.new(@year, @month, day).monday?
					return day
				end
			end
		when @day_of_week == :tuesday 
			ary.each do |day|
				if Date.new(@year, @month, day).tuesday?
					return day
				end
			end
		when @day_of_week == :wednesday 
			ary.each do |day|
				if Date.new(@year, @month, day).wednesday?
					return day
				end
			end
		when @day_of_week == :thursday 
			ary.each do |day|
				if Date.new(@year, @month, day).thursday?
					return day
				end
			end
		when @day_of_week == :friday 
			ary.each do |day|
				if Date.new(@year, @month, day).friday?
					return day
				end
			end
		when @day_of_week == :saturday 
			ary.each do |day|
				if Date.new(@year, @month, day).saturday?
					return day
				end
			end
		end
	end

end


# TEENTH.each do |day|
		# 	case 
		# 	when Date.new(@year, @month, day).monday?
				
		# 	when Date.new(@year, @month, day).tuesday?
		# 	when Date.new(@year, @month, day).wednseday?
		# 	when Date.new(@year, @month, day).thursday?
		# 	when Date.new(@year, @month, day).friday?
		# 	when Date.new(@year, @month, day).saturday?
		# 	when Date.new(@year, @month, day).sunday?
		# 	end