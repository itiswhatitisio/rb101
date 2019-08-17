=begin
  
# Poblem
- Input
  - string
-Output 
  - array
- Requirements
  - one argument
  - array represents the number of characters in each word in the sentense
  - index of each value in an array represents the position of a word in the sentense
 
# Test cases

 sentence("To be or not to be") => [2,2,2,3,2,2]
 sentence("hello world") => [5,5]

# Data structures

- String
- Array

# Algorithm

- Split the string based on the space
- This returns an array of words
- Iterate over each word and determine the length of each word

=end

def string_lengths(sentence)
  strings = sentence.split
  lengths = []
  counter = 1

  until counter == strings.size do
    word_length = strings[counter - 1].length
    lengths.push(word_length)
    counter += 1
  end

  lengths
end

p string_lengths("to be or not to be")
p string_lengths("hello world")