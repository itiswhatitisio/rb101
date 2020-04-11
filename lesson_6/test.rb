=begin

# Requirements:
- check if any sub-array in the WINNING_LINES
  contains two elements marked as 'X'
- the values 'X' stored in the brd hash

=end

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]

board = { 1=>"X", 2=>"X", 3=>" ", 4=>" ", 5=>" ", 
          6=>" ", 7=>" ", 8=>" ", 9=>"X"}

def square_at_risk(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count('X') == 2
     square = brd.select{|k,v| line.include?(k) && v == ' '}.keys.first
    end
  end
  square
end

p square_at_risk(board)
=begin

board.select{|k,v| line.include?(k) && v == ' '}.keys.first

- board = { 1=>"X", 2=>"X", 3=>" ", 4=>" ", 5=>" ", 
          6=>" ", 7=>" ", 8=>" ", 9=>"X"}

board.select{|k,v| line.include?(k) && v == ' '}

line.include?(k) && v == ' ' checks if 
the winning line array in the board, e.g.[1,2,3] includes 
key from the line (e.g. 1) and whether the value
associated with this key is empty v == ' '
.select returns a new hash of pairs for which the block is true
.keys returns a new array with keys
.first returns the first element of the array with keys
=end