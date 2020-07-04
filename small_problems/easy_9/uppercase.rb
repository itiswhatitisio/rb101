# *** (Understand the) Problem: ***
# Essential to understanding how to solve a problem.  In order to be able to solve a problem, you have
# to at least understand what the problem is and what it is asking. Take some time to allow the problem
# to load into your brain. Don't rush this.
# First identify the inputs and the outputs of the problem
# input: string
# output: boolean (true/false)
# _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
# Check for Problem Domain: The Problem Domain is the area of expertise or application that needs to be
# examined to solve a problem.  Basically any domain-specific terms or concepts that may be applicable.
# It limits the scope of the problem.
# For example, if the problem asks you to add up a set of multiples, you need to make sure you know what
# multiples are.  Could one word have multiple meanings? etc
# Problem Domain:
# - alphabetic characters (e.g. a,b,c)
# - non-alphabetic characters (e.g. punctuation , . slashes / numbers etc.)
# _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
# Explicit Requirements:
# - true if all alphabetic characters are uppercase
# - ignore all non alphabetic characters
# _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
# Check for Implicit Requirements.  Are there requirements that are not explicitly stated?
# Implicit Requirements:
# - empty string should return true
# _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
# Clarifying Questions:  Some questions to ask the interviewer (or perhaps yourself) to better
# understand the problem.
# 1. Is whitespace considered as a character?
# _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
# Mental Model:  A mental model is an explanation of someone's thought process about how something
# works in the real world.  Think of it as a summary of the "entire problem" written in your own words.
# It is your perspective of *what* the problem requires--not *how*.  How is implemented in the Algorithm
# section.
# As a rule of thumb, you can keep the number of mental models to one if it fully, and accurately,
# captures the requirements of the problem.
# Your Mental Model: n/a
# ===================================================================================================
# *** Examples / Test Cases / Edge Cases: ***
# Examples:
# THE OBJECTIVE IS to come up with examples that validate your understanding of the problem, and confirm
# that you are working in the right direction.  Typically the confirmation will come from documentation of
# a process, or a person.
# Your Examples: see Test cases
# _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
# Test Cases:
# Note: Rules for a specific problem are oftentimes an excellent place to find test cases.  If you're
# working with collections, it's a good idea to find test cases that deal with zero, one or multiple
# elements in the collection.
# Try to provide test cases that handle any edge cases you can find.
# If you're working with collections, it's a good idea to find test cases that deal with zero, one or
# multiple elements in the collection.
# Your Test Cases:
# uppercase?('t') == false
# uppercase?('T') == true
# uppercase?('Four Score') == false
# uppercase?('FOUR SCORE') == true
# uppercase?('4SCORE!') == true
# uppercase?('') == true
# _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
# Edge Cases:
# Edge cases are situations that occur along the "edge" of a specific problem.  For example: problems that
# involve iterating over numbers have edge cases that are at both ends of the range.  Typically can
# involve working with negative numbers, 0, or extremely high values.
# Your Edge Cases:
# uppercase?('') == true
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

# Data structure/Algorithm:
# - Array? as we need to iterate over each character
# - or use each_char method for strings
#
# - convert the string into an array
# - use method all on the array

# # Code:

def uppercase?(string)
  string.split('').all? { |char| char.match?(/[A-Z0-9\s\W]/) }
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true

# LS solution:

def uppercase?(string)
  string == string.upcase
end