=begin

# Problem

Input:
- array of strings

Output:
- string: integer

# Requirements
- each element and numner of occurences in the list
- words are case-sensitive 'suv' != 'SUV'

# Examples/Test cases
- input
  - empty (nil,"",[])
  - edge cases
  - lower/uppercase
- failures

# Data structure
- array
- output as hash

# Algorithm
- create an empty hash
- iterate through an array
- add array element as a key to hash
- identify the same strings in the array
- increase the count of each string (value) for each key

# Solution Launch School

def count_occurrences(array)
  occurrences = {}

  array.each do |element|
    occurrences[element] = array.count(element)
  end

  occurrences.each do |element, count|
    puts "#{element} => #{count}"
  end
end

=end

def count_occurrences(array)

  occurences = {}

  array.each do |vehicle| 

    count = 0

    element = vehicle.downcase

    if occurences[element] == nil

      array.each do |veh|

      if element == veh.downcase

        count += 1

        occurences[vehicle] = count

      end

    end

  end

end

occurences.each {|k, v| puts "#{k} => #{v}" }

end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

vehicles_uppercases = [
  'car', 'car', 'truck', 'CAR', 'SUV', 'truck',
  'motorcycle', 'MOTOrcycle', 'car', 'TruCK'
]

# count_occurrences(vehicles)
count_occurrences(vehicles_uppercases)

