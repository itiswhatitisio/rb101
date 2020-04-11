DEFENSE = {
  1 => [[2,3], [4,7], [5,9]],
  2 => [[5,8]],
  3 => [[1,2], [5,7], [6,9]],
  4 => [[5,6]],
  6 => [[4,5]],
  7 => [[8,9], [3,5], [1,4]],
  8 => [[2,5]],
  9 => [[1,5], [3,6], [7,8]]
}

marked_square = [1,2,6,7]

splitted_arr = marked_square.each_slice(2).to_a

# square_to_defend = nil
# DEFENSE.each do |key, val|
#   val.each do |sub_arr|
#     splitted_arr.each do |arr|
#       square_to_defend = key if sub_arr == arr
#     end
#   end
# end
# p square_to_defend 

# def computer_places_piece!(brd)
#   square_to_defend = nil
#   DEFENSE.each do |key, val|
#   val.each do |sub_arr|
#     splitted_arr.each do |arr|
#       square_to_defend = key if sub_arr == arr
#     end
#   end
# end

# if square_to_defend
#   brd[square_to_defend] = COMPUTER_MARKER
# else
#   square = empty_squares(brd).sample
#   brd[square] = COMPUTER_MARKER
# end

def square_to_defend(brd)
  square_to_defend = nil
  marked_s = brd.keys.select { |n| brd[n] == PLAYER_MARKER }
  splitted_arr = marked_s.each_slice(2).to_a
end

board = 
p square_to_defend