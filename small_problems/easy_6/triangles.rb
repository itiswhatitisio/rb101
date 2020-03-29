=begin

# Problem

# Requirements:
- display a right triangle whose sides each have n stars
- The hypotenuse of the triangle (the diagonal side in the images below)
  should have one end at the lower-left of the triangle
- the other end at the upper-right

# Input:
- positive integer - n

# Output:
- triangle

# Examples:
triangle(5)

    *
   **
  ***
 ****
*****

# Data structure/Algorithm:
- string
- can print one line at a time
- n - number of lines to print
- first line - spaces = n - 1
               stars = 1
- repeat untill stars == n

=end

def triangle(n)
  i = 0
  spaces = n - 1
  stars = 1
  while i < n
    puts ' ' * spaces + '*' * stars
    spaces -= 1
    stars += 1
    i += 1
  end
end

# triangle(5)
# triangle(9)
# triangle(6)

# Further exploration

def upside_down(n)
  i = 0
  spaces = 0
  stars = n
  while i < n
    puts ' ' * spaces + '*' * stars
    spaces += 1
    stars -= 1
    i += 1
  end
end

upside_down(5)
upside_down(9)
