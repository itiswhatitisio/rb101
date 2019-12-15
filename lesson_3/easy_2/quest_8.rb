# ...remove everything starting from "house".

advice = "Few things in life are as important as house training your pet dinosaur."

p advice.slice!(0, 39)

p advice

advice.slice!(0, advice.index('house'))

# string.index(substring)
# Returns the index of the first occurrence of the given substring or 
# pattern (regexp) in str. 
