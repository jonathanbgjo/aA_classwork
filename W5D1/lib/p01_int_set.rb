require 'rspec'

class MaxIntSet
  attr_reader :store
  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num) # index
    if is_valid?(num)
      @store[num] = true
    else
      raise "Out of bounds"
    end
    
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num] == true
  end

  private

  def is_valid?(num)
    0 <= num && num <= store.length - 1
  end

  def validate!(num)
  end
end

require 'byebug'
class IntSet
  attr_reader :store
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num) #index
    self[num] << num
  end

  def remove(num)
    self[num].pop
  end

  def include?(num) 
    # p @store
    if self[num].length > 0
      return true
    else
      return false
    end
  end

  private

  def [](num)
    # p 'does this hit this function'
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if !self[num].include?(num)
      self[num] << num
      @count += 1
    end
    if @count >= num_buckets
      self.resize!
    end
    # p @store
  end

  def remove(num)
    if self[num].include?(num)
      self[num].pop
      @count -=1
    end
  end

  def include?(num)
    if self[num].length > 0
      return true
    else
      return false
    end
  end

  private

  def [](num)
    @store[num % num_buckets]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    temp = @store.dup
    @store = Array.new(num_buckets * 2) { Array.new }
    temp.each do |sub_arr|
      sub_arr.each do |ele|
        self[ele] << ele
      end
    end
    @store
  end
end

