=begin

# Problem

Input:
- integer
- positive, negative, zero

Output:
- true -> boolean

# Requirements
- return true if number's absolute value is odd
- absolute value -> non-negative number, n -> n, -n -> n, 0 -> 0
- odd -> num % 2 != 0

# Examples/Test cases
puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true

# Data structure
- integer

# Algorithm
- verify if the integer is a positive, negative or zero: num >= 0
- if positive, return the integer
- if negative, convert to positive num / -1
- if zero, return false
- for positive, negative, return true if number is odd

# original solution

def is_odd?(num)

  case num
  when num < 0
    num = num / -1
  when num > 0
    num = num
  when num == 0
    return false
  end

  num % 2 != 0 ? true : false

end

# refactored -> for the remainder, the negative sign is not relevant

def is_odd?(num)

  num % 2 != 0 ? true : false

end

=end 


def is_odd?(num)

  num.odd?

end

puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true