module StringCalculator

  def self.add(string)
    return 0 if string.empty?

    raise_error_on_negative_numbers(string)
    split_string(string).sum(&:to_i)
  end

  def self.split_string(string)
    extra_lines = string[0,2]
    delimiter = delimiter(extra_lines)
    string.gsub("\n", delimiter).split(delimiter)
  end

  def self.delimiter(extra_lines)
    extra_lines == '//' ? ';' : ','
  end

  def self.raise_error_on_negative_numbers(string)
    if string.include?('-')
      numbers_str_arr = string.split(',')
      negative_numbers = numbers_str_arr.collect{|c| c if c.include? '-'}.compact.join(',')
      
      raise "negative numbers not allowed #{negative_numbers}" 
    end
  end

end