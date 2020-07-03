CONSONANTS = ["b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "x", "z", "w", "y",
              "B", "C", "D", "F", "G", "H", "J", "K", "L", "M", "N", "P", "Q", "R", "S", "T", "V", "X", "Z", "W", "Y"]

def double_consonants(string)
  result = []
  string.split('').each do |char|
    if CONSONANTS.include?(char)
    i = 0
    loop do
      result << char
      i += 1
      break if i == 2
    end
    else
      result << char
      end
  end
  result.join
end

p double_consonants('String')

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""