# Problem
# =========
#
# Input: integer
#
# Output: integer
#
# Examples/Test cases: provided
#
# Requirements:
# ===============
#
# Explicit requirements:
# - search all multiples of 3 and 5 up to an n number
# - compute the sum of all the multiples
#
# Implicit requirements:
# - multiple of 3 and 5 -> n % 3 == 0 || n % 5 == 0
#
# Data stucture/Algorithm:
# ==========================
# - get the integer n v
# - initialize array for all integers up to a number n v
# - inititalize array for the multiples v
# - output a range of integers up to a number n and save it to an array v
# - iterate over each value in an array v
# - determine if a number in an array is multiple of 3 or 5 v
# - save this value in a different arrayv v
# - calculate the sum of the values in the multiples array using reduce method

def find_multiples(integer)
  arr = (1..integer).to_a
  multiples = []

  arr.each do |val|
    if (val % 3).zero? || (val % 5).zero?
      multiples.push(val) # mutates original array
    end
  end
  multiples
end

def multisum(integer)
  array_multiples = find_multiples(integer)
  array_multiples.reduce(:+)
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234_168
