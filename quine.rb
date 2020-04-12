# Just something I found online ...

variable = ""

File.open('quine.rb', 'r') do |file|
  file.each_line do |line|
    variable << line
  end
end

puts variable