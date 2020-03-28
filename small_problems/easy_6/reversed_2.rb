def reversing_array(array)
  reversed_array = []
  i = -1
  while i > -(array.length + 1)
    reversed_array << array[i]
    i -= 1
  end
  reversed_array
end

reversing_array([1, 2, 3, 4]) == [4, 3, 2, 1]    # => true
reversing_array(%w(a b e d c)) == %w(c d e b a)  # => true
reversing_array(['abc']) == ['abc']              # => true
reversing_array([]) == []                        # => true

list = [1, 3, 2]                        # => [1, 3, 2]
new_list = reversing_array(list)        # => [2, 3, 1]
list.object_id != new_list.object_id  # => true
list == [1, 3, 2]                     # => true
new_list == [2, 3, 1]                 # => true

# LS solution

def reverse(array)
  result_array = []
  array.reverse_each { |el| result_array << element }
  result_array
end

# Further exploration - inject/each_with_object

def reverse1(array)
  array.each_with_object([]) { |i, arr| arr.unshift(i) }
end

reverse1([1, 2, 3, 4]) == [4, 3, 2, 1]    # => true
reverse1(%w(a b e d c)) == %w(c d e b a)  # => true
reverse1(['abc']) == ['abc']              # => true
reverse1([]) == []                        # => true

def reverse2(array)
  array.reduce([], :unshift)
end

p reverse2([1, 2, 3, 4]) == [4, 3, 2, 1]    # => true
p reverse2(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse2(['abc']) == ['abc']              # => true
p reverse2([]) == []                        # => true