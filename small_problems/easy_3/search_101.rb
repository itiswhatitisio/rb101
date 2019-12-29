positions = %w(1st 2nd 3rd 4th 5th last)

def prompt(number)
  puts "==> Enter the #{number} number:"
end

def get_numbers(positions_array)
  array_user_numbers = []
  positions_array.each do |pos|
    prompt(pos)
    user_input = gets.chomp.to_i
    array_user_numbers.push(user_input)
  end
  array_user_numbers
end

def search(array)
  last_number = array.pop
  if array.include?(last_number)
    puts "The number #{last_number} appears in #{array}."
  else
    puts "The number #{last_number} does not appear in #{array}."
  end
end

search(get_numbers(positions))
