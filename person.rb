class Person
  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..100_000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def get_id
    @id
  end

  def get_name
    @name
  end

  def get_age
    @age
  end

  def set_name=(value)
    @name = value
  end

  def set_age=(value)
    @age = value
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  private

  def of_age?
    age >= 18
  end

end