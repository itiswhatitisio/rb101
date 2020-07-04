# input: integer
# - even number of digits
# - left-side digits are exactly the same as its right-side digits
# - e.g. 44, 3333, 103103
# - double numbers should be returned as-is
#
# Test cases:
# twice(37) == 74
# twice(44) == 44
# twice(334433) == 668866
# twice(444) == 888
# twice(107) == 214
# twice(103103) == 103103
# twice(3333) == 3333
# twice(7676) == 7676
# twice(123_456_789_123_456_789) == 123_456_789_123_456_789
# twice(5) == 10
#

def twice(num)
  num_string = num.to_s
  if num_string.length.even?
    middle_char = num_string.length/2
    first_half = num_string[0..middle_char-1]
    second_half = num_string[middle_char..num_string.length]
    if first_half == second_half
      return num
    end
  end
  num * 2
end

p twice(3333)
p twice(37)

p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10