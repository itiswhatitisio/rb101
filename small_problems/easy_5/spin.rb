=begin

# Problem:
You are given a method named spin_me that 
takes a string as an argument and returns a 
string that contains the same words, 
but with each word's characters reversed. 
Given the method's implementation, 
will the returned string be the same object as the one passed 
in as an argument or a different object?

- It will be the same object, as we are using
a destructive method reverse! which changes
the original object

=end

def spin_me(str)
  p str.object_id
  result = str.split.each do |word|
    word.reverse!
  end.join(" ")
  p result
  p result.object_id
end

spin_me("hello world") # "olleh dlrow"