require 'rspec'

def handle_str(str)
    if str[-2..-1] == "cs"
        str.length
    else
        str.reverse
    end 
end

RSpec.describe "Main" do
    it "#handle_str with cs" do
        expect(handle_str("Hellocs")).to eq(7)
    end

    it "#handle_str without cs" do
        expect(handle_str("Hello")).to eq("olleH")
    end

    it "#handle_str with 1 word" do
        expect(handle_str("H")).to eq("H")
    end
end