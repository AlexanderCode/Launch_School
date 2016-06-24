# interview_practice.rb
# take a string as an argument, return the string in reverse order

# tasks are:

# create a method that breaks the string up and then puts it back together
# fist a split happens
# then it needs to be stored
# then we place last element in the 0 index of an array
# then we stop the process when no more string elemnts are available
# then we output the new reversed string


def reverse_string(string)
  reverse_array = []
  new_array = string.split("")

  string.length.times do 
    reverse_array << new_array.pop
    
  end

  reverse_array.join(' ')
end


puts reverse_string("Hi how are you doing?")