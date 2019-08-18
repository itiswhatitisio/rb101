=begin

Write a method that takes one argument, 
a positive integer, and returns the sum of its digits.

# Problem

Input:
- a positive integer

Output:
- sum of the digits

# Requirements
- do not simple loops such as while, loop etc.

# Examples/Test cases
sum(23) == 5
sum(496) == 19
sum(123_456_789) == 45

# Data structure
- array

# Algorithm

=end

def sum(integer)

  integer.digits.reduce(:+)

end



puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
