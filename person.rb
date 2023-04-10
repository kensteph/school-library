class Person
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
    return false if @age < 18

    true
  end

  public

  def can_use_services?
    return true if of_age? || @parent_permission

    false
  end
end