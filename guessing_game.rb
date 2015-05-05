

def analyzer(answer)
  guesses = []
  (0..5).each do
    if guesses.length >= 5
      puts "You didnt guess it in enouph tries, you lose."
      return
    user_guess = gets.chomp
    if guesses.include?(user_guess)
      responder("same")
    end
    guesses << user_guess
    if user_guess == answer
      responder("win")
      return
    else 
      responder(calculator(user_guess, answer))
  end
end

def calculater(guess, answer)
  if guess < answer
    return "low"
  else return "high"
end

def responder(type)
  if type == "same"
    puts "You said that already. TEEHEE I remembered what you guessed and u didnt."
  if type == "high"
    puts "Your too high, guess again"
  if type == "low"
    puts "Your too low guess again"
  if type == "win"
    puts "You have won the game, congradulations"
end

comp_num = rand (1..100)
puts "I chose a number between 1 and 100, can you guess the number?"
analyzer(comp_num)
