=begin

# Problem:
Take an Array of Integers between 0 and 19,
and return an Array of those Integers sorted based on the English
words for each number:
zero, one, two, three, four,
five, six, seven, eight, nine,
ten, eleven, twelve, thirteen, fourteen,
fifteen, sixteen, seventeen, eighteen, nineteen

# Requirements:
- sort in ascending order

# Input:
- array of integers

# Output:
- array of integers

# Example:
alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]

# Data structures/Algorithm:
- create a hash where each number corresponds related word
  - create an array of words
  - create an array of numbers
  - iterate over each array, if the number matches
    the word position in an array, add the word and number to a hash

=end

def alphabetic_number_sort(array)
  words_numbers = {}
  words = %w(zero one two three four five six seven eight nine ten
             eleven twelve thirteen fourteen fifteen sixteen seventeen
             eighteen nineteen)
  numbers = array
  words.each_with_index do |word, idx|
    numbers.each do |number|
      words_numbers[word] = number if number == idx
    end
  end
  result = {}
  array.each do |el|
    words_numbers.each_pair do |key, val|
      result[key] = val if words_numbers.value?(el)
    end
  end
  result_sorted = result.sort.to_h
  result_sorted.values
end

p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]


# LS solution

  WORDS = %w(zero one two three four five six seven eight nine ten
             eleven twelve thirteen fourteen fifteen sixteen seventeen
             eighteen nineteen)

def alphabetic_number_sort1(array)
  array.sort_by { |num| WORDS[num] }
end

p alphabetic_number_sort1((0..19).to_a) 