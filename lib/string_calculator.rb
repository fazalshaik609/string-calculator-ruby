module StringCalculator

  def self.add(string)
    return 0 if string.empty?
    
    split_string(string).sum(&:to_i)
  end

  def self.split_string(string)
    string.gsub("\n", delimiter).split(delimiter)
  end

  def self.delimiter
    ','
  end

end