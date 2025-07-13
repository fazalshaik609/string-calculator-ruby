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

  context "given any number of inputs string" do
    it "returns 9 for '4,2,3'" do
      expect(StringCalculator.add("4,2,3")).to eql(9)
    end

    it "returns 200 for '50,50,50,50'" do
      expect(StringCalculator.add("50,50,50,50")).to eql(200)
    end
  end

  context "given newlines '\n' in input string" do
    it "supports newlines and returns 3 for '1\n2'" do
      expect(StringCalculator.add("1\n2")).to eql(3)
    end

    it "supports newlines and returns 6 for '1\n2,3'" do
      expect(StringCalculator.add("1\n2,3")).to eql(6)
    end

    it "supports multiple newlines and returns 12 for '1\n2,3\n4\n2'" do
      expect(StringCalculator.add("1\n2,3\n4\n2")).to eql(12)
    end

    it "supports consecutive newlines and returns 8 for '4\n0,0\n\n\n4'" do
      expect(StringCalculator.add("4\n0,0\n\n\n4")).to eql(8)
    end
  end

  context "given different delimiters in input string" do
    it "returns 3 for '//;\n1;2'" do
      expect(StringCalculator.add("//;\n1;2")).to eql(3)
    end
  end

end