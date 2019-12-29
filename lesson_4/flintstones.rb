flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

obj = {}
flintstones.each_with_index do |elem, indx|
    obj[elem] = indx
end

p obj