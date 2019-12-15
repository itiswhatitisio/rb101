# Returns true if obj is an element of the range, false otherwise. 
# Conveniently, === is the comparison operator used by case statements.

puts (10..100) === 42

# Returns true if obj is between the begin and end of the range.
# This tests begin <= obj <= end when exclude_end? is false and 
# begin <= obj < end when exclude_end? is true.

puts (10..100).cover?(42)