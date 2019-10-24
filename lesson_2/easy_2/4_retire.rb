=begin

# Problem

Input
- age -> integer
- retirement age -> integer

Output
- current year -> date
- retirement year -> current year + (retirement age -  current age)
- years of work to go -> retirement age - current age


# Requirements
- display current year


# Examples/Test cases
What is your age? 30
At what age would you like to retire? 70

It's 2016. You will retire in 2056.
You have only 40 years of work to go!

# Data structure
- n/a

# Algorithm

- get age v
- get retirement age v
- get years of work to go -> retirement age - current age v
- get current year v
- retirement year -> current year + years of work to go v
- display the result

=end

require 'date'

puts "What is your age?"
age = gets.chomp.to_i

puts "At what age would you like to retire?"
retirement_age = gets.chomp.to_i

years_to_work = retirement_age - age

current_year = Date.today.year

retirement_year = current_year + years_to_work

puts "It's #{current_year}. You will retire in #{retirement_year}. "
puts  "You have only #{years_to_work} years of work to go!"

