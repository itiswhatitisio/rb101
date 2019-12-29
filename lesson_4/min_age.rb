ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

# extract all the ages
# sort
# pick the lowest age
# identify the pair with the lowest age

# values - Returns a new array populated with the values from hsh.

p ages.values.sort[0]

# Alternative solution

p ages.values.min


