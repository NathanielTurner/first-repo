def analyzer(answer)
  guesses = []
  count = 0
  (0..5).each do |a|
    if a == 5
      puts "You didnt guess it in enouph tries, you lose."
      return
    end
    user_guess = gets.chomp.to_i
    if guesses.include?(user_guess)
      responder("same")
    elsif user_guess == answer
      responder("win")
      return
    else
      responder(calculater(user_guess, answer))
    end
    guesses << user_guess
  end
end

def calculater(guess, answer)
  if guess < answer
    return "low"
  else
    return "high"
  end
end

def responder(type)
  if type == "same"
    puts "You said that already. TEEHEE I remembered what you guessed and u didnt. Guess again"
  end
  if type == "high"
    puts "Your too high, guess again"
  end
  if type == "low"
    puts "Your too low, guess again"
  end
  if type == "win"
    puts "You have won the game, congradulations"
  end
end

comp_num = rand (1..100)
puts comp_num
puts "I chose a number between 1 and 100, can you guess the number?"
analyzer(comp_num)
puts "hi"
