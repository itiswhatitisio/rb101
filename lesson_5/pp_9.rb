=begin
# Problem: return a new array of the same structure but 
with the sub arrays being ordered 
(alphabetically or numerically as appropriate) 
in descending order

Input: multidimensional array

Output: sorted multidimensional array

# Requirements:
- sort elements within the array in decending order
- [2,1,3] => [3,2,1]

# Data structure/Algo:
- iterate over each element of the array
- sort each element in the array in des. order
  - using sort method

=end

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

sorted_array = arr.map do |arr|
  arr.sort do |a,b|
    b <=> a
  end
end

p sorted_array


