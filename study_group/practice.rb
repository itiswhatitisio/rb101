# Write a function that will return the count of distinct case-insensitive
# alphabetic characters and numeric digits that occur more than once in the
# input string. The input string can be assumed to contain only alphabets
# (both uppercase and lowercase) and numeric digits.

# Input: string
# Output: integer
# Test cases: provided
# Data structure/Algorithm
# - convert string to an array
# - initialize an array to store result
# - iterate over the original array
# - if the element matches any other element in an array, 
#   add it to the new array
# - count the length of the array

def duplicate_count(string)
  result = []
  splitted = string.split('')
  i = 0
  counter = 0
    if splitted.size > 0
    loop do
    current_var = splitted[i]
    splitted.each_with_index do |el, idx|
      if current_var.downcase == el.downcase && (i > idx || i != idx)
        result.push(el.downcase)
        break
      end
    end
    i += 1
    counter += 1
    break if counter == splitted.size
  end
else
end
  result.uniq.size
end

p duplicate_count("") == 0
p duplicate_count("abcde") == 0
p duplicate_count("abcdeaa") == 1
p duplicate_count("abcdeaB") == 2
p duplicate_count("Indivisibilities") == 2

# Given the string of chars a..z A..Z do as in the sample cases

p accum("abcd")    # "A-Bb-Ccc-Dddd"
p accum("RqaEzty") # "R-Qq-Aaa-Eeee-Zzzzz-Tttttt-Yyyyyyy"
p accum("cwAt")    # "C-Ww-Aaa-Tttt"
