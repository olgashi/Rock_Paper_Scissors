WINNING_CHOICES = { 'rock' => ['scissors', 'lizard'],
                    'paper' => ['spock', 'rock'],
                    'scissors' => ['lizard', 'paper'],
                    'spock' => ['rock', 'scissors'],
                    'lizard' => ['spock', 'paper'] }

def prompt(message)
  puts("=> #{message}")
end

def win?(first_choice, second_choice)
  WINNING_CHOICES[first_choice].include?(second_choice)
end

def make_choice(str)
  choice = case str
           when 'r'
             'rock'
           when 'p'
             'paper'
           when 'sc'
             'scissors'
           when 'sp'
             'spock'
           when 'l'
             'lizard'
           end

  choice
end

def display_winner(winner)
  puts("#{winner} won!")
end

def determine_winner(player, computer)
  if win?(player, computer)
    'Player'
  elsif win?(computer, player)
    'Computer'
  end
end

def overall_winner?(score)
  score['Player'] == 5 || score['Computer'] == 5
end

def update_score(score, winner)
  score[winner] += 1
end

def display_score(score)
  puts("Player score: #{score['Player']}; Computer score: #{score['Computer']}")
end

def reset_score(score)
  score['Player'] = 0
  score['Computer'] = 0
end

score = { 'Player' => 0, 'Computer' => 0 }

loop do
  system('clear') || system('cls')
  puts("\n")
  prompt("Welcome to 'ROCK PAPER SCISSORS SPOCK LIZARD' !")
  puts("\n")
  prompt("In order to be the grand winner, you need to win 5 rounds.")
  prompt("After 5 rounds you can either start a new game or quit.\n\n")
  prompt("Choose one: #{WINNING_CHOICES.keys.join(', ')}\n\n")
  prompt("Enter 'r' for rock, 'p' for paper, 'sc' for scissors")
  puts("\t'sp' for spock, 'l' for lizzard.")

  loop do
    choice = ''
    loop do
      puts("Your turn...")
      choice = make_choice(Kernel.gets().chop())

      if WINNING_CHOICES.keys.include?(choice)
        break
      else
        prompt("That's not a valid choice.")
      end
    end

    computer_choice = WINNING_CHOICES.keys.sample

    puts("Player chose #{choice}; Computer chose #{computer_choice}")

    winner = determine_winner(choice, computer_choice)

    if winner
      display_winner(winner)
      update_score(score, winner)
    else
      puts("It's a tie!")
    end

    display_score(score)

    if overall_winner?(score)
      puts("Game is over!")
      display_score(score)
      reset_score(score)
      break
    end
  end
  prompt("Do you want to play another game?")
  prompt("Enter 'y' for 'yes', any other key for no.")
  answer = gets.chomp

  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for playing! Goodbye!")
