require_relative 'person'
require_relative 'book'
require_relative 'rental'
require_relative 'teacher'

@books = []
@rentals = []
@students = []
@teachers = []

def all_books
  puts 'List of books:'
  @books.each_with_index do |book, index|
    puts "#{index + 1}. Title: #{book.title}, Author: #{book.author}"
  end
end

def all_people
  puts 'List of people:'
  @students.each_with_index do |student, index|
    puts "#{index + 1}. Student: Name: #{student.name}, ID: #{student.id}, Age: #{student.age}"
  end

  @teachers.each_with_index do |teacher, index|
    puts "#{index + 1 + @students.length}. Teacher: Name: #{teacher.name}, ID: #{teacher.id}, Age: #{teacher.age}"
  end
end

def create_student
  print 'Name: '
  name = gets.chomp
  print 'Age: '
  age = gets.chomp.to_i
  print 'Has parent permission [Y/N]: '
  parent_permission = gets.chomp.downcase == 'y'

  new_student = Person.new(age, name, parent_permission: parent_permission)
  @students << new_student
  puts 'Student created successfully.'
end

def create_teacher
  print 'Name: '
  name = gets.chomp
  print 'Age: '
  age = gets.chomp.to_i
  print 'Specialization: '
  specialization = gets.chomp

  new_teacher = Teacher.new(age, name, specialization)
  @teachers << new_teacher
  puts 'Teacher created successfully.'
end

def create_a_person
  print 'Do you want to create a student (1) or a teacher (2) [Input the number]: '
  @input = gets.chomp.to_i
  if @input == 1
    create_student
  elsif @input == 2
    create_teacher
  else
    print 'Invalid choice.'
  end
end

def create_a_book
  print 'Title: '
  title = gets.chomp
  print 'Author: '
  author = gets.chomp

  new_book = Book.new(title, author)
  @books << new_book
  puts 'Book created successfully.'
end

def create_a_rental
  if @books.empty? || (@students.empty? && @teachers.empty?)
    puts 'No books or people available. Create books and people first.'
  else
    puts 'Select a book from the following list by number:'
    all_books
    book = gets.chomp.to_i - 1

    puts 'Select a person from the following list by number:'
    all_people
    person = gets.chomp.to_i - 1

    print 'Enter rental date (e.g., YYYY-MM-DD): '
    date = gets.chomp

    new_rental = if person < @students.length
                   Rental.new(date, @students[person], @books[book])
                 else
                   Rental.new(date, @teachers[person - @students.length], @books[book])
                 end

    @rentals << new_rental
    puts 'Rental created successfully.'
  end
end

def all_rentals
  print 'ID of person: '
  person_id = gets.chomp.to_i

  found_rentals = @rentals.select { |rental| rental.person.id == person_id }

  if found_rentals.empty?
    puts 'No rentals for this person.'
  else
    puts "Rentals for person with ID #{person_id}:"
    found_rentals.each do |rental|
      puts "Date: #{rental.date}, Book: #{rental.book.title}"
    end
  end
end
