require'json'
module Database

  def preseve_data
    puts "All the data has been preserved successfully.\n"
    # Preserve Books
    preseve_books
  end

  def preseve_books
    books_ojects =[]
    @books_list.each {|book| books_ojects << {title: book.title,author:book.author}}
    File.write("books.json",books_ojects.to_json)
  end

  def preseve_people
    people_ojects =[]
    @people_list.each do |people| 
      if people.class.name == 'Student'
        people_ojects << {age: people.age,classroom:people.classroom,name:people.name,parent_permission:people.parent_permission,type:"Student"}
      else
        people_ojects << {age: people.age,specialization:people.specialization,name:people.name,type:"Teacher"}
      end
      
    end
    File.write("people.json",people_ojects.to_json)
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