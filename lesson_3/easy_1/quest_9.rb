flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, 
  "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

# Delete_if
# Deletes every key-value pair from hsh for which block evaluates to true.
# If no block is given, an enumerator is returned instead.

flintstones.delete_if { |key| key != "Barney" }

p flintstones.to_a.flatten

# Array#assoc
# Searches through the hash comparing obj with the key using ==. 
# Returns the key-value pair (two elements array) or nil if no match is found. 

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, 
  "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

p flintstones.assoc("Barney")
