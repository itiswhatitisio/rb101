=begin

# Problem:

# Requirements:
- return index of the first Fibonacci number that has
  the number of digits specified as an argument
- fibonacci sequence: next number is the sum of the two previous ones

# Input:
- integer

# Output:
- integer (index)

# Examples:

find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
find_fibonacci_index_by_length(10) == 45
find_fibonacci_index_by_length(100) == 476
find_fibonacci_index_by_length(1000) == 4782
find_fibonacci_index_by_length(10000) == 47847

# Data structure/Algorithm:
- array, since we need to return index and
  array is an indexed-based collection
- convert digits to strings, so we can calculate the size
- recursion
- initiate an empty array
- add the number to the previous number
- convert it to string
- check the size of the string
- if the size == length parameter, return the index
- else continue generating numbers

=end

def fibonacci(number)
  numbers = %w(0 1)
  i = 0
  loop do
    n = numbers[i].to_i + numbers[i + 1].to_i
    numbers << n.to_s
    break if n.to_s.length == number
    i += 1
  end
  numbers.find_index(numbers.last)
end

p fibonacci(2) #== 7          # 1 1 2 3 5 8 13
p fibonacci(3) #== 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p fibonacci(10) #== 45
p fibonacci(100) #== 476
p fibonacci(1000) #== 4782
# fibonacci(10000) #== 47847
