=begin

# Problem

# Requirements:
- result = multiply all the numbers in an array
- resul/nr of elements in an array
- print the result rounded to 3 integers

# Input:
- array of integers

# Output:
- integer, rounded to 3 integers

# Examples:
show_multiplicative_average([3, 5])
The result is 7.500

show_multiplicative_average([6])
The result is 6.000

show_multiplicative_average([2, 5, 7, 11, 13, 17])
The result is 28361.667

# Data structure/Algorithm:
- array
- result = multiply all the elements in an array -> reduce
- average = result.to_f/array.length
- print the result rounded to 3 integers

=end

def show_multiplicative_average(array)
  result = array.reduce(:*)/array.size.to_f
  puts "The result is #{format('%.3f', result)}"
end

show_multiplicative_average([3, 5])
show_multiplicative_average([6])
show_multiplicative_average([2, 5, 7, 11, 13, 17])