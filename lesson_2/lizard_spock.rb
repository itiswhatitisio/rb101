# the user makes a choice
# the computer makes a choice
# the winner is displayed

VALID_CHOICES = %w(rock paper scissors lizard spock)

WINNING_OUTCOMES = {
  rock: ['lizard', 'scissors'],
  lizard: ['paper', 'spock'],
  spock: ['rock', 'scissors'],
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
  WINNING_OUTCOMES.each do |key, arr|
    if key.to_s == first
      return (second == arr[0] || second == arr[1])
    end
  end
end

def display_results(player, computer)
  if player == computer
    puts "It's a tie!"
  elsif win?(player, computer)
    puts "You won!"
  else
    puts "You lost!"
  end
end



def prompt(message)
  Kernel.puts("=> #{message}")
end

loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = Kernel.gets().chomp()

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice")
    end
  end

  computer_choice = VALID_CHOICES.sample()

  Kernel.puts("You chose: #{choice}; Computer chose: #{computer_choice}")

  puts display_results(choice, computer_choice)

  prompt("Do you want to play again? (yes/no)")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end
