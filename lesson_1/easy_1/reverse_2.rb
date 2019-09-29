=begin

# Problem

Input:
- string
- one argument

Output:
- string

# Requirements
- an outputted string must be in reversed order
- capitalization should be preserved
- each string with more than 5 letters should be reversed

# Examples/Test cases
reverse_words('Professional')          # => lanoisseforP
reverse_words('Walk around the block') # => Walk dnuora the kcolb
reverse_words('Launch School')         # => hcnuaL loohcS

# Data structure
- string

# Algorithm
- split the input string based on empty space
- reverse array
- if element.length > 5, reverse the word
- join the array into a string


# Another solution

def reverse_words(str)
  str.split.map { |w| w.size >= 5 ? w.reverse : w }.join(' ')
end

=end


def reverse_words(sentence)

  arr = sentence.split

  arr.each do |word|

    word.reverse! if word.length >= 5

  end

  puts arr.join(" ")

end


reverse_words('Professional')          # => lanoisseforP
reverse_words('Walk around the block') # => Walk dnuora the kcolb
reverse_words('Launch School')         # => hcnuaL loohcS















