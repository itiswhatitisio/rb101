=begin
animal = 'dog'

loop do |var|
  animal = 'cat'
  var = 'ball'
  break
end

puts animal
puts var

animal = 'dog'

loop do |animal|
  animal = 'cat'
  break
end

puts animal

def test
  puts 'written assignment'
end

var = test

if var
  puts 'written assignment'
else
  puts 'interview'
end

#num = 1

n = 1

[2,3].each { |num| n = 5 }

puts n

dog = 'Max'

def met
  cat = 'Spike'
  puts dog
end

met

p dog
=end

=begin
animal = 'dog'

loop do |var|
  animal = 'dog'
  var = 'ball'
  break
end

puts animal
puts var

animal = 'dog'

loop do |animal|
  animal = 'cat'
  break
end

puts animal

def test
  puts 'written assignment'
end

var = test

if var
  puts 'written assignment'
else
  puts 'interview'
end

#num = 1

n = 1

[2,3].each { |num| n = 5 }

puts n

dog = 'Max'

def met
  cat = 'Spike'
  puts dog
end

met

p dog

#Variable shadowing
current = "2012"
1.upto(10) do |current|
  p current * current
end

p current

current = "2012"
1.upto(10) do |var|
  p current = var * var
end

p current

# Since we already have a local variable named x, 
# there is no way to access some other variable, also called x, 
# that is outside the local scope
x = 42
3.times { |x| puts "Local x is #{x} and outer x is #{x}" }

i = 5
el = 'hello'

loop do |el|
  p el
  last_name = 'Smith'
  i -= 1
  break if i == 0
end

# puts last_name # throw a NameErro, since the variable last_name
# is initialized within a block. Variables initialized within a block
# are local to the scope of the block and cannot be accessed in the
# outer scope

counter = 5
while counter > 0
  first_name = 'John'
  counter -= 1
end

puts first_name 

# While doesn't create a new variable scope. Variable first_name is
# initialized within the while statement and can be accessed outside
# of this statement

=end

# NameError. This is method definition. Variables defined within
# method definion are local to this method and not accessible
# to the outer scope

def blah()
  my_var = "my_var has been defined"
end

# puts my_var
# This code raises an error because the scope of my_var is local to 
# the blah() method. In other words, the my_var variable can be used 
# within the blah() method, but it cannot be used anywhere outside of 
# the method.

# The variable lyric is initialized within the cray method
# When calling the cray method, the variable is initialized
# and the puts method prints value of the lyrics variable
# Nil is not printed, sinse this is the return value of the method cray
# Nil can only be printed if we puts cray() method

def cray()
  lyric = "Stuff is cray cray"
  puts lyric
end

cray() 
# The lyric variable is defined in the cray() method and 
# puts() can access the variable within the cray() method.






