i = 1

while i <= 99 do
  puts i
  i+=2
end

# using upto method

1.upto(99) { |num| puts num if num.odd? }

# using Array.select method

(1..99).select { |num| puts num if num.odd? }
