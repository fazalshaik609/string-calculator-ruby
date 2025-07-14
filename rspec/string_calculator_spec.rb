# frozen_string_literal: true

require 'debug'
require 'string_calculator'

RSpec.describe StringCalculator, '#add' do
  context 'given an empty string' do
    before { @calc = StringCalculator::Calculator.new }

    it 'returns 0' do
      expect(@calc.add).to eql(0)
    end
  end

  context 'given single input string' do
    before { @calc = StringCalculator::Calculator.new('1') }

    it "returns 1 for '1'" do
      expect(@calc.add).to eql(1)
    end
  end

  context 'given two inputs string' do
    before { @calc = StringCalculator::Calculator.new('1,2') }

    it "returns 3 for '1,2'" do
      expect(@calc.add).to eql(3)
    end
  end

  context 'given any number of inputs string' do
    before { @calc = StringCalculator::Calculator.new('4,2,3') }

    it "returns 9 for '4,2,3'" do
      expect(@calc.add).to eql(9)
    end
  end

  context "given newlines '\n' in input string" do
    before { @calc = StringCalculator::Calculator.new("1\n2") }

    it "supports newlines and returns 3 for '1\n2'" do
      expect(@calc.add).to eql(3)
    end

    it "supports newlines and returns 6 for '1\n2,3'" do
      @calc.string = "1\n2,3"

      expect(@calc.add).to eql(6)
    end

    it "supports multiple newlines and returns 12 for '1\n2,3\n4\n2'" do
      @calc.string = "1\n2,3\n4\n2"

      expect(@calc.add).to eql(12)
    end

    it "supports consecutive newlines and returns 8 for '4\n0,0\n\n\n4'" do
      @calc.string = "4\n0,0\n\n\n4"

      expect(@calc.add).to eql(8)
    end
  end

  context "given different delimiters with begining of string '//'" do
    before { @calc = StringCalculator::Calculator.new("//;\n1;2") }

    it "returns 3 for '//;\n1;2'" do
      expect(@calc.add).to eql(3)
    end

    it "returns 12 for '//a;\n\n10b;2c'" do
      @calc.string = "//a;\n\n10b;2c"

      expect(@calc.add).to eql(12)
    end
  end

  context 'given single negative number as input string' do
    before { @calc = StringCalculator::Calculator.new('-1') }

    it 'should raise RuntimeError' do
      expect { @calc.add }.to raise_error(RuntimeError)
    end

    it "should raise RuntimeError with message 'negative numbers not allowed'" do
      expect { @calc.add }.to raise_error(RuntimeError, 'negative numbers not allowed -1')
    end
  end

  context 'given multiple negative numbers as input string' do
    before { @calc = StringCalculator::Calculator.new('-1,-2') }

    it 'should raise RuntimeError with multiple negative numbers message' do
      expect { @calc.add }.to raise_error(RuntimeError, 'negative numbers not allowed -1,-2')
    end

    it 'should raise negative numbers not allowed message even input string has postive numbers' do
      @calc.string = '-1,-8,4,6,-12'

      expect { @calc.add }.to raise_error(RuntimeError, 'negative numbers not allowed -1,-8,-12')
    end
  end
end
