=begin

# Problem

# Requirements:

# Input:

# Output:

# Examples:
staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
staggered_case('ALL CAPS') == 'AlL cApS'
staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

# Data structure/Algorithm:


=end

def staggered_case(string)
  new_string = ''
  i = 0
  string.each_char do |ch|
    if ch =~ /['A-Za-z']/
      if (i.even? || i == 0)
        new_string += ch.upcase
      elsif i.odd?
        new_string += ch.downcase
      end
      i += 1
    else
      new_string += ch
    end
  end
  new_string
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'