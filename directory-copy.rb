def take_initial_input
  puts "Please enter the name of the student"
  puts "To finish, just hit return twice"
  name = gets.chomp.capitalize 
  month = gets.chomp
  country_of_birth = gets.chomp.upcase 
  return name, month, country_of_birth
end

def singular_plural_formatter(students)
  return "Now we have #{students.count} student" if students.length == 1
  return "Now we have #{students.count} students"
end

def add_students(students, name, month, country_of_birth)
  students << {name: name, cohort: month.to_sym, country: country_of_birth.to_sym }
end
  
def input_students 
  students = []
  name, month, country_of_birth = take_initial_input
  while !name.empty? do
    month = 'undecided' if month.empty?
    country_of_birth = 'citizen of the world' if country_of_birth.empty?
    add_students(students, name, month, country_of_birth)
    puts singular_plural_formatter(students)
    # get another name, month from the user
    name, month, country_of_birth = take_initial_input
  end
  students
end

def formatter(name)
  "#{name[:name].ljust(12)}" + 
  "(#{name[:cohort].to_s} cohort)".center(20) + 
  "#{name[:country].to_s.center(6)}"
end

def print_by_cohort(names)
  puts "What cohort do you like to print?"
  # get the month and use it to print students names by cohort
  month = gets.chomp
  names.each {|name| puts formatter(name) if name[:cohort] == month.to_sym}
end

def print_by_specified_letter(names)
  puts 'Specify the first letter of the student\'s name.'
  letter = gets.chomp.capitalize
  names.each do |name|
    if name[:name].start_with?(letter)
      puts formatter(name)
    end
  end
end

def print_by_length_of_name(names)
  puts 'Length of name, please'
  len = gets.chomp.to_i
  names.each do |name|
    if name[:name].length < len
      puts formatter(name)
    end
  end
end

def print_grouped_by_cohort(names)
  #sorted = names.sort {|x, y| x[:cohort] <=> y[:cohort]}
  #sorted.each {|name| puts formatter(name)}
  names.group_by {|name| name[:cohort]}
       .each_pair {|k, v| v.each {|element| puts formatter(element)}}
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_names(names)
=begin
  count = 0
  while count < names.size
    puts "#{count + 1}. #{names[count][:name].ljust(8)}" +
         "(#{names[count][:cohort]} cohort)".center(15) + 
         "#{names[count][:country].center(4)}"
    count += 1
  end
=end 
  names.each_with_index do |name, index| 
    puts "#{index + 1}. #{formatter(name)}" 
  end
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
  print_by_specified_letter(students)
  print_by_length_of_name(students)
  print_grouped_by_cohort(students)
else 
  puts "There are no regeistered students at this moment."
end