require_relative "./person.rb"

class Teacher< Person
  def initialize(age,specialization, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @specialization= specialization
  end
end