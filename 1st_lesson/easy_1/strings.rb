=begin

Write a method that takes one argument, a positive integer, 
and returns a string of alternating 1s and 0s, always starting with 1. 
The length of the string should match the given integer.


# Problem

Input:
- one argument
- positive integer

Output:
- string

# Requirements
- output consists of alternating 1's and 0's
- output always starts with 1
- string.length == input integer


# Examples/Test cases
puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

# Data structure
- string
- array

# Algorithm

- create an empty array to hold the ouput
- iterator will hold the position of an integer in a string
- arr.length == integer
- iterate and increment the iterator until iterator == integer
- add 1 to an array if i % 2 != 0
- add 0 to an array if i % 2 == 0
- join the array and output the string

# Solution 

def stringy(size)
  numbers = []

  size.times do |index|
    number = index.even? ? 1 : 0
    numbers << number
  end

  numbers.join
end

=end


def stringy(integer) 

  output = []
  count = 1

  while count <= integer do
    output.push(1) if count % 2 != 0
    output.push(0) if count % 2 == 0
    count += 1
  end

  output.join("")

end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'










