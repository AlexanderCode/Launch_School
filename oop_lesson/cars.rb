
module Towable
  def can_tow?(pounds)
    pounds < 2000 ? true : false
  end
end


class Vehicle
  attr_accessor :color
  attr_reader :year, :model

  def age
    "Your #{self.model} is #{years_old} years old."
  end

  def self.number_of_vehicles
    puts "this program has created #{@@number_of_vehicles} vehicles"
  end

   def self.gas_mileage(gallons, miles)
    p "#{miles/gallons} miles per gallon of gas"
  end

  @@number_of_vehicles = 0

  def initialize(year, model, color)
    @@number_of_vehicles += 1
    @year = year
    @color = color
    @model = model
    @speed = 0
  end

  def spray_paint(col)
    self.color = col
    puts "Your new #{color} paint job looks great!"
  end

  def accelerate(n)
    @speed += n
    p "You push the gas and accelerate #{n} mph"
  end

  def brake(s)
    @speed -= s
    p "you push the brake and decelerate #{s} mph"
  end

  def current_speed
    p "You are now going #{@speed} mph"
  end

  private

  def years_old
    Time.now.year - self.year
  end

end

class MyCar < Vehicle
  
  NUMBER_OF_DOORS = 4

  def to_s
    "My car is a #{color}, #{year}, #{@model}!"
  end

  def shut_off
    @speed = 0
    p "Car is now off"
  end
end

class MyTruck < Vehicle
  NUMBER_OF_DOORS = 2

  include Towable

  def shut_off
    @speed = 0
    p "Truck is now off"
  end

  def to_s
    "My car is a #{color}, #{year}, #{@model}!"
  end

end

lumina = MyCar.new(1997, 'chevy lumina', 'white')
puts lumina.age