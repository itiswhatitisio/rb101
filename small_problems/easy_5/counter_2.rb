def word_sizes(string)
  result = {}
  words = string.split(' ')
  words.each do |word|
    new_word = word.gsub(/[^a-z]/i, '')
    if result.key?(new_word.size)
      result[new_word.size] += 1
    else
      result[new_word.size] = 1
    end
  end
  result
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}