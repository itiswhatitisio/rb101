=begin
Problem

Requirements:
- if the array contains two elements, add or
- if the array contains three elements, add comma and or
- if the array contains >= 3 elements and separator, add separator
- if the array contains >= 3 elements, separator and keyword
  add separator between each element and the keyword before the last el

Input:
- array

Output:
- String

Examples:
joinor([1, 2])                   # => "1 or 2" V
joinor([1, 2, 3])                # => "1, 2, or 3"
joinor([1, 2, 3], '; ')          # => "1; 2; or 3"
joinor([1, 2, 3], ', ', 'and')   # => "1, 2, and 3"

Data structure/Algorithm
- array
- identify the last element and add the separator

- iterate over each element in the array, add the comma after
  the first and the second element, add the 'or' before the
  last element in the array

=end

def joinor(arr, separator = ', ', kw = 'or')
  case arr.size
  when 0 then ''
  when 1 then arr.first
  when 2 then arr.insert(arr.index(arr.last), 'or').join(' ')
  else
    arr1 = []
    arr.each_with_index do |el, i|
      arr1 << el.to_s + "#{separator}" if i != arr.length - 1
      arr1 << "#{kw} " + el.to_s if i == arr.length - 1
    end
    arr1.join
  end
end

p joinor([1, 2])
p joinor([1, 2, 3])
p joinor([1, 2, 3], '; ')
p joinor([1, 2, 3], '; ', 'and')
