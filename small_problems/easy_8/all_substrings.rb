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

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde', 
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]