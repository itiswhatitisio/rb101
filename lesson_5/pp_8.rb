=begin
# Problem:
Output all vowels in strings

# Requirements:

Input: nested hash with arrays

Output: string

Test cases/Examples:
e
u
i

# Algorithm/Data structure:
- initialize array with vowels
- iterate over the hash key
- iterate over the hash value
- iterate over each element in the array (hash value)
- iterate over each character in the string in the array
  - split string into array to be able to iterate over
    idividual characters in the string
- check if each character matches vowels array
- if there is a match, return the character

=end

hsh = { first: ['the', 'quick'], second: ['brown', 'fox'],
        third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog'] }

vowels = %w(a e u i o y)

p vowels

hsh.each do |_, arr|
  arr.each do |el|
    el.split('').each do |char|
      vowels.each do |vowel|
        puts char if char == vowel
      end
    end
  end
end

# Instead of split method, possible to use String#chars method
# At this point String#chars can be called within the block
# to return an array of characters for that string in that iteration
