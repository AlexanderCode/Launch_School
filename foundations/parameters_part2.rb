
def birds(array)
  yield(array)
end

birds(%w(raven finch hawk eagle)) do |array|
  _, _, *birds_of_prey = array
  puts birds_of_prey
end
