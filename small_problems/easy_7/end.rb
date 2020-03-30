=begin

# Problem

# Requirements:
- return the next to last word in the String passed as an argument

# Input:
- string

# Output:
- string

# Examples:
penultimate('last word') == 'last'
penultimate('Launch School is great!') == 'is'

# Data structure/Algorithm:
- string, converted to array
- determine the length of the array
- return the length-2 element from the array

=end

def penultimate(string)
  arr = string.split(' ')
  size = arr.length - 2
  arr[size]
end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'