module StringCalculator

  def self.add(string)
    return 0 if string.empty?
    raise "negative numbers not allowed #{string}" if string.include?('-')
    
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

end