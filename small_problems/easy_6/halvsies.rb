=begin

# Problem

# Requirements:
- split array in two equal halfs
- if original_array.length.odd? == true, then the middle element
  should be places in the first half

# Input:
- one array

# Output:
- nested array containing two arrays

# Examples:
halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
halvsies([5]) == [[5], []]
halvsies([]) == [[], []]

# Data structure/Algorithm:
- array
- detemine the middle of an array - middle = arr.size/2 + arr.size % 2
- split the array into two by using slice
  - first half - arr.slice(0, middle)
  - second half - arr.slice(middle,middle)
- add each half to the new array

=end

def halvsies(arr)
  result = []
  middle = arr.size / 2 + arr.size % 2 # LS solution middle = (array.size / 2.0).ceil
  first_half = arr.slice(0, middle)
  second_half = arr.slice(middle, middle)
  result << first_half << second_half
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]

def halvsies_partiion(arr)
  arr.partition { |val| arr.index(val) < arr.size / 2.0 }
end

p halvsies_partiion([1, 2, 3, 4]) #== [[1, 2], [3, 4]]
p halvsies_partiion([1, 5, 2, 4, 3]) #== [[1, 5, 2], [4, 3]]
p halvsies_partiion([5]) #== [[5], []]
p halvsies_partiion([]) #== [[], []]