require 'rspec'

class Pocemon
  def initialize(name, color)
    @name = name
      @color = color
    end

  def to_str
    "{name: '#{@name}', color: '#{@color}'}"
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
  it "#pocemons_to_str" do
    pocemons = [Pocemon.new("Пикачу", "Жёлтый"), Pocemon.new("Джиглипуф", "Розовый")]
    expect(pocemons_to_str(pocemons)).to eq("[{name: 'Пикачу', color: 'Жёлтый'}, {name: 'Джиглипуф', color: 'Розовый'}]")
  end
end