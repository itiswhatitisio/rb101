=begin

# Problem

Input:
- one argument
- a string

Output:
- a string

# Requirements
- an outputted string must be in reversed order
- capitalization should be preserved
- empty input should return empty string

# Examples/Test cases
- eddge cases: two empty spaces?

puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'

# Data structure
- string

# Algorithm
- split the input string based on empty space
- reverse array
- join the array into a string

=end


def reverse_sentence(sentence)

  sentence.split(" ").reverse.join(" ")

end

puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'



