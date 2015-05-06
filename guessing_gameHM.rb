def analyzer(answer)
  guesses = []
  last_guess = 0
  level = ""
  (0..5).each do |a|
    user_guess = optimizer(gets.chomp).to_i
    if a == 4
      unless user_guess == answer
        puts "You didnt guess it in enouph tries, you lose."
      else
        responder("win")
      end
      return
    end
    if guesses.include?(user_guess)
      responder("same")
    elsif user_guess == answer
      responder("win")
      return
    else
      level = calculater(user_guess, answer)
      responder(calculater(user_guess, answer))
    end
    if (a > 0) && (user_guess < last_guess) && (level == "low")
      puts "Wow did you really guess a lower number after being told you were low? what a waste, guess again."
    end
    if (a > 0) && (user_guess > last_guess) && (level == "high")
      "Wow did you really guess a higher number after being told you were high what a waste, guess again."
    end
    last_guess = user_guess
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
  if type == "bad"
    puts "Only integers 1 through 100 count as a guess, try again"
  end
end

def optimizer(guess)
optimized = false
  while optimized == false
    if (guess.to_f.to_s == guess)
      responder("bad")
      guess = gets.chomp
    elsif  (guess.to_f.to_s != guess) && (guess.to_i.to_s != guess)
      responder("bad")
      guess = gets.chomp
    elsif guess.to_i > 100 || guess.to_i < 1
      responder("bad")
      guess = gets.chomp
    else
      optimized = true
    return guess
    end
  end
end

comp_num = rand (1..100)
#puts comp_num
puts "I chose a number between 1 and 100, can you guess the number?"
analyzer(comp_num)
