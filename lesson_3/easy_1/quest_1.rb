numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers

=begin

The output will be array [1,2,2,3], since uniq is not mutating the original array.
uniq! instead mutates the original array

=end

numbers = [1, 2, 2, 3]
numbers.uniq!

puts numbers