
class Minilang
  attr_accessor :register, :stack, :commands

  def initialize(string)
    @commands = string
    @register = 0
    @stack = []
  end

  def eval
    commands.split(' ').each do |word|
      if word == word.to_i.to_s
        self.register = word.to_i
      else
        case word
        when "PUSH"
        push
        when "ADD"
        add
        when "SUB"
        sub
        when "MULT"
        mult
        when "DIV"
        div
        when "MOD"
        mod
        when "POP"
        pop
        when "PRINT"
        print
        else
        return p "Invalid Command!"
        end
      end
    end
  end


  def push
    self.stack.push(self.register)
  end

  def add
    self.register += self.stack.last
  end

  def sub
    self.register -= self.stack.last
  end

  def mult
    self.register *= self.stack.last
  end

  def div
    self.register /= self.stack.last
  end

  def mod
    self.register %= self.stack.last
  end

  def pop
    self.register = self.stack.pop
  end

  def print
    if self.register == nil
      p "Empty Stack!"
    else
      puts self.register
    end
  end

end

Minilang.new('5 PRINT').eval

Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)