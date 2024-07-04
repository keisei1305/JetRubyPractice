require_relative "FileManager.rb"
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