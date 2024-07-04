require_relative '../FileManager.rb'

ABSOLUTE_PATH = "students.txt"
BUFFER = "buffer.txt"
flManager = FileManager.new(ABSOLUTE_PATH, BUFFER)

while true
  puts "О студентах какого возраста вы хотите узнать?"
  age = gets.to_i
  break if age==-1
  students = flManager.where(age)
  puts students
end