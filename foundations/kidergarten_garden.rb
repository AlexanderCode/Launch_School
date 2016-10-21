# what i am tring to do is sort through names and use the order of those names to store
# specificly letters that corespond to a type of plant.

# my proccess of sorting the plants needs to happen twice since they are placed in 2
# lines a front and back row.. meaning that to get all four plants into each child i
# need to take 2 and then when the new line starts take 2 again.

# what I think i will do is create a hash with the kids names and each name will point
# to an array with the plants

# it the test suite the name of the child is what is being called to pull the info and 
# what is returned is the plant names as objects.  each child will get 4 objects in an
# array.  the list of plants happens when the object garden is created

# plant objects
# attr_reader for each child name
# each child name will be an array with 4 plant objects
# each child name can be different so we need to assign them.
# students need to be in an array that will defalut to the names given but can be changed

# class Garden
#   CHILDREN = %w(alice bob charlie david eve fred ginny 
#                 harriet ileana joseph kincaid larry).freeze

#   PLANTS = { 'V' => :violets, 'R' => :radishes, 'G' => :grass, 'C' => :clover }.freeze

#   def initialize(garden, students = CHILDREN)
#     position = 0
#     @garden = garden.split("\n").map(&:chars)
#     @students = students.sort.each_with_object({}) do |(students), hash|
#       hash[students.downcase.to_sym] = [@garden[0][position], @garden[0][position + 1],
#                                         @garden[1][position], @garden[1][position + 1]]
#       position += 2
#     end
#     student_methods
#   end

#   private

#   def student_methods
#     @students.keys.each do |name|
#       self.class.send(:define_method, name) do
#         @students[name].map { |plant| PLANTS[plant] }
#       end
#     end
#   end
# end

# class Garden
#   CHILDREN = %w(alice bob charlie david eve fred ginny 
#                 harriet ileana joseph kincaid larry).freeze

#   PLANTS = { 'V' => :violets, 'R' => :radishes, 'G' => :grass, 'C' => :clover }.freeze

#   def initialize(garden, stu = CHILDREN)
#     gar = garden.split("\n").map(&:chars)
#     @stu = Hash[stu.sort.map(&:downcase).zip(gar[0].each_slice(2).zip(gar[1].each_slice(2)))]
#     student_methods
#   end

#   private

#   def student_methods
#     @stu.keys.each do |name|
#       self.class.send(:define_method, name) do
#         @stu[name].flatten.map { |plant| PLANTS[plant] }
#       end
#     end
#   end
# end

class Garden
  CHILDREN = %w(alice bob charlie david eve fred ginny 
                harriet ileana joseph kincaid larry).freeze

  PLANTS = { 'V' => :violets, 'R' => :radishes, 'G' => :grass, 'C' => :clover }.freeze

  def initialize(garden, stu = CHILDREN)
    gar = garden.split("\n").map(&:chars)
    @stu = Hash[stu.sort.map(&:downcase).zip(gar[0].each_slice(2).zip(gar[1].each_slice(2)))]
    @stu.keys.each do |name| 
      self.class.send(:define_method, name){ @stu[name].flatten.map {|plant| PLANTS[plant]}}
    end
  end
end