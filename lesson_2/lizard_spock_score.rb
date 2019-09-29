
DISPLAY_CHOICES = %w(r\ for\ rock p\ for\ paper s\ for\ scissors l\ for\ lizard k\ for\ spock)

VALID_CHOICES = %w(r p s l k)

WINNING_COMBINATIONS = {
  rock: ['lizard', 'scissors'],
  lizard: ['paper', 'spock'],
  spock: ['rock', 'scissors'],
  scissors: ['lizard', 'paper'],
  paper: ['rock', 'spock']
}

NUMBER_GAMES = 5

def convert_input(input)
  case input
  when 'r'
    'rock'
  when 'l'
    'lizard'
  when 'k'
    'spock'
  when 's'
    'scissors'
  when 'p'
    'paper'
  end
end

def win?(first, second)
  WINNING_COMBINATIONS.each do |key, arr|
    if key.to_s == first
      return (second == arr[0] || second == arr[1])
    end
  end
end

def display_results_single_game(player_choice, choice_computer)
  if player_choice == choice_computer
    puts "It's a tie!"
  elsif win?(player_choice, choice_computer)
    puts "You won!"
  else
    puts "You lost!"
  end
end

def increment_scores(player_name, choice, computer, choice_computer, score_hash = {})
  if choice == choice_computer
    score_hash[player_name] += 0
    score_hash[computer] += 0
  elsif win?(choice, choice_computer)
    score_hash[player_name] += 1
  else
    score_hash[computer] += 1
  end
end

def determine_grand_winner(score_hash)
  score_hash.select {|k,v| v == score_hash.values.max }
end

def display_grand_winner(winner)
  winner.each { |key,score| puts "The grand winner is #{key} with the total score: #{score} points"}
end

def clear_screen
  system('clear') || system('cls')
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

# Main program

prompt("What is your name?")
user_name = Kernel.gets().chomp()

prompt("Welcome to the game, #{user_name}! When a player reaches five wins, the match is over, and the winning player becomes the grand winner")

computer = 'Computer'

loop do

  loop do # count scores
  
    scores = Hash.new {0}

    until count == NUMBER_GAMES

      choice = ''
      loop do # validate choice
        prompt("Choose one: #{DISPLAY_CHOICES.join(', ')}")
        choice = Kernel.gets().chomp()

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

      display_results_single_game(choice, computer_choice)

      increment_scores(user_name, choice, computer,computer_choice, scores)
     
     count +=1
    end

    grand_winner = determine_grand_winner(scores)

    display_grand_winner(grand_winner)

    break

end

  prompt("Do you want to play again? (y for yes/n for no)")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
  clear_screen()

end

