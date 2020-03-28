=begin

# Problem:
Return a strind with all of the non-alphabetic characters
replaced by spaced.

# Requirements:
- string of lowercased words and non-alphabetic characters
- replace non-alphabetic characters by spaces
- never have consecutive spaces if on or more
  non-alphabetic characters occur in a row

# Input:
- string of lowercased words and non-alphabetic characters

# Output:
- string

# Examples:
cleanup("---what's my +*& line?") == ' what s my line '

# Data structures/Algorithm:
- iterate over each character in the string - each_char method?
- determine if a character is alphabetic - include?
- if non-alphabetic, replace with a space
- remove excess spaces

=end

ALPHABETIC_CHARACTERS = ('a'..'z').to_a

def cleanup(string)
  words = string.split('')
  words.map do |char|
    ALPHABETIC_CHARACTERS.each do
      char.replace(' ') if ALPHABETIC_CHARACTERS.include?(char) == false
    end
  end
  p words.join.squeeze(' ')
end

# replace method mutates original object

cleanup("---what's my +*& line?")
