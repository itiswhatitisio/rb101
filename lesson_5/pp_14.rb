=begin

# Problem:
return an array containing the colors of the fruits 
and the sizes of the vegetables

Input: hash

Output: array

# Requirements
- sizes -> vegetables: should be uppercase 
- the colors -> fruit: should be capitalized.

# Examples:
[["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]

# Data structure/Algorithm
- iterate over hash
- if type == vegetable, then select size, return the value
- if type == fruit, then select colors, return value

=end

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

# p hsh['grape'][:colors]

result = hsh.map do |key, val| 
  if val[:type] == 'vegetable'
    val[:size].upcase
  elsif val[:type] == 'fruit'
    val[:colors].map do |fruit|
      fruit.capitalize
    end
  end
end

p result

