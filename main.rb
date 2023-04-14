require_relative './app'

def main
  puts "Welcome to School Library App!\n\n"
  app = App.new
  app.menu
end

main
