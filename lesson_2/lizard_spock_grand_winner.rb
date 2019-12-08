DISPLAY_CHOICES = %w(
  r\ for\ rock p\ for\ paper s\ for\ scissors
  l\ for\ lizard k\ for\ spock
)

VALID_CHOICES = %w(r p s l k)

WINNING_COMBINATIONS = {
  rock: ['lizard', 'scissors'],
  lizard: ['paper', 'spock'],
  spock: ['rock', 'scissors'],
  scissors: ['lizard', 'paper'],
  paper: ['rock', 'spock']
}

NUMBER_GAMES = 5

def welcome(user_name)
  prompt("Welcome to the game, #{user_name}!
    To become a grand winner, win five games.")
end

def validate_username(name)
  if name == '' || name.strip.empty? || name.nil?
    false
  else
    true
  end
end

def determine_username
  prompt('What is your name?')
  user_name = Kernel.gets().chomp()
  loop do
    if validate_username(user_name)
      return user_name
    end
    prompt("This is not a valid name. Please enter a valid name")
    user_name = Kernel.gets().chomp()
  end
end

def determine_user_choice
  loop do
    prompt("Choose one: #{DISPLAY_CHOICES.join(', ')}")
    choice = Kernel.gets().chomp().downcase()
    if VALID_CHOICES.include?(choice)
      choice = convert_input(choice)
      return choice
    else
      prompt("That's not a valid choice")
    end
  end
end

def convert_input(input)
  case input
  when 'r', 'R'
    'rock'
  when 'l', 'L'
    'lizard'
  when 'k', 'K'
    'spock'
  when 's', 'S'
    'scissors'
  when 'p', 'P'
    'paper'
  end
end

def determine_computer_choice
  convert_input(VALID_CHOICES.sample())
end

def win(user_choice, computer_choice)
  if user_choice == computer_choice
    'tie'
  else
    WINNING_COMBINATIONS.each do |key, arr|
      if key.to_s == user_choice
        if arr.include?(computer_choice)
          return 'winner'
        else
          return 'loser'
        end
      end
    end
  end
end

def display_results_single_game(outcome)
  if outcome == 'winner'
    puts "You won!"
  elsif outcome == 'loser'
    puts "You lost!"
  elsif outcome == 'tie'
    puts "It's a tie!"
  end
end

def increment_scores(player_name, computer, win_result, score_hash = {})
  if win_result == 'winner'
    score_hash[player_name] += 1
  elsif win_result == 'loser'
    score_hash[computer] += 1
  end
end

def display_current_score(scores)
  scores.each do |player, score|
    puts "Current score for #{player} is #{score}"
  end
end

def max_num_games_reached?(score_hash)
  score_hash.value?(NUMBER_GAMES)
end

def determine_grand_winner(score_hash)
  score_hash.select { |_, v| v == score_hash.values.max }
end

def display_grand_winner(winner)
  winner.each_key { |key| puts "The grand winner is #{key}!" }
end

def validate_play_again(input)
  input = input.downcase()
  if input == 'y' || input == 'n'
    return true
  else
    return false
  end
end

def continue_playing
  prompt("Do you want to play again? (y for yes/n for no)")
  answer = Kernel.gets().chomp()
  loop do
    break if validate_play_again(answer)
    prompt('This is not a valid choice. Please enter y for yes/n for no')
    answer = Kernel.gets().chomp()
  end
  answer.downcase == 'y'
end

def clear_screen
  system('clear') || system('cls')
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

# Main program

clear_screen()

player_name = determine_username()
welcome(player_name)
computer = 'Computer'

loop do
  scores = Hash.new { 0 }

  loop do
    choice = determine_user_choice()
    computer_choice = determine_computer_choice()
    Kernel.puts("You chose: #{choice}; Computer chose: #{computer_choice}")
    game_outcome = win(choice, computer_choice)
    display_results_single_game(game_outcome)
    increment_scores(player_name, computer, game_outcome, scores)
    display_current_score(scores)
    break if max_num_games_reached?(scores)
  end

  grand_winner = determine_grand_winner(scores)
  display_grand_winner(grand_winner)

  break unless continue_playing()

  clear_screen()
end
