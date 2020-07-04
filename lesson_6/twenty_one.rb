require 'yaml'

CARDS_VALUES = %w(2 3 4 5 6 7 8 9 10 jack queen king ace)
SUITS = %w(hearts diamonds clubs spades)
SCORE = %w(jack queen king)
ACE_VALUES = { low: 1, high: 11 }
DEALER_SCORE = 17
GRAND_WINNER_WINNING_SCORE = 5
#MESSAGES = YAML.load_file('messages.yml')

# LANGUAGE = 'en'

# def messages(message, lang='en')
#   MESSAGES[lang][message]
# end

# def prompt(key)
#   message = messages(key, LANGUAGE)   # make sure the "messages" method is declared above this line)
#   puts "=> #{message}"
# end

def prompt(msg)
  puts " => #{msg}"
end

def initialize_new_deck(suits, cards)
  new_deck = []
  suits.product(cards).each do |suit, value|
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
    prompt "Hit (h) or stay (s)?"
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

def display_initial_cards(cards)
  prompt "Dealer: #{cards[:Dealer].sample} and an unknown card"
  prompt "You: #{cards[:Player]}"
end

def display_cards(cards, player = :Player)
  prompt "#{player}: #{cards[player]}"
end

def calculate_score(player_cards, score)
  player_cards.each do |player, hand|
    hand.each do |card|
      if SCORE.include?(card[:value])
        score[player] += 10
      elsif card[:value] == 'ace'
        score[player] += ACE_VALUES[:high]
      else
        score[player] += card[:value].to_i
      end
    end
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

def detect_winner(score)
  return 'tie' if score.values.uniq.length == 1
  score.key(score.values.max)
end

def display_winner(winner)
  prompt "========================"
  return prompt "It's a tie!" + "\n => ========================" if winner == 'tie'
  prompt "The winner is #{winner}"
  prompt "========================"
end

def play_again?
  answer = nil
  loop do
    prompt 'Play again? (y or n)'
    answer = gets.chomp
    break if answer == 'y' || answer == 'n'
    prompt "This is not a valid choice. Please select 'y' or 'n'"
  end
  puts answer
   answer.downcase.start_with?('y')
end

## MAIN PROGRAM ##
prompt '======================================'
prompt "Welcome to Twenty One!"
prompt "Win 5 rounds to become a grand winner!"
prompt '======================================'

prompt 'Dealing cards...'
sleep(4)

grand_winner_score = { Dealer: 0, Player: 0 }

loop do
  # Initialize deck
  system 'clear'
  deck_current_game = initialize_new_deck(SUITS, CARDS_VALUES)
  current_cards = { Dealer: [], Player: [] }
  current_score = { Dealer: 0, Player: 0 }

  # Deal two cards to player and dealer
  player_cards_current_game = deal_initial_cards(current_cards, deck_current_game)
  display_initial_cards(current_cards)
  prompt "Your score is #{calculate_score(current_cards,current_score)[:Player]}"

  # Player turn: hit or stay
  loop do
    answer = hit_or_stay
    break if answer == 's' # stay
    current_cards[:Player] << deal_card!(deck_current_game)
    display_cards(current_cards)
    prompt "Your score is #{calculate_score(current_cards,current_score)[:Player]}"
    break if busted?(calculate_score(current_cards), "Player".to_sym)
  end

  if busted?(calculate_score(current_cards), "Player".to_sym)
    prompt "The score is #{calculate_score(current_cards)}"
    prompt "You loose!"
    grand_winner_score[:Dealer] += 1
    prompt "Total scores: #{grand_winner_score}"
    break if grand_winner_score.has_value?(5)
    play_again? ? next : break
  else
    prompt "You choose to stay!"
  end
  # Dealer turn
  dealer_answer = nil
  loop do
    dealer_score = calculate_score(current_cards)[:Dealer]
    
    if dealer_score >= DEALER_SCORE
      dealer_answer = 'stay'
    else
      dealer_answer = 'hit'
    end
    break if dealer_answer == 'stay' || busted?(calculate_score(current_cards), "Dealer".to_sym)
    prompt "Dealer chooses to hit"
    current_cards[:Dealer] << deal_card!(deck_current_game)
    prompt "172 Dealer: #{current_cards[:Dealer]}"
    prompt "Dealer's score is #{calculate_score(current_cards)[:Dealer]}"
    break if busted?(calculate_score(current_cards), "Dealer".to_sym)
  end

  if busted?(calculate_score(current_cards), "Dealer".to_sym)
    prompt "You win! Dealer lost!"
    grand_winner_score[:Player] += 1
    prompt "The score is #{calculate_score(current_cards)}"
    prompt "#{grand_winner_score}"
    break if grand_winner_score.has_value?(5)
    play_again? ? next : break
  else
    prompt "Dealer chooses to stay"
    prompt "Dealer: #{current_cards[:Dealer]}"
    prompt "Dealer's score is #{calculate_score(current_cards)[:Dealer]}"
    display_winner(detect_winner(calculate_score(current_cards)))
    grand_winner_score[detect_winner(calculate_score(current_cards))] += 1 if detect_winner(calculate_score(current_cards)) != 'tie'
  end
prompt "Total scores: #{grand_winner_score}"
break if grand_winner_score.has_value?(5)
break unless play_again?
end
prompt "The game is over. Thank you for playing!"

