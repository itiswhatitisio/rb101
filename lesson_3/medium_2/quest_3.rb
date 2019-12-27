def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins" # my_string = "pumpkins", since indexed ass. doesn't mutate the object
my_array = ["pumpkins"] # my_array = ["pumpkins", "rutabaga"], shovel method mutates the object
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"