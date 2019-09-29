require 'date' 

puts Date.new # "the brackets are nested with this method; items inside the outermost bracket pairs can only be omitted if all of the innermost bracket pairs are omitted as well."
puts Date.new(2016) # 2016-01-01
puts Date.new(2016, 5) # 2016-05-01
puts Date.new(2016, 5, 13) # 2016-05-13

=begin

# Date subclass https://docs.ruby-lang.org/en/2.5.0/Date.html

new([year=-4712[, month=1[, mday=1[, start=Date::ITALY]]]]) → date
Creates a date object denoting the given calendar date.

=end