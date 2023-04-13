require_relative './teacher.rb'
require_relative './student.rb'
require_relative './book.rb'
require_relative './rental.rb'
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
      @books_list.each_with_index {|value,index| puts "#{index})  Title: #{value.title}, Author: #{value.author}"}
    end
  end

  def list_all_people
    if @people_list.length == 0
      puts 'The list is empty.'
    else
      @people_list.each_with_index do |value,index| 
        type = 'Student'
        if value.specialization 
          type = 'Teacher'
        end
          puts "#{index})  [#{type}] Name: #{value.name}, ID: #{value.id}, Age: #{value.age}"
        end
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
    puts 'Teacher created successfully'
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
    puts 'Student created successfully'
  end

  def create_book
    puts 'Please provide these information :'
    print 'Title:'
    title = gets.chomp
    print 'Author :'
    author = gets.chomp
    new_book = Book.new(title,author)
    @books_list << new_book
    puts 'Book created successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number'
    list_all_books
    book_position = gets.chomp.to_i
    puts 'Select a person from the following list by number (not id)'
    list_all_people
    person_position = gets.chomp.to_i
    print 'Date (2023/04/13):'
    date = gets.chomp
    new_rent = Rental.new(date,@books_list[book_position],@people_list[person_position])
    @rentals_list << new_rent
  end


end


app = App.new
# app.create_book
# app.create_book
# app.list_all_books
app.create_student
app.create_teacher
app.list_all_people
# app.create_book
# app.create_book
# app.create_rental
# puts app.inspect