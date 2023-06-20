require_Relative 'person'

class Teacher < Person
  def initialize(age, specialization, name = 'Unknown', parent_permission: true)
    super(id, age, name, parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end