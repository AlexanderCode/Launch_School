
items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) do |*veggies, wheat |
  puts veggies.join(', ')
  puts wheat
end

gather(items) do | apples , *veggies, wheat|
  puts apples
  puts veggies.join(', ')
  puts wheat
end

gather(items) do | apples , *veggies|
  puts apples
  puts veggies.join(', ')
end

gather(items) do | apples, corn, cabbage, wheat|
  puts "#{apples}, #{corn}, #{cabbage}, and #{wheat}"
end

