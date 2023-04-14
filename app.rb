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
      puts"\n"
      puts 'The library is empty.'
      puts"\n"
    else
      puts"\n"
      @books_list.each_with_index {|value,index| puts "#{index})  Title: #{value.title}, Author: #{value.author}"}
      puts"\n"
    end
  end

  def list_all_people
    if @people_list.length == 0
      puts"\n"
      puts 'The list is empty.'
      puts"\n"
    else
      puts"\n"
      @people_list.each_with_index do |value,index| 
          puts "#{index})  [#{value.class}] Name: #{value.name}, ID: #{value.id}, Age: #{value.age}"
      end
      puts"\n"
    end
  end

  def list_all_rental()
    if @rentals_list.length == 0
      puts"\n"
      puts 'The list is empty.'
      puts"\n"
    else
      puts"\n"
      print 'ID of the person : '
      person_id = gets.chomp.to_i
      @rentals_list.each_with_index do |value,index|
        puts "Date: #{value.date}, Book: #{value.book.title} by #{value.book.author}" if value.person.id == person_id
      end
      puts"\n"
    end
  end

  def create_teacher
    puts"\n"
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
    puts"\n"
  end

  def create_student
    puts"\n"
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
    puts"\n"
  end

  def create_person
    puts"\n"
    print 'Do you want to create a Student (1) or a Teacher (2) [Input the number]'
    choice = gets.chomp
    if choice == '1' then
      create_student
    else
      create_teacher
    end
  end

  def create_book
    puts"\n"
    puts 'Please provide these information :'
    print 'Title:'
    title = gets.chomp
    print 'Author :'
    author = gets.chomp
    new_book = Book.new(title,author)
    @books_list << new_book
    puts 'Book created successfully'
    puts"\n"
  end

  def create_rental
    puts"\n"
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
    puts 'Rental created successfully'
    puts"\n"
  end

  def exit_app
    puts "Thank you for using this app!"
    exit
  end
end