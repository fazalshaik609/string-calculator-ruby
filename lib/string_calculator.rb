module StringCalculator

  def self.add(string)
    return 0 if string.empty?
    
    number_strings = string.split(',')
    return number_strings[0].to_i + number_strings[1].to_i if number_strings.size.eql?(2)
    string.to_i
  end

end