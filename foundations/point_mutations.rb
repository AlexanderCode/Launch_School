# when my object is created i am given a dna strand and then when hamming_distance metnod
# is called I am giveing another sequence of dna to compare the two.  I am looking for
# the number of differences.

# ok my idea is to zip the two given dna strands together by trning them into arrays and
# then turning them into a hash.. if the key and value are equle then they should be
# deleted.. then we just need to do a count.

# found i can not delete because i need to keep the original dna strands whole so i just
# count with a block now

# initalize with my base dna sequence

# create hamming_distance method

# possibly make new method that does the compare

class DNA
  attr_reader :dna1

  def initialize(dna1)
    @dna1 = dna1.chars
  end

  def hamming_distance(dna2)
    dna1.zip(dna2.chars).count { |x, y| x != y && y != nil }
  end
end
