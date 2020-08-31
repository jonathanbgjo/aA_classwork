class Integer
  # Integer#hash already implemented for you
end

class Array #[121312321]
  def hash
    # return -1 if self.lengh == 0 
    arr = []
    self.each.with_index do |el, idx| 
      arr << (idx+el).hash
    end
    arr.sum
  end
end
require 'byebug'
class String
  def hash
    alpha = ('a'..'z').to_a 
    
    sum = 0
    self.each_char.with_index do |char,idx|
      sum += (alpha.index(char) - idx).hash
    end
    sum
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    sum = 0
    self.values.each do |ele|
      sum += ele.hash
    end
    sum
    # 0
  end
end
# [1,2,3] = 6
# [3,2,1] = 6