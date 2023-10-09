require_relative 'person'

class Teacher < Person
  attr_reader :specialization

  def initialize(id, name = 'Unknown', age = 0, specialization)
    super(id, name, age)
    @specialization = specialization
  end

  def can_use_services?
    true # Teachers can always use services
  end
end
