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
      responder(calculater(user_guess, answer))
    end
    if ((a > 0) && (user_guess < last_guess) && (level == "low")) ||
       ((a > 0) && (user_guess > last_guess) && (level == "high"))
       responder(level, 2)
    end
    level = calculater(user_guess, answer)
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

def responder(type, level = 1)
  if type == "same"
    puts "You said that already. TEEHEE I remembered what you guessed and u didnt, guess again"
  end
  if (type == "high") && (level == 2)
    puts "You really guessed higher after I said you were high?"
  end
  if (type == "low") && (level == 2)
    puts "You really guessed lower after I said you were low?"
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
# needs to develop a new random number generater
puts "I chose a number between 1 and 100, can you guess the number?"
analyzer(comp_num)
