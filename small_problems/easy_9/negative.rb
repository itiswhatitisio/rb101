def negative(num)
  if num < 0
    num
  else
    -num
  end
end

def negative1(num)
  -num.abs
end

p negative1(5) #== -5
p negative1(-3) #== -3
p negative1(0) #== 0      # There's no such thing as -0 in ruby