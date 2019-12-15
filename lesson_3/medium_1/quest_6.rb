answer = 42

def mess_with_it(some_number)
  some_number += 8 # += operator doesn't mutate original object
end

new_answer = mess_with_it(answer)

p answer - 8