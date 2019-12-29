ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

array = ages.each_with_object([]) do |(key, value), arr|
  arr << value
end

p array.reduce(:+)

# Other solutions
# total_ages = 0
# ages.each { |_,age| total_ages += age }
# total_ages # => 6174
#
#
# ages.values.inject(:+) # => 6174
