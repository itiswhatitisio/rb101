# Create a hash that expresses the frequency with which each letter occurs in this string:
# 
# input: string
# output: hash
#
# Algorithm:
# - determine unique letters in the string
# - start with the first letter
# - loop over the entire string to check if the letter matches other letters
# - if there is a match, count how many times the match occurs
# Count method -> if an argument is given, counts the number of elements which equal obj using ==.
#
#
#
#

statement = "The Flintstones Rock"

splitted = statement.delete(' ').split('')

letters = {}

splitted.each do |el|
  letters[el] = splitted.count(el)
end

p letters
