=begin

# Problem:

# Requirements:
- final array contains all the values from both of the arrays
- final array doesn't contain the duplicates
- will it always be a one level array or also nested arrays?
- return a new array?

# Input:
- two arrays

# Output:
- array

# Examples:
merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

# Data structure/Algorithm:
- array
- concatenate both arrays
- remove duplicates

=end

def merge(array1, array2)
  i = 0
  loop do
    x = 0
    loop do
      array2.delete(array2[x]) if array1[i] == array2[x]
      break if x == array2.length - 1
      x += 1
    end
    break if i == array1.length - 1
    i += 1
  end
  array1 + array2
end

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

def merge1(arr1, arr2)
  arr1.each do |el|
    arr2.each do |val|
      arr2.delete(val) if el == val
    end
  end
  arr1 + arr2
end

merge1([1, 3, 5], [3, 6, 9])

# LS solution

def merge2(arr1,arr2)
  arr1 | arr2
end

p merge2([1, 3, 5], [3, 6, 9])
