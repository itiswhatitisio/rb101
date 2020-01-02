# Problem
#
# Input: two strings
#
# Output: one string
#
# Requirements:
# - empty string should be ignored
# - concatenate short string, long string, and then short string
#
# Data structures / Algorithm
# - compare two strings by size
# - save the shortest string
# - save the longest string
# - concatenate strings
#
#
#

def short_long_short(string1, string2)
  if string1.size > string2.size
    long_string = string1
    short_string = string2
  else
    long_string = string2
    short_string = string1
  end

  short_string + long_string + short_string

end

# Alternative solution
# def short_long_short(str1, str2)
#  return "#{str2}#{str1}#{str2}" if str1.size > str2.size
# "#{str1}#{str2}#{str1}"
# end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"