require 'string_calculator'

RSpec.describe StringCalculator, "#add" do

  context "given an empty string" do   
    it "should return 0" do
      expect(StringCalculator.add("")).to eql(0)
    end
  end

  context "given input '1'" do
    it "should return 1" do
      expect(StringCalculator.add("1")).to eql(1)
    end
  end

  context "given input '33'" do
    it "should return 33" do
      expect(StringCalculator.add("33")).to eql(33)
    end
  end

end