CARDS_VALUES = %w(2 3 4 5 6 7 8 9 10 jack queen king ace).freeze
SUITS = %w(hearts diamonds clubs spades).freeze
VALUES = {  "2" => 2, "3" => 3, "4" => 4, "5" => 5, "6" => 6,
            "7" => 7, "8" => 8, "9" => 9, "10" => 10, "jack" => 10,
            "queen" => 10, "king" => 10, "ace" => { low: 1, high: 11 } }.freeze
ACE_VALUES = { low: 1, high: 11 }.freeze
DEALER_SCORE = 17
GRAND_WINNER_THRESHOLD = 5

def prompt(msg)
  puts " => #{msg}"
end

def welcome
  prompt "======================================"
  prompt "Welcome to Twenty One!"
  prompt "Get 5 points to become a grand winner!"
  prompt "======================================"
end

def initialize_new_deck(suits, values)
  new_deck = []
  suits.product(values.keys).each do |suit, value|
    new_deck << { suit: suit, value: value }
  end
  new_deck
end

def deal_card!(deck)
  card = deck.sample
  deck.delete(card)
end

def hit_or_stay
  answer = nil
  loop do
    prompt 'Hit (h) or stay (s)?'
    answer = gets.chomp
    break if answer == 'h' || answer == 's'
    prompt "This is not a valid choice. Press 'h' to hit or 's' to stay."
  end
  answer
end

def deal_initial_cards(cards, current_deck)
  cards.each_pair do |_, player_cards|
    2.times { player_cards << deal_card!(current_deck) }
  end
  cards
end

def display_cards(cards, player, initial = false)
  result = []
  cards[player].each do |card|
    result << "#{card[:value]} of #{card[:suit]}"
  end
  if player == :Dealer && initial == true
    prompt "#{player}: #{result.sample}"
  else
    prompt "#{player}: #{result.join(', ')}"
  end
end

def player_turn
  loop do
    answer = hit_or_stay
    break if answer == 's' # stay
    current_cards[:Player] << deal_card!(deck_current_game)
    display_cards(current_cards, :Player)
    current_score = calculate_score(current_cards, current_score)
    prompt "Your score is #{current_score[:Player]}"
    break if busted?(current_score, :Player)
  end
end

def calculate_score(player_cards, score)
  score = { Dealer: 0, Player: 0 }
  player_cards.each do |player, hand|
    hand.each do |card|
      if card[:value] == 'ace'
        score[player] += VALUES["ace"][:high]
      else
        score[player] += VALUES[card[:value]]
      end
    end
    score
  end

  player_cards.each do |player, val|
    val.each do |card|
      if card[:value] == 'ace' && score[player] > 21
        score[player] -= 10
      end
    end
  end
  score
end

def busted?(score, player)
  if score[player] > 21
    true
  else
    false
  end
end

def detect_result(score)
  player_total = score[:Player]
  dealer_total = score[:Dealer]

  if player_total > 21
    :player_busted
  elsif dealer_total > 21
    :dealer_busted
  elsif dealer_total < player_total
    :Player
  elsif dealer_total > player_total
    :Dealer
  else
    :tie
  end
end

def display_result(score)
  result = detect_result(score)
  sleep(3)
  case result
  when :player_busted
    prompt "You busted! Dealer wins!"
  when :dealer_busted
    prompt "Dealer busted! You win!"
  when :Player
    prompt "You win!"
  when :Dealer
    prompt "Dealer wins!"
  when :tie
    prompt "It's a tie!"
  end
end

def calculate_grand_winner_score(score, result)
  prompt "Calculating grand winner score..."
  sleep(2)
  case result
  when :player_busted
    score[:Dealer] += 1
  when :Dealer
    score[:Dealer] += 1
  when :dealer_busted
    score[:Player] += 1
  when :Player
    score[:Player] += 1
  end
end

def detect_grand_winner(scores)
  scores.key(scores.values.max)
end

def display_winner(winner)
  prompt "========================"
  prompt "The winner is #{winner}"
  prompt "========================"
end

