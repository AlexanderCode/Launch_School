# accessor_methods.rb

class Person
  attr_accessor :first_name
  attr_reader :phone_number
  attr_writer :last_name

  def initialize(name = "Lily", number = 1234567890)
    @phone_number = number
    @name = name
  end

  def name=(msg)
    @first_name = msg.split.first
    @last_name = msg.split.last
  end

  def name
    @first_name + ' ' + @last_name
  end

  def first_equals_last?
    first_name == last_name
  end

  def older_than?(other)
    age > other.age
  end

private
attr_reader :last_name

end

person1 = Person.new
person1.name = 'John Doe'
puts person1.name
