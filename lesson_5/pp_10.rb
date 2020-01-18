=begin

Requirements:
- return new array
- same structure - hashes must be preserved
- increment value by one
- using map method (map method returns and array)

=end


arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]
new_arr = []

new_arr = arr.map do |hsh|
  hsh.each_with_object({}) do |(key, val), hsh1|
     hsh1[key] = val + 1
   end
end

p arr
p new_arr