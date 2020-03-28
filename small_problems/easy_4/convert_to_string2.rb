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
  string
end

def signed_integer_to_string(integer)
  if integer < 0
    "-#{integer_to_string(-integer)}"
  elsif integer > 0
    "+#{integer_to_string(integer)}"
  elsif integer == 0
    integer_to_string(integer)
  end
end
  

p signed_integer_to_string(4321) 
p signed_integer_to_string(-123)
p signed_integer_to_string(0)