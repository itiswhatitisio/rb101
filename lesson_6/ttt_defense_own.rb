=begin

# Requirements
- computer - defensive minded
- if there is an immediate threat, defend the 3rd square
- immediate threat - 2 squares marked by the player in a row
- if no immediate threat, than pick random square
- 16 possible combinations marking two squares:
  [1,2], [2,3], [4,5], [5,6], [7,8], [8,9], [1,4], [4,7], [2,5],
  [5,8], [3,6], [6,9], [1,5], [5,9], [3,5], [5,7]

# Current setup
- empty_squares(brd) method generates an array of empty squares
- check the numbers of the marked squares by the player
- marked squares are included in the combinations for defense?
  - if marked square is included in the defense hash,
    mark the defense square
  - DEFENSE.values.flatten(1)

=end

require 'pry'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

WINNING_SCORE = 5

DEFENSE = {
  1 => [[2, 3], [4, 7], [5, 9]],
  2 => [[5, 8]],
  3 => [[1, 2], [5, 7], [6, 9]],
  4 => [[5, 6]],
  6 => [[4, 5]],
  7 => [[8, 9], [3, 5], [1, 4]],
  8 => [[2, 5]],
  9 => [[1, 5], [3, 6], [7, 8]]
}

def prompt(msg)
  puts "#{msg}"
end

def display_board(brd)
  system 'clear'
  puts "You're a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}"
  puts "#{brd[1]}|#{brd[2]}|#{brd[3]}"
  puts "-----"
  puts "#{brd[4]}|#{brd[5]}|#{brd[6]}"
  puts "-----"
  puts "#{brd[7]}|#{brd[8]}|#{brd[9]}"
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |n| brd[n] == INITIAL_MARKER }
end

# def marked_squares(brd)
#   marked_s = brd.keys.select { |n| brd[n] == PLAYER_MARKER }
# end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))})"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry that's not a valid choice"
  end
  brd[square] = PLAYER_MARKER
end

def square_to_defend(brd)
  square_to_defend = nil
  marked_s = brd.keys.select { |n| brd[n] == PLAYER_MARKER }
  splitted_arr = marked_s.each_slice(2).to_a
  p "splitted array is #{splitted_arr}"
  DEFENSE.each do |key, val|
    val.each do |sub_arr|
      splitted_arr.each do |arr|
        square_to_defend = key if sub_arr == arr && square_to_defend != COMPUTER_MARKER
      end
    end
  end
  square_to_defend
end

def computer_places_piece!(brd)
  risk_square = square_to_defend(brd)
  puts "risk square is #{risk_square} and #{brd[risk_square]}"
  if !risk_square.nil? && brd[risk_square] != COMPUTER_MARKER
    brd[risk_square] = COMPUTER_MARKER
  else
    square = empty_squares(brd).sample
    brd[square] = COMPUTER_MARKER
  end
end

def joinor(arr, separator = ', ', kw = 'or')
  case arr.size
  when 0 then ''
  when 1 then arr.first
  when 2 then arr.insert(arr.index(arr.last), 'or').join(' ')
  else
    arr1 = []
    arr.each_with_index do |el, i|
      arr1 << el.to_s + "#{separator}" if i != arr.length - 1
      arr1 << "#{kw} " + el.to_s if i == arr.length - 1
    end
    arr1.join
  end
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    # if  brd[line[0]] == PLAYER_MARKER &&
    #     brd[line[1]] == PLAYER_MARKER &&
    #     brd[line[2]] == PLAYER_MARKER
    #   return 'Player'
    # elsif brd[line[0]] == COMPUTER_MARKER &&
    #       brd[line[1]] == COMPUTER_MARKER &&
    #       brd[line[2]] == COMPUTER_MARKER
    #   return 'Computer'
    # end
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def display_score(score)
  prompt("Current score for Computer is #{score[:Computer]}, for Player #{score[:Player]}")
end

loop do
  score = {
    Computer: 0,
    Player: 0
  }

  loop do
    board = initialize_board

    loop do
      display_board(board)
      display_score(score)

      player_places_piece!(board)
      break if someone_won?(board) || board_full?(board)

      computer_places_piece!(board)
      break if someone_won?(board) || board_full?(board)
      binding.pry

    end

    display_board(board)

    # Keep score

    if detect_winner(board) == 'Player'
      score[:Player] += 1
    elsif detect_winner(board) == 'Computer'
      score[:Computer] += 1
    end

    break if score[:Player] == WINNING_SCORE ||
             score[:Computer] == WINNING_SCORE
  end

  display_score(score)

  prompt 'Player won!' if score[:Player] == WINNING_SCORE
  prompt 'Computer won!' if score[:Computer] == WINNING_SCORE

  prompt 'Play again? (y or n)'
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt 'Thanks for playing Tic Tac Toe! Good bye!'
