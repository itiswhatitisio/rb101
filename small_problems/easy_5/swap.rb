=begin

# Problem:
Write a method that takes this string of words and 
returns a string in which the first and last letters of 
every word are swapped.

# Requirements
- every word contains at least one letter
- the string will always contain at least one word
- each string contains nothing but words and spaces

# Input 
- string

# Output
- string

# Examples
swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
swap('Abcde') == 'ebcdA'
swap('a') == 'a'

# Data structure/Algorithm
- string
- split the sentence into an array
- iterate over each string in the new array
- identify the first and the last letter of each string
- save the first letter in a separate variable
- save the last letter in a separate variable
- replace the last letter with the first letter
- replace the first letter with the last letter
- join the string

=end

def swap(string)
  result = string.split.map do |el| 
    first_char = el.slice(0, 1)
    last_char = el.slice(-1, 1)
    el[0] = last_char
    el[-1] = first_char
    el
  end
  p result.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'

# LS Solution

def swap_first_last_characters(word)
  word[0], word[-1] = word[-1], word[0]
  word
end

# When Ruby sees something like this a = b, 
# it effectively creates a temporary array with the values 
# from the right side ([b, a]), and then assigns each element 
# from that array into the corresponding named variable

def swap(words)
  result = words.split.map do |word|
    swap_first_last_characters(word)
  end
  result.join(' ')
end

