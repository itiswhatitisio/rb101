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

def validate_username(name)
 if name == '' || name.strip.empty? || name.nil?
   return false
 else
   return true
 end
end

def validate_play_again(input)
  input = input.downcase()
  if input == 'y' || input == 'n'
    return true
   else 
     return false
   end
end

def continue_playing(answer)
  loop do 
    puts validate_play_again(answer)
    break if validate_play_again(answer)
    prompt('This is not a valid choice. Please enter y for yes/n for no')
    answer = Kernel.gets().chomp()
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

def win?(user_choice, computer_choice)
  if user_choice == computer_choice
  puts 'tie'
    return 'tie'
  else
    WINNING_COMBINATIONS.each do |key, arr|
      if key.to_s == user_choice
        if (computer_choice == arr[0] || computer_choice == arr[1])
        puts 'winner'
          return 'winner'
          end
      else
        puts 'loser'
        return 'loser'
      end
    end
  end
end

def display_results_single_game(result)
  if result == 'tie'
    puts "It's a tie!"
  elsif result == 'winner'
    puts "You won!"
  elsif result == 'loser'
    puts "You lost!"
  end
end

def increment_scores(player_name, computer, win_result, score_hash = {})
  if win_result
    score_hash[player_name] += 1
  else
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

def clear_screen
  system('clear') || system('cls')
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

# Main program

clear_screen()

prompt('What is your name?')
user_name = Kernel.gets().chomp()

invalid_username(user_name)

prompt("Welcome to the game, #{user_name}! To become a grand winner, win five games.")

computer = 'Computer'

loop do
  loop do # count scores
    scores = Hash.new { 0 }

    until max_num_games_reached?(scores)

      choice = ''
      loop do # validate choice
        prompt("Choose one: #{DISPLAY_CHOICES.join(', ')}")
        choice = Kernel.gets().chomp().downcase()

        if VALID_CHOICES.include?(choice)
          break
        else
          prompt("That's not a valid choice")
        end
      end

      computer_choice = VALID_CHOICES.sample()
      computer_choice = convert_input(computer_choice)
      choice = convert_input(choice)
      Kernel.puts("You chose: #{choice}; Computer chose: #{computer_choice}")

      game_outcome = win?(choice, computer_choice)
      display_results_single_game(game_outcome)
      increment_scores(user_name, computer, game_outcome, scores)
      display_current_score(scores)

    end

    grand_winner = determine_grand_winner(scores)
    display_grand_winner(grand_winner)

    break
  end

prompt("Do you want to play again? (y for yes/n for no)")
answer = Kernel.gets().chomp()
continue_playing(answer)
break if answer.downcase() == 'n'
  
  clear_screen()
end
