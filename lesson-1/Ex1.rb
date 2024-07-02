require 'rspec'

def greeting
    puts "Как ваше имя?"
    name = gets.chomp
    puts "Как ваша фамилия?"
    surname = gets.chomp
    puts "Ваш возраст?"
    age = gets.to_i
    if age<18
        "Привет, #{name} #{surname}. Тебе меньше 18 лет, но начать программировать учиться никогда не рано"
    else 
        "Привет, #{name} #{surname}. Самое время заняться делом"
    end
end

def foobar(num1, num2)
    if num1==20 or num2==20
        num2
    else
        num1+num2
    end
end    


RSpec.describe "Main" do
    it "#greeting more 18" do
        allow_any_instance_of(Kernel).to receive(:gets).and_return('Женя', 'Татарян', 21)
        expect(greeting).to eq("Привет, Женя Татарян. Самое время заняться делом")
    end

    it "#greeting less 18" do
        allow_any_instance_of(Kernel).to receive(:gets).and_return('Женя', 'Татарян', 16)
        expect(greeting).to eq("Привет, Женя Татарян. Тебе меньше 18 лет, но начать программировать учиться никогда не рано")
    end

    it "#greeting equal 18" do
        allow_any_instance_of(Kernel).to receive(:gets).and_return('Женя', 'Татарян', 18)
        expect(greeting).to eq("Привет, Женя Татарян. Самое время заняться делом")
    end

    it "#foobar when 20 first" do
        expect(foobar(20, 30)).to eq(30)
    end

    it "#foobar when 20 second" do
        expect(foobar(30, 20)).to eq(20)
    end

    it "#foobar when there no 20" do
        expect(foobar(30, 50)).to eq(80)
    end
end