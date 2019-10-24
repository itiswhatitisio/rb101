puts "What is your name?"
user_name = gets.chomp

if user_name.include? "!"
  puts "HELLO #{user_name.upcase.chop}. WHY ARE YOU SCREAMING?"
else
  puts "Hello #{user_name}"
end
