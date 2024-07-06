require "rspec"
require_relative "../Controller/router.rb"

RSpec.describe Router, "Router http request simulation" do
  subject do
    Router.new
  end

  it "Router POST request" do
    subject.create()
    expect(subject.show(0)).to eq("Hello World")
  end
end