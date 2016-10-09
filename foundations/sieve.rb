class Sieve
  attr_reader :list

  def initialize(end_number)
    @list = (2..end_number).to_a
  end

  def primes
    list.each do |num|
      list.delete_if { |n| n != num && n % num == 0 }
    end
    list
  end

end