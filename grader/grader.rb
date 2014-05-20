#get all grades from user and pass to array
require 'pry'

def get_grades
  puts 'Please enter grades one per line. Enter "done" when finished.'
  grades_arr = []

  input = nil
  while input != "done"
    input = gets.chomp
#add all grades in array
    grades_arr << input.to_i unless input == "done"
  end
  return grades_arr
    binding.pry
end

#get the average of the array
def average(get_grades)
  get_grades.inject(:+) / get_grades.length
end

def pass_fail(average)
  if average >= 70
    puts "You passed."
  else
    puts "You failed."
  end
end

#report grades pass fail to user
def result
  pass_fail(average(get_grades))
end


result
