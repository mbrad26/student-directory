def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name and month
  name = gets.chomp
  month = gets.chomp
  country_of_birth = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? && !month.empty? do
    students << { name: name, cohort: month, country: country_of_birth }
    if students.length == 1
      puts "Now we have #{students.count} student"
    else
      puts "Now we have #{students.count} students"
    end
    # get another name, month from the user
    name = gets.chomp
    month = gets.chomp
    country_of_birth = gets.chomp
  end
  # return the array of students
  students
end

def print_by_cohort(names)
  puts "What cohort do you like to print?"
  # get the month and use it to print students names by cohort
  month = gets.chomp
  names.each {|name| puts name[:name] if name[:cohort] == month}
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_names(names)
  count = 0
  while count < names.size
    puts "#{count + 1}. #{names[count][:name].ljust(8)} (#{names[count][:cohort]} cohort).center(15), #{names[count][:country].center(4)}"
    count += 1
  end
  
=begin
  names.each_with_index do |name, index| 
    puts "#{index + 1}. #{name[:name].ljust(8)} (#{name[:cohort]} cohort).center(15), #{name[:country].center(4)}" # if name[:name].length < 12 # if name[:name].start_with?("A")
  end
=end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
# nothing happens until we call the methods
print_header
# only prints students names if there are at list 1 student in the list
if students.length >= 1
  print_names(students)
  print_footer(students)
  print_by_cohort(students)
else 
  puts "There are no regeistered students at this moment."
end