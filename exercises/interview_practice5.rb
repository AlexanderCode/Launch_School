# interview_practice5.rb

# creat a method
# output from that method
# count the number of parentheses
# if odd then I need a false
# if even then I need a true
# if zero then I need a true
# return  ture or false

def balancer(par)
  paren_count = 0
  par.split('').each do |char|
    return false if paren_count < 0
    paren_count += 1 if char == "("
    paren_count -= 1 if char == ")"
  end
  if paren_count.even?
    true
  else paren_count.odd?
    false
  end
end


  #num = p.count("()")
  #if num.even?
    #true
  #else num.odd?
    #false
  #end


p balancer("hi")
p balancer("(hi")
p balancer("(hi)")

p balancer(")hi(")