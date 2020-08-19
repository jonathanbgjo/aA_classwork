class Array
  # Write an `Array#my_inject` method. If my_inject receives no argument, then
  # use the first element of the array as the default accumulator.
  # **Do NOT use the built-in `Array#inject` or `Array#reduce` methods in your 
  # implementati on.**

  def my_inject(accumulator = nil, &prc)
    p self
    accumulator ||= self[0]
  
    self.each do |ele|
      prc.call(accumulator, ele)
    end
  end
end

# Define a method `primes(num)` that returns an array of the first "num" primes.
# You may wish to use an `is_prime?` helper method.

def is_prime?(num)
  (2...num).each do |factor|
    if num % factor == 0
      return false
    end
  end
  true
end

def primes(num)
  count = 0
  i = 2
  result = []
  while count < num
    if is_prime?(i)
      result << i
      count+=1
    end
    i+=1 
  end

  result
end

# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.
# 0!, 1!, 2!, 3!
#0, 1, 2*1, 3*2*1
def factorials_rec(num)
  # p num
  # p "num #{num} "
  if num <= 0
    return [1]
  end
  if num == 1
    return [1]
  end
  if num == 2
    return [1, 1]
  end
  # p factorial(3)
  # factorial = num-1 * factorials_rec(num-2)
  # p factorial
  return factorials_rec(num-1) + [factorial(num-1)]
 
end
def factorial(num)
  if num == 0
    return 1
  elsif num == 1
    return 1
  elsif num== 2
    return 2
  end
  num *= factorial(num-1)
  
end

class Array
  # Write an `Array#dups` method that will return a hash containing the indices 
  # of all duplicate elements. The keys are the duplicate elements; the values 
  # are arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
      hash=  Hash.new {|h,k| h[k] = []}
      self.each.with_index do |ele, idx|
          hash[ele] << idx 
      end
      hash.each do |k,v|
        if hash[k].length == 1
          hash.delete(k)
        end
      end

      return hash
  end
end

class String
  # Write a `String#symmetric_substrings` method that returns an array of 
  # substrings that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.

  def symmetric_substrings
    p self
    arr = []
    self.each_char do |char|
      arr << char
    end

    result = []
    arr.each.with_index do |char|
      new_str = char
      if is_palindrome?(new_str) && new_str.length > 1
          result << new_str
      end
      arr[1..arr.length-1].each do |char2|
        new_str +=char2
        if is_palindrome?(new_str) && new_str.length > 1
          result << new_str
        end
      end
    end
    result
  end

  def is_palindrome?(word)

    i = 0
    while i < word.length/2
      if word[i] == word[word.length -1 -i]
        return false
      end
      i+=1
    end
    return true
  end
end

class Array
  # Write an `Array#merge_sort` method; it should not modify the original array.
  # **Do NOT use the built in `Array#sort` or `Array#sort_by` methods in your 
  # implementation.**
  
  def merge_sort(&prc)
  end

  private
  def self.merge(left, right, &prc)
  end
end
