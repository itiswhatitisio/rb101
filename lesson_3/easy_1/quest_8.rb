flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]

p flintstones

p flintstones.flatten
p flintstones.flatten!

# Returns a new array that is a one-dimensional flattening of self (recursively).
# That is, for every element that is an array, extract its elements into the new array.
# The optional level argument determines the level of recursion to flatten.

