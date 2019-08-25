
puts "Please enter the name: "
answer = gets.chomp
answer = 'Teddy' if answer.empty?

def print_age(name)
  puts "#{name} is #{rand(20..200)} years old!"
end

print_age(answer)
