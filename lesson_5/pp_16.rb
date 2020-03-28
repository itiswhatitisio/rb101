=begin

# Problem:
define method to generate UUID

Input: n/a

Output: string

# Requirements
- consists of 32 hexadecimal characters
- broken into sections 8-4-4-4-12

# Examples:
f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91

# Data structure/Algorithm
- nested array
- in a random way select either number or a letter 8 times
- push it to the first sub array

=end

def generate_uuid
  characters = %w(0 1 2 3 4 5 6 7 8 9 a b c d e f)
  arr = [8, 4, 4, 4, 12]
  uuid = ''

  arr.each_with_index do |el, idx|
    el.times { uuid += characters.sample }
    uuid += '-' unless idx >= arr.size - 1
  end
  uuid

end

p generate_uuid
