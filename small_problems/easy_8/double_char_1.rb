# Problem
# Write a method that takes a string, and returns a new string in which every character is doubled.
#
# Requirements:
# - Input: string
# - Output: string
#
# Test cases:
# repeater('Hello') == "HHeelllloo"
# repeater("Good job!") == "GGoooodd  jjoobb!!"
# repeater('') == ''
#
# Algorithm/Data structures:
# - iterate through string
#   - turn string into array
#   - iterate through each el in the arr
# - duplicate each character with a loop
# - add each duplicated element to the new arr

def repeater(string)
  result = []
  string.split('').each do |char|
    i = 0
    loop do
      result << char
      i += 1
      break if i == 2
    end
  end
  result.join
end

# LS solution

def repeater_ls(string)
  result = ''
  string.each_char do |char|
    result << char << char
  end
  result
end

p repeater_ls('Hello') == "HHeelllloo"
p repeater_ls("Good job!") == "GGoooodd  jjoobb!!"
p repeater_ls('') == ''