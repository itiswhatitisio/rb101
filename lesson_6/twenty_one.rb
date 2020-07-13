
CARDS_VALUES = %w(2 3 4 5 6 7 8 9 10 jack queen king ace).freeze
SUITS = %w(hearts diamonds clubs spades).freeze
VALUES = {  "2" => 2, "3" => 3, "4" => 4, "5" => 5, "6" => 6,
            "7" => 7, "8" => 8, "9" => 9, "10" => 10, "jack" => 10,
            "queen" => 10, "king" => 10, "ace" => { low: 1, high: 11 } }.freeze
ACE_VALUES = { low: 1, high: 11 }.freeze
DEALER_SCORE = 17
GRAND_WINNER_THRESHOLD = 5
VALID_ANSWERS = %W(H h S s Y y N n)

def prompt(msg)
  puts " => #{msg}"
end

def welcome
  prompt "======================================"
  prompt "Welcome to Twenty One, Player!"
  prompt "Get #{GRAND_WINNER_THRESHOLD} points to become a grand winner!"
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
    break if VALID_ANSWERS.include?(answer)
    prompt "This is not a valid choice. Press 'h' to hit or 's' to stay."
  end
  answer
end

def deal_initial_cards(cards, deck)
  cards.each_pair do |_, player_cards|
    2.times { player_cards << deal_card!(deck) }
  end
  cards
end

def display_cards(cards, player, initial = false)
  result = []
  cards[player].each do |card|
    result << "#{card[:value]} of #{card[:suit]}"
  end
  if player == :Dealer && initial == true
    prompt "#{player}: #{result.sample} and an unknown card"
  else
    prompt "#{player}: #{result.join(', ')}"
  end
end

def player_turn(deck, cards, score)
  loop do
    break if score[:Player] == 21
    answer = hit_or_stay
    break if stay?(answer)
    cards[:Player] << deal_card!(deck)
    display_cards(cards, :Player)
    score = calculate_score(cards)
    display_score(:Player, score)
    break if score[:Player] == 21
    break if busted?(score, :Player)
  end
end

def stay?(answer)
  answer == 's'
end

def dealer_turn(deck, cards, score)
  dealer_answer = nil
  loop do
    dealer_answer = if score[:Dealer] >= DEALER_SCORE
                      'stay'
                    else
                      'hit'
                    end
    break if busted?(score, :Dealer) || dealer_answer == 'stay'
    prompt 'Dealer chooses to hit'
    cards[:Dealer] << deal_card!(deck)
    sleep(2)
    score = calculate_score(cards)
    display_cards(cards, :Dealer, false)
    display_score(:Dealer, score)
  end
end

def calculate_score(player_cards)
  score = { Dealer: 0, Player: 0 }
  player_cards.each do |player, hand|
    hand.each do |card|
      score[player] = if card[:value] == 'ace'
                        score[player] + VALUES["ace"][:high]
                      else
                        score[player] + VALUES[card[:value]]
                      end
    end
  end
  calculate_ace_value(player_cards, score)
end

def calculate_ace_value(player_cards, score)
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
  score[player] > 21
end

def round_over(score, grand_winner_score)
  prompt "Current round scores:"
  prompt "Dealer: #{score[:Dealer]}"
  prompt "Player: #{score[:Player]}"
  display_result(score)
  display_grand_winner_score(grand_winner_score, score)
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
  sleep(2)
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

def update_grand_winner_score(score, result)
  prompt "Calculating grand winner score..."
  sleep(1)
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

def display_score(player, score)
  prompt "Your score is #{score[player]}"
end

def display_grand_winner_score(grand_winner_score, score)
  update_grand_winner_score(grand_winner_score, detect_result(score))
  prompt "************************"
  prompt "Dealer: #{grand_winner_score[:Dealer]}"
  prompt "Player: #{grand_winner_score[:Player]}"
  prompt "************************"
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
  gets
end

def play_again?
  answer = nil
  loop do
    prompt 'Play again? (y or n)'
    answer = gets.chomp
    break if VALID_ANSWERS.include?(answer)

    prompt "This is not a valid choice. Please select 'y' or 'n'"
  end
  answer.downcase.start_with?('y')
end

## MAIN PROGRAM ##

welcome
loop do
  prompt 'Dealing cards...'
  sleep(2)
  grand_winner_score = { Dealer: 0, Player: 0 }

  loop do
    system 'clear'
    deck_current_game = initialize_new_deck(SUITS, VALUES)
    current_cards = { Dealer: [], Player: [] }
    current_score = { Dealer: 0, Player: 0 }

    # Deal and display initial cards
    deal_initial_cards(current_cards, deck_current_game)
    display_cards(current_cards, :Dealer, true)
    display_cards(current_cards, :Player)
    current_score = calculate_score(current_cards)
    display_score(:Player, current_score)

    # Player turn
    player_turn(deck_current_game, current_cards, current_score)
    current_score = calculate_score(current_cards)
    if busted?(current_score, :Player)
      display_cards(current_cards, :Dealer, false)
      round_over(current_score, grand_winner_score)
      break if grand_winner_score.value?(GRAND_WINNER_THRESHOLD)
      next if continue
    else
      prompt 'You choose to stay!'
    end

    # Dealer turn
    dealer_turn(deck_current_game, current_cards, current_score)
    current_score = calculate_score(current_cards)
    if busted?(current_score, :Dealer)
      display_cards(current_cards, :Dealer, false)
      round_over(current_score, grand_winner_score)
      break if grand_winner_score.value?(GRAND_WINNER_THRESHOLD)
      next if continue
    else
      prompt 'Dealer chooses to stay!'
    end
    round_over(current_score, grand_winner_score)
    break if grand_winner_score.value?(GRAND_WINNER_THRESHOLD)
    next if continue
  end
  display_winner(detect_grand_winner(grand_winner_score))
  break unless play_again?
end

prompt 'The game is over. Thank you for playing!'
