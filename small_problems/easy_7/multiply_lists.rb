=begin

# Problem

# Requirements:
- product of each pair of numbers with the same index
- arguments contain the same number of elements

# Input:
- two arrays

# Output:
- new array

# Examples:
multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

# Data structure/Algorithm:
- array
- iterate over the first array
- iterate over the second array
- if the idex of both elements matches, multiply the elements
- add the product to the new array

=end

def multiply_list(arr1, arr2)
  result = []
  arr1.each_with_index do |num1, ind1|
    arr2.each_with_index do |num2, ind2|
      result.push(num1 * num2) if ind1 == ind2
    end
  end
  result
end

multiply_list([3, 5, 7], [9, 10, 11])

# LS solution

def multiply_list(list_1, list_2)
  products = []
  list_1.each_with_index do |item, index|
    products << item * list_2[index]
  end
  products
end

# Further exploration

def multiply_list_zip(list_1, list_2)
  list_1.zip(list_2).map { |list| list.reduce(:*) }
end

p multiply_list_zip([3, 5, 7], [9, 10, 11])
