=begin

# Problem

# Requirements:
- multiply all pairs between two arrays
- sort array by increasing value

# Input:
- two array argumets

# Output:
- an array

# Examples:
multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

# Data structure/Algorithm:
- array

=end

def multiply_all_pairs(arr1, arr2)
  result = []
  arr1.each do |el|
    arr2.each do |val|
      result << el * val
    end
  end
  result.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2])

# LS solution

def multiply_all_pairs(array_1, array_2)
  array_1.product(array_2).map { |num1, num2| num1 * num2 }.sort
end