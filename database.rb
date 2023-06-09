require 'json'
module Database
  def preseve_data
    puts "All the data has been preserved successfully.\n"
    # Preserve Books
    preseve_books
    # Preserve People
    preseve_people
    # Preserve Rentals
    preseve_rentals
  end

  def preseve_books
    books_ojects = []
    @books_list.each { |book| books_ojects << { title: book.title, author: book.author } }
    File.write('books.json', books_ojects.to_json)
  end

  def preseve_people
    people_ojects = []
    @people_list.each do |people|
      if people.instance_of?(::Student)
        people_ojects << { age: people.age, classroom: people.classroom, name: people.name,
                           parent_permission: people.parent_permission, id: people.id, type: 'Student' }
      else
        people_ojects << { age: people.age, specialization: people.specialization, name: people.name, id: people.id,
                           type: 'Teacher' }
      end
    end
    File.write('people.json', people_ojects.to_json)
  end

  def preseve_rentals
    rental_ojects = []

    @rentals_list.each do |rental|
      book = { title: rental.book.title, author: rental.book.author }
      if rental.person.instance_of?(::Student)
        student = { age: rental.person.age, classroom: rental.person.classroom, name: rental.person.name,
                    id: rental.person.id, type: 'Student' }
        rental_ojects << { date: rental.date, book: book, person: student }
      else
        teacher = { age: rental.person.age, specialization: rental.person.specialization, name: rental.person.name,
                    id: rental.person.id, type: 'Teacher' }
        rental_ojects << { date: rental.date, book: book, person: teacher }
      end
    end
    File.write('rentals.json', rental_ojects.to_json)
  end

  def load_books
    books = []
    if File.exist?('books.json') && !File.empty?('books.json')
      data = JSON.parse(File.read('books.json'))
      data.each { |book| books << Book.new(book['title'], book['author']) }
    end
    books
  end

  def load_people
    people = []
    if File.exist?('people.json') && !File.empty?('people.json')
      data = JSON.parse(File.read('people.json'))
      data.each do |person|
        if person['type'] == 'Student'
          student = Student.new(person['age'], person['classrom'], person['name'])
          student.id = person['id']
          people << student
        else
          teacher = Teacher.new(person['age'], person['specialization'], person['name'])
          teacher.id = person['id']
          people << teacher
        end
      end
    end
    people
  end

  def load_rentals
    rentals = []
    if File.exist?('rentals.json') && !File.empty?('rentals.json')
      data = JSON.parse(File.read('rentals.json'))
      data.each do |rental|
        book = Book.new(rental['book']['title'], rental['book']['author'])
        if rental['person']['type'] == 'Student'
          student = Student.new(rental['person']['age'], rental['person']['classrom'], rental['person']['name'])
          student.id = rental['person']['id']
          rentals << Rental.new(rental['date'], book, student)
        else
          teacher = Teacher.new(rental['person']['age'], rental['person']['specialization'], rental['person']['name'])
          teacher.id = rental['person']['id']
          rentals << Rental.new(rental['date'], book, teacher)
        end
      end
    end
    rentals
  end
end
