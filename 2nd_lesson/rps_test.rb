
def display_winner(player, computer)

  results = {
    lost: [['scissors', 'paper'], ['rock', 'scissors'], ['paper','rock']]
  }

  results.each_pair do |key,val|
    results[key].each do |arr|
      p arr[0]
     return player == arr[0] && computer_choice == arr[1]
    end
  end

end

choice = ['scissors'].sample()
computer_choice = ['paper'].sample()

puts choice
puts computer_choice

puts display_winner(choice, computer_choice)

if display_winner(choice, computer_choice)
  puts "You won"
elsif choice == computer_choice
  puts "It's a tie!"
else
  puts "You lost!"
end
    



# my solution
=begin
def display_results(player)
  player == results[:lost]
end



display_results(choice)
=end