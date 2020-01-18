=begin
# Problem: 
return a hash where the key is the first 
item in each sub array and the value is the second item.
Input:
- multidimensional array

Output:
- array

# Requirements:
- sorted array
- take into account only odd numbers

# Example:
# return [[1, 8, 3], [1, 6, 7], [1, 4, 9]]

# Data structure/Algo:
- select only odd numbers
    
p result

=end

arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

sorted = arr.sort_by do |el|
  el.select do |num|
    num.odd?
  end
end

p sorted

=begin
i = 0

loop do
  curr_arr = arr[i]
  counter = 0
  loop do 
    curr_val = arr[i][counter]
    if curr_val.odd?
      x = i + 1
      loop do
        p arr[x]
        break if x == arr.size
        x += 1
      end
    end
    counter += 1
    break if counter == arr[i].size
  end
  i += 1
  break if i == arr.size
end
=end


