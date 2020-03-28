=begin

# Problem:
Write a method that takes a string with one or more space separated 
words and returns a hash that shows the number of words of 
different sizes.


# Requirements:
 - Words - any string of characters that do not include a space.

# Input:
- string

# Output:
- hash

# Examples:
word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
word_sizes('') == {}

# Data structures/Algorithm:
- array
- hash
- split the string in an array
- iterate over array and calculate the number of characters
- check if this size is present in hash
- if it is present, add another number
- if it is not present, create a new key

=end

def word_sizes(string)
  result = {}
  words = string.split(' ')
  words.each do |word|
    if result.key?(word.size)
      result[word.size] += 1
    else
      result[word.size] = 1
    end
  end
  result
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}

# Alternative solution

def word_sizes1(string)
  result = Hash.new(0)
  string.split(' ').each do |word|
    result[word.size] += 1
  end
  p result
end

p word_sizes1('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes1('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes1("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes1('') == {}