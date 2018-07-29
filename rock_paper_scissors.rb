
VALID_CHOICES = %w(rock paper scissors spock lizard)
RULES = { 'rock' =>  ['scissors', 'lizard'], 'paper' =>  ['spock', 'rock'], 'scissors' =>  ['lizard', 'paper' ], 'spock' => ['rock', 'scissors' ], 'lizard' => ['spock', 'paper'] }

score = { 'Player' => 0, 'Computer'=> 0 }

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(first, second)
  RULES[first].include?(second)
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
           else

           end

  choice
end

def display_winner(winner)
  puts("#{winner} won!")
end         

def results(player, computer)
  if win?(player, computer)
    'Player'
  elsif win?(computer, player)
    'Computer'
  end
end

def update_score(score, winner)
  score[winner] += 1
end

def reset_score(score)
  score['Player'] = 0 
  score['Computer'] = 0
end

score = { 'Player' => 0, 'Computer'=> 0 }

loop do
  puts("\n")
  prompt("Welcome to 'ROCK PAPER SCISSORS SPOCK LIZARD' !")
  puts("\n")
  prompt("Choose one: #{VALID_CHOICES.join(', ')}")
  prompt("Enter 'r' for rock, 'p' for paper, 'sc' for scissors, 'sp' for spock, 'l' for lizzard.  ")

  loop do
    choice = ''
    loop do
      puts "Your turn..."
      
      choice = make_choice(Kernel.gets().chop())

      if VALID_CHOICES.include?(choice)
        break
      else
        prompt("That's not a valid choice.")
      end
    end

    computer_choice = VALID_CHOICES.sample

    Kernel.puts("Player chose #{choice}; Computer chose #{computer_choice}")

    winner = results(choice, computer_choice)
    if winner 
      display_winner(winner)
      update_score(score, winner)
    else
      puts "It's a tie!"
    end

    puts "\nPlayer score: #{score['Player']}, computer score: #{score['Computer']}\n\n"
    if score['Player'] == 5 || score['Computer'] == 5
      puts "Game is over! Player score: #{score['Player']}, computer score: #{score['Computer']}"

      break
    end
      
  end
  reset_score(score)
  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()

  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for playing! Goodbye!")
