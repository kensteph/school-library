require_relative './teacher'
require_relative './student'
require_relative './book'
require_relative './rental'
require 'json'
require_relative './database'
class App
  include Database
  def initialize
    @books_list = load_books || []
    @people_list = load_people || []
    @rentals_list = load_rentals || []
  end

  def list_all_books
    puts "\n"
    if @books_list.empty?
      puts 'The library is empty.'
    else
      @books_list.each_with_index do |value, index|
        puts "#{index})  Title: #{value.title}, Author: #{value.author}"
      end
    end
    puts "\n"
  end

  def list_all_people
    puts "\n"
    if @people_list.empty?
      puts 'The list is empty.'
    else
      @people_list.each_with_index do |value, index|
        puts "#{index})  [#{value.class}] Name: #{value.name}, ID: #{value.id}, Age: #{value.age}"
      end
    end
    puts "\n"
  end

  def list_all_rental()
    puts "\n"
    if @rentals_list.empty?
      puts 'The rental list is empty.'
    else
      print 'ID of the person : '
      person_id = gets.chomp.to_i
      puts "Rentals:\n"
      @rentals_list.each_with_index do |value, _index|
        puts "Date: #{value.date}, Book \"#{value.book.title}\" by #{value.book.author}" if value.person.id == person_id
      end
    end
    puts "\n"
  end

  def create_teacher
    puts "\n"
    puts 'Please provide these information :'
    print 'Age : '
    age = gets.chomp
    print 'Name : '
    name = gets.chomp
    print 'specialization : '
    specialization = gets.chomp

    new_teacher = Teacher.new(age, specialization, name)
    @people_list << new_teacher
    puts 'Teacher created successfully'
    puts "\n"
  end

  def create_student
    puts "\n"
    puts 'Please provide these information :'
    print 'Classroom (number) : '
    classroom = gets.chomp
    print 'Age : '
    age = gets.chomp
    print 'Name : '
    name = gets.chomp
    print 'Has parent permission? [Y/N] : '
    parent_permission = gets.chomp
    permission = true
    permission = false if parent_permission.upcase == 'N'
    new_student = Student.new(age, classroom, name, parent_permission: permission)
    @people_list << new_student
    puts 'Student created successfully'
    puts "\n"
  end

  def create_person
    puts "\n"
    print 'Do you want to create a Student (1) or a Teacher (2) [Input the number]: '
    choice = gets.chomp
    if choice == '1'
      create_student
    else
      create_teacher
    end
  end

  def create_book
    puts "\n"
    puts 'Please provide these information :'
    print 'Title: '
    title = gets.chomp
    print 'Author : '
    author = gets.chomp
    new_book = Book.new(title, author)
    @books_list << new_book
    puts 'Book created successfully'
    puts "\n"
  end

  def create_rental
    puts "\n"
    if @books_list.empty? || @people_list.empty?
      puts 'Please make sure you have books and persons'
    else
      puts 'Select a book from the following list by number'
      list_all_books
      book_position = gets.chomp.to_i
      puts 'Select a person from the following list by number (not id)'
      list_all_people
      person_position = gets.chomp.to_i
      print 'Date (2023/04/13): '
      date = gets.chomp
      new_rent = Rental.new(date, @books_list[book_position], @people_list[person_position])
      @rentals_list << new_rent
      puts 'Rental created successfully'
    end
    puts "\n"
  end

  def actions_management(choice)
    action_to_perform = ACTIONS[choice]
    if action_to_perform.nil?
      puts "\nYour choice is incorrect. Must between 1-7. Please retry...\n\n"
    else
      send(action_to_perform)
    end
  end
end
