# create_the_class.rb

module Walkable

  def walk
    p "Let's go for a walk!"
  end

end

class Cat
  include Walkable
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def greet
    p "Hello! My name is #{name}!"
  end

end

kitty = Cat.new('Sophie')
kitty.greet
kitty.name = "Luna"
kitty.greet
kitty.walk