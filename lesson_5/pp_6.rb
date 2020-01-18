=begin
# Problem: 
print out the name, age and gender of each family member

# Requirements:

Input: multi-dimensional hash, 2 levels

Output: string with interpolation

Test cases/Examples:
(Name) is a (age)-year-old (male or female).

# Algorithm/Data structure:
- access the first level of hash, print out key
- access the second level of hash, print out value of age and gender
- [key][key]

=end


munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |member, details|
    puts "#{member} is a #{details["age"]}-year-old #{details["gender"]}."
end

# Solution

munsters.each_pair do |name, details|
  puts "#{name} is a #{details['age']} year old #{details['gender']}"
end