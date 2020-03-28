=begin

Problem
Determine and return the ASCII string value of a string
that is passed in as an argument.

# Requirements

- The ASCII string value is the sum of the ASCII values of
every character in the string.
- use method String#ord

## Input
- string

## Output
- number

# Test cases

ascii_value('Four score') == 984
ascii_value('Launch School') == 1251
ascii_value('a') == 97
ascii_value('') == 0

# Data structures/Algorithm
- array
- convert the string into array -> .split
- iterate over each character
- return the ASCII value of each character
- sum all the values

=end

def ascii_value(string)
  string.split('').map(&:ord)
        .reduce(0) { |sum, num| sum + num }
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0

# Further Exploration

'b'.ord.chr == 'b'

# Alternative Solution

def ascii_values_each(str)
  total = 0
  str.each_char { |char| total += char.ord }
  total
end

p ascii_values_each('Four score') == 984
p ascii_values_each('Launch School') == 1251
p ascii_values_each('a') == 97
p ascii_values_each('') == 0
