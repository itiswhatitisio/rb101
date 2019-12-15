
def fib(first_num, second_num, limit)
  # method definition creates a new variable scopre
  # a method's scope is entirely self-contained
  # thus methods can't access variables outside of the method definition
  # a method doesn't have access to any local variables outside of its scope
  limit = limit
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1, 15)
puts "result is #{result}"