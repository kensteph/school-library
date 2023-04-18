require'json'
module Database

  def preseve_data
    # Preserve Books
    puts "Preserve the books"
    books_ojects =[]
    @books_list.each {|book| books_ojects << {title: book.title,author:book.author}}
    File.write("books.json",books_ojects.to_json)
  end

  def query_books
    books = []
    if File.exist?("books.json") && File.read("books.json") !='' 
      data = JSON.parse(File.read("books.json")) 
      data.each{ |book| books << Book.new(book['title'],book['author'])}
    end
    books
  end
end