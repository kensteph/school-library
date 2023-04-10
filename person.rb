class Person
  def initialize (id,name="Unknown",age,parent_permission=true)
    @id = Random.rand(1..1000)
    @name = name
    @age= age
    @parent_permission = parent_permission
  end

  # Getters
  attr_reader :id, :name, :age
  # Setters
  attr_writer :name, :age
  
end