require_relative 'base_decorator'
require_relative 'person'
require_relative 'trim_decorator'

class CapitalizeDecorator < Decorator
  
  def correct_name
    @nameable.correct_name.capitalize
  end
end
