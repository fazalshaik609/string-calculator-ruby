module StringCalculator

  def self.add(string)
    return 0 if string.empty?
    
    string.split(',').sum(&:to_i)
  end

end