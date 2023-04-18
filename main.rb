require_relative './app'

def display_menu
  puts 'Please choose an option by entering a number:'
  puts '1 - List all book'
  puts '2 - List all people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all rentals for a given person id'
  puts '7 - Exit'
end

ACTIONS = {
  1 => :list_all_books,
  2 => :list_all_people,
  3 => :create_person,
  4 => :create_book,
  5 => :create_rental,
  6 => :list_all_rental
}.freeze

def main
  puts "Welcome to School Library App!\n\n"
  app = App.new
  choice = 0
  while choice != 7
    display_menu
    choice = gets.chomp.to_i
    if choice == 7
      # Preserve the data
      app.preseve_data
      puts 'Thank you for using this app!'
      exit
    end
    method_name = ACTIONS[choice]
    if method_name.nil?
      puts "\nYour choice is incorrect. Must between 1-7. Please try again...\n\n"
    else
      method_tocall = app.method(method_name)
      method_tocall.call
    end
  end
end

main
