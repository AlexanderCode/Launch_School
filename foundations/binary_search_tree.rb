# I need to insert numbers based on the value of the given number.. if the
# number is less then the value of the given number then insert left otherwise
# insert right.

# I can use array insert and depending on a > or < case I will insert
# with an index less one or more one then the given value.

class Bst

  attr_reader :data, :left, :right

  def initialize(n)
    @data = n
    @left, @right = nil 
  end

  def insert(n)
    if n <= @data
      @left&.insert(n) || @left = Bst.new(n)
    else
      @right&.insert(n) || @right = Bst.new(n)
    end
  end

  def each
    return enum_for :each unless block_given?

    @left&.each &Proc.new
    yield @data
    @right&.each &Proc.new
  end

end