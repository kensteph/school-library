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
end

app = App.new
app.list_all_books