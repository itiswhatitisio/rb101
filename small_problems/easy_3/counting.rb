def prompt(message)
  puts message
end


def count_words(string)
  string.delete(' ').size
end

# Main program

prompt('Please write word or multiple words')
user_words = gets.chomp
prompt("There are #{count_words(user_words)} characters in \"#{user_words}\".")