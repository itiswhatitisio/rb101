# Problem
#
# Input: integer - year
#
# Output: string
#
# Requirements:
# - New centuries begin in years that end with 01, 1901-2000 -> 20th century
#
# Data structures / Algorithm
# - check the total size of the year
# - check if the year ends with 01
# - use the first numbers to determine the century (total size of the year - 2)
# - if size = 1, then it is the first century
# - if there are two numbers, then the last number should be 1
# - if yes, then convert to the century string using ordinalize method

=begin
ORDER = {
  st: [1],
  nd: [2],
  rd: [3],
  th: [4,5,6,7,8,9]
}

def century(year)
  year_string = year.to_s
  if year.to_s.size == 1
    '1st'
  elsif year.to_s.size == 2
    first_num = year_string[0]
    if year_string[1].to_i >= 1
      century = first_num.to_i + 1
    elsif year_string[1].to_i == 0
    century = first_num.to_i
    end
  else
    a = year_string.size.to_i - 2
    if year_string[year_string.size - 1].to_i >= 1
      century = year_string.slice(0,a).to_i + 1
    elsif year_string[year_string.size - 1].to_i == 0
    century = year_string.slice(0,a).to_i
    end
  end
end

def ordinalize(integer)
  ORDER.each do |key, val|
         if val.include?(integer)
          return integer.to_s + key.to_s 
        else 
          return integer.to_s + 'th'
        end
      end
    end

=end



p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'




