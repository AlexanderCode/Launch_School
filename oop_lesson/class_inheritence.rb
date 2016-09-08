# class_inheritence.rb

module Towable
  def tow
    "I can tow a trailer!"
  end
end

module Transportation

  class Vehicle
    attr_accessor :year

    def initialize(year)
      @year = year
    end

    def start_engine
      "Ready to go!"
    end
  end

  class Truck < Vehicle
    include Towable
    attr_accessor :bed_type

    def initialize(year = 1998, type = "flatbed")
      super(year)
      @bed_type = type
    end

    def start_engine(speed)
      super() + " Drive #{speed}, please!"
    end

  end

  class Car < Vehicle

  end

end

truck1 = Transportation::Truck.new(1994)
puts truck1.year
puts truck1.tow

car1 = Transportation::Car.new(2006)
puts car1.year
