def input_students
  puts "Please enter the names of students"
  puts "To finish, just hit return twice" 
  name = gets.chomp 

  students = []

  while !name.empty? do
    puts "Which cohort is he/she in?"
    cohort = gets.chomp.to_sym
    if cohort.length == 0
      cohort = :november
    end
    puts "What country is he/she from?"
    country = gets.chomp
    puts "What are his/her hobbies?"
    hobbies = gets.chomp

    students << { name: name, cohort: cohort, country: country, hobbies: hobbies }
    
    puts "Now we have #{students.count} students"
    puts "Enter another student"
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
  
  # Print all students with a while loop
  i = 0
  while i < students.length
    puts "#{i + 1}. #{students[i][:name]} (#{students[i][:cohort]} cohort) 
    country: #{students[i][:country]}, hobbies: #{students[i][:hobbies]}"
    i += 1 
  end 

  # Print only students beginning with S
  # s_students = students.select { |student| student[:name][0] == "s" }
  # puts "Students beginning with S: "
  # s_students.each_with_index { |student, i| puts "#{i + 1}. #{student[:name]}"}

  # Print only students whose name is shorter than 12 words 
  # short_names = students.select { |student| student[:name].length < 12 }
  # short_names.each_with_index { |student, i| puts "#{i + 1}. #{student[:name]}" }
  
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end



students = input_students
print_header
print(students)
print_footer(students)