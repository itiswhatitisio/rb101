# Problem
# Write a method that takes a non-empty string argument, and returns the middle character or characters of the argument.
# If the argument has an odd length, you should return exactly one character. If the argument has an even length,
# you should return exactly two characters.
#
# Requirements
# Input: string
# Output: string
# - return middle character or characters
# - if argument has an odd length, return exactly one character
# - do spaces count as characters? -> yes
# - what happens when an empty string is returned?
#
# Test cases:
# center_of('I love ruby') == 'e'
# center_of('Launch School') == ' '
# center_of('Launch') == 'un'
# center_of('Launchschool') == 'hs'
# center_of('x') == 'x'

def center_of(str)
  middle_char = str.length/2
  if str.length.even?
    return str[middle_char - 1..middle_char]
  else
    return str[middle_char]
  end
end

p center_of('I love ruby')
p center_of('Launch School')
p center_of('Launchschool')

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'

p center_of('')