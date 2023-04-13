require_relative './teacher.rb'
require_relative './student.rb'
class App
  def initialize
    @books_list = []
    @people_list = []
    @rentals_list = []
  end

  def list_all_books
    if @books_list.length == 0
      puts 'The library is empty.'
    else
      @books_list.each {|index,value| puts "#{index}-#{value}"}
    end
  end

  def list_all_people
    if @books_list.length == 0
      puts 'The list is empty.'
    else
      @people_list.each {|index,value| puts "#{index}-#{value}"}
    end
  end

  def create_teacher
    puts 'Please provide these information :'
    print 'Age :'
    age = gets.chomp
    print 'Name :'
    name = gets.chomp
    print 'specialization :'
    specialization = gets.chomp

    new_teacher = Teacher.new(age,specialization,name)
    @people_list << new_teacher
  end

  def create_student
    puts 'Please provide these information :'
    print 'Classroom (number) :'
    classroom = gets.chomp
    print 'Age :'
    age = gets.chomp
    print 'Name :'
    name = gets.chomp
    print 'Has parent permission? [Y/N] :'
    parent_permission = gets.chomp
    permission = true
    if(parent_permission.upcase =='N')
      permission = false
    end
    new_student = Student.new(age,name,classroom,parent_permission:permission)
    @people_list << new_student
  end


end


app = App.new
app.list_all_books
app.create_teacher
app.create_teacher
app.create_student
puts app.inspect