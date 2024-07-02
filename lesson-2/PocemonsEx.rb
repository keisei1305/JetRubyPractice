require 'rspec'

def init_pocemons(count)
  pocemons=[]
    count.times do
      puts "Введите имя покемона"
      name = gets.chomp
      puts "Введите цвет покемона"
      color = gets.chomp
      pocemons<<{"name"=>name, "color"=>color}
    end
  pocemons
end

def pocemon_to_str(pocemon)
  "{name: '#{pocemon["name"]}', color: '#{pocemon["color"]}'}"
end

def pocemons_to_str(pocemons)
  pocemons = pocemons.map{|pocemon| pocemon_to_str(pocemon)}
  "["+pocemons.join(", ")+"]"
end



#puts "Сколько вы хотите покемонов?"
#count = gets.to_i
#pocemons = init_pocemons(count)

pocemons = init_pocemons(2)
puts pocemons_to_str(pocemons)

RSpec.describe "Main" do
  it "#pocemons_to_str" do
    pocemons = [{"name"=>"Пикачу", "color"=>"Жёлтый"}, {"name"=>"Джиглипуф", "color"=>"Розовый"}]
    expect(pocemons_to_str(pocemons)).to eq("[{name: 'Пикачу', color: 'Жёлтый'}, {name: 'Джиглипуф', color: 'Розовый'}]")
  end

  it "#init_pocemons" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('Пикачу', "Жёлтый", "Джиглипуф", "Розовый")
    pocemons = [{"name"=>"Пикачу", "color"=>"Жёлтый"}, {"name"=>"Джиглипуф", "color"=>"Розовый"}]
    expect(init_pocemons(2)).to eq(pocemons)
  end
end