=begin

# Problem

Input:
- one argument
- an array of integers

Output:
- integer

# Requirements
- calculate the average of all integers in the array
  - average is a single number that represents the entire list
  - sum of the numbers divided by how many numbers are present in the list
- array will never be empty
- array contains only positive numbers

# Examples/Test cases
average([1, 5, 87, 45, 8, 8]) == 25

# Data structure
- array

# Algorithm
- iterate over each integer in an array
- sum the next integer with the previous integer until the last integer in an array
- total sum / array.length

def average(array) 
 
  sum = 0
  i = 0
  
  while i < array.length do

    sum += array[i]

    i += 1

  end

  sum / array.length
  
end
=end

def average(array) 
 
  sum = array.reduce { |sum, number| sum + number }
  sum.to_f / array.count

end

puts average([1, 5, 87, 45, 8, 8])
puts average([9, 47, 23, 95, 16, 52])



