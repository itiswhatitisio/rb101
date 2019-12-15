=begin

# Algorithm
- take a sentence
- append a space
- repeat 10 times
- terminate after printing 10 times

=end

def ascii_art(sentence)
  " " + sentence
end

def iterator(number, sentence)
  count = 0

loop do
  count+=1
  sentence = ascii_art(sentence)
  puts sentence
  if count == number
    break
  end
end

end

# Method 1 - with the .times method, using recusrsion
words = "The Flintstones Rock!"
10.times do
words = ascii_art(words)
puts words
end

# Method 2, creating two custom methods with a possibility to modify
# number of times a sentence gets printed, using recursion
some_words = "The Flintstones Rock!"
iterator(10, some_words)

# Solution by LS

10.times { |number| puts (" " * number) + "The Flintstones Rock!" }
