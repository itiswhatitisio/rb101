# greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
# => Hello, John Q Doe! Nice to have a Master Plumber around.

# - not known how many names a person will have
# - method values -> does it give the values in the same order as in the hash or is it random?

def greetings(names, data)
  full_name = names.join(' ')
  profession = data.values
  puts "Hello, #{full_name}! Nice to have a #{profession} around."
end

def greetings1(names, data)
  full_name = names.join(' ')
  puts "Hello, #{full_name}! Nice to have a #{data[:title]} #{data[:occupation]} around."
end

greetings1(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })