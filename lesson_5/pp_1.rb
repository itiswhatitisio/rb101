# Order array by descending numeric value
#
# Input: array of strings
#
# Output: sorted array of strings
#
# Algorithm
# - iterate over each element in the array
# - convert it to integer
# - sort the array
# - convert the values to strings
# - 
# - 


arr = ['10', '11', '9', '7', '8']

array_integers = arr.map do |val|
  val.to_i
end

sorted = array_integers.sort do |a,b|
  b <=> a
end

outcome = sorted.map do |val|
  val.to_s
end

p outcome

# Solution

arr.sort do |a,b|
  b.to_i <=> a.to_i
end
