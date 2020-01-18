# Problem
# Return a new array identical in structure to the original 
# but containing only the integers that are multiples of 3
# Use select or reject methods

# Algo
# - iterate over each element of the array using map metod
# - use select method
#

arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

result = arr.map do |sub_arr|
  sub_arr.select do |el|
    el % 3 == 0
  end
end

p result