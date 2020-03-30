=begin

# Problem

# Requirements:
- output hash contains nr of characters for lowercase letters, 
  uppercase letters and nr of characters for the rest of the char

# Input:
- string

# Output:
- hash

# Examples:
letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

# Data structure/Algorithm:
- string
- hash
- how to determine nr of characters?

=end

LOWERCASE = ('a'..'z').to_a
UPPEPRCASE = ('A'..'Z').to_a

def letter_case_count(string)
  result = { lowercase: 0, uppercase: 0, neither: 0 }
  string.each_char do |chr|
    if LOWERCASE.include?(chr)
      result[:lowercase] += 1
    elsif UPPEPRCASE.include?(chr)
      result[:uppercase] += 1 
    else
      result[:neither] +=1
    end
  end
  result
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

# LS - solution

def letter_case_count(string)
  counts = {}
  characters = string.chars
  counts[:lowercase] = characters.count { |char| char =~ /[a-z]/ }
  counts[:uppercase] = characters.count { |char| char =~ /[A-Z]/ }
  counts[:neither] = characters.count { |char| char =~ /[^A-Za-z]/ }
  counts
end