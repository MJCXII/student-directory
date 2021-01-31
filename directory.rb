@students = []

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp
  while !name.empty? do
    #@students << {name: name, cohort: :november}
    insert_to_students(name, cohort = "november")
    puts "Now we have #{@students.count} students"
    name = gets.chomp
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_student_list
  print_footer
end

def process(selection)
  case selection
  when "1"
    input_students
    puts "Input Students Selected"
  when "2"
    puts "Show Students Selected"
    show_students
  when "3"
    puts "Save Students Selected"
    save_students
  when "4"
    puts "Load Students Selected"
    load_students
  when "9"
    puts "Exiting, Goodbye!"
    exit
  else
    puts "I don't know what you meant, try again"
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students
  puts "Input Filename: "
  savefilename = gets.chomp
  if savefilename == ""
    savefilename = "students.csv"
  end
  #file = File.open("students.csv", "w")
  file = File.open(savefilename, "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def insert_to_students(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

def load_students#(filename = loadfilename)#load_students(filename = "students.csv")
  puts "Input Filename: "
  loadfilename = gets.chomp
  if loadfilename == ""
    loadfilename = "students.csv"
  end
  file = File.open(loadfilename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    insert_to_students(name, cohort)
    #@students << {name: name, cohort: cohort.to_sym}
  end
  #file.close
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end


interactive_menu
