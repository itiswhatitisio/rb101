def fizzbuzz(num1, num2)
  i = num1
  loop do
    if i % 3 == 0 && i % 5 == 0
      puts 'FizzBuzz' 
    elsif i % 5 == 0
      puts 'Buzz'
    elsif i % 3 == 0
      puts 'Fizz'
    else
      puts i
    end
    i += 1
    break if i > num2
  end
end

fizzbuzz(1, 15)