=begin

# Problem

# Requirements:
- input arrays non-empty
- contain the same number of elements
- combine two arrays
- elements need to be alternating

# Input:
- two arrays

# Output:
- one array
- new array

# Examples:
interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

# Data structure/Algorithm:
- array
- arr1[0] = result[0]
- arr2[0] = result[1], index = 1
- arr1[1] = result[2]
- arr2[1] = result[3], index = 3
- arr1[2] = result[4]
- arr2[2] = result[5], index = 5
- can use insert method

=end

def interleave(arr1, arr2)
  total_length = (arr1.length + arr2.length)
  result = arr1
  x = 1
  i = 0
  while x < total_length
    result.insert(x, arr2[i])
    x += 2
    i += 1
  end
  result
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

# LS solution

def interleave1(array1, array2)
  result = []
  array1.each_with_index do |element, index|
    result << element << array2[index]
  end
  result
end

p interleave1([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
