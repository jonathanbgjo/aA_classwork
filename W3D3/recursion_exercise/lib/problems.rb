require "byebug"
# Write a method, pow(base, exponent), that takes in two numbers.
# The method should calculate the base raised to the exponent power.
# You can assume the exponent is  always positive.
#
# Solve this recursively!
#
# Examples:
#
# pow(2, 0) # => 1
# pow(2, 1) # => 2
# pow(2, 5) # => 32
# pow(3, 4) # => 81
# pow(4, 3) # => 64
def pow(base, exponent)
    if exponent== 0
        return 1
    end

    return base * pow(base, exponent-1)
end
#our comments
#base 2.  pow(2,0) ==> 1
#pow(2,1)  2x 1 ==> 2
#pow(2,2) 2 x 2 x 1 ==> 4
#pow(2,3)2 x 2 x 2 x 1 ==> 8


# Write a method, lucas_number(n), that takes in a number.
# The method should return the n-th number of the Lucas Sequence.
# The 0-th number of the Lucas Sequence is 2.
# The 1-st number of the Lucas Sequence is 1
# To generate the next number of the sequence, we add up the previous two numbers.
#
# For example, the sequence begins: 2, 1, 3, 4, 7, 11, ...
#
# Solve this recursively!
#
# Examples:
#
# lucas_number(0)   # =>    2
# lucas_number(1)   # =>    1
# lucas_number(2)   # =>    3
# lucas_number(3)   # =>    4
# lucas_number(5)   # =>    11
# lucas_number(9)   # =>    76
def lucas_number(n)
    if n == 0
        return 2
    elsif n==1
        return 1
    end

    return lucas_number(n-2) + lucas_number(n-1)
end
#our comments
#0 ==> 2
#1 ==> 1
#2 ==> ln(1) + ln(0) ==> 2+1 ==>3
#3 ==> ln(n-2) + ln(1) ==> 1+3==> 4


# Write a method, sum_array(array), that takes in an array of numbers.
# The method should return the total sum of the elements.
#
# Solve this recursively!
#
# Examples:
#
# sum_array([])             # => 0
# sum_array([5])            # => 5
# sum_array([5, 2])         # => 7
# sum_array([4, 10, -1, 2]) # => 15
def sum_array(array)
    return 0 if array.empty?

    return array.shift + sum_array(array)
end
#our comments
#return 0 if array.empty?
#sum+=array.shift
#


# Write a method, reverse_string(str), that takes in a string.
# The method should return the string with it's characters in reverse order.
#
# Solve this recursively!
#
# Examples:
#
# reverse_string("")            # => ""
# reverse_string("c")           # => "c"
# reverse_string("internet")    # => "tenretni"
# reverse_string("friends")     # => "sdneirf"
def reverse_string(str)
    return "" if str == ""

    str[-1] + reverse_string(str[0..-2])

end
#our comments
#concat from last => first
#if str == "" return ""
#get last, recursively call all but last


# A 1-dimensional array is also known as a flattened array.
# Write a method, flatten(data), that accepts a single argument. The
# method should take in an array of any dimension and return the flattened
# version of that array. Solve this recursively.
#
# Hint:
#  - if the argument is not an array, then we have reached the base case
#  - look up the documentation for how to check if data is an array or not
#
# Examples:
#
# array_1 = [1, 2, [[3, 4], [5, [6]]], [7, 8]]
# flatten(array_1)      # => [ 1, 2, 3, 4, 5, 6, 7, 8 ]
#
# array_2 = ['this', ['problem', 'is'], [['pretty', 'tough'], [[':)']]]]
# flatten(array_2)      # => [ 'this', 'problem', 'is', 'pretty', 'tough', ':)' ]
#
# flatten('base case')  # => [ 'base case' ]
#
# Another Hint:
#
# From the last example, you may be confused. We said that the method takes
# in an array as an arg, but we passed it a string?
# If data is not an array, then we can consider it as a 0-dimensional array.
#     0-dimensional array: 'some data'
#     1-dimensional array: ['some data'] => ['some data']
#     2-dimensional array: [['some data']]
#     3-dimensional array: [[['some data']]]

# def flatten(data)
#   if !data.is_a?(Array)
#     return data
#   end

#   if data[1]
#     return [] + [flatten(data.first)] + flatten(data[1..-1])
#   else
#     return [] + [flatten(data.first)]
#   end

# end
# def flatten(data)
#   if !data.is_a?(Array)
#     return [data]
#   end

#   if data[1]
#     return [] + flatten(data.first) + flatten(data[1..-1])
#   else
#     return [] + flatten(data.first)
#   end

# end

def flatten(data)
  if !data.is_a?(Array)
    if data.nil?
      return []
    else
      return [data]
    end
  end

  return flatten(data.first) + flatten(data[1..-1])
end
# var.is_a?(Array)
# flatten(arr.first) + flatten(arr[1..-1]) #  "second data", "third data", "fourth data"
# flatten(arr.first) + flatten(arr[1..-1])
# [flatten(first)]
# ['first'] + rest => ['first']

