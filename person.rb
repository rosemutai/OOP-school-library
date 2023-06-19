class Person
  def initialize(age, name = "Unknown", parent_permission = true)
    @id = Random.rand(1..100000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def getId
    @id
  end

  def getName
    @name
  end

  def getAge
    @age
  end


  def setName=(value)
    @name = value
  end

  def setAge=(value)
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
