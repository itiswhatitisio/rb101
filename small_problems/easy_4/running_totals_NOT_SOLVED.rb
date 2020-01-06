# Problem
# =========
#
# Input: array
#
# Output: array
#
# Examples/Test cases:
#
# Requirements:
# ===============
#
# Explicit requirements:
# - new array has the same number of elements as the original
# - each new element in the new array is the sum of the previous elements
#
# Implicit requirements:
# - empty array should return empty arrays
#
# Data stucture/Algorithm:
# ==========================
# - arrays
# - initialize array to store totals
# - add the 0 index element to the new array
# - start iteration from the second element in the original array
# - calculate the sum of the previous value and the current value
# - push the total to the new array
# - repeat for each element in an array

def running_total(array)
  totals = []
  array.each_with_index do |val, idx|
    if idx.zero?
      totals.push(val)
    else
      totals.push(totals[idx - 1] + val)
    end
  end
  totals
end

def running_total_map(array)
  sum = 0
  array.map {|val| sum += val }
end

def running_total_reduce(array)
  result = []
  array.reduce(0) do |sum, n| 
    total = sum + n
    result << total
  end
end

running_total([2, 5, 13]) == [2, 7, 20]
running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
running_total([3]) == [3]
running_total([]) == []

running_total_map([2, 5, 13]) == [2, 7, 20]
running_total_map([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
running_total_map([3]) == [3]
running_total_map([]) == []

p running_total_reduce([2, 5, 13])
#p running_total_reduce([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
#p running_total_reduce([3]) == [3]
#p running_total_reduce([]) == []