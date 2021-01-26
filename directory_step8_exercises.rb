#TODO 6,8,10

def input_students
  puts "Please enter the names of the students"
  puts "To finish, enter 'submit'"
  students = []
  name = gets.chomp
  
  if name == "submit"
    students
  else
    
  puts "Please enter the month of cohort"  
  cohort = gets.chomp
  
  if cohort.empty?
      cohort = "january"
  end
  
  puts "Please enter date of birth :dd/mm/yyyy"  
  dob = gets.chomp
  puts "Favourite hobby"  
  hobby = gets.chomp
  puts "Height in cm"  
  height = gets.chomp
  students << {name: name, cohort: cohort, dob: dob, hobby: hobby, height: height}
  puts "Now we have #{students.count} students"
  name = gets.chomp
  
  until name == "submit" do
    
        puts "Please enter the month of cohort"
        cohort = gets.chomp
        if cohort.empty?
          cohort = "january"
        end
        puts "Please enter date of birth :dd/mm/yyyy"  
        dob = gets.chomp
        puts "Favourite hobby"  
        hobby = gets.chomp
        puts "Height in cm"  
        height = gets.chomp
        students << {name: name, cohort: cohort, dob: dob, hobby: hobby, height: height}
        puts "Now we have #{students.count} students"
        name = gets.chomp
  end
  end
    students
end

def print_header
  puts "The students of Villains Academy".center(5)
  puts "-------------"
end

#Exercise 1, each_with_index made redunant by changing from .each method to utlizing while (as per exercise 4)
#def print(students) 
  #students.each_with_index do |student, index| #Exercise 1
    #indexplusone = index + 1 #Exercise 1 cont.
    #if student[:name].length <= 12 && student[:name].chars.first == "a" #Exercise 2 + Exercise 3
    #puts "#{indexplusone}. #{student[:name]} (#{student[:cohort]} cohort)"
    #end
  #end
#end

def print(students) 
counter = 0
  while counter < students.length do
    index = counter + 1
    if students[counter][:name].length <= 12 && students[counter][:name].chars.first == "a" 
      puts "#{index}. #{students[counter][:name]} #{students[counter][:cohort]} cohort 
      Date of Birth: #{students[counter][:dob]} 
      Favourite Hobby: #{students[counter][:hobby]} 
      Height(cm): #{students[counter][:height]}"
    end
    counter = counter + 1
  end
end 

def print_footer(students)
  if students.count > 1 
  puts "Overall, we have #{students.count} great students".center(18)
  else
  puts "Overall, we have #{students.count} great student".center(18)
  end 
end

students = input_students

if !students.empty? 
print_header
print(students)
print_footer(students)
else 
  puts "No students"
end 