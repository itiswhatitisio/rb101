flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.append("Dino", "Hoppy")

flintstones.insert(6, "Dino", "Hoppy")

flintstones.push("Dino").push("Hoppy") # chaining

flintstones.concat(%w(Dino Hoppy)) # concat adds an array rather than one item