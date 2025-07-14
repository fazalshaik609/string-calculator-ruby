module StringCalculator

  class Calculator
    attr_accessor :string 

    def initialize(string = '')
      @string = string
    end

    def add
      return 0 if @string.empty?

      raise_error_on_negative_numbers
      split_string.sum(&:to_i)
    end

    private

    def split_string
      extra_lines = @string[0,2]
      delimiter = delimiter(extra_lines)
      @string.gsub("\n", delimiter).split(delimiter)
    end

    def delimiter(extra_lines)
      extra_lines == '//' ? ';' : ','
    end

    def raise_error_on_negative_numbers
      return unless @string.include?('-')

      numbers_str_arr = @string.split(',')
      negative_numbers = numbers_str_arr.collect{|c| c if c.include? '-'}.compact.join(',')
      raise "negative numbers not allowed #{negative_numbers}" 
    end
  end

end