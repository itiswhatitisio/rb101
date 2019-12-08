array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2

=begin
  
Here we have created an array1 with values Moe, Larry... and an empty array2.
We then iterate over array1, we then appending value variable to array 2.
Value variable is pointing to the array1 values, as we are iterating
over array1 and grabbing its values.
We then mutate values of array1 with method upcase!. Since array2 contains
values which point to the values of array1, and we have mutated those
original values from array1, the array2 will also display mutated values 
and print: Moe, Larry, CURLY, SHEMP, Harpo, CHICO, Groucho, Zeppo
  
=end