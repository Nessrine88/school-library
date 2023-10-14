require_relative 'app'

loop do
  puts "
  Please choose an option by entering a number:
  1- list all books
  2- list all people
  3- Create a person
  4- Create a book
  5- Create a rental
  6- List all rentals for a given person id
  7- exit
  "
  @number = gets.chomp.to_i

  case @number
  when 1
    all_books
  when 2
    all_people
  when 3
    create_a_person
  when 4
    create_a_book
  when 5
    create_a_rental
  when 6
    all_rentals
  when 7
    break
  else
    puts 'Invalid option. Please choose a valid number from 1 to 7.'
  end
end
