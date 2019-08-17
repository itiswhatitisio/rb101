=begin

# Problem

Input:
- two arguments
- string
- positive integer

Output:
- string

# Requirements
- Each string is printed on a new line
- repeat the input string

# Examples/Test cases
repeat('Hello', 3) => Hello
                      Hello
                      Hello

# Data structure
- String

# Algorithm
- define how many times a string should be printed
- every time a string is printed, increment a number
- stop when the string is printed specified number of times

# my solution

def repeat(string,num)
  count = 0

  while count < num
    puts string
    count += 1 
  end
end

=end

def repeat(string, number)
  number.times { puts string }
end

puts repeat('Hello', 3) # iterating 5 times, the block returns the initial integer.
