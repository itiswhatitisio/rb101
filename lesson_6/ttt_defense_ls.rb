require 'pry'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

WINNING_SCORE = 5

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

def computer_places_piece!(brd)
  square = nil
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd)
    break if square
  end

  if !square
    square = empty_squares(brd).sample
  end

  brd[square] = COMPUTER_MARKER
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

def find_at_risk_square(line, board)
  if board.values_at(*line).count(PLAYER_MARKER) == 2
    board.select{|k,v| line.include?(k) && v == INITIAL_MARKER}.keys.first
  else
    nil
  end
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

  end
    display_board(board)
  # Keep score

  if detect_winner(board) == 'Player'
    score[:Player] += 1
  elsif detect_winner(board) == 'Computer'
    score[:Computer] += 1
  end

  break if score[:Player] == WINNING_SCORE || score[:Computer] == WINNING_SCORE

end
display_score(score)

prompt 'Player won!' if score[:Player] == WINNING_SCORE
prompt 'Computer won!' if score[:Computer] == WINNING_SCORE

prompt 'Play again? (y or n)'
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt 'Thanks for playing Tic Tac Toe! Good bye!'
