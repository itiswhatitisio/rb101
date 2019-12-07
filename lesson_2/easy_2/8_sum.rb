=begin

# Problem
Input
- integer > 0
- s for sum, p for product

Output
- sum of all integers if s
- product of all integers if p

# Requirements
- validate the input to determine sum or product
- validate that the integer 

# Examples/test cases
- sum of : 1+2+3+4+5 = 15
- product of 6: 1*2*3*4*5*6 = 720

# Data structures
- integers
- array

# Algorithm
- integer - get input from the user v
- s for sum v
- p for product v
- determine all numbers upto integer 
- sum or multiple all numbers
- display output

=end

puts "Please enter an integer greater than 0"
integer = gets.chomp.to_i

puts "Enter 's' to compute the sum, 'p' to compute the product."
operation = gets.chomp

def new_array(i)
  (1..i).to_a
end

array = new_array(integer)
puts array

def operation(arr, op)
  if op == 's' 
    sum = arr.reduce(:+)
  else
    product = arr.reduce(:*)
  end
end

puts operation(array,operation)
