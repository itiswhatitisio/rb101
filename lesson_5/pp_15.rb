=begin

# Problem:
return an array which contains only the hashes 
where all the integers are even

Input: array with hashes

Output: array

# Requirements
- hashes should contain only even numbers

# Examples:
arr = [{e: [8], f: [6, 10]}]

# Data structure/Algorithm
- since the returned value should be array, 
  need to use select method

=end

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], 
        c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

result = arr.select do |hsh|
  hsh.all? do |key, val|
    val.all? do |num|
      num.even?
    end
  end
end
    
p result
