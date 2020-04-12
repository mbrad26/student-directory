require 'csv'

@students = []

def add_students(name, cohort)
  @students << { name: name, cohort: cohort.to_sym }
end

def open_file(filename)
  CSV.open(filename, "r") do |file|
    file.each do |line|
      name, cohort = line
      add_students(name, cohort)
    end
  end
end

def save_file(filename)
  CSV.open(filename, "a") do |file|
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      file << student_data
    end
  end
end

def try_load_students
  if !ARGV.empty?
    filename = ARGV.first
  else
    filename = 'students.csv'
  end
  #return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  elsif 
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

def load_students(filename)
  open_file(filename)
  puts "Loading #{filename}..." 
  sleep(2)
  puts "Loading successful!"
  sleep(1)
end

def load_students_from_file
  puts "What is the name of the file you want to be loaded"
  filename = STDIN.gets.chomp
  open_file(filename)
  puts "Loading #{filename}..." 
  sleep(2)
  puts "Loading successful!"
  sleep(1)
end

def save_students
  puts "Please give a name to the file"
  filename = STDIN.gets.chomp 
  # open the file for writing
  save_file(filename)
  puts "Saving to #{filename}.csv..."
  sleep(1)
  puts "Saved to #{filename}.csv"
end

def interactive_menu
  loop do
    # 1. print the menu and ask the user what to do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show list"
  puts "3. Save the list"
  puts "4. Load the list from file"
  puts "9. Exit"
end

def show_students
  puts "Reading file..."
  sleep(2)
  print_header
  print_names
  print_footer
end

def process(selection)
  case selection
    when "1" then input_students
    when "2" then show_students
    when "3" then save_students
    when "4" then load_students_from_file
    when "9" then exit
    else
      puts "I don't know what you meant, try again"
  end
end

def take_initial_input
  puts "Please enter the name of the student"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp.capitalize
  puts "Please enter a cohort"
  cohort = STDIN.gets.chomp
  return name, cohort
end

def input_students
  name, cohort = take_initial_input
  # while the name is not empty, repeat this code
  while !name.empty? do
    add_students(name, cohort)
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name, cohort = take_initial_input
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_names
  @students.each { |name| puts "#{name[:name]} (#{name[:cohort]} cohort)" }
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

# nothing happens until we call the methods
try_load_students
interactive_menu
