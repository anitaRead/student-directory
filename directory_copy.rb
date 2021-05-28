@students = []

def input_students
  puts "Please enter the names of students"
  puts "To finish, just hit return twice" 
  name = gets.chomp 

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

    @students << { name: name, cohort: cohort, country: country, hobbies: hobbies }
    
    puts @students.count > 1 ? "Now we have #{@students.count} students" : "Now we have #{@students.count} student"
    puts "Enter another student"
    name = gets.chomp
  end

  @students
end  

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list
  # Print all students with numbered bullet points
  @students.each_with_index { |student, index| puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)" }
  
  # Print all students with a while loop
  # i = 0
  # while i < students.length
  #   puts "#{i + 1}. #{students[i][:name]} (#{students[i][:cohort]} cohort) 
  #   country: #{students[i][:country]}, hobbies: #{students[i][:hobbies]}"
  #   i += 1 
  # end 

  # Print only students beginning with S
  # s_students = students.select { |student| student[:name][0] == "s" }
  # puts "Students beginning with S: "
  # s_students.each_with_index { |student, i| puts "#{i + 1}. #{student[:name]}"}

  # Print only students whose name is shorter than 12 words 
  # short_names = students.select { |student| student[:name].length < 12 }
  # short_names.each_with_index { |student, i| puts "#{i + 1}. #{student[:name]}" }
  
  # Print all students in November cohort
  # @students.map { |student| puts student if student[:cohort] == :november }
end

def print_footer
  if @students.count > 0 
    puts @students.count > 1 ? "Overall, we have #{@students.count} great students" : "Overall, we have #{@students.count} great student"
  end
end

def print_menu
  # Print the menu and ask the user what to do
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "9. Exit" 
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
  when "1"
    @students = input_students
  when "2"
    show_students
  when "3"
    save_students
  when "9"
    exit
  else
    puts "I don't know what you meant, try again"
  end
end

def interactive_menu
  while true do
    print_menu
    process(gets.chomp)
  end
end

def save_students
  file = File.open("students.csw", "w")
  @students.each do |student|
  student_data = [student[:name], student[:cohort]]
  csv_line = student_data.join(",")
  file.puts csv_line
  end
  file.close
end

interactive_menu