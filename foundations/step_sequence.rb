
def step(start, stop, increment)
  count = start
  loop do |value|
    yield count
    break if count >= stop
    count += increment
  end
end

step(1, 10, 3) { |value| puts "value = #{value}" }