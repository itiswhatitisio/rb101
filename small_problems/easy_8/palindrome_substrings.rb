# Problem
# return a list of all substrings of a string that are palindromic
#
# Requirements
# - Input: string
# - Output: array of strings
# - Palindromic: each substring must consist of the same sequence of characters forwards as
# it does backwards
# - Consider all characters, case matters
# - use all_subrstings method
#
# Test cases
# palindromes('abcd') == []
# palindromes('madam') == ['madam', 'ada']
# palindromes('hello-madam-did-madam-goodbye') == [
#     'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
#     'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
#     '-madam-', 'madam', 'ada', 'oo'
# ]
# palindromes('knitting cassettes') == [
#     'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
# ]

def substrings_at_start(string)
  arr = []
  for i in 0..string.length - 1
    arr << string[0..i]
  end
  arr
end

def substrings(string)
  arr = []
  for i in 0..string.length - 1
    arr.concat(substrings_at_start(string[i..- 1]))
  end
  arr
end

def palindromes(string)
  substrings(string).select do |str|
  str == str.reverse && str.length > 1
  end
end

p palindromes('hello')

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
    'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
    'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
    '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
    'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]
