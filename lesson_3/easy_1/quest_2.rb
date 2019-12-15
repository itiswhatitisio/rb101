=begin

Describe the difference between ! and ? in Ruby. And explain what would happen in the following scenarios:

what is != and where should you use it?
- != means not equal, should be used to compare different objetcs

put ! before something, like !user_name
- ! means negation, the return value would be the opposite (boolean) of 
an object

put ! after something, like words.uniq!
- ! after a method means that this method modifies the original object,
not Ruby syntax, part of the method name

put ? before something
- ? before something is used as a ternary operator with the followin syntax
test expression ? if true : if false

put ? after something
- ? after a method means that this method will return true or false, 
part of the method name, not the ruby syntax

put !! before something, like !!user_name
- !! double negation, returns the value (in boolean) of an object


=end
