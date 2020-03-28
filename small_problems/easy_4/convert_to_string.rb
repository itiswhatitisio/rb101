=begin
Input: integer
Output: string
Test cases:provided
Requirements:
- convert an integer to a string representation
Data structure/Algorithm:
- create a hash to store string representation of integers
- initialize a string which will store the final output
- iterate over each digit in the provided integer
  - create a loop to iterate over each digit
  - iterate over hash with digits
  - compare each number from the string with the current hash key
  - if there is a match, add to the result string

=end

DIGITS = {
  0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4',
  5 => '5', 6 => '6', 7 => '7', 8 => '8', 9 => '9'
}

def integer_to_string(integer)
  result = []
  string = ''
  loop do
    num = (integer % 10)
    integer /= 10
    result.push(num)
    break if integer == 0
  end

  result.reverse.each do |el|
    DIGITS.each do |key, val|
    if el == key
      string << val
    end
  end
  end
p string
end


integer_to_string(4321)
integer_to_string(0)
integer_to_string(5000)