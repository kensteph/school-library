require_relative './student.rb'
require_relative './classroom.rb'

# Create Classrooms
classroom1 = Classroom.new("Class 1")
classroom2 = Classroom.new("Class 2")
classroom3 = Classroom.new("Class 3")

# puts classroom1.inspect
# Create Students
student1 = Student.new(12,classroom1,"Theddy Romain")
student2 = Student.new(14,classroom1,"Stephy Romain")
puts student1.inspect
# Set a new class for student 1
student1.classroom = classroom3
puts student1.inspect
# puts classroom1.inspect