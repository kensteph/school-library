require_relative './person'

class Student < Person
  attr_reader :classroom
  attr_accessor :parent_permission

  def initialize(age, classroom, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    @classroom.students.push(self) unless @classroom.students.include?(self)
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
