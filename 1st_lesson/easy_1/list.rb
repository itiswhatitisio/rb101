=begin

# Problem

Input:
- a positive integer

Output:
- array of integers

# Requirements
- return list of the digits

# Examples/Test cases
puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7] 

# Data structure
- integer
- string has an advantage over integers

# Algorithm
- convert an integer to string
- use the split method to return an array of strings
- iterate over each element in an array
- convert each element to an interger
- return an array

=end


def digit_list(num) 

  arr = num.to_s.split("")
  arr.map { |el| el.to_i }
  
end

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true