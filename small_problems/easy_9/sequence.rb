# *** (Understand the) Problem: ***
# Essential to understanding how to solve a problem.  In order to be able to solve a problem, you have
# to at least understand what the problem is and what it is asking.  Take some time to allow the problem
# to load into your brain.  Don't rush this.
# First identify the inputs and the outputs of the problem
# input: integer
# output: array
# _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
# Check for Problem Domain: The Problem Domain is the area of expertise or application that needs to be
# examined to solve a problem.  Basically any domain-specific terms or concepts that may be applicable.
# It limits the scope of the problem.
# For example, if the problem asks you to add up a set of multiples, you need to make sure you know what
# multiples are.  Could one word have multiple meanings? etc
# Problem Domain: sequence -> number of integers from 1 to the number that is given as an argument
# _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
# Explicit Requirements:
# - the argument will always be a valid integer that is greater than 0.
# _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
# Check for Implicit Requirements.  Are there requirements that are not explicitly stated?
# Implicit Requirements: n/a
# _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
# Clarifying Questions:  Some questions to ask the interviewer (or perhaps yourself) to better
# understand the problem.
# 1. n/a
# _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
# Mental Model:  A mental model is an explanation of someone's thought process about how something
# works in the real world.  Think of it as a summary of the "entire problem" written in your own words.
# It is your perspective of *what* the problem requires--not *how*.  How is implemented in the Algorithm
# section.
# As a rule of thumb, you can keep the number of mental models to one if it fully, and accurately,
# captures the requirements of the problem.
# Your Mental Model:
# ===================================================================================================
# *** Examples / Test Cases / Edge Cases: ***
# Examples:
# THE OBJECTIVE IS to come up with examples that validate your understanding of the problem, and confirm
# that you are working in the right direction.  Typically the confirmation will come from documentation of
# a process, or a person.
# Your Examples: n/a
# _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
# Test Cases:
# Note: Rules for a specific problem are oftentimes an excellent place to find test cases.  If you're
# working with collections, it's a good idea to find test cases that deal with zero, one or multiple
# elements in the collection.
# Try to provide test cases that handle any edge cases you can find.
# If you're working with collections, it's a good idea to find test cases that deal with zero, one or
# multiple elements in the collection.
# Your Test Cases:
# sequence(5) == [1, 2, 3, 4, 5]
# sequence(3) == [1, 2, 3]
# sequence(1) == [1]
# _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
# Edge Cases:
# Edge cases are situations that occur along the "edge" of a specific problem.  For example: problems that
# involve iterating over numbers have edge cases that are at both ends of the range.  Typically can
# involve working with negative numbers, 0, or extremely high values.
# Your Edge Cases: n/a
# ===================================================================================================
# *** Data Structure:***
# Next determine what data structures you will work with to convert the input to the desired output.
# THE CHIEF CONSIDERATIONS HERE are your intended programming language and your mental model.
# Are you going to use arrays, hashes, etc?
# Your data structure will influence your program.
# ===================================================================================================
# *** Algorithm: ***
# Start with your mental model if you have one.  While you're still learning to solve problems,
# it would be a good idea to consistently create mental models to assist you.
# Otherwise you can start with your Data Structure, and think about how you'd build and manipulate
# it to get to the output.  For example, if you're going to use an array maybe you would want to focus
# on constructing or iterating over a collection.
# ** THE CHIEF OBJECTIVE HERE is to determine a series of instructions that will transform the input
# into the desired output.
#     - The challenge is to get to the right amount of detail (think about the steps to creating a
#     peanut butter and jelly sandwich.)
#     - You want something that you can readily convert to code without actually writing code.
#     - Before implementing the algorithm, you should test it manually with test cases.
#
# - create an empty array
# - initialize a counter variable = 1
# - loop until counter variable = argument passed to the method
# - during each iteration, concatenate counter variable to an array
# - increment counter variable by 1 during each iteration
# - return the array

# # Code:

def sequence(num)
  result = []
  i = 1
  loop do
    result << i
    i += 1
    break if i > num
  end
  result
end

def sequence1(num)
  result = []
  1.upto(num) { |n| result << n }
  result
end

# This simply takes advantage of Range combined with to_a
# which creates a range from 1 up to the value of the supplied parameter number and then converts it to an array.

def sequence2(number)
  (1..number).to_a
end

p sequence1(5) == [1, 2, 3, 4, 5]
p sequence1(3) == [1, 2, 3]
p sequence1(1) == [1]

# Further Exploration

def sequence_negative(num)
  num > 1 ? (1..num).to_a : (num..1).to_a
end

p sequence_negative(-5)
p sequence_negative(0)


# User submitted solutions
# the splat (*) operator can be used to unpack variables and arrays
# so that they can be passed as individual arguments to a method
def seq(n)
  [*(1..n)]
end

p seq(5)