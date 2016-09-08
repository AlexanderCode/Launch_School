# cat_class.rb

class Cat
  COLOR = "orange"
  attr_accessor :name
  @@kitty_count = 0

  def initialize(name = "Martin")
    @name = name
    @@kitty_count += 1
  end

  def self.generic_greeting
    p "Hello! I am a cat!"
  end

  def rename(string)
    self.name = string
  end

  def identify
    self
  end

  def personal_greeting
    p "Hello! My name is #{name}!"
  end

  def self.total
    p @@kitty_count
  end

  def greet
    p "Hello! My name is #{name} and I am a #{COLOR} cat!"
  end

  def to_s
    "I'm #{name}!"
  end

end

kitty = Cat.new('Sophie')
puts kitty