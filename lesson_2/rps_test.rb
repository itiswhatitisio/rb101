# RPS Bonus Features

# Lizard Spock

RESULTS = {
      rock: ['lizard', 'scissors'], 
      lizard: ['paper','spock'], 
      spock: ['rock','scissors'],
      scissors: ['lizard', 'paper'],
      paper: ['rock', 'spock']
    }

# input: string, string
# output: boolean - true or false
# compare first string with the key
# if the string matches the key
# iterate over the array values
# if the second string matches one of the array values
# return true
# if no, return false

def win?(first, second)
  RESULTS.each do |key,arr|
    if key.to_s == first
      return (second == arr[0] || second == arr[1])
    end
  end
end

def count_scores(player_name, choice, computer,computer_choice, score_hash = {})
if player_name == computer
    score_hash[player_name] += 0
    score_hash[computer] += 0
  elsif win?(choice, computer_choice)
    score_hash[player_name] += 1
  else
    score_hash[computer] += 1
  end
end

def determine_winner(score_hash)

  puts score_hash.select {|k,v| v == score_hash.values.max }

end

def display_winner(winner)

  winner.each { |key,score| puts "The grand winner is #{key} with the total score #{score}"}
end




player_name ='bob'
computer = 'bot'

choice = 'paper'
computer_choice = 'rock'

scores = Hash.new {0}

p count_scores(player_name, choice, computer,computer_choice, scores)

p scores

choice = 'paper'
computer_choice = 'rock'

p count_scores(player_name, choice, computer,computer_choice, scores)

p scores

choice = 'paper'
computer_choice = 'scissors'

p count_scores(player_name, choice, computer,computer_choice, scores)

winner = determine_winner(scores)

display_winner(winner)
# Keeping track of scores

# create a counter variable to keep track of the iterations number
# set count = 0
# set player_score = 0
# set computer_score = 0
# if player wins, player += 1
# if computer wins, computer += 1
# after 5 iterations, compare scores
# player_score == computer_score - it's a tie
# if player_score > computer_score - player wins!
# else - computer wins!









