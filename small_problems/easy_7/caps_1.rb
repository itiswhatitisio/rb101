=begin

# Problem

# Requirements:
- transform each character using staggered cap scheme
- word[0] - capital
- word[1] - lowercase
- word[2] - capital
- wordp[3] - lowercase etc.

# Input:
- string

# Output:
- new string

# Examples:
staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
staggered_case('ALL_CAPS') == 'AlL_CaPs'
staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

# Data structure/Algorithm:
- string

=end

def staggered_case(string)
  new_string = ''
  string.each_char.with_index do |ch, i|
    new_string << ch.upcase if i.even? || i == 0
    new_string << ch.downcase if i.odd?
  end
  new_string
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

# LS solution

def staggered_case1(string, value)
  result = ''
  need_upper = value
  string.chars.each do |char|
    if need_upper
      result += char.upcase
    else
      result += char.downcase
    end
    need_upper = !need_upper
  end
  result
end

p staggered_case1('I Love Launch School!', false)