def continue
  prompt "Press 'Enter' to continue..."
  answer = gets.chomp
end

def play_again?
  answer = nil
  loop do
    prompt 'Play again? (y or n)'
    answer = gets.chomp
    break if answer == 'y' || answer == 'n'
    prompt "This is not a valid choice. Please select 'y' or 'n'"
  end
  answer.downcase.start_with?('y')
end

## MAIN PROGRAM ##
welcome
loop do 
  prompt 'Dealing cards...' 
  sleep(4) 
  
  grand_winner_score = { Dealer: 0, Player: 0 } 
  
  loop do 
    system 'clear' 
    deck_current_game = initialize_new_deck(SUITS, VALUES) 
    current_cards = { Dealer: [], Player: [] } 
    current_score = { Dealer: 0, Player: 0 } 
    
    # Deal two cards to player and dealer 
    display_cards(current_cards, :Dealer, true)
    display_cards(current_cards, :Player) 
    current_score = calculate_score(current_cards, current_score)
    prompt "Your score is #{current_score[:Player]}"
    
    # Player turn: hit or stay
  loop do
    answer = hit_or_stay
    break if answer == 's' # stay
    current_cards[:Player] << deal_card!(deck_current_game)
    display_cards(current_cards, :Player)
    current_score = calculate_score(current_cards, current_score)
    prompt "Your score is #{current_score[:Player]}"
    break if busted?(current_score, :Player)
  end

  if busted?(current_score, :Player)
    display_cards(current_cards, :Dealer, false)
    prompt "The score for this round is: \n => Dealer: #{current_score[:Dealer]} \n => Player: #{current_score[:Player]}"
    display_result(current_score)
    calculate_grand_winner_score(grand_winner_score, detect_result(current_score))
    prompt "Dealer: #{grand_winner_score[:Dealer]} \n => Player: #{grand_winner_score[:Player]}"
    break if grand_winner_score.value?(GRAND_WINNER_THRESHOLD)
    next if continue
  else
    prompt 'You choose to stay!'
  end
  # Dealer turn
  dealer_answer = nil
  loop do
    dealer_answer = if current_score[:Dealer] >= DEALER_SCORE
                      'stay'
                    else
                      'hit'
    end
    break if busted?(current_score, :Dealer) || dealer_answer == 'stay'

    prompt 'Dealer chooses to hit'
    current_cards[:Dealer] << deal_card!(deck_current_game)
    sleep(3)
    current_score = calculate_score(current_cards, current_score)
    display_cards(current_cards, :Dealer, false)
    prompt "Dealer's score is #{current_score[:Dealer]}"
    break if busted?(current_score, :Dealer)
  end

  if busted?(current_score, :Dealer)
    display_result(current_score)
    calculate_grand_winner_score(grand_winner_score, detect_result(current_score))
    prompt "The score for this round is: \n => Dealer: #{current_score[:Dealer]} \n => Player: #{current_score[:Player]}"
    prompt "Dealer: #{grand_winner_score[:Dealer]} \n => Player: #{grand_winner_score[:Player]}"
    break if grand_winner_score.has_value?(GRAND_WINNER_THRESHOLD
    )
    next if continue
  else
    prompt "Dealer chooses to stay"
    display_cards(current_cards, :Dealer, false)
    current_score = calculate_score(current_cards, current_score)
    prompt "The score for this round is: \n => Dealer: #{current_score[:Dealer]} \n => Player: #{current_score[:Player]}"
    display_result(current_score)
    calculate_grand_winner_score(grand_winner_score, detect_result(current_score))
    prompt "Dealer: #{grand_winner_score[:Dealer]} \n => Player: #{grand_winner_score[:Player]}"
    break if grand_winner_score.has_value?(GRAND_WINNER_THRESHOLD)
    next if continue
  end
  prompt "Total scores: #{grand_winner_score}"
  break if grand_winner_score.has_value?(GRAND_WINNER_THRESHOLD)
end
display_winner(detect_grand_winner(grand_winner_score))
break unless play_again?
end
prompt 'The game is over. Thank you for playing!'
