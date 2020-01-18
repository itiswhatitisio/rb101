=begin

# Problem:
return an array containing the colors of the fruits 
and the sizes of the vegetables

Input: hash

Output: array

# Requirements
- sizes should be uppercase 
- the colors should be capitalized.

# Examples:
[["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]

# Data structure/Algorithm
- iterate over hash
- select colors
- select size

=end

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

result = hsh.map do |key, val| 
  val.select do |el|
    p el.to_s == "colors"
  end
      
end

