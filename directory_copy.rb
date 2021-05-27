def input_students
  puts "Please enter the names of students"
  puts "To finish, just hit return twice" 
  name = gets.chomp 

  students = []

  while !name.empty? do
    students << { name: name, cohort: :november }
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end

  students
end  

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  # Print students with numbered bullet points
  # students.each_with_index { |student, index| puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)" }
  
  # Print only students beginning with S
  s = students.select { |student| student[:name][0] == "s" }
  puts "Students beginning with S: "
  s.each_with_index { |student, i| puts "#{i + 1}. #{student[:name]}"}

  
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end



students = input_students
print_header
print(students)
print_footer(students)