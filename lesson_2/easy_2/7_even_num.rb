# using upto method

1.upto(99) { |num| puts num if num.even? }

# using Array.select method

(1..99).select { |num| puts num if num.even? }
