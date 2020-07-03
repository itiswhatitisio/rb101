def reversed_number(num)
  result = ''
  string = num.to_s
  i = -1
  loop do
    result << string[i]
    i -= 1
    break if i < -string.length
  end
  result.to_i
end


p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # No leading zeros in return value!
p reversed_number(12003) == 30021
p reversed_number(1) == 1