require_relative "../FileManager.rb"
require_relative "../ATM/ATM.rb"
require "rspec"

RSpec.describe FileManager, "CRUD in files. FileManager class test" do
  subject do 
    FileManager.new("students_test.txt", "buffer_test.txt")
  end
  before do
    subject.create("Татарян Евгений")
    subject.create("Романов Владислав")
    subject.create("Шевякин Артём")
    subject.create("Кузнецов Евгений")
  end

  it "find" do
    expect(subject.find(1)).to eq("Романов Владислав")
  end

  it "where" do
    expect(subject.where("Евгений")).to eq(["Татарян Евгений", "Кузнецов Евгений"])
  end

  it "update" do 
    subject.update(0, "Татарян Женя")
    expect(subject.find(0)).to eq("Татарян Женя")
  end

  it "delete" do
    subject.delete(0)
    expect(subject.find(0)).to eq("Романов Владислав")
  end

  it "create" do
    subject.create("Парфинцов Егор")
    expect(subject.find(4)).to eq("Парфинцов Егор")
  end

  after{File.delete("students_test.txt")}
end 

RSpec.describe ATM, "ATM machine" do
  subject do
    ATM.new(FileManager.new("balance.txt", "buffer.txt"))
  end

  before do
    file = File.open("balance.txt", "w")
    file.puts("100.0")
    file.close()
  end

  it "balance" do
    expect(subject.balance).to eq("100.0")
  end

  it "deposite" do
    subject.deposite(150)
    expect(subject.balance).to eq("250.0")
  end

  it "withdraw" do
    subject.withdraw(50)
    expect(subject.balance).to eq("50.0")
  end

  it "withdraw error" do
    expect{subject.withdraw(300)}.to raise_error(Exception, "sum is more than balance")
  end
  after do
    File.delete("balance.txt")
  end
end