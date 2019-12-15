# delete_at method deletes a value at an index passed as an argument
# returns the deleted value
# original object is modified

numbers = [1, 2, 3, 4, 5]
puts numbers.object_id
numbers.delete_at(1) 
numbers
puts numbers
puts numbers.object_id

# delete method deletes a specific value passed as an argument
# returns the deleted value
# original object is modified

numbers = [1, 2, 3, 4, 5]
puts numbers.object_id
numbers.delete(1)
numbers
puts numbers
puts numbers.object_id