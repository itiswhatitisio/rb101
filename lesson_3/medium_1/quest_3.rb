def factors(number)
  divisor = number
  factors = []
  begin
    factors << number / divisor if number % divisor == 0 
    # number % divisor calculates the remainder
    divisor -= 1
  end until divisor == 0
  factors
  # since << modifies original array, we can just use factors to print
  # the array
end

=begin

# Test case

factors(5)
divisor = 5
factors = []
5 % 5 == 0
factors = [1]
for all the subsequent numbers (4,3,2), the remainder will not be equal 0
divisor = 1
5 % 1 == 0
factors = [1,5]

# why is it necessary to print out factors at the end of the method?
This is what is the actual return value from the method. 
Recall that without an explicit return statement in the code, 
the return value of the method is the last statement executed. 
If we omitted this line, the code would execute, 
but the return value of the method would be nil.

=end

def new_factors(number)
  divisor = number
  factors = []
  while divisor > 0 do
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end

p new_factors(0)

