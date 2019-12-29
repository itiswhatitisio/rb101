def multiply(numbers_array, multiplier)
  counter = 0
  result = []

  while counter < numbers_array.size do
    output = numbers_array[counter] * multiplier
    result.push(output)
    counter += 1
  end
  result
end

my_numbers = [1, 4, 3, 7, 2, 6]
p multiply(my_numbers, 3) # => [3, 12, 9, 21, 6, 18]
