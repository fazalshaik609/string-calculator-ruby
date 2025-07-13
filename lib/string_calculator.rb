module StringCalculator

  def self.add(string)
    return 0 if string.empty?
    
    return find_numbers(string)[0] + find_numbers(string)[1] if string.include?(',')
    string.to_i
  end

  def self.find_numbers(string)
    string.split(',').map(&:to_i)
  end

end