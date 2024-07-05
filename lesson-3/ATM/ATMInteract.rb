require_relative "ATM.rb"
require_relative "../FileManager"

ABSOLUTE_PATH = "balance.txt"
BUFFER = "buffer"
atm = ATM.new(FileManager.new(ABSOLUTE_PATH, BUFFER))

unless File.exist?(ABSOLUTE_PATH)
  File.write(ABSOLUTE_PATH, 100.0)
end

while true
  puts "\n\nВведите команды для взаимодействия:"
  puts "D: deposit; W: withdraw; B: balance; Q: quit;"
  cmd = gets.chomp
  cmd = cmd.downcase
  case cmd
  when 'd'
    puts "Введите депозит:"
    dep = gets.to_f
    atm.deposite(dep)
    puts "Вы успешно ввели депозит"
  when 'w'
    puts "Введите сумму для снятия:"
    wd = gets.to_f
    begin
      atm.withdraw(wd)
    rescue Exception =>e
      puts "Ошибка. Введите сумму снятия меньше вашего баланса и больше 0"
    else 
      puts "Вы успешно сняли деньги"
    end
    when 'b'
      puts "Ваш баланс:"
      puts atm.balance
    when 'q'
      break
  else
    puts "Невозможная команда, повторите снова\n"
  end
end