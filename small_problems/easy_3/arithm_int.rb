positions = %w(first second)
operators = %i[+ - * / % **]

def prompt(pos)
  puts "==> Enter the #{pos} number:"
end

def get_numbers(positions_array)
  numbers_array = []
  positions_array.each do |pos|
    prompt(pos)
    user_input = gets.chomp.to_f
    numbers_array.push(user_input)
  end
  numbers_array
end

# addition, subtraction, product, quotient, remainder, and power.

def perform_operations(numbers_array, operators_array)
  operators_array.each do |operator|
    puts "#{numbers_array[0]} #{operator} #{numbers_array[1]} = #{numbers_array.reduce(operator)}"
  end
end

perform_operations(get_numbers(positions), operators)
