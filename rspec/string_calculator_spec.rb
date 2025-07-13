require 'string_calculator'
require 'debug'

RSpec.describe StringCalculator, "#add" do

  context "given an empty string" do   
    it "returns 0" do
      expect(StringCalculator.add("")).to eql(0)
    end
  end

  context "given single input string" do
    it "returns 1 for '1'" do
      expect(StringCalculator.add("1")).to eql(1)
    end
  end

  context "given single input string" do
    it "returns 33 for '33'" do
      expect(StringCalculator.add("33")).to eql(33)
    end
  end

  context "given two inputs string" do
    it "returns 3 for '1,2'" do
      expect(StringCalculator.add("1,2")).to eql(3)
    end

    it "returns 10 for '0,10'" do
      expect(StringCalculator.add("0,10")).to eql(10)
    end
  end

end