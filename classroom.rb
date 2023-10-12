class Classroom < Student
  attr_accessor :label
  attr_reader :students

  def initialize(label)
    super()
    @label = label
    @students = []
  end

  def new_student(student)
    students << student
    student.classroom = self
  end
end
