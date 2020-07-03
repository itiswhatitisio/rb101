def substrings_at_start(string)
  arr = []
  for i in 0..string.length - 1
    arr << string[0..i]
  end
  arr
end

p substrings_at_start('abc') == ['a', 'ab', 'abc']
p substrings_at_start('a') == ['a']
p substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']