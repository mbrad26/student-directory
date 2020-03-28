def interactive_menu
  students = []
  loop do
    # 1. print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    # 2. read the inpt and save it into a variable
    selection = gets.chomp
    # 3. do what the user has asked
    case selection
      when "1"
        students = input_students
      when "2"
        print_header
        print_names(students)
        print_footer(students)
      when "9"
        exit
      else
        puts "I don't know what you meant, try again"
    end
end
  # 4. repeat from step 1
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    students << { name: name, cohort: :november }
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_names(names)
  names.each { |name| puts "#{name[:name]} (#{name[:cohort]} cohort)" }
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end


# nothing happens until we call the methods
interactive_menu
