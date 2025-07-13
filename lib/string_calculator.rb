module StringCalculator

  def self.add(string)
    return 0 if string.empty?
    
    split_string(string).sum(&:to_i)
  end

  def self.split_string(string)
    delimiter = string[0,2]
    string.gsub("\n", delimiter(delimiter)).split(delimiter(delimiter))
  end

  def self.delimiter(delimiter)
    delimiter == '//' ? ';' : ','
  end

end