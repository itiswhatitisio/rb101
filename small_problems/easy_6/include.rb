=begin

# Problem

# Requirements:
- return true if an argument is present in the array
- return false if an argument is not present in the array
- consider empty and nil values
- do not use include? method

# Input:
- array
- an argument to search for

# Output:
- boolean - true or false

# Examples:
include?([1,2,3,4,5], 3) == true
include?([1,2,3,4,5], 6) == false
include?([], 3) == false
include?([nil], nil) == true
include?([], nil) == false

# Data structure/Algorithm:
- array
- iterate over each element in an array - each
- if element matches the passed argument, return true
- if element doesn't match the passed argument, return false

=end

def included?(array, arg)
  result = []
  array.each do |val|
    result << true if val == arg
  end
  result.each do |el|
    return true if el == true
  end
  return false if result.empty?
end

p included?([1, 2, 3, 4, 5], 3) == true
p included?([1, 2, 3, 4, 5], 6) == false
p included?([], 3) == false
p included?([nil], nil) == true
p included?([], nil) == false

# Further exploration

def included3?(arr, val)
  arr.any? { |el| el == val }
end

# LS - solution 1

def include1?(array, value)
  !!array.find_index(value)
end

p include1?([1, 2, 3, 4, 5], 3) #== true
p include1?([1, 2, 3, 4, 5], 6) == false
p include1?([], 3) == false
p include1?([nil], nil) == true
p include1?([], nil) == false

# LS - solution 2

def include2?(array, value)
  array.each { |element| return true if value == element }
  false
end

p include2?([1, 2, 3, 4, 5], 3) #== true
p include2?([1, 2, 3, 4, 5], 6) == false
p include2?([], 3) == false
p include2?([nil], nil) == true
p include2?([], nil) == false