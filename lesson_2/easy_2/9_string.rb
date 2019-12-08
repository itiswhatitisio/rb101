name = 'Bob'
puts name
puts "Object id for name is #{name.object_id}"

save_name = name
puts save_name
puts "Object id for save_name is #{save_name.object_id}"

name = 'Alice'

puts name
puts "Object id for name is #{name.object_id}"

puts save_name
puts "Object id for save_name is #{save_name.object_id}"

=begin
  
First we have created a variable name which was referencing the object (String litreal)
'Bob' with the object id ...11560. We then created a variable save_name
and assigned it to the name variable. Now both variables were referencing
the same object, that is why the object id for save_name is also ...11560.
Save_name is an alias for name in this case.

We then reassigned the variable name to a new object 'Alice' and now
the variable name is pointing to the object ...10720. 
Reassignment doesn't mutate the original object.
Save_name is still pointing the 'Bob' object.
  
=end

name = 'Bob'
puts name
puts "Object id for name is #{name.object_id}"

save_name = name
puts save_name
puts "Object id for save_name is #{save_name.object_id}"

name.upcase!

puts name
puts "Object id for name is #{name.object_id}"

puts save_name
puts "Object id for save_name is #{save_name.object_id}"

=begin

First we created a variable name which was referencing the object (String litreal)
'Bob' with the object id ...7820. We then created a variable save_name
and assigned it to the name variable. Now both variables were referencing
the same object, that is why the object id for save_name is also ...7820.
Save_name is an alias for name in this case.

We then applied a mutating method .upcase! to the name variable. The method
mutated the original object. Since both variables point to the same object
which was changed by the method, both name and save_name will print out 'BOB'

=end