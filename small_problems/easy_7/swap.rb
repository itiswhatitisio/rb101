=begin

# Problem

# Requirements:
- may not use String#swapcase method
- every uppercase letter is replaced by its lowercase version
- every lowercase letter by its uppercase version
- All other characters should be unchanged

# Input:
- string

# Output:
- new string

# Examples:
swapcase('CamelCase') == 'cAMELcASE'
swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

# Data structure/Algorithm:
- string
- hash to store capitals and lowecase letters

=end

def letters(capital, lowercase)
  all_letters = {}
  capital.each_with_index do |ch, i|
    lowercase.each_with_index do |char, idx|
      all_letters[ch] = char if i == idx
    end
  end
  all_letters
end

capital_letters = ('A'..'Z').to_a
lowercase_letters = ('a'..'z').to_a

all_letters = letters(capital_letters, lowercase_letters)

def swap_case(string, letters_hash)
  all_letters = letters_hash
  result = string.split(' ').each do |word|
    word.each_char.with_index do |ch, idx|
      all_letters.each_pair do |key, val|
        word[idx] = val if ch == key
        word[idx] = key if ch == val
      end
    end
  end
  result.join(' ')
end
p swap_case('CamelCase', all_letters) == 'cAMELcASE'
p swap_case('Tonight on XYZ-TV', all_letters) == 'tONIGHT ON xyz-tv'

# LS solution

def swapcase(string)
  characters = string.chars.map do |char|
    if char =~ /[a-z]/
      char.upcase
    elsif char =~ /[A-Z]/
      char.downcase
    else
      char
    end
  end
  characters.join
end