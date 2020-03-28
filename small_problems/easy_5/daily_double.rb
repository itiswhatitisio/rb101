=begin

# Problem:
Write a method that takes a string argument and returns a 
new string that contains the value of the original string with 
all consecutive duplicate characters collapsed into a single character. 
You may not use String#squeeze or String#squeeze!.

# Requirements:
- all duplicate characters are collapsed into one character
- may not use String#squeeze method

# Input:
- string

# Output:
- string

# Examples:
crunch('ddaaiillyy ddoouubbllee') == 'daily double'
crunch('4444abcabccba') == '4abcabcba'
crunch('ggggggggggggggg') == 'g'
crunch('a') == 'a'
crunch('') == ''

# Data structures/Algorithm:
- array
- iterate over each character
- if the last one is the same as the previous, skip the iteration

=end

def crunch(string)
  splitted = string.split('')
  new_string_arr = []
  splitted.each do |el|
    new_string_arr << el unless new_string_arr.last == el
  end
  new_string_arr.join 
end

crunch('ddaaiillyy ddoouubbllee') == 'daily double'
crunch('4444abcabccba') == '4abcabcba'
crunch('ggggggggggggggg') == 'g'
crunch('a') == 'a'
crunch('') == ''

# Further exploration - regex

def crunch_regex(string)
  string.gsub!(/(.)\1+/, '\1') # 
end

p crunch('ddaaiillyy ddoouubbllee')
p crunch('4444abcabccba')
p crunch('ggggggggggggggg')
p crunch('a')
p crunch('')