=begin

# Problem:

# Requirements:
- reverse each element in an array
- may not use reverse or reverse! methods
- mutate the original object -> return the same array

# Input:
- array

# Output:
- array

# Examples:
list = [1,2,3,4]
result = reverse!(list)
result == [4, 3, 2, 1]
list == [4, 3, 2, 1]
list.object_id == result.object_id

list = %w(a b e d c)
reverse!(list) == ["c", "d", "e", "b", "a"]
list == ["c", "d", "e", "b", "a"]

list = ['abc']
reverse!(list) == ["abc"]
list == ["abc"]

list = []
reverse!(list) == []
list == []

# Data structure/Algorithm:
- array
- save the first element of the array, to be used later as a reference
  to check if the reversion is done

=end

def reverse!(array)
  i = 0
  x = -1
  while i < array.length / 2
    array[i], array[x] = array[x], array[i] # parallel assignment
    i += 1
    x -= 1
  end
  array
end

list = [1,2,3,4]
p result = reverse!(list)
result == [4, 3, 2, 1]
list == [4, 3, 2, 1]
p list.object_id == result.object_id

list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"]
p list == ["c", "d", "e", "b", "a"]

list = ['abc']
p reverse!(list) == ["abc"]
p list == ["abc"]

list = []
p reverse!(list) == []
p list == []
