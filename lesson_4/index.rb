flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles Bea)

flintstones.each_with_index do |val, indx|
  if val.include?('Be')
    p indx
    break
  end
end

# Returns the index of the first object in ary such that the object is == to obj.

flintstones.index { |name| name[0, 2] == "Be" }
