require_relative "../FileManager"

class CashMachine
  def initialize(balance_path)
    unless File.exist?(balance_path)
      File.write(balance_path, 100.0)
    end
    @flManager = FileManager.new(balance_path, "buffer.txt")
  end

  def init
    while true
      puts "\n\nВведите команды для взаимодействия:"
      puts "D: deposit; W: withdraw; B: balance; Q: quit;"
      cmd = gets.chomp
      cmd = cmd.downcase
      case cmd
      when 'd'
        puts "Введите депозит:"
        dep = gets.to_f
        deposite(dep)
        puts "Вы успешно ввели депозит"
      when 'w'
        puts "Введите сумму для снятия:"
        wd = gets.to_f
        begin
          withdraw(wd)
        rescue Exception =>e
          puts "Ошибка. Введите сумму снятия меньше вашего баланса и больше 0"
        else 
          puts "Вы успешно сняли деньги"
        end
        when 'b'
          puts "Ваш баланс:"
          puts balance
        when 'q'
          break
      else
        puts "Невозможная команда, повторите снова\n"
      end
    end
  end

  private def deposite(sum)
    balance = @flManager.find(0).to_f
    @flManager.update(0, (balance+sum).to_s)
  end

  private def withdraw(sum)
    balance = @flManager.find(0).to_f
    raise Exception.new "sum is incorrcet" if sum<0 
    raise Exception.new "sum is more than balance" if balance - sum < 0
    @flManager.update(0, (balance - sum).to_s)
  end

  private def balance
    balance = @flManager.find(0)
    balance
  end
end