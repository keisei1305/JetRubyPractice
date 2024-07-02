require 'rspec'

class Pocemon
  def initialize(name, color)
    @name = name
      @color = color
    end

  def to_str
    "{name: #{@name}, color: #{@color}}"
  end
end

def init_pocemons(count)
  pocemons=[]
    count.times do
      puts "Введите имя покемона"
      name = gets.chomp
      puts "Введите цвет покемона"
      color = gets.chomp
      pocemons<<Pocemon.new(name, color)
    end
  pocemons
end

def pocemons_to_str(pocemons)
  "["+pocemons.join(", ")+"]"
end

#puts "Сколько вы хотите покемонов?"
#count = gets.to_i
#pocemons = init_pocemons(count)
#puts pocemons

pocemons = []
pocemons<<Pocemon.new("Picka", "Yellow")
pocemons<<Pocemon.new("Jigglypuff", "Pink")

puts pocemons_to_str(pocemons)

RSpec.describe "Main" do
  it "#pocemons init" do
    expect(handle_str("Hellocs")).to eq(7)
  end

  it "#handle_str without cs" do
    expect(handle_str("Hello")).to eq("olleH")
  end

  it "#handle_str with 1 word" do
    expect(handle_str("H")).to eq("H")
  end
end