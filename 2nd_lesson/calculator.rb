# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

# answer = Kernel.gets()
# Kernel.puts(answer)

Kernel.puts("Welcome to the Calculator!")

Kernel.puts("What's the first number?")
number1 = Kernel.gets().chomp() # gets() returns a string

Kernel.puts("What's the second number?")
number2 = Kernel.gets().chomp() # gets() returns a string

Kernel.puts("What operation would you like to perform? 1) add 2) subtract 3) multiply 4) divide")
operator = Kernel.gets().chomp() 

# if expressions can return a value

if operator == '1' # Local variables initialized within an if can be accessed outside of the if.
  result = number1.to_i() + number2.to_i()
elsif operator == '2' # pay attention to the equality operator!
  result = number1.to_i() - number2.to_i()
elsif operator == '3'
  result = number1.to_i() * number2.to_i()
elsif operator == '4'
  result = number1.to_f() / number2.to_f() # without the to_f() method, the output will be an integer
end

Kernel.puts("The result is #{result}")