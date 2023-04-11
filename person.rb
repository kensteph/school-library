require_relative './nameable.rb'

class Person< Nameable
  # Getters
  attr_accessor :name, :age
  # Setters
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  private

  def of_age?
    @age >= 18
  end

  public

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @nameable.correct_name[0,9]
  end
end
