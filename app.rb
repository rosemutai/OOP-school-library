require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'

class App
  def initialize
    @books = []
    @persons = []
    @rentals = []
  end

  def available_options
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person(teacher or student)'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 List all rentals for a given person'
    puts '7 Exit'
  end

  def run
    chosen_option = 0
    while chosen_option != 7
      available_options
      chosen_option = gets.to_i
      users_choice(chosen_option)
    end
  end

  def users_choice(chosen_option)
    case chosen_option
    when 1
      list_all_books
    when 2
      list_all_people
    when 3
      create_a_person
    when 4
      create_a_book
    when 5
      create_a_rental
    when 6
      list_all_rentals
    when 7
      puts 'Thank you for using the app!'
    end
  end

  def list_all_books
    @books.each do |book|
      puts "Title: #{book.title}, Author: #{book.author}"
    end
  end

  def list_all_people
    @persons.each do |person|
      puts "Name: #{person.name}, Age:#{person.age}"
    end
  end

  def create_a_person
    print 'Do you want to create a student (1) or a teacher (2)? [input the number]: '
    student_or_teacher = gets.chomp.to_i
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp

    case student_or_teacher
    when 1
      print 'Has parent permission? [Y/N]: '
      parent_permission = gets.chomp.downcase == 'y'
      new_student = Student.new(age, name, parent_permission)
      @persons.push(new_student)
      puts 'Person created successfully'

    when 2
      print 'Specialization: '
      specialization = gets.chomp
      new_teacher = Teacher.new(age, name, specialization)
      @persons.push(new_teacher)
      puts 'Person created successfully'
    else
      puts 'No such option, please try again'
    end
  end

  def create_a_book
    puts 'Title: '
    title = gets.chomp
    puts 'Author: '
    author = gets.chomp
    new_book = Book.new(title, author)
    @books.push(new_book)
    puts 'Book created successfully'
  end

  def create_a_rental
    if @books.empty?
      puts 'Currently there are no books'
    elsif @persons.empty?
      puts 'Currently there are no users'
    else
      puts 'Select a book from the following list by its index: '
      @books.each_with_index do |book, index|
        puts "#{index}: Title: #{book.title}, Author: #{book.author}"
      end
      book_rented = gets.to_i
      puts 'Select a person from the following list by their index: '
      @persons.each_with_index do |person, index|
        puts "#{index} #{person.class} Name: #{person.name}, ID: #{person.id} Age: #{person.age}"
      end
      person_that_rented_book = gets.to_i
      print 'Date: '
      date = gets.chomp
      @rentals.push(Rental.new(date, @books[book_rented], @persons[person_that_rented_book]))
      puts 'Rentals created successfully'
    end
  end

  def list_all_rentals
    puts 'Enter person ID: '
    person_id = gets.to_i
    puts 'Rentals: '
    @rentals.each do |rental|
      puts "Date Rented: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
      if rental.person.id == person_id
    end
  end
end
