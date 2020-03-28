=begin
def print_in_box(string)
  size = string.size + 2
  box = ['+']

  size.times do
    box[0] << '-'
  end
  box << '+'
  result = box.join

  spaces = ""

  string.size.times do
    spaces << "\s"
  end

  result << "\n| #{spaces} | \n| #{string} | \n| #{spaces} |"
  result << "\n" + box.join
  puts result
end

print_in_box('To boldly go where no one has gone before.')
print_in_box('I believe I can even yet remember when I saw the stars for the first time.')
print_in_box('')
=end
# LS solution

def print_box(string)

  horizontal_lines = "+#{'-' * (string.size + 2)}"
  vertical_lines = "|#{ ' ' * (string.size + 2)}|"

  puts horizontal_lines
  puts vertical_lines
  puts "| #{string} |"
  puts vertical_lines
  puts horizontal_lines

end

print_box('To boldly go.')