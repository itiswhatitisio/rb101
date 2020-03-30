=begin

# Problem

# Requirements:
- output the string with the first letters capitalized
- return new string
- words -> any sequence of non-blank characters

# Input:
- single string argument

# Output:
- string

# Examples:
word_cap('four score and seven') == 'Four Score And Seven'
word_cap('the javaScript language') == 'The Javascript Language'
word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

# Data structure/Algorithm:
- string
- array
- split a string into an array - split
- iterate over each element and apply capitalize method
- join the elements using join method

=end

def word_cap(string)
  result = string.split(' ').map { |word| word.capitalize }
  result.join(' ')
end

word_cap('four score and seven') == 'Four Score And Seven'
word_cap('the javaScript language') == 'The Javascript Language'
word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

# LS - solution

def word_cap(words)
  words.split.map(&:capitalize).join(' ')
end

# Further exploration - without the capitalize method

capital_letters = ('A'..'Z').to_a
lowercase_letters = ('a'..'z').to_a

def letters(capital, lowercase)
  all_letters = {}
  capital.each_with_index do |ch, i|
    lowercase.each_with_index do |char, idx|
      all_letters[ch] = char if i == idx
    end
  end
  all_letters
end

all_letters = letters(capital_letters, lowercase_letters)

def capitalize_words(string, letters_hash)
  all_letters = letters_hash
  result = string.split(' ').each do |word|
    word.each_char do |ch|
      all_letters.each_pair do |key, val|
        word[0] = key if word.chr == val
        if ch == key
          idx = word.index(ch)
          word[idx] = val
        end
      end
    end
  end
  result.join(' ')
end

p capitalize_words('four score and seven', all_letters) == 'Four Score And Seven'
p capitalize_words('the javaScript language', all_letters) == 'The Javascript Language'
p capitalize_words('this is a "quoted" word', all_letters) == 'This Is A "quoted" Word'
