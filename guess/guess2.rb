require 'pry'

def guess_number
  hidden = 46
  puts "Please guess a number between 1 and 1000"
  guess = gets.chomp
  guess = guess.to_i
    if hidden == guess
    puts "You are correct"
    elsif guess > hidden
      puts "Too high, guess again"
      guess_number
    elsif guess < hidden
      puts "Too low, guess again"
      guess_number
    end


  #    #else guess_number
  #    end
  # end
end

guess_number
