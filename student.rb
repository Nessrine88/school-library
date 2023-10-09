require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(id,classroom, age = 0, parent_permission = true,, name = 'Unknown' )
    super(id, name, age, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
