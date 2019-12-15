# see if "Spot" is present.
# What are two other hash methods that would work just as well for this solution?

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

p ages.has_key?("Spot")

p ages.include?("Spot")

p ages.key?("Spot")

p ages.member?("Spot")