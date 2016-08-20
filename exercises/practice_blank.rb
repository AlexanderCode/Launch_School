# practice_blank.rb






def balancer(par)
  if par.split('').count("(") == par.split('').count(")") 
    true
  else
    false
  end
end







p balancer("hi")
p balancer("(hi")
p balancer("(hi)")