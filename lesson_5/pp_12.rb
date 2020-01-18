=begin
# Problem: 
return a hash where the key is the first 
item in each sub array and the value is the second item.

# Requirements:

Input:
- multidimensional array

Output:
- hash

# Example:
# expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, 
{:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

# Data structure/Algo:
- iterate and transform the first array using each_with_object
  as it returns the initially given object
- iterate over each element in the array
- access the first element and assign it as a key
- access the second element and assign it as a value

=end

arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], 
[{a: 1, b: 2, c: 3, d: 4}, 'D']]

result = arr.each_with_object({}) do |el, hsh|
  hsh[el[0]] = el[1]
end

p result


