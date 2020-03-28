NUMBERS = {'0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9}

def string_to_integer(string)
  arr = string.chars.map { |val| NUMBERS[val] }
  arr.reduce { |total, num| total * 10 + num }
end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570

HEX = {'0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9,
  'A' => 10, 'B' => 11, 'C' => 12, 'D' => 13, 'E' => 14,
  'F' => 15}

# Algorithm
# - split the input string
# - convert the string to array
# - convert each element in the array into a number, based on HEX table
# - determine the index of each element (base)
# - el * 16 * power of index
# - sum all the elements in the final number

def hexadecimal_to_integer(string)
  arr = string.split('').map { |el| HEX[el.upcase]}.reverse
  result = arr.map.with_index do |val,idx|
    val * (16 ** idx)
  end
  result.reduce(:+)
end

p hexadecimal_to_integer('4D9f') == 19871
