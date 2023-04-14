require_relative './app.rb'
def main
  app = App.new
  choice = 0
  while choice !=7.to_s
    puts "\nWelcome to School Library App! \n \n" if choice==0
    puts "Please choose an option by entering a number:"
    puts ""
    puts "1 - List all book"
    puts "2 - List all people"
    puts "3 - Create a person"
    puts "4 - Create a book"
    puts "5 - Create a rental"
    puts "6 - List all rentals for a given person id"
    puts "7 - Exit"

    # choice
    choice = gets.chomp
    case choice
    when "1"
      app.list_all_books
    when "2"
      app.list_all_people
    when "3"
      app.create_person
    when "4"
      app.create_book
    when "5"
      app.create_rental
    when "6"
      app.list_all_rental
    when "7"
      exit_app
    else
      puts "**** Welcome to School Library App ****!"
    end
  end
end

main()